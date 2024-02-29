String BASE_URL = "https://newsapi.org/v2/top-headlines?country=";
// url example: https://newsapi.org/v2/top-headlines?country=in&apiKey=[YOUR_API_KEY]

const String apiKey = "YOUR_API_KEY";

const List<String> countries = [
  'India',
  'Argentina',
  'Australia',
  'Austria',
  'Belgium',
  'Brazil',
  'Bulgaria',
  'Canada',
  'China',
  'Colombia',
  'Cuba',
  'Czech Republic',
  'Egypt',
  'France',
  'Germany',
  'Greece',
  'Hong Kong',
  'Hungary',
  'Indonesia',
  'Ireland',
  'Israel',
  'Italy',
  'Japan',
  'Latvia',
  'Lithuania',
  'Malaysia',
  'Mexico',
  'Morocco',
  'Netherlands',
  'New Zealand',
  'Nigeria',
  'Norway',
  'Philippines',
  'Poland',
  'Portugal',
  'Romania',
  'Russia',
  'Saudi Arabia',
  'Serbia',
  'Singapore',
  'Slovakia',
  'Slovenia',
  'South Africa',
  'South Korea',
  'Sweden',
  'Switzerland',
  'Taiwan',
  'Thailand',
  'Turkey',
  'UAE',
  'Ukraine',
  'United Kingdom',
  'United States',
  'Venezuela',
];

const List<String> countryCodes = [
  'in', // India
  'ar', // Argentina
  'au', // Australia
  'at', // Austria
  'be', // Belgium
  'br', // Brazil
  'bg', // Bulgaria
  'ca', // Canada
  'cn', // China
  'co', // Colombia
  'cu', // Cuba
  'cz', // Czech Republic
  'eg', // Egypt
  'fr', // France
  'de', // Germany
  'gr', // Greece
  'hk', // Hong Kong
  'hu', // Hungary
  'id', // Indonesia
  'ie', // Ireland
  'il', // Israel
  'it', // Italy
  'jp', // Japan
  'lv', // Latvia
  'lt', // Lithuania
  'my', // Malaysia
  'mx', // Mexico
  'ma', // Morocco
  'nl', // Netherlands
  'nz', // New Zealand
  'ng', // Nigeria
  'no', // Norway
  'ph', // Philippines
  'pl', // Poland
  'pt', // Portugal
  'ro', // Romania
  'ru', // Russia
  'sa', // Saudi Arabia
  'rs', // Serbia
  'sg', // Singapore
  'sk', // Slovakia
  'si', // Slovenia
  'za', // South Africa
  'kr', // South Korea
  'se', // Sweden
  'ch', // Switzerland
  'tw', // Taiwan
  'th', // Thailand
  'tr', // Turkey
  'ae', // UAE
  'ua', // Ukraine
  'gb', // United Kingdom
  'us', // United States
  've', // Venezuela
];
