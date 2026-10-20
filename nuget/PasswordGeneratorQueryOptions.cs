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
        /// </summary>
        [JsonProperty("count")]
        public int? Count { get; set; }

        /// <summary>
        /// The length of the password to generate
        /// </summary>
        [JsonProperty("length")]
        public int? Length { get; set; }

        /// <summary>
        /// The complexity of the password. Only applies when type is random
        /// </summary>
        [JsonProperty("complexity")]
        public string Complexity { get; set; }

        /// <summary>
        /// The kind of password to generate. random uses the complexity preset, pronounceable builds readable syllables, passphrase joins dictionary words, and custom honours the include/exclude switches below
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// Include digits. Applies to custom and pronounceable, and to random at simple complexity
        /// </summary>
        [JsonProperty("includeNumbers")]
        public bool? IncludeNumbers { get; set; }

        /// <summary>
        /// Include punctuation symbols. Applies to custom, and to random at medium complexity
        /// </summary>
        [JsonProperty("includeSymbols")]
        public bool? IncludeSymbols { get; set; }

        /// <summary>
        /// Include uppercase letters. Applies to custom, and to random at simple complexity
        /// </summary>
        [JsonProperty("includeUppercase")]
        public bool? IncludeUppercase { get; set; }

        /// <summary>
        /// Include lowercase letters in a custom password. Set false to build from the other character sets only
        /// </summary>
        [JsonProperty("includeLowercase")]
        public bool? IncludeLowercase { get; set; }

        /// <summary>
        /// Exclude characters that are easy to confuse when read aloud or typed (i, l, 1, L, o, 0, O)
        /// </summary>
        [JsonProperty("excludeSimilar")]
        public bool? ExcludeSimilar { get; set; }

        /// <summary>
        /// Exclude brackets, slashes, quotes and other characters that need escaping in shells and config files
        /// </summary>
        [JsonProperty("excludeAmbiguous")]
        public bool? ExcludeAmbiguous { get; set; }

        /// <summary>
        /// Randomly capitalise letters in a pronounceable password
        /// </summary>
        [JsonProperty("mixedCase")]
        public bool? MixedCase { get; set; }

        /// <summary>
        /// Guarantee at least one character from every enabled set rather than leaving it to chance
        /// </summary>
        [JsonProperty("strict")]
        public bool? Strict { get; set; }

        /// <summary>
        /// How many words a passphrase contains. Only applies when type is passphrase
        /// </summary>
        [JsonProperty("wordCount")]
        public int? WordCount { get; set; }

        /// <summary>
        /// The character placed between passphrase words. Only applies when type is passphrase
        /// </summary>
        [JsonProperty("separator")]
        public string Separator { get; set; }

        /// <summary>
        /// Capitalise each word of a passphrase. Only applies when type is passphrase
        /// </summary>
        [JsonProperty("capitalize")]
        public bool? Capitalize { get; set; }

        /// <summary>
        /// Return a strength analysis alongside each password
        /// </summary>
        [JsonProperty("analyze")]
        public bool? Analyze { get; set; }
    }
}
