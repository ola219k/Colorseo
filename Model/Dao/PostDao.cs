using Model.EF;
using Model.ViewModel;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class PostDao
    {
        BlogDbContext db = null;
        public PostDao()
        {
            db = new BlogDbContext();
        }
        public List<Post> ListNewPost(int top)
        {
            return db.Posts.OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }

        public List<string> ListName(string keyword)
        {
            return db.Posts.Where(x => x.Title.Contains(keyword)).Select(x => x.Title).ToList();
        }

        public IEnumerable<Post> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<Post> model = db.Posts;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.Title.Contains(searchString) || x.Title.Contains(searchString));
            }

            return model.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        /// <summary>
        /// Get list Post by category
        /// </summary>
        /// <param name="categoryID"></param>
        /// <returns></returns>
        public List<PostViewModel> ListByCategoryId(long categoryID, ref int totalRecord, int pageIndex = 1, int pageSize = 4)
        {
            totalRecord = db.Posts.Where(x => x.CategoryID == categoryID).Count();
            var model = (from a in db.Posts
                         join b in db.PostCategories
                         on a.CategoryID equals b.ID
                         where a.CategoryID == categoryID
                         select new
                         {
                             CateMetaTitle = b.MetaTitle,
                             CateName = b.Title,
                             CreatedDate = a.CreatedDate,
                             ID = a.ID,
                             Images = a.Image,
                             Title= a.Title,
                             MetaTitle = a.MetaTitle,
                         }).AsEnumerable().Select(x => new PostViewModel()
                         {
                             CateMetaTitle = x.MetaTitle,
                             CateName = x.Title,
                             CreatedDate = x.CreatedDate,
                             ID = x.ID,
                            // Images = x.Images,
                             Title = x.Title,
                             MetaTitle = x.MetaTitle,
                         });
            return model.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * (pageSize)).Take(pageSize).ToList();
        }

        public List<PostViewModel> Search(string keyword, ref int totalRecord, int pageIndex = 1, int pageSize = 1)
        {
            totalRecord = db.Posts.Where(x => x.Title == keyword).Count();
            var model = (from a in db.Posts
                         join b in db.PostCategories
                         on a.CategoryID equals b.ID
                         where a.Title.Contains(keyword)
                         select new
                         {
                             CateMetaTitle = b.MetaTitle,
                             CateName = b.Title,
                             CreatedDate = a.CreatedDate,
                             ID = a.ID,
                            // Images = a.Image,
                             Title = a.Title,
                             MetaTitle = a.MetaTitle,
                         }).AsEnumerable().Select(x => new PostViewModel()
                         {
                             CateMetaTitle = x.MetaTitle,
                             CateName = x.Title,
                             CreatedDate = x.CreatedDate,
                             ID = x.ID,
                            // Images = x.Images,
                             Title  = x.Title,
                             MetaTitle = x.MetaTitle,
                         });
            return model.OrderByDescending(x => x.CreatedDate).Skip((pageIndex - 1) * pageSize).Take(pageSize).ToList();
        }


        /// <summary>
        /// List feature Post
        /// </summary>
        /// <param name="top"></param>
        /// <returns></returns>
        public List<Post> ListFeaturePost(int top)
        {
            return db.Posts.Where(x => x.TopHot != null && x.TopHot > DateTime.Now).OrderByDescending(x => x.CreatedDate).Take(top).ToList();
        }
        public List<Post> ListRelatedPosts(long PostId)
        {
            var Post = db.Posts.Find(PostId);
            return db.Posts.Where(x => x.ID != PostId && x.CategoryID == Post.CategoryID).ToList();
        }
        
        public void UpdateImages(long PostId, string images)
        {
            var Post = db.Posts.Find(PostId);
            Post.MoreImages = images;
            db.SaveChanges();
        }

        public Post ViewDetail(long id)
        {
            return db.Posts.Find(id);
        }

        public long Create(Post Post)
        {
            Post.CreatedDate = DateTime.Now;
            Post.ViewCount = 0;
            db.Posts.Add(Post);
            db.SaveChanges();
            return Post.ID;
        }
    }
}