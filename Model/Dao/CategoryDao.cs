using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CategoryDao
    {
        BlogDbContext db = null;
        public CategoryDao()
        {
            db = new BlogDbContext();
        }

        public long Insert(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
            return category.ID;
        }

        public List<Category> ListAll()
        {
            return db.Categories.Where(x => x.Status == true).ToList();
        }

        public PostCategory ViewDetail(long id)
        {
            return db.PostCategories.Find(id);
        }
    }
}
