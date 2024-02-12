using System.ComponentModel.DataAnnotations;
namespace WebApplication.Helpers
{
    public class ValidacijaGodina : ValidationAttribute
    {
        private readonly DateTime _minValue = DateTime.UtcNow;
        private readonly DateTime _maxValue = DateTime.UtcNow.AddYears(50);

        public override bool IsValid(object value)
        {
            DateTime val = (DateTime)value;
            return val >= _minValue && val <= _maxValue;
        }
        public override string FormatErrorMessage(string name)
        {
            return string.Format("Greska", _minValue, _maxValue);
        }
    }
}
