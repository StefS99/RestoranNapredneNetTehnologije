﻿using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class User : IdentityUser<int>
    {
        public string? Ime { get; set; }
        public string? Prezime { get; set; }

        public List<PorudzbinaUser>? PorudzbinaUsers { get; set; } = new List<PorudzbinaUser>();
    }
}
