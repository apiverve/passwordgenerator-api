using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.PasswordGenerator
{
    /// <summary>
    /// Query options for the Password Generator API
    /// </summary>
    public class PasswordGeneratorQueryOptions
    {
        /// <summary>
        /// The number of passwords to generate
        /// Example: 10
        /// </summary>
        [JsonProperty("count")]
        public string Count { get; set; }

        /// <summary>
        /// The length of the password to generate
        /// Example: 12
        /// </summary>
        [JsonProperty("length")]
        public string Length { get; set; }

        /// <summary>
        /// The complexity of the password (e.g., simple, medium, strong)
        /// Example: strong
        /// </summary>
        [JsonProperty("complexity")]
        public string Complexity { get; set; }
    }
}
