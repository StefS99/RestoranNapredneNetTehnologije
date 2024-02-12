using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseContext.Migrations
{
    /// <inheritdoc />
    public partial class AddedSlikaInsteadImagePath : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "ImagePath",
                table: "Porudzbine",
                newName: "Slika");

            migrationBuilder.RenameColumn(
                name: "ImagePath",
                table: "Jela",
                newName: "Slika");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Slika",
                table: "Porudzbine",
                newName: "ImagePath");

            migrationBuilder.RenameColumn(
                name: "Slika",
                table: "Jela",
                newName: "ImagePath");
        }
    }
}
