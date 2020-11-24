namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using global::Model.EF.Model.EF;

    public partial class BlogDbContext : DbContext
    {
        public BlogDbContext()
            : base("name=BlogDbContext")
        {
        }

        public virtual DbSet<About> Abouts { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<Content> Contents { get; set; }
        public virtual DbSet<ContentTag> ContentTags { get; set; }
        public virtual DbSet<Footer> Footers { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<MenuType> MenuTypes { get; set; }
        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<PostCategory> PostCategories { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<SystemConfig> SystemConfigs { get; set; }
        public virtual DbSet<Tag> Tags { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        public virtual DbSet<Role> Roles { set; get; }
        public virtual DbSet<Credential> Credentials { set; get; }

        public virtual DbSet<UsersGroup > UserGroups { set; get; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<About>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.ModifiledBy)
                .IsUnicode(false);

            modelBuilder.Entity<About>()
                .Property(e => e.MeteDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<Category>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.ModifiledBy)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.MeteDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<Content>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Content>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Content>()
                .Property(e => e.ModifiledBy)
                .IsUnicode(false);

            modelBuilder.Entity<Content>()
                .Property(e => e.MeteDescriptions)
                .IsFixedLength();

            modelBuilder.Entity<ContentTag>()
                .Property(e => e.TagID)
                .IsUnicode(false);

            modelBuilder.Entity<Footer>()
                .Property(e => e.ID)
                .IsUnicode(false);


            modelBuilder.Entity<Post>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);


            modelBuilder.Entity<Post>()
                .Property(e => e.Content)
                .IsFixedLength();

            modelBuilder.Entity<PostCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<PostCategory>()
                .Property(e => e.MeteDescriptions)
                .IsFixedLength();


            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<SystemConfig>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<Tag>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Users>()
                .Property(e => e.Password)
                .IsUnicode(false);

        }

    }
}
