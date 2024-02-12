using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DatabaseContext.Migrations
{
    /// <inheritdoc />
    public partial class AddedAdresa : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AdresaPorucioca",
                table: "PorudzbinaUser");

            migrationBuilder.AddColumn<string>(
                name: "Adresa",
                table: "Porudzbine",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Adresa",
                table: "Porudzbine");

            migrationBuilder.AddColumn<string>(
                name: "AdresaPorucioca",
                table: "PorudzbinaUser",
                type: "nvarchar(max)",
                nullable: true);
        }
    }
}
