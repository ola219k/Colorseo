using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class PostCategoryDao
    {
        BlogDbContext db = null;
        public PostCategoryDao()
        {
            db = new BlogDbContext();
        }

        public List<PostCategory> ListAll()
        {
            return db.PostCategories.Where(x => x.Status == true).OrderBy(y => y.DisplayOrder).ToList();
        }

        public PostCategory ViewDetail(long id)
        {
            return db.PostCategories.Find(id);
        }
    }
}
