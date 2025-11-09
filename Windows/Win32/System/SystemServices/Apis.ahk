#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SystemServices {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static _MM_HINT_T0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _MM_HINT_T1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static _MM_HINT_T2 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static _MM_HINT_NTA => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ANYSIZE_ARRAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_ALLOCATION_ALIGNMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static X86_CACHE_ALIGNMENT_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ARM_CACHE_ALIGNMENT_SIZE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_CACHE_ALIGNMENT_SIZE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static PRAGMA_DEPRECATED_DDK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UCSCHAR_INVALID_CHARACTER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_UCSCHAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_UCSCHAR => 1114111

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_PROC_PER_GROUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_PROCESSORS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_ERROR_MASK => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEVERITY_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEVERITY_INFORMATIONAL => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEVERITY_WARNING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEVERITY_ERROR => 3221225472

    /**
     * @type {Integer (UInt64)}
     */
    static MAXLONGLONG => 9223372036854775807

    /**
     * @type {Integer (UInt32)}
     */
    static UNICODE_STRING_MAX_CHARS => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static MINCHAR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MAXCHAR => 127

    /**
     * @type {Integer (UInt32)}
     */
    static MINSHORT => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MAXSHORT => 32767

    /**
     * @type {Integer (UInt32)}
     */
    static MINLONG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLONG => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static MAXBYTE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static MAXWORD => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static MAXDWORD => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_SHORT_ID_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_LONG_ID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SERVER_NT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static VER_WORKSTATION_NT => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_SMALLBUSINESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_ENTERPRISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_BACKOFFICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_COMMUNICATIONS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_TERMINAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_SMALLBUSINESS_RESTRICTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_EMBEDDEDNT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_DATACENTER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_SINGLEUSERTS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_PERSONAL => 512

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_BLADE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_EMBEDDED_RESTRICTED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_SECURITY_APPLIANCE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_STORAGE_SERVER => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_COMPUTE_SERVER => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_WH_SERVER => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static VER_SUITE_MULTIUSERTS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_SERVER_CORE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SOLUTION_EMBEDDEDSERVER_CORE => 57

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_EMBEDDED => 58

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED => 65

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_AUTOMOTIVE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_A => 86

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_THINPC => 87

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_A => 88

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY => 89

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_E => 90

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_E => 91

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_A_E => 92

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_ARM => 97

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_EVAL => 105

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_INDUSTRY_E_EVAL => 106

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_EVAL => 107

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_EMBEDDED_E_EVAL => 108

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_NANO_SERVER => 109

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD_STORAGE_SERVER => 110

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED => 111

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_STUDENT => 112

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_N => 113

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_STUDENT_N => 114

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_SINGLELANGUAGE => 115

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CORE_CONNECTED_COUNTRYSPECIFIC => 116

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CONNECTED_CAR => 117

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_INDUSTRY_HANDHELD => 118

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PPI_PRO => 119

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ARM64_SERVER => 120

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD_HOST_INFRASTRUCTURE_SERVER => 124

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_S => 127

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PROFESSIONAL_S_N => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOLOGRAPHIC => 135

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HOLOGRAPHIC_BUSINESS => 136

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_SINGLE_LANGUAGE => 138

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_CHINA => 139

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SUBSCRIPTION => 140

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISE_SUBSCRIPTION_N => 141

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_NANO_SERVER => 143

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_NANO_SERVER => 144

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_WS_SERVER_CORE => 147

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_WS_SERVER_CORE => 148

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UTILITY_VM => 149

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_EVALUATION_SERVER_CORE => 159

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_STANDARD_EVALUATION_SERVER_CORE => 160

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_FOR_EDUCATION => 164

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_PRO_FOR_EDUCATION_N => 165

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CORE => 168

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_NANO_SERVER => 169

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISEG => 171

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ENTERPRISEGN => 172

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_SERVERRDSH => 175

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUD => 178

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDN => 179

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_HUBOS => 180

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_ONECOREUPDATEOS => 182

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDE => 183

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTOS => 185

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEN => 186

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTEDGEOS => 187

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISE => 188

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_LITE => 189

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISES => 191

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_SYSTEMOS => 192

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_GAMEOS => 194

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_ERAOS => 195

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_DURANGOHOSTOS => 196

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_SCARLETTHOSTOS => 197

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_XBOX_KEYSTONE => 198

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CLOUDHOST => 199

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_CLOUDMOS => 200

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEDITIONN => 202

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_CLOUDEDITION => 203

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_VALIDATION => 204

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISESK => 205

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISEK => 206

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_IOTENTERPRISESEVAL => 207

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_AGENTBRIDGE => 208

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURE_SERVER_NANOHOST => 209

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_WNC => 210

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_AZURESTACKHCI_SERVER_CORE => 406

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_AZURE_EDITION => 407

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_DATACENTER_SERVER_CORE_AZURE_EDITION => 408

    /**
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UNLICENSED => 2882382797

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_NEUTRAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_INVARIANT => 127

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_AFRIKAANS => 54

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ALBANIAN => 28

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ALSATIAN => 132

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_AMHARIC => 94

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ARABIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ARMENIAN => 43

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ASSAMESE => 77

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_AZERI => 44

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_AZERBAIJANI => 44

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BANGLA => 69

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BASHKIR => 109

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BASQUE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BELARUSIAN => 35

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BENGALI => 69

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BRETON => 126

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BOSNIAN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BOSNIAN_NEUTRAL => 30746

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_BULGARIAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CATALAN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CENTRAL_KURDISH => 146

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CHEROKEE => 92

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CHINESE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CHINESE_SIMPLIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CHINESE_TRADITIONAL => 31748

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CORSICAN => 131

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CROATIAN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_CZECH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_DANISH => 6

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_DARI => 140

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_DIVEHI => 101

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_DUTCH => 19

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ENGLISH => 9

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ESTONIAN => 37

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FAEROESE => 56

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FARSI => 41

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FILIPINO => 100

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FINNISH => 11

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FRENCH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FRISIAN => 98

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_FULAH => 103

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GALICIAN => 86

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GEORGIAN => 55

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GERMAN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GREEK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GREENLANDIC => 111

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_GUJARATI => 71

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_HAUSA => 104

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_HAWAIIAN => 117

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_HEBREW => 13

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_HINDI => 57

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_HUNGARIAN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ICELANDIC => 15

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_IGBO => 112

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_INDONESIAN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_INUKTITUT => 93

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_IRISH => 60

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ITALIAN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_JAPANESE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KANNADA => 75

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KASHMIRI => 96

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KAZAK => 63

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KHMER => 83

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KICHE => 134

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KINYARWANDA => 135

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KONKANI => 87

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KOREAN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_KYRGYZ => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_LAO => 84

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_LATVIAN => 38

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_LITHUANIAN => 39

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_LOWER_SORBIAN => 46

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_LUXEMBOURGISH => 110

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MACEDONIAN => 47

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MALAY => 62

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MALAYALAM => 76

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MALTESE => 58

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MANIPURI => 88

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MAORI => 129

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MAPUDUNGUN => 122

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MARATHI => 78

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MOHAWK => 124

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_MONGOLIAN => 80

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_NEPALI => 97

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_NORWEGIAN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_OCCITAN => 130

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ODIA => 72

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ORIYA => 72

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_PASHTO => 99

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_PERSIAN => 41

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_POLISH => 21

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_PORTUGUESE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_PULAR => 103

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_PUNJABI => 70

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_QUECHUA => 107

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ROMANIAN => 24

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ROMANSH => 23

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_RUSSIAN => 25

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SAKHA => 133

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SAMI => 59

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SANSKRIT => 79

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SCOTTISH_GAELIC => 145

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SERBIAN => 26

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SERBIAN_NEUTRAL => 31770

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SINDHI => 89

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SINHALESE => 91

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SLOVAK => 27

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SLOVENIAN => 36

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SOTHO => 108

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SPANISH => 10

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SWAHILI => 65

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SWEDISH => 29

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_SYRIAC => 90

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TAJIK => 40

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TAMAZIGHT => 95

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TAMIL => 73

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TATAR => 68

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TELUGU => 74

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_THAI => 30

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TIBETAN => 81

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TIGRIGNA => 115

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TIGRINYA => 115

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TSWANA => 50

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TURKISH => 31

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_TURKMEN => 66

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_UIGHUR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_UKRAINIAN => 34

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_UPPER_SORBIAN => 46

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_URDU => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_UZBEK => 67

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_VALENCIAN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_VIETNAMESE => 42

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_WELSH => 82

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_WOLOF => 136

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_XHOSA => 52

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_YAKUT => 133

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_YI => 120

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_YORUBA => 106

    /**
     * @type {Integer (UInt32)}
     */
    static LANG_ZULU => 53

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_NEUTRAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SYS_DEFAULT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CUSTOM_DEFAULT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CUSTOM_UNSPECIFIED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UI_CUSTOM_DEFAULT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AFRIKAANS_SOUTH_AFRICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ALBANIAN_ALBANIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ALSATIAN_FRANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AMHARIC_ETHIOPIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_SAUDI_ARABIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_IRAQ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_EGYPT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_LIBYA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_ALGERIA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_MOROCCO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_TUNISIA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_OMAN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_YEMEN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_SYRIA => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_JORDAN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_LEBANON => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_KUWAIT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_UAE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_BAHRAIN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARABIC_QATAR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ARMENIAN_ARMENIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ASSAMESE_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AZERI_LATIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AZERI_CYRILLIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AZERBAIJANI_AZERBAIJAN_LATIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_AZERBAIJANI_AZERBAIJAN_CYRILLIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BANGLA_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BANGLA_BANGLADESH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BASHKIR_RUSSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BASQUE_BASQUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BELARUSIAN_BELARUS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BENGALI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BENGALI_BANGLADESH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_LATIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BOSNIAN_BOSNIA_HERZEGOVINA_CYRILLIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BRETON_FRANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_BULGARIAN_BULGARIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CATALAN_CATALAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CENTRAL_KURDISH_IRAQ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHEROKEE_CHEROKEE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHINESE_TRADITIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHINESE_SIMPLIFIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHINESE_HONGKONG => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHINESE_SINGAPORE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CHINESE_MACAU => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CORSICAN_FRANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CZECH_CZECH_REPUBLIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CROATIAN_CROATIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_CROATIAN_BOSNIA_HERZEGOVINA_LATIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DANISH_DENMARK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DARI_AFGHANISTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DIVEHI_MALDIVES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DUTCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_DUTCH_BELGIAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_US => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_UK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_AUS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_CAN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_NZ => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_EIRE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_SOUTH_AFRICA => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_JAMAICA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_CARIBBEAN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_BELIZE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_TRINIDAD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_ZIMBABWE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_PHILIPPINES => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_INDIA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_MALAYSIA => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ENGLISH_SINGAPORE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ESTONIAN_ESTONIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FAEROESE_FAROE_ISLANDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FILIPINO_PHILIPPINES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FINNISH_FINLAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH_BELGIAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH_CANADIAN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH_SWISS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH_LUXEMBOURG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRENCH_MONACO => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FRISIAN_NETHERLANDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_FULAH_SENEGAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GALICIAN_GALICIAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GEORGIAN_GEORGIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GERMAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GERMAN_SWISS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GERMAN_AUSTRIAN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GERMAN_LUXEMBOURG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GERMAN_LIECHTENSTEIN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GREEK_GREECE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GREENLANDIC_GREENLAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_GUJARATI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_HAUSA_NIGERIA_LATIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_HAWAIIAN_US => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_HEBREW_ISRAEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_HINDI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_HUNGARIAN_HUNGARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ICELANDIC_ICELAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_IGBO_NIGERIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_INDONESIAN_INDONESIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_INUKTITUT_CANADA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_INUKTITUT_CANADA_LATIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_IRISH_IRELAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ITALIAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ITALIAN_SWISS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_JAPANESE_JAPAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KANNADA_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KASHMIRI_SASIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KASHMIRI_INDIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KAZAK_KAZAKHSTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KHMER_CAMBODIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KICHE_GUATEMALA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KINYARWANDA_RWANDA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KONKANI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KOREAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_KYRGYZ_KYRGYZSTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_LAO_LAO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_LATVIAN_LATVIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_LITHUANIAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_LOWER_SORBIAN_GERMANY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_LUXEMBOURGISH_LUXEMBOURG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MACEDONIAN_MACEDONIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MALAY_MALAYSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MALAY_BRUNEI_DARUSSALAM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MALAYALAM_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MALTESE_MALTA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MAORI_NEW_ZEALAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MAPUDUNGUN_CHILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MARATHI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MOHAWK_MOHAWK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MONGOLIAN_CYRILLIC_MONGOLIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_MONGOLIAN_PRC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_NEPALI_INDIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_NEPALI_NEPAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_NORWEGIAN_BOKMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_NORWEGIAN_NYNORSK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_OCCITAN_FRANCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ODIA_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ORIYA_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PASHTO_AFGHANISTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PERSIAN_IRAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_POLISH_POLAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PORTUGUESE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PORTUGUESE_BRAZILIAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PULAR_SENEGAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PUNJABI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_PUNJABI_PAKISTAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_QUECHUA_BOLIVIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_QUECHUA_ECUADOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_QUECHUA_PERU => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ROMANIAN_ROMANIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ROMANSH_SWITZERLAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_RUSSIAN_RUSSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAKHA_RUSSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_NORTHERN_NORWAY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_NORTHERN_SWEDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_NORTHERN_FINLAND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_LULE_NORWAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_LULE_SWEDEN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_SOUTHERN_NORWAY => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_SOUTHERN_SWEDEN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_SKOLT_FINLAND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SAMI_INARI_FINLAND => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SANSKRIT_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SCOTTISH_GAELIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_LATIN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_BOSNIA_HERZEGOVINA_CYRILLIC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_MONTENEGRO_LATIN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_MONTENEGRO_CYRILLIC => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_SERBIA_LATIN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_SERBIA_CYRILLIC => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_CROATIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_LATIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SERBIAN_CYRILLIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SINDHI_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SINDHI_PAKISTAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SINDHI_AFGHANISTAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SINHALESE_SRI_LANKA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SOTHO_NORTHERN_SOUTH_AFRICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SLOVAK_SLOVAKIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SLOVENIAN_SLOVENIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_MEXICAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_MODERN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_GUATEMALA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_COSTA_RICA => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_PANAMA => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_DOMINICAN_REPUBLIC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_VENEZUELA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_COLOMBIA => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_PERU => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_ARGENTINA => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_ECUADOR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_CHILE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_URUGUAY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_PARAGUAY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_BOLIVIA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_EL_SALVADOR => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_HONDURAS => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_NICARAGUA => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_PUERTO_RICO => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SPANISH_US => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SWAHILI_KENYA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SWEDISH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SWEDISH_FINLAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_SYRIAC_SYRIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TAJIK_TAJIKISTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TAMAZIGHT_ALGERIA_LATIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TAMAZIGHT_MOROCCO_TIFINAGH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TAMIL_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TAMIL_SRI_LANKA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TATAR_RUSSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TELUGU_INDIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_THAI_THAILAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TIBETAN_PRC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TIGRIGNA_ERITREA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TIGRINYA_ERITREA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TIGRINYA_ETHIOPIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TSWANA_BOTSWANA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TSWANA_SOUTH_AFRICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TURKISH_TURKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_TURKMEN_TURKMENISTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UIGHUR_PRC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UKRAINIAN_UKRAINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UPPER_SORBIAN_GERMANY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_URDU_PAKISTAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_URDU_INDIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UZBEK_LATIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_UZBEK_CYRILLIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_VALENCIAN_VALENCIA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_VIETNAMESE_VIETNAM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_WELSH_UNITED_KINGDOM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_WOLOF_SENEGAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_XHOSA_SOUTH_AFRICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_YAKUT_RUSSIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_YI_PRC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_YORUBA_NIGERIA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SUBLANG_ZULU_SOUTH_AFRICA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_INVARIANT_MATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_JAPANESE_XJIS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_JAPANESE_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_JAPANESE_RADICALSTROKE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_BIG5 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_PRCP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_PRC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_BOPOMOFO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_CHINESE_RADICALSTROKE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_KOREAN_KSC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_KOREAN_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_GERMAN_PHONE_BOOK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_HUNGARIAN_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_HUNGARIAN_TECHNICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_GEORGIAN_TRADITIONAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SORT_GEORGIAN_MODERN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NLS_VALID_LOCALE_MASK => 1048575

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_NAME_MAX_LENGTH => 85

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_TRANSIENT_KEYBOARD1 => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_TRANSIENT_KEYBOARD2 => 9216

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_TRANSIENT_KEYBOARD3 => 10240

    /**
     * @type {Integer (UInt32)}
     */
    static LOCALE_TRANSIENT_KEYBOARD4 => 11264

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_WAIT_OBJECTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_SUSPEND_COUNT => 127

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CONTEXT_FLAG_LOOKASIDE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PF_TEMPORAL_LEVEL_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PF_TEMPORAL_LEVEL_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PF_TEMPORAL_LEVEL_3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PF_NON_TEMPORAL_LEVEL_ALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_READ_FAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_WRITE_FAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_EXECUTE_FAULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static INITIAL_MXCSR => 8064

    /**
     * @type {Integer (UInt32)}
     */
    static INITIAL_FPCSR => 639

    /**
     * @type {Integer (UInt32)}
     */
    static RUNTIME_FUNCTION_INDIRECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_NO_EPILOGUE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static UNWIND_CHAIN_LIMIT => 32

    /**
     * @type {String}
     */
    static OUT_OF_PROCESS_FUNCTION_TABLE_CALLBACK_EXPORT_NAME => "OutOfProcessFunctionTableCallback"

    /**
     * @type {Integer (UInt32)}
     */
    static INITIAL_CPSR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static INITIAL_FPSCR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ARM_MAX_BREAKPOINTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ARM_MAX_WATCHPOINTS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_PLD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_PLI => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_PST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_L1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_L2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_L3 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_KEEP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_PREFETCH_STRM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static _ARM64_MULT_INTRINS_SUPPORTED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_MAX_BREAKPOINTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ARM64_MAX_WATCHPOINTS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NONVOL_INT_NUMREG_ARM64 => 11

    /**
     * @type {Integer (UInt32)}
     */
    static NONVOL_FP_NUMREG_ARM64 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static BREAK_DEBUG_BASE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static ASSERT_BREAKPOINT => 524291

    /**
     * @type {Integer (UInt32)}
     */
    static SIZE_OF_80387_REGISTERS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_SUPPORTED_EXTENSION => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NONCONTINUABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_UNWINDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_EXIT_UNWIND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_STACK_INVALID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_NESTED_CALL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_TARGET_UNWIND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_COLLIDED_UNWIND => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_SOFTWARE_ORIGINATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_MAXIMUM_PARAMETERS => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_SYSTEM_SECURITY => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_ALLOWED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static SID_REVISION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SID_MAX_SUB_AUTHORITIES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SID_RECOMMENDED_SUB_AUTHORITIES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SID_HASH_SIZE => 32

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NULL_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WORLD_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_LOGON_RID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CREATOR_OWNER_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CREATOR_GROUP_RID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CREATOR_OWNER_SERVER_RID => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CREATOR_GROUP_SERVER_RID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CREATOR_OWNER_RIGHTS_RID => 4

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_DIALUP_RID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NETWORK_RID => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BATCH_RID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_INTERACTIVE_RID => 4

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOGON_IDS_RID => 5

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOGON_IDS_RID_COUNT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_SERVICE_RID => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_ANONYMOUS_LOGON_RID => 7

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROXY_RID => 8

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_ENTERPRISE_CONTROLLERS_RID => 9

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_SERVER_LOGON_RID => 9

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PRINCIPAL_SELF_RID => 10

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATED_USER_RID => 11

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_RESTRICTED_CODE_RID => 12

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_TERMINAL_SERVER_RID => 13

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_REMOTE_LOGON_RID => 14

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_THIS_ORGANIZATION_RID => 15

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_IUSER_RID => 17

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_SYSTEM_RID => 18

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_SERVICE_RID => 19

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NETWORK_SERVICE_RID => 20

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NT_NON_UNIQUE => 21

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NT_NON_UNIQUE_SUB_AUTH_COUNT => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_ENTERPRISE_READONLY_CONTROLLERS_RID => 22

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BUILTIN_DOMAIN_RID => 32

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WRITE_RESTRICTED_CODE_RID => 33

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PACKAGE_BASE_RID => 64

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PACKAGE_RID_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PACKAGE_NTLM_RID => 10

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PACKAGE_SCHANNEL_RID => 14

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PACKAGE_DIGEST_RID => 21

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CRED_TYPE_BASE_RID => 65

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CRED_TYPE_RID_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CRED_TYPE_THIS_ORG_CERT_RID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MIN_BASE_RID => 80

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_SERVICE_ID_BASE_RID => 80

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_SERVICE_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_RESERVED_ID_BASE_RID => 81

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_APPPOOL_ID_BASE_RID => 82

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_APPPOOL_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_VIRTUALSERVER_ID_BASE_RID => 83

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_VIRTUALSERVER_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_USERMODEDRIVERHOST_ID_BASE_RID => 84

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_USERMODEDRIVERHOST_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_BASE_RID => 85

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CLOUD_INFRASTRUCTURE_SERVICES_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WMIHOST_ID_BASE_RID => 86

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WMIHOST_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_TASK_ID_BASE_RID => 87

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_NFS_ID_BASE_RID => 88

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_COM_ID_BASE_RID => 89

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WINDOW_MANAGER_BASE_RID => 90

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_RDV_GFX_BASE_RID => 91

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_DASHOST_ID_BASE_RID => 92

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_DASHOST_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_USERMANAGER_ID_BASE_RID => 93

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_USERMANAGER_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WINRM_ID_BASE_RID => 94

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WINRM_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CCG_ID_BASE_RID => 95

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_UMFD_BASE_RID => 96

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_UNIQUIFIED_SERVICE_BASE_RID => 97

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_VIRTUALACCOUNT_ID_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_EDGE_CLOUD_INFRASTRUCTURE_SERVICE_ID_BASE_RID => 98

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_RESTRICTED_SERVICES_BASE_RID => 99

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_RESTRICTED_SERVICES_RID_COUNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MAX_BASE_RID => 111

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MAX_ALWAYS_FILTERED => 999

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MIN_NEVER_FILTERED => 1000

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_OTHER_ORGANIZATION_RID => 1000

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_WINDOWSMOBILE_ID_BASE_RID => 112

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_INSTALLER_GROUP_CAPABILITY_BASE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_INSTALLER_GROUP_CAPABILITY_RID_COUNT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_INSTALLER_CAPABILITY_RID_COUNT => 10

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_ACCOUNT_RID => 113

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_LOCAL_ACCOUNT_AND_ADMIN_RID => 114

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_AUTHORIZATION_DATA_IS_COMPOUNDED => 496

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_AUTHORIZATION_DATA_CONTAINS_CLAIMS => 497

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_ENTERPRISE_READONLY_DOMAIN_CONTROLLERS => 498

    /**
     * @type {Integer (Int32)}
     */
    static FOREST_USER_RID_MAX => 499

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_ADMIN => 500

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_GUEST => 501

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_KRBTGT => 502

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_DEFAULT_ACCOUNT => 503

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_WDAG_ACCOUNT => 504

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_USER_RID_MAX => 999

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_ADMINS => 512

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_USERS => 513

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_GUESTS => 514

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_COMPUTERS => 515

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_CONTROLLERS => 516

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_CERT_ADMINS => 517

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_SCHEMA_ADMINS => 518

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_ENTERPRISE_ADMINS => 519

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_POLICY_ADMINS => 520

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_READONLY_CONTROLLERS => 521

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_CLONEABLE_CONTROLLERS => 522

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_CDC_RESERVED => 524

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_PROTECTED_USERS => 525

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_KEY_ADMINS => 526

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_ENTERPRISE_KEY_ADMINS => 527

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_FOREST_TRUSTS => 528

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_GROUP_RID_EXTERNAL_TRUSTS => 529

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_ADMINS => 544

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_USERS => 545

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_GUESTS => 546

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_POWER_USERS => 547

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_ACCOUNT_OPS => 548

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_SYSTEM_OPS => 549

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_PRINT_OPS => 550

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_BACKUP_OPS => 551

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_REPLICATOR => 552

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_RAS_SERVERS => 553

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_PREW2KCOMPACCESS => 554

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_REMOTE_DESKTOP_USERS => 555

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_NETWORK_CONFIGURATION_OPS => 556

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_INCOMING_FOREST_TRUST_BUILDERS => 557

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_MONITORING_USERS => 558

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_LOGGING_USERS => 559

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_AUTHORIZATIONACCESS => 560

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_TS_LICENSE_SERVERS => 561

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_DCOM_USERS => 562

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_IUSERS => 568

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_CRYPTO_OPERATORS => 569

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_CACHEABLE_PRINCIPALS_GROUP => 571

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_NON_CACHEABLE_PRINCIPALS_GROUP => 572

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_EVENT_LOG_READERS_GROUP => 573

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_CERTSVC_DCOM_ACCESS_GROUP => 574

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_RDS_REMOTE_ACCESS_SERVERS => 575

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_RDS_ENDPOINT_SERVERS => 576

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_RDS_MANAGEMENT_SERVERS => 577

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_HYPER_V_ADMINS => 578

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_ACCESS_CONTROL_ASSISTANCE_OPS => 579

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_REMOTE_MANAGEMENT_USERS => 580

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_DEFAULT_ACCOUNT => 581

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_STORAGE_REPLICA_ADMINS => 582

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_DEVICE_OWNERS => 583

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_USER_MODE_HARDWARE_OPERATORS => 584

    /**
     * @type {Integer (Int32)}
     */
    static DOMAIN_ALIAS_RID_OPENSSH_USERS => 585

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_APP_PACKAGE_BASE_RID => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BUILTIN_APP_PACKAGE_RID_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_APP_PACKAGE_RID_COUNT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_BASE_RID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_APP_RID => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_APP_SILO_RID => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BUILTIN_CAPABILITY_RID_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_RID_COUNT => 5

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PARENT_PACKAGE_RID_COUNT => 8

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CHILD_PACKAGE_RID_COUNT => 12

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BUILTIN_PACKAGE_ANY_PACKAGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_BUILTIN_PACKAGE_ANY_RESTRICTED_PACKAGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_INTERNET_CLIENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_INTERNET_CLIENT_SERVER => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_PRIVATE_NETWORK_CLIENT_SERVER => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_PICTURES_LIBRARY => 4

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_VIDEOS_LIBRARY => 5

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_MUSIC_LIBRARY => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_DOCUMENTS_LIBRARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_ENTERPRISE_AUTHENTICATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_SHARED_USER_CERTIFICATES => 9

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_REMOVABLE_STORAGE => 10

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_APPOINTMENTS => 11

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_CONTACTS => 12

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_CAPABILITY_INTERNET_EXPLORER => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_UNTRUSTED_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_LOW_RID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_MEDIUM_RID => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_MANDATORY_MEDIUM_PLUS_RID => 8448

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_HIGH_RID => 12288

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_SYSTEM_RID => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_PROTECTED_PROCESS_RID => 20480

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_MANDATORY_MAXIMUM_USER_RID => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_AUTHORITY_RID_COUNT => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_AUTHORITY_ASSERTED_RID => 1

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_SERVICE_ASSERTED_RID => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_FRESH_KEY_AUTH_RID => 3

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_KEY_TRUST_RID => 4

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_KEY_PROPERTY_MFA_RID => 5

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_AUTHENTICATION_KEY_PROPERTY_ATTESTATION_RID => 6

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_TRUST_AUTHORITY_RID_COUNT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_TYPE_FULL_RID => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_TYPE_LITE_RID => 512

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_TYPE_NONE_RID => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_WINTCB_RID => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_WINDOWS_RID => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_APP_RID => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_ANTIMALWARE_RID => 1536

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_AUTHENTICODE_RID => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SECURITY_PROCESS_PROTECTION_LEVEL_NONE_RID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_TRUSTED_INSTALLER_RID1 => 956008885

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_TRUSTED_INSTALLER_RID2 => 3418522649

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_TRUSTED_INSTALLER_RID3 => 1831038044

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_TRUSTED_INSTALLER_RID4 => 1853292631

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_TRUSTED_INSTALLER_RID5 => 2271478464

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_MANDATORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_ENABLED_BY_DEFAULT => 2

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_ENABLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_OWNER => 8

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_USE_FOR_DENY_ONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_INTEGRITY => 32

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_INTEGRITY_ENABLED => 64

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_LOGON_ID => -1073741824

    /**
     * @type {Integer (Int32)}
     */
    static SE_GROUP_RESOURCE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION3 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION4 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_ACL_REVISION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MIN_MS_ACE_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALLOWED_ACE_TYPE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED_ACE_TYPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_AUDIT_ACE_TYPE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ALARM_ACE_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_V2_ACE_TYPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALLOWED_COMPOUND_ACE_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_V3_ACE_TYPE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MIN_MS_OBJECT_ACE_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALLOWED_OBJECT_ACE_TYPE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED_OBJECT_ACE_TYPE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_AUDIT_OBJECT_ACE_TYPE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ALARM_OBJECT_ACE_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_OBJECT_ACE_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_V4_ACE_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_ACE_TYPE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALLOWED_CALLBACK_ACE_TYPE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED_CALLBACK_ACE_TYPE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_ALLOWED_CALLBACK_OBJECT_ACE_TYPE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED_CALLBACK_OBJECT_ACE_TYPE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_AUDIT_CALLBACK_ACE_TYPE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ALARM_CALLBACK_ACE_TYPE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_AUDIT_CALLBACK_OBJECT_ACE_TYPE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ALARM_CALLBACK_OBJECT_ACE_TYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_MANDATORY_LABEL_ACE_TYPE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_RESOURCE_ATTRIBUTE_ACE_TYPE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SCOPED_POLICY_ID_ACE_TYPE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PROCESS_TRUST_LABEL_ACE_TYPE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ACCESS_FILTER_ACE_TYPE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_MS_V5_ACE_TYPE => 21

    /**
     * @type {Integer (UInt32)}
     */
    static VALID_INHERIT_FLAGS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_ACE_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRUST_PROTECTED_FILTER_ACE_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_MANDATORY_LABEL_NO_WRITE_UP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_MANDATORY_LABEL_NO_READ_UP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_MANDATORY_LABEL_NO_EXECUTE_UP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PROCESS_TRUST_LABEL_VALID_MASK => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PROCESS_TRUST_NOCONSTRAINT_MASK => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ACCESS_FILTER_VALID_MASK => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static SYSTEM_ACCESS_FILTER_NOCONSTRAINT_MASK => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_DESCRIPTOR_REVISION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SECURITY_DESCRIPTOR_REVISION1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_OBJECT_GUID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_PROPERTY_SET_GUID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_PROPERTY_GUID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_MAX_LEVEL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static AUDIT_ALLOW_NO_PRIVILEGE => 1

    /**
     * @type {String}
     */
    static ACCESS_DS_SOURCE_A => "DS"

    /**
     * @type {String}
     */
    static ACCESS_DS_SOURCE_W => "DS"

    /**
     * @type {String}
     */
    static ACCESS_DS_OBJECT_TYPE_NAME_A => "Directory Service Object"

    /**
     * @type {String}
     */
    static ACCESS_DS_OBJECT_TYPE_NAME_W => "Directory Service Object"

    /**
     * @type {Integer (UInt32)}
     */
    static PRIVILEGE_SET_ALL_NECESSARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_REASON_TYPE_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_REASON_DATA_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_REASON_STAGING_MASK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESS_REASON_EXDATA_MASK => 2130706432

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SECURITY_DESCRIPTOR_FLAG_NO_OWNER_ACE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SECURITY_DESCRIPTOR_FLAG_NO_LABEL_ACE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SECURITY_DESCRIPTOR_FLAG_NO_ACCESS_FILTER_ACE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SECURITY_DESCRIPTOR_VALID_FLAGS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ACCESS_CHECK_FLAG_NO_LEARNING_MODE_LOGGING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SE_ACCESS_CHECK_VALID_FLAGS => 8

    /**
     * @type {String}
     */
    static SE_ACTIVATE_AS_USER_CAPABILITY => "activateAsUser"

    /**
     * @type {String}
     */
    static SE_CONSTRAINED_IMPERSONATION_CAPABILITY => "constrainedImpersonation"

    /**
     * @type {String}
     */
    static SE_SESSION_IMPERSONATION_CAPABILITY => "sessionImpersonation"

    /**
     * @type {String}
     */
    static SE_MUMA_CAPABILITY => "muma"

    /**
     * @type {String}
     */
    static SE_DEVELOPMENT_MODE_NETWORK_CAPABILITY => "developmentModeNetwork"

    /**
     * @type {String}
     */
    static SE_LEARNING_MODE_LOGGING_CAPABILITY => "learningModeLogging"

    /**
     * @type {String}
     */
    static SE_PERMISSIVE_LEARNING_MODE_CAPABILITY => "permissiveLearningMode"

    /**
     * @type {String}
     */
    static SE_APP_SILO_VOLUME_ROOT_MINIMAL_CAPABILITY => "isolatedWin32-volumeRootMinimal"

    /**
     * @type {String}
     */
    static SE_APP_SILO_PROFILES_ROOT_MINIMAL_CAPABILITY => "isolatedWin32-profilesRootMinimal"

    /**
     * @type {String}
     */
    static SE_APP_SILO_USER_PROFILE_MINIMAL_CAPABILITY => "isolatedWin32-userProfileMinimal"

    /**
     * @type {String}
     */
    static SE_APP_SILO_PROMPT_FOR_ACCESS_CAPABILITY => "isolatedWin32-promptForAccess"

    /**
     * @type {String}
     */
    static SE_APP_SILO_ACCESS_TO_PUBLISHER_DIRECTORY_CAPABILITY => "isolatedWin32-accessToPublisherDirectory"

    /**
     * @type {String}
     */
    static SE_APP_SILO_PRINT_CAPABILITY => "isolatedWin32-print"

    /**
     * @type {Integer (UInt32)}
     */
    static POLICY_AUDIT_SUBCATEGORY_COUNT => 59

    /**
     * @type {Integer (UInt32)}
     */
    static TOKEN_SOURCE_LENGTH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_TYPE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTE_CUSTOM_FLAGS => 4294901760

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION_V1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CLAIM_SECURITY_ATTRIBUTES_INFORMATION_VERSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROCESS_TRUST_LABEL_SECURITY_INFORMATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static ACCESS_FILTER_SECURITY_INFORMATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_UNCHECKED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_UNSIGNED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_ENTERPRISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_DEVELOPER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_AUTHENTICODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_2 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_STORE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_3 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_ANTIMALWARE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_MICROSOFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_4 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_5 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_DYNAMIC_CODEGEN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_WINDOWS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_7 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_WINDOWS_TCB => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SE_SIGNING_LEVEL_CUSTOM_6 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_ASSIGN_PROCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SET_ATTRIBUTES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_QUERY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_TERMINATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_SET_SECURITY_ATTRIBUTES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_IMPERSONATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FLS_MAXIMUM_AVAILABLE => 4080

    /**
     * @type {Integer (UInt32)}
     */
    static TLS_MINIMUM_AVAILABLE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_DYNAMIC_CODE_ALLOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_BASE_PRIORITY_LOWRT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_BASE_PRIORITY_MAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_BASE_PRIORITY_MIN => -2

    /**
     * @type {Integer (Int32)}
     */
    static THREAD_BASE_PRIORITY_IDLE => -15

    /**
     * @type {Integer (UInt32)}
     */
    static COMPONENT_KTM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static COMPONENT_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PRIORITY_LOWEST => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_EH_CONTINUATION_TARGET_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_EH_CONTINUATION_TARGET_PROCESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_ENFORCED_ADDRESS_RANGE_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_ENFORCED_ADDRESS_RANGE_PROCESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QUOTA_LIMITS_USE_DEFAULT_LIMITS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_HW_COUNTERS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static THREAD_PROFILING_FLAG_DISPATCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_NET_RATE_CONTROL_MAX_DSCP_TAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_END_OF_JOB_TIME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_END_OF_PROCESS_TIME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_ACTIVE_PROCESS_LIMIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_ACTIVE_PROCESS_ZERO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_NEW_PROCESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_EXIT_PROCESS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_ABNORMAL_EXIT_PROCESS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_PROCESS_MEMORY_LIMIT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_JOB_MEMORY_LIMIT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_NOTIFICATION_LIMIT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_JOB_CYCLE_TIME_LIMIT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_SILO_TERMINATED => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_MINIMUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_MSG_MAXIMUM => 13

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_IME => 256

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UILIMIT_ALL => 511

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_UI_VALID_FLAGS => 511

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_CPU_RATE_CONTROL_PER_PROCESSOR_CAPS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PARTITION_QUERY_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEMORY_PARTITION_MODIFY_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MUTANT_QUERY_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_ZONE_ID_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_ZONE_ID_STANDARD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TIME_ZONE_ID_DAYLIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LTP_PC_SMT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CACHE_FULLY_ASSOCIATIVE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_INTEL_386 => 386

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_INTEL_486 => 486

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_INTEL_PENTIUM => 586

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_INTEL_IA64 => 2200

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_AMD_X8664 => 8664

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_MIPS_R4000 => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_ALPHA_21064 => 21064

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PPC_601 => 601

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PPC_603 => 603

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PPC_604 => 604

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PPC_620 => 620

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_HITACHI_SH3 => 10003

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_HITACHI_SH3E => 10004

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_HITACHI_SH4 => 10005

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_MOTOROLA_821 => 821

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_SHx_SH3 => 103

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_SHx_SH4 => 104

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_STRONGARM => 2577

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_ARM720 => 1824

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_ARM820 => 2080

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_ARM920 => 2336

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_ARM_7TDMI => 70001

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_OPTIL => 18767

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_LEGACY_FLOATING_POINT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_LEGACY_SSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_GSSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AVX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_MPX_BNDREGS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_MPX_BNDCSR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AVX512_KMASK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AVX512_ZMM_H => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AVX512_ZMM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_IPT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_PASID => 10

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CET_U => 11

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CET_S => 12

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AMX_TILE_CONFIG => 17

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_AMX_TILE_DATA => 18

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_LWP => 62

    /**
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_XSTATE_FEATURES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_ARM64_SVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_FIRST_NON_LEGACY_FEATURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_COMPACTION_ENABLE => 63

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_ALIGN_BIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_XFD_BIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CONTROLFLAG_XSAVEOPT_MASK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CONTROLFLAG_XSAVEC_MASK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XSTATE_CONTROLFLAG_XFD_MASK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CFG_CALL_TARGET_VALID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CFG_CALL_TARGET_PROCESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CFG_CALL_TARGET_CONVERT_EXPORT_SUPPRESSED_TO_VALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CFG_CALL_TARGET_VALID_XFG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CFG_CALL_TARGET_CONVERT_XFG_TO_CFG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_QUERY_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SESSION_MODIFY_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_TOP_DOWN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_WRITE_WATCH => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_PHYSICAL => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_ROTATE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_DIFFERENT_IMAGE_BASE_OK => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_4MB_PAGES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_COALESCE_PLACEHOLDERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_GRAPHICS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_NONPAGED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_ZERO_PAGES_OPTIONAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_NONPAGED_LARGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_NONPAGED_HUGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_SOFT_FAULT_PAGES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_EC_CODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_EXTENDED_PARAMETER_TYPE_BITS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SEC_HUGE_PAGES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_WATCH_FLAG_RESET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VM_PREFETCH_TO_WORKING_SET => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_TYPE_SGX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_TYPE_SGX2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_TYPE_VBS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VBS_FLAG_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_TYPE_VBS_BASIC => 17

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_BASIC_PAGE_MEASURED_DATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_BASIC_PAGE_UNMEASURED_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_BASIC_PAGE_ZERO_FILL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_BASIC_PAGE_THREAD_DESCRIPTOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VBS_BASIC_PAGE_SYSTEM_CALL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DEDICATED_MEMORY_CACHE_ELIGIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_ATTRIBUTE_PRIVACY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_ATTRIBUTE_INTEGRITY => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_ATTRIBUTE_GLOBAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TREE_CONNECT_ATTRIBUTE_PINNED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ATTRIBUTE_STRICTLY_SEQUENTIAL => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MAILSLOT_NO_MESSAGE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static MAILSLOT_WAIT_FOREVER => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CASE_SENSITIVE_SEARCH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CASE_PRESERVED_NAMES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_UNICODE_ON_DISK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_PERSISTENT_ACLS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_FILE_COMPRESSION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VOLUME_QUOTAS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_SPARSE_FILES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_REPARSE_POINTS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_REMOTE_STORAGE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_RETURNS_CLEANUP_RESULT_INFO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_POSIX_UNLINK_RENAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_BYPASS_IO => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_STREAM_SNAPSHOTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_CASE_SENSITIVE_DIRS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_VOLUME_IS_COMPRESSED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_OBJECT_IDS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_ENCRYPTION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAMED_STREAMS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ONLY_VOLUME => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SEQUENTIAL_WRITE_ONCE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_TRANSACTIONS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_HARD_LINKS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_EXTENDED_ATTRIBUTES => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_OPEN_BY_FILE_ID => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_USN_JOURNAL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_INTEGRITY_STREAMS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_BLOCK_REFCOUNTING => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_SPARSE_VDL => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_DAX_VOLUME => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_SUPPORTS_GHOSTING => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_FLAG_HARDLINK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_FLAG_NTFS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_FLAG_DOS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_FLAG_BOTH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NAME_FLAGS_UNSPECIFIED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_UID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_GID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_MODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_METADATA_HAS_DEVICE_ID => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LX_FILE_CASE_SENSITIVE_DIR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CS_FLAG_CASE_SENSITIVE_DIR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_FLAGS_FILE_DATA_ONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_FLAGS_NO_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_FLAGS_FILE_DATA_SYNC_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_FLAGS_FLUSH_AND_PURGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_RESERVED_ZERO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_RESERVED_ONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_RESERVED_TWO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_RESERVED_RANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_RESERVED_INVALID => -1073709056

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_MOUNT_POINT => 2684354563

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_HSM => 3221225476

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_HSM2 => 2147483654

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_SIS => 2147483655

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WIM => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CSV => 2147483657

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_DFS => 2147483658

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_SYMLINK => 2684354572

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_DFSR => 2147483666

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_DEDUP => 2147483667

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_NFS => 2147483668

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_FILE_PLACEHOLDER => 2147483669

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WOF => 2147483671

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WCI => 2147483672

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WCI_1 => 2415923224

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_GLOBAL_REPARSE => 2684354585

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD => 2415919130

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_1 => 2415923226

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_2 => 2415927322

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_3 => 2415931418

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_4 => 2415935514

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_5 => 2415939610

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_6 => 2415943706

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_7 => 2415947802

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_8 => 2415951898

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_9 => 2415955994

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_A => 2415960090

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_B => 2415964186

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_C => 2415968282

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_D => 2415972378

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_E => 2415976474

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_F => 2415980570

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_CLOUD_MASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_APPEXECLINK => 2147483675

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_PROJFS => 2415919132

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_STORAGE_SYNC => 2147483678

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WCI_TOMBSTONE => 2684354591

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_UNHANDLED => 2147483680

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_ONEDRIVE => 2147483681

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_PROJFS_TOMBSTONE => 2684354594

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_AF_UNIX => 2147483683

    /**
     * @type {Integer (Int32)}
     */
    static IO_REPARSE_TAG_STORAGE_SYNC_FOLDER => -1879048153

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WCI_LINK => 2684354599

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_WCI_LINK_1 => 2684358695

    /**
     * @type {Integer (UInt32)}
     */
    static IO_REPARSE_TAG_DATALESS_CIM => 2684354600

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_RESUME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_SKIP_IN_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_SKIP_NON_INTEGRITY_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_IGNORE_REDUNDANCY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_SKIP_DATA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_SCRUB_BY_OBJECT_ID => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_INPUT_FLAG_OPLOCK_NOT_ACQUIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_OUTPUT_FLAG_INCOMPLETE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_OUTPUT_FLAG_NON_USER_DATA_RANGE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_OUTPUT_FLAG_PARITY_EXTENT_DATA_RETURNED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_OUTPUT_FLAG_RESUME_CONTEXT_LENGTH_SPECIFIED => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SHUFFLE_FILE_FLAG_SKIP_INITIALIZING_NEW_CLUSTERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IO_COMPLETION_MODIFY_STATE => 2

    /**
     * @type {String}
     */
    static SMB_CCF_APP_INSTANCE_EA_NAME => "ClusteredApplicationInstance"

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_APP_INSTANCE_CSV_FLAGS_VALID_ONLY_IF_CSV_COORDINATOR => 1

    /**
     * @type {Guid}
     */
    static GUID_MAX_POWER_SAVINGS => Guid("{a1841308-3541-4fab-bc81-f71556f20b4a}")

    /**
     * @type {Guid}
     */
    static GUID_MIN_POWER_SAVINGS => Guid("{8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c}")

    /**
     * @type {Guid}
     */
    static GUID_TYPICAL_POWER_SAVINGS => Guid("{381b4222-f694-41f0-9685-ff5bb260df2e}")

    /**
     * @type {Guid}
     */
    static NO_SUBGROUP_GUID => Guid("{fea3413e-7e05-4911-9a71-700331f1c294}")

    /**
     * @type {Guid}
     */
    static ALL_POWERSCHEMES_GUID => Guid("{68a1e95e-13ea-41e1-8011-0c496ca490b0}")

    /**
     * @type {Guid}
     */
    static GUID_POWERSCHEME_PERSONALITY => Guid("{245d8541-3943-4422-b025-13a784f679b7}")

    /**
     * @type {Guid}
     */
    static GUID_ACTIVE_POWERSCHEME => Guid("{31f9f286-5084-42fe-b720-2b0264993763}")

    /**
     * @type {Guid}
     */
    static GUID_POWER_MODE_BEST_EFFICIENCY => Guid("{961cc777-2547-4f9d-8174-7d86181b8a7a}")

    /**
     * @type {Guid}
     */
    static GUID_POWER_MODE_NONE => Guid("{00000000-0000-0000-0000-000000000000}")

    /**
     * @type {Guid}
     */
    static GUID_POWER_MODE_PERFORMANCE => Guid("{3af9b8d9-7c97-431d-ad78-34a8bfea439f}")

    /**
     * @type {Guid}
     */
    static GUID_POWER_MODE_BEST_PERFORMANCE => Guid("{ded574b5-45a0-4f42-8737-46345c09c238}")

    /**
     * @type {Guid}
     */
    static GUID_IDLE_RESILIENCY_SUBGROUP => Guid("{2e601130-5351-4d9d-8e04-252966bad054}")

    /**
     * @type {Guid}
     */
    static GUID_IDLE_RESILIENCY_PERIOD => Guid("{c42b79aa-aa3a-484b-a98f-2cf32aa90a28}")

    /**
     * @type {Guid}
     */
    static GUID_DEEP_SLEEP_ENABLED => Guid("{d502f7ee-1dc7-4efd-a55d-f04b6f5c0545}")

    /**
     * @type {Guid}
     */
    static GUID_DEEP_SLEEP_PLATFORM_STATE => Guid("{d23f2fb8-9536-4038-9c94-1ce02e5c2152}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_COALESCING_POWERDOWN_TIMEOUT => Guid("{c36f0eb4-2988-4a70-8eee-0884fc2c2433}")

    /**
     * @type {Guid}
     */
    static GUID_EXECUTION_REQUIRED_REQUEST_TIMEOUT => Guid("{3166bc41-7e98-4e03-b34e-ec0f5f2b218e}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_SUBGROUP => Guid("{7516b95f-f776-4464-8c53-06167f40cc99}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_POWERDOWN_TIMEOUT => Guid("{3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_ANNOYANCE_TIMEOUT => Guid("{82dbcf2d-cd67-40c5-bfdc-9f1a5ccd4663}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_ADAPTIVE_PERCENT_INCREASE => Guid("{eed904df-b142-4183-b10b-5a1197a37864}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_DIM_TIMEOUT => Guid("{17aaa29b-8b43-4b94-aafe-35f64daaf1ee}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_ADAPTIVE_POWERDOWN => Guid("{90959d22-d6a1-49b9-af93-bce885ad335b}")

    /**
     * @type {Guid}
     */
    static GUID_MONITOR_POWER_ON => Guid("{02731015-4510-4526-99e6-e5a17ebd1aea}")

    /**
     * @type {Guid}
     */
    static GUID_DEVICE_POWER_POLICY_VIDEO_BRIGHTNESS => Guid("{aded5e82-b909-4619-9949-f5d71dac0bcb}")

    /**
     * @type {Guid}
     */
    static GUID_DEVICE_POWER_POLICY_VIDEO_DIM_BRIGHTNESS => Guid("{f1fbfde2-a960-4165-9f88-50667911ce96}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_CURRENT_MONITOR_BRIGHTNESS => Guid("{8ffee2c6-2d01-46be-adb9-398addc5b4ff}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_ADAPTIVE_DISPLAY_BRIGHTNESS => Guid("{fbd9aa66-9553-4097-ba44-ed6e9d65eab8}")

    /**
     * @type {Guid}
     */
    static GUID_CONSOLE_DISPLAY_STATE => Guid("{6fe69556-704a-47a0-8f24-c28d936fda47}")

    /**
     * @type {Guid}
     */
    static GUID_ALLOW_DISPLAY_REQUIRED => Guid("{a9ceb8da-cd46-44fb-a98b-02af69de4623}")

    /**
     * @type {Guid}
     */
    static GUID_VIDEO_CONSOLE_LOCK_TIMEOUT => Guid("{8ec4b3a5-6868-48c2-be75-4f3044be88a7}")

    /**
     * @type {Guid}
     */
    static GUID_ADVANCED_COLOR_QUALITY_BIAS => Guid("{684c3e69-a4f7-4014-8754-d45179a56167}")

    /**
     * @type {Guid}
     */
    static GUID_ADAPTIVE_POWER_BEHAVIOR_SUBGROUP => Guid("{8619b916-e004-4dd8-9b66-dae86f806698}")

    /**
     * @type {Guid}
     */
    static GUID_NON_ADAPTIVE_INPUT_TIMEOUT => Guid("{5adbbfbc-074e-4da1-ba38-db8b36b2c8f3}")

    /**
     * @type {Guid}
     */
    static GUID_ADAPTIVE_INPUT_CONTROLLER_STATE => Guid("{0e98fae9-f45a-4de1-a757-6031f197f6ea}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_SUBGROUP => Guid("{0012ee47-9041-4b5d-9b77-535fba8b1442}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_MAX_POWER => Guid("{51dea550-bb38-4bc4-991b-eacf37be5ec8}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_POWERDOWN_TIMEOUT => Guid("{6738e2c4-e8a5-4a42-b16a-e040e769756e}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_IDLE_TIMEOUT => Guid("{58e39ba8-b8e6-4ef6-90d0-89ae32b258d6}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_BURST_IGNORE_THRESHOLD => Guid("{80e3c60e-bb94-4ad8-bbe0-0d3195efc663}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_ADAPTIVE_POWERDOWN => Guid("{396a32e1-499a-40b2-9124-a96afe707667}")

    /**
     * @type {Guid}
     */
    static GUID_DISK_NVME_NOPPME => Guid("{fc7372b6-ab2d-43ee-8797-15e9841f2cca}")

    /**
     * @type {Guid}
     */
    static GUID_SLEEP_SUBGROUP => Guid("{238c9fa8-0aad-41ed-83f4-97be242c8f20}")

    /**
     * @type {Guid}
     */
    static GUID_SLEEP_IDLE_THRESHOLD => Guid("{81cd32e0-7833-44f3-8737-7081f38d1f70}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_TIMEOUT => Guid("{29f6c1db-86da-48c5-9fdb-f2b67b1f44da}")

    /**
     * @type {Guid}
     */
    static GUID_UNATTEND_SLEEP_TIMEOUT => Guid("{7bc4a2f9-d8fc-4469-b07b-33eb785aaca0}")

    /**
     * @type {Guid}
     */
    static GUID_HIBERNATE_TIMEOUT => Guid("{9d7815a6-7ee4-497e-8888-515a05f02364}")

    /**
     * @type {Guid}
     */
    static GUID_HIBERNATE_FASTS4_POLICY => Guid("{94ac6d29-73ce-41a6-809f-6363ba21b47e}")

    /**
     * @type {Guid}
     */
    static GUID_CRITICAL_POWER_TRANSITION => Guid("{b7a27025-e569-46c2-a504-2b96cad225a1}")

    /**
     * @type {Guid}
     */
    static GUID_SYSTEM_AWAYMODE => Guid("{98a7f580-01f7-48aa-9c0f-44352c29e5c0}")

    /**
     * @type {Guid}
     */
    static GUID_ALLOW_AWAYMODE => Guid("{25dfa149-5dd1-4736-b5ab-e8a37b5b8187}")

    /**
     * @type {Guid}
     */
    static GUID_USER_PRESENCE_PREDICTION => Guid("{82011705-fb95-4d46-8d35-4042b1d20def}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_BUDGET_GRACE_PERIOD => Guid("{60c07fe1-0556-45cf-9903-d56e32210242}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_BUDGET_PERCENT => Guid("{9fe527be-1b70-48da-930d-7bcf17b44990}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_BUDGET_REFRESH_COUNT => Guid("{aca8648e-c4b1-4baa-8cce-9390ad647f8c}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_BUDGET_REFRESH_INTERVAL => Guid("{61f45dfe-1919-4180-bb46-8cc70e0b38f1}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_RESERVE_GRACE_PERIOD => Guid("{c763ee92-71e8-4127-84eb-f6ed043a3e3d}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_RESERVE_TIME => Guid("{468fe7e5-1158-46ec-88bc-5b96c9e44fd0}")

    /**
     * @type {Guid}
     */
    static GUID_STANDBY_RESET_PERCENT => Guid("{49cb11a5-56e2-4afb-9d38-3df47872e21b}")

    /**
     * @type {Guid}
     */
    static GUID_HUPR_ADAPTIVE_AWAY_DISPLAY_TIMEOUT => Guid("{0a7d6ab6-ac83-4ad1-8282-eca5b58308f3}")

    /**
     * @type {Guid}
     */
    static GUID_HUPR_ADAPTIVE_INATTENTIVE_DIM_TIMEOUT => Guid("{cf8c6097-12b8-4279-bbdd-44601ee5209d}")

    /**
     * @type {Guid}
     */
    static GUID_HUPR_ADAPTIVE_INATTENTIVE_DISPLAY_TIMEOUT => Guid("{ee16691e-6ab3-4619-bb48-1c77c9357e5a}")

    /**
     * @type {Guid}
     */
    static GUID_HUPR_ADAPTIVE_AWAY_DIM_TIMEOUT => Guid("{a79c8e0e-f271-482d-8f8a-5db9a18312de}")

    /**
     * @type {Guid}
     */
    static GUID_ALLOW_STANDBY_STATES => Guid("{abfc2519-3608-4c2a-94ea-171b0ed546ab}")

    /**
     * @type {Guid}
     */
    static GUID_ALLOW_RTC_WAKE => Guid("{bd3b718a-0680-4d9d-8ab2-e1d2b4ac806d}")

    /**
     * @type {Guid}
     */
    static GUID_LEGACY_RTC_MITIGATION => Guid("{1a34bdc3-7e6b-442e-a9d0-64b6ef378e84}")

    /**
     * @type {Guid}
     */
    static GUID_ALLOW_SYSTEM_REQUIRED => Guid("{a4b195f5-8225-47d8-8012-9d41369786e2}")

    /**
     * @type {Guid}
     */
    static GUID_POWER_SAVING_STATUS => Guid("{e00958c0-c213-4ace-ac77-fecced2eeea5}")

    /**
     * @type {Guid}
     */
    static GUID_ENERGY_SAVER_STATUS => Guid("{550e8400-e29b-41d4-a716-446655440000}")

    /**
     * @type {Guid}
     */
    static GUID_ENERGY_SAVER_SUBGROUP => Guid("{de830923-a562-41af-a086-e3a2c6bad2da}")

    /**
     * @type {Guid}
     */
    static GUID_ENERGY_SAVER_BATTERY_THRESHOLD => Guid("{e69653ca-cf7f-4f05-aa73-cb833fa90ad4}")

    /**
     * @type {Guid}
     */
    static GUID_ENERGY_SAVER_BRIGHTNESS => Guid("{13d09884-f74e-474a-a852-b6bde8ad03a8}")

    /**
     * @type {Guid}
     */
    static GUID_ENERGY_SAVER_POLICY => Guid("{5c5bb349-ad29-4ee2-9d0b-2b25270f7a81}")

    /**
     * @type {Guid}
     */
    static GUID_SYSTEM_BUTTON_SUBGROUP => Guid("{4f971e89-eebd-4455-a8de-9e59040e7347}")

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_INDEX_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_INDEX_SLEEP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_INDEX_HIBERNATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_INDEX_SHUTDOWN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_INDEX_TURN_OFF_THE_DISPLAY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_VALUE_NOTHING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_VALUE_SLEEP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_VALUE_HIBERNATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_VALUE_SHUTDOWN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static POWERBUTTON_ACTION_VALUE_TURN_OFF_THE_DISPLAY => 8

    /**
     * @type {Guid}
     */
    static GUID_POWERBUTTON_ACTION => Guid("{7648efa3-dd9c-4e3e-b566-50f929386280}")

    /**
     * @type {Guid}
     */
    static GUID_SLEEPBUTTON_ACTION => Guid("{96996bc0-ad50-47ec-923b-6f41874dd9eb}")

    /**
     * @type {Guid}
     */
    static GUID_USERINTERFACEBUTTON_ACTION => Guid("{a7066653-8d6c-40a8-910e-a1f54b84c7e5}")

    /**
     * @type {Guid}
     */
    static GUID_LIDCLOSE_ACTION => Guid("{5ca83367-6e45-459f-a27b-476b1d01c936}")

    /**
     * @type {Guid}
     */
    static GUID_LIDOPEN_POWERSTATE => Guid("{99ff10e7-23b1-4c07-a9d1-5c3206d741b4}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_SUBGROUP => Guid("{e73a048d-bf27-4f12-9731-8b2076e8891f}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_ACTION_0 => Guid("{637ea02f-bbcb-4015-8e2c-a1c7b9c0b546}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_LEVEL_0 => Guid("{9a66d8d7-4ff7-4ef9-b5a2-5a326ca2a469}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_FLAGS_0 => Guid("{5dbb7c9f-38e9-40d2-9749-4f8a0e9f640f}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_ACTION_1 => Guid("{d8742dcb-3e6a-4b3c-b3fe-374623cdcf06}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_LEVEL_1 => Guid("{8183ba9a-e910-48da-8769-14ae6dc1170a}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_FLAGS_1 => Guid("{bcded951-187b-4d05-bccc-f7e51960c258}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_ACTION_2 => Guid("{421cba38-1a8e-4881-ac89-e33a8b04ece4}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_LEVEL_2 => Guid("{07a07ca2-adaf-40d7-b077-533aaded1bfa}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_FLAGS_2 => Guid("{7fd2f0c4-feb7-4da3-8117-e3fbedc46582}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_ACTION_3 => Guid("{80472613-9780-455e-b308-72d3003cf2f8}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_LEVEL_3 => Guid("{58afd5a6-c2dd-47d2-9fbf-ef70cc5c5965}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_DISCHARGE_FLAGS_3 => Guid("{73613ccf-dbfa-4279-8356-4935f6bf62f3}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SETTINGS_SUBGROUP => Guid("{54533251-82be-4824-96c1-47b60b740d00}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THROTTLE_POLICY => Guid("{57027304-4af6-4104-9260-e3d95248fc36}")

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_IDEAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_SINGLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_ROCKET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_IDEAL_AGGRESSIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_DECREASE_MAX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PERFSTATE_POLICY_CHANGE_INCREASE_MAX => 3

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THROTTLE_MAXIMUM => Guid("{bc5038f7-23e0-4960-96da-33abaf5935ec}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THROTTLE_MAXIMUM_1 => Guid("{bc5038f7-23e0-4960-96da-33abaf5935ed}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THROTTLE_MINIMUM => Guid("{893dee8e-2bef-41e0-89c6-b55d0929964c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THROTTLE_MINIMUM_1 => Guid("{893dee8e-2bef-41e0-89c6-b55d0929964d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_FREQUENCY_LIMIT => Guid("{75b0ae3f-bce0-45a7-8c89-c9611c25e100}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_FREQUENCY_LIMIT_1 => Guid("{75b0ae3f-bce0-45a7-8c89-c9611c25e101}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_ALLOW_THROTTLING => Guid("{3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_THROTTLE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_THROTTLE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_THROTTLE_AUTOMATIC => 2

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLESTATE_POLICY => Guid("{68f262a7-f621-4069-b9a5-4874169be23c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERFSTATE_POLICY => Guid("{bbdc3814-18e9-4463-8a55-d197327c45c0}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_THRESHOLD => Guid("{06cadf0e-64ed-448a-8927-ce7bf90eb35d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_THRESHOLD_1 => Guid("{06cadf0e-64ed-448a-8927-ce7bf90eb35e}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_THRESHOLD => Guid("{12a0ab44-fe28-4fa9-b3bd-4b64f44960a6}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_THRESHOLD_1 => Guid("{12a0ab44-fe28-4fa9-b3bd-4b64f44960a7}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_POLICY => Guid("{465e1f50-b610-473a-ab58-00d1077dc418}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_POLICY_1 => Guid("{465e1f50-b610-473a-ab58-00d1077dc419}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_POLICY => Guid("{40fbefc7-2e9d-4d25-a185-0cfd8574bac6}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_POLICY_1 => Guid("{40fbefc7-2e9d-4d25-a185-0cfd8574bac7}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_TIME => Guid("{984cf492-3bed-4488-a8f9-4286c97bf5aa}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_TIME_1 => Guid("{984cf492-3bed-4488-a8f9-4286c97bf5ab}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_TIME => Guid("{d8edeb9b-95cf-4f95-a73c-b061973693c8}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_TIME_1 => Guid("{d8edeb9b-95cf-4f95-a73c-b061973693c9}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_TIME_CHECK => Guid("{4d2b0152-7d5c-498b-88e2-34345392a2c5}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_BOOST_POLICY => Guid("{45bcc044-d885-43e2-8605-ee0ec6e96b59}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_POLICY_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_POLICY_MAX => 100

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_BOOST_MODE => Guid("{be337238-0d82-4146-a960-4f3749d470c7}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_AGGRESSIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_EFFICIENT_ENABLED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_EFFICIENT_AGGRESSIVE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_AGGRESSIVE_AT_GUARANTEED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_EFFICIENT_AGGRESSIVE_AT_GUARANTEED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_BOOST_MODE_MAX => 6

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_AUTONOMOUS_MODE => Guid("{8baa4a8a-14c6-4451-8e8b-14bdbd197537}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_AUTONOMOUS_MODE_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_AUTONOMOUS_MODE_ENABLED => 1

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_ENERGY_PERFORMANCE_PREFERENCE => Guid("{36687f9e-e3a5-4dbf-b1dc-15eb381c6863}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_ENERGY_PERFORMANCE_PREFERENCE_1 => Guid("{36687f9e-e3a5-4dbf-b1dc-15eb381c6864}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_PERFORMANCE_PREFERENCE => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_ENERGY_PREFERENCE => 0

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_AUTONOMOUS_ACTIVITY_WINDOW => Guid("{cfeda3d0-7697-4566-a922-a9086cd49dfa}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_MINIMUM_ACTIVITY_WINDOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_PERF_MAXIMUM_ACTIVITY_WINDOW => 1270000000

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_DUTY_CYCLING => Guid("{4e4450b3-6179-4e91-b8f1-5bb9938f81a1}")

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_DUTY_CYCLING_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_DUTY_CYCLING_ENABLED => 1

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_ALLOW_SCALING => Guid("{6c2993b0-8f48-481f-bcc6-00dd2742aa06}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_DISABLE => Guid("{5d76a2ca-e8c0-402f-a133-2158492d58ad}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_STATE_MAXIMUM => Guid("{9943e905-9a30-4ec1-9b99-44dd3b76f7a2}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_TIME_CHECK => Guid("{c4581c31-89ab-4597-8e2b-9c9cab440e6b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_DEMOTE_THRESHOLD => Guid("{4b92d758-5a24-4851-a470-815d78aee119}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_IDLE_PROMOTE_THRESHOLD => Guid("{7b224883-b3cc-4d79-819f-8374152cbe7c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_INCREASE_THRESHOLD => Guid("{df142941-20f3-4edf-9a4a-9c83d3d717d1}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_DECREASE_THRESHOLD => Guid("{68dd2f27-a4ce-4e11-8487-3794e4135dfa}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_INCREASE_POLICY => Guid("{c7be0679-2817-4d69-9d02-519a537ed0c6}")

    /**
     * @type {Integer (UInt32)}
     */
    static CORE_PARKING_POLICY_CHANGE_IDEAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CORE_PARKING_POLICY_CHANGE_SINGLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CORE_PARKING_POLICY_CHANGE_ROCKET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CORE_PARKING_POLICY_CHANGE_MULTISTEP => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CORE_PARKING_POLICY_CHANGE_MAX => 3

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_DECREASE_POLICY => Guid("{71021b41-c749-4d21-be74-a00f335d582b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_MAX_CORES => Guid("{ea062031-0e34-4ff1-9b6d-eb1059334028}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_MAX_CORES_1 => Guid("{ea062031-0e34-4ff1-9b6d-eb1059334029}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_MIN_CORES => Guid("{0cc5b647-c1df-4637-891a-dec35c318583}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_MIN_CORES_1 => Guid("{0cc5b647-c1df-4637-891a-dec35c318584}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_INCREASE_TIME => Guid("{2ddd5a84-5a71-437e-912a-db0b8c788732}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_DECREASE_TIME => Guid("{dfd10d17-d5eb-45dd-877a-9a34ddd15c82}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_DECREASE_FACTOR => Guid("{8f7b45e3-c393-480a-878c-f67ac3d07082}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_AFFINITY_HISTORY_THRESHOLD => Guid("{5b33697b-e89d-4d38-aa46-9e7dfb7cd2f9}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_AFFINITY_WEIGHTING => Guid("{e70867f1-fa2f-4f4e-aea1-4d8a0ba23b20}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_DECREASE_FACTOR => Guid("{1299023c-bc28-4f0a-81ec-d3295a8d815d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_HISTORY_THRESHOLD => Guid("{9ac18e92-aa3c-4e27-b307-01ae37307129}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_WEIGHTING => Guid("{8809c2d8-b155-42d4-bcda-0d345651b1db}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CORE_PARKING_OVER_UTILIZATION_THRESHOLD => Guid("{943c8cb6-6f93-4227-ad87-e9a3feec08d1}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_CORE_OVERRIDE => Guid("{a55612aa-f624-42c6-a443-7397d064c04f}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_PERF_STATE => Guid("{447235c7-6a8d-4cc0-8e24-9eaf70b96e2b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_PERF_STATE_1 => Guid("{447235c7-6a8d-4cc0-8e24-9eaf70b96e2c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_CONCURRENCY_THRESHOLD => Guid("{2430ab6f-a520-44a2-9601-f7f23b5134b1}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_HEADROOM_THRESHOLD => Guid("{f735a673-2066-4f80-a0c5-ddee0cf1bf5d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PARKING_DISTRIBUTION_THRESHOLD => Guid("{4bdaf4e9-d103-46d7-a5f0-6280121616ef}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SOFT_PARKING_LATENCY => Guid("{97cfac41-2217-47eb-992d-618b1977c907}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_HISTORY => Guid("{7d24baa7-0b84-480f-840c-1b0743c00f5f}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_HISTORY_1 => Guid("{7d24baa7-0b84-480f-840c-1b0743c00f60}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_INCREASE_HISTORY => Guid("{99b3ef01-752f-46a1-80fb-7730011f2354}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_DECREASE_HISTORY => Guid("{0300f6f8-abd6-45a9-b74f-4908691a40b5}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_CORE_PARKING_HISTORY => Guid("{77d7f282-8f1a-42cd-8537-45450a839be8}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_LATENCY_HINT => Guid("{0822df31-9c83-441c-a079-0de4cf009c7b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_LATENCY_HINT_PERF => Guid("{619b7505-003b-4e82-b7a6-4dd29c300971}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_LATENCY_HINT_PERF_1 => Guid("{619b7505-003b-4e82-b7a6-4dd29c300972}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_LATENCY_HINT_EPP => Guid("{4b70f900-cdd9-4e66-aa26-ae8417f98173}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_PERF_LATENCY_HINT_EPP_1 => Guid("{4b70f900-cdd9-4e66-aa26-ae8417f98174}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_LATENCY_HINT_MIN_UNPARK => Guid("{616cdaa5-695e-4545-97ad-97dc2d1bdd88}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_LATENCY_HINT_MIN_UNPARK_1 => Guid("{616cdaa5-695e-4545-97ad-97dc2d1bdd89}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_MODULE_PARKING_POLICY => Guid("{b0deaf6b-59c0-4523-8a45-ca7f40244114}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_COMPLEX_PARKING_POLICY => Guid("{b669a5e9-7b1d-4132-baaa-49190abcfeb6}")

    /**
     * @type {Integer (UInt32)}
     */
    static PARKING_TOPOLOGY_POLICY_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PARKING_TOPOLOGY_POLICY_ROUNDROBIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PARKING_TOPOLOGY_POLICY_SEQUENTIAL => 2

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SMT_UNPARKING_POLICY => Guid("{b28a6829-c5f7-444e-8f61-10e24e85c532}")

    /**
     * @type {Integer (UInt32)}
     */
    static SMT_UNPARKING_POLICY_CORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SMT_UNPARKING_POLICY_CORE_PER_THREAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SMT_UNPARKING_POLICY_LP_ROUNDROBIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SMT_UNPARKING_POLICY_LP_SEQUENTIAL => 3

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESTRICTION_COUNT => Guid("{1a98ad09-af22-42ca-8e61-f0a5802c270a}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_DISTRIBUTE_UTILITY => Guid("{e0007330-f589-42ed-a401-5ddb10e785d3}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESOURCE_PRIORITY => Guid("{603fe9ce-8d01-4b48-a968-1d706c28fd5c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESOURCE_PRIORITY_1 => Guid("{603fe9ce-8d01-4b48-a968-1d706c28fd5d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETEROGENEOUS_POLICY => Guid("{7f2f5cfa-f10c-4823-b5e1-e93ae85f46b5}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_DECREASE_TIME => Guid("{7f2492b6-60b1-45e5-ae55-773f8cd5caec}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_INCREASE_TIME => Guid("{4009efa7-e72d-4cba-9edf-91084ea8cbc3}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_CONTAINMENT_DECREASE_TIME => Guid("{6ff13aeb-7897-4356-9999-dd9930af065f}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_CONTAINMENT_INCREASE_TIME => Guid("{64fcee6b-5b1f-45a4-a76a-19b2c36ee290}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_CONTAINMENT_EFFICIENCY_THRESHOLD => Guid("{69439b22-221b-4830-bd34-f7bcece24583}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_CONTAINMENT_HYBRID_THRESHOLD => Guid("{6788488b-1b90-4d11-8fa7-973e470dff47}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_CONTAINMENT_POLICY => Guid("{60fbe21b-efd9-49f2-b066-8674d8e9f423}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_DECREASE_THRESHOLD => Guid("{f8861c27-95e7-475c-865b-13c0cb3f9d6b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_DECREASE_THRESHOLD_1 => Guid("{f8861c27-95e7-475c-865b-13c0cb3f9d6c}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_INCREASE_THRESHOLD => Guid("{b000397d-9b0b-483d-98c9-692a6060cfbf}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_HETERO_INCREASE_THRESHOLD_1 => Guid("{b000397d-9b0b-483d-98c9-692a6060cfc0}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CLASS0_FLOOR_PERF => Guid("{fddc842b-8364-4edc-94cf-c17f60de1c80}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_CLASS1_INITIAL_PERF => Guid("{1facfc65-a930-4bc5-9f38-504ec097bbc0}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_THREAD_SCHEDULING_POLICY => Guid("{93b8b6dc-0698-4d1c-9ee4-0644e900c85d}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SHORT_THREAD_SCHEDULING_POLICY => Guid("{bae08b81-2d5e-4688-ad6a-13243356654b}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SHORT_THREAD_RUNTIME_THRESHOLD => Guid("{d92998c2-6a48-49ca-85d4-8cceec294570}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SHORT_THREAD_ARCH_CLASS_UPPER_THRESHOLD => Guid("{828423eb-8662-4344-90f7-52bf15870f5a}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_SHORT_THREAD_ARCH_CLASS_LOWER_THRESHOLD => Guid("{53824d46-87bd-4739-aa1b-aa793fac36d6}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_LONG_THREAD_ARCH_CLASS_UPPER_THRESHOLD => Guid("{bf903d33-9d24-49d3-a468-e65e0325046a}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_LONG_THREAD_ARCH_CLASS_LOWER_THRESHOLD => Guid("{43f278bc-0f8a-46d0-8b31-9a23e615d713}")

    /**
     * @type {Guid}
     */
    static GUID_SYSTEM_COOLING_POLICY => Guid("{94d3a615-a899-4ac5-ae2b-e4d8f634367f}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_DISABLE_THRESHOLD => Guid("{38b8383d-cce0-4c79-9e3e-56a4f17cc480}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_DISABLE_THRESHOLD_1 => Guid("{38b8383d-cce0-4c79-9e3e-56a4f17cc481}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_ENABLE_THRESHOLD => Guid("{3d44e256-7222-4415-a9ed-9c45fa3dd830}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_ENABLE_THRESHOLD_1 => Guid("{3d44e256-7222-4415-a9ed-9c45fa3dd831}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_DISABLE_TIME => Guid("{f565999f-3fb0-411a-a226-3f0198dec130}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_DISABLE_TIME_1 => Guid("{f565999f-3fb0-411a-a226-3f0198dec131}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_ENABLE_TIME => Guid("{3d915188-7830-49ae-a79a-0fb0a1e5a200}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_ENABLE_TIME_1 => Guid("{3d915188-7830-49ae-a79a-0fb0a1e5a201}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_EPP_CEILING => Guid("{4427c73b-9756-4a5c-b84b-c7bda79c7320}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_EPP_CEILING_1 => Guid("{4427c73b-9756-4a5c-b84b-c7bda79c7321}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_PERF_FLOOR => Guid("{ce8e92ee-6a86-4572-bfe0-20c21d03cd40}")

    /**
     * @type {Guid}
     */
    static GUID_PROCESSOR_RESPONSIVENESS_PERF_FLOOR_1 => Guid("{ce8e92ee-6a86-4572-bfe0-20c21d03cd41}")

    /**
     * @type {Guid}
     */
    static GUID_LOCK_CONSOLE_ON_WAKE => Guid("{0e796bdb-100d-47d6-a2d5-f7d2daa51f51}")

    /**
     * @type {Guid}
     */
    static GUID_DEVICE_IDLE_POLICY => Guid("{4faab71a-92e5-4726-b531-224559672d19}")

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_DEVICE_IDLE_POLICY_PERFORMANCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_DEVICE_IDLE_POLICY_CONSERVATIVE => 1

    /**
     * @type {Guid}
     */
    static GUID_CONNECTIVITY_IN_STANDBY => Guid("{f15576e8-98b7-4186-b944-eafa664402d9}")

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_CONNECTIVITY_IN_STANDBY_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_CONNECTIVITY_IN_STANDBY_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_CONNECTIVITY_IN_STANDBY_SYSTEM_MANAGED => 2

    /**
     * @type {Guid}
     */
    static GUID_DISCONNECTED_STANDBY_MODE => Guid("{68afb2d9-ee95-47a8-8f50-4115088073b1}")

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_DISCONNECTED_STANDBY_MODE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_DISCONNECTED_STANDBY_MODE_AGGRESSIVE => 1

    /**
     * @type {Guid}
     */
    static GUID_ACDC_POWER_SOURCE => Guid("{5d3e9a59-e9d5-4b00-a6bd-ff34ff516548}")

    /**
     * @type {Guid}
     */
    static GUID_LIDSWITCH_STATE_CHANGE => Guid("{ba3e0f4d-b817-4094-a2d1-d56379e6a0f3}")

    /**
     * @type {Guid}
     */
    static GUID_LIDSWITCH_STATE_RELIABILITY => Guid("{ae4c4ff1-d361-43f4-80aa-bbb6eb03de94}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_PERCENTAGE_REMAINING => Guid("{a7ad8041-b45a-4cae-87a3-eecbb468a9e1}")

    /**
     * @type {Guid}
     */
    static GUID_BATTERY_COUNT => Guid("{7d263f15-fca4-49e5-854b-a9f2bfbd5c24}")

    /**
     * @type {Guid}
     */
    static GUID_GLOBAL_USER_PRESENCE => Guid("{786e8a1d-b427-4344-9207-09e70bdcbea9}")

    /**
     * @type {Guid}
     */
    static GUID_SESSION_DISPLAY_STATUS => Guid("{2b84c20e-ad23-4ddf-93db-05ffbd7efca5}")

    /**
     * @type {Guid}
     */
    static GUID_SESSION_USER_PRESENCE => Guid("{3c0f4548-c03f-4c4d-b9f2-237ede686376}")

    /**
     * @type {Guid}
     */
    static GUID_IDLE_BACKGROUND_TASK => Guid("{515c31d8-f734-163d-a0fd-11a08c91e8f1}")

    /**
     * @type {Guid}
     */
    static GUID_BACKGROUND_TASK_NOTIFICATION => Guid("{cf23f240-2a54-48d8-b114-de1518ff052e}")

    /**
     * @type {Guid}
     */
    static GUID_APPLAUNCH_BUTTON => Guid("{1a689231-7399-4e9a-8f99-b71f999db3fa}")

    /**
     * @type {Guid}
     */
    static GUID_PCIEXPRESS_SETTINGS_SUBGROUP => Guid("{501a4d13-42af-4429-9fd1-a8218c268e20}")

    /**
     * @type {Guid}
     */
    static GUID_PCIEXPRESS_ASPM_POLICY => Guid("{ee12f906-d277-404b-b6da-e5fa1a576df5}")

    /**
     * @type {Guid}
     */
    static GUID_ENABLE_SWITCH_FORCED_SHUTDOWN => Guid("{833a6b62-dfa4-46d1-82f8-e09e34d029d6}")

    /**
     * @type {Guid}
     */
    static GUID_INTSTEER_SUBGROUP => Guid("{48672f38-7a9a-4bb2-8bf8-3d85be19de4e}")

    /**
     * @type {Guid}
     */
    static GUID_INTSTEER_MODE => Guid("{2bfc24f9-5ea2-4801-8213-3dbae01aa39d}")

    /**
     * @type {Guid}
     */
    static GUID_INTSTEER_LOAD_PER_PROC_TRIGGER => Guid("{73cde64d-d720-4bb2-a860-c755afe77ef2}")

    /**
     * @type {Guid}
     */
    static GUID_INTSTEER_TIME_UNPARK_TRIGGER => Guid("{d6ba4903-386f-4c2c-8adb-5c21b3328d25}")

    /**
     * @type {Guid}
     */
    static GUID_GRAPHICS_SUBGROUP => Guid("{5fb4938d-1ee8-4b0f-9a3c-5036b0ab995c}")

    /**
     * @type {Guid}
     */
    static GUID_GPU_PREFERENCE_POLICY => Guid("{dd848b2a-8a5d-4451-9ae2-39cd41658f6c}")

    /**
     * @type {Guid}
     */
    static GUID_MIXED_REALITY_MODE => Guid("{1e626b4e-cf04-4f8d-9cc7-c97c5b0f2391}")

    /**
     * @type {Guid}
     */
    static GUID_SPR_ACTIVE_SESSION_CHANGE => Guid("{0e24ce38-c393-4742-bdb1-744f4b9ee08e}")

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_SYSTEM_MAXIMUM => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DIAGNOSTIC_REASON_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DIAGNOSTIC_REASON_SIMPLE_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIAGNOSTIC_REASON_DETAILED_STRING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIAGNOSTIC_REASON_NOT_SPECIFIED => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_REQUEST_CONTEXT_VERSION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_SETTING_VALUE_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_IDLE_BUCKET_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PROC_IDLE_BUCKET_COUNT_EX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_PPM_SOFTWARE_ALL => 252

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_PPM_SOFTWARE_ANY => 253

    /**
     * @type {Integer (UInt32)}
     */
    static ACPI_PPM_HARDWARE_ALL => 254

    /**
     * @type {Integer (UInt32)}
     */
    static MS_PPM_SOFTWARE_ALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_QUERY_ALLOWED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_UI_ALLOWED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_OVERRIDE_APPS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_HIBERBOOT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_USER_NOTIFY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_DOZE_TO_HIBERNATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_ACPI_CRITICAL => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_ACPI_USER_NOTIFY => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_DIRECTED_DRIPS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_PSEUDO_TRANSITION => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_LIGHTEST_FIRST => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_LOCK_CONSOLE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_DISABLE_WAKES => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_ACTION_CRITICAL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static POWER_USER_NOTIFY_FORCED_SHUTDOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_DISCHARGE_FLAGS_EVENTCODE_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static BATTERY_DISCHARGE_FLAGS_ENABLE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_DISCHARGE_POLICIES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DISCHARGE_POLICY_CRITICAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DISCHARGE_POLICY_LOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESSOR_IDLESTATE_POLICY_COUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PO_THROTTLE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PO_THROTTLE_CONSTANT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PO_THROTTLE_DEGRADE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PO_THROTTLE_ADAPTIVE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PO_THROTTLE_MAXIMUM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HIBERFILE_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static HIBERFILE_TYPE_REDUCED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HIBERFILE_TYPE_FULL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HIBERFILE_TYPE_MAX => 3

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_DOS_SIGNATURE => 23117

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_OS2_SIGNATURE => 17742

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_OS2_SIGNATURE_LE => 17740

    /**
     * @type {Integer (UInt16)}
     */
    static IMAGE_VXD_SIGNATURE => 17740

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_NT_SIGNATURE => 17744

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SIZEOF_FILE_HEADER => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_NUMBEROF_DIRECTORY_ENTRIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SIZEOF_SHORT_NAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SIZEOF_SECTION_HEADER => 40

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SIZEOF_SYMBOL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_SECTION_MAX => 65279

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_SECTION_MAX_EX => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_VOID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_CHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_SHORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_INT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_LONG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_FLOAT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_DOUBLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_STRUCT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_UNION => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_ENUM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_MOE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_BYTE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_WORD => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_UINT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_DWORD => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_TYPE_PCODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_DTYPE_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_DTYPE_POINTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_DTYPE_FUNCTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_DTYPE_ARRAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_NULL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_AUTOMATIC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_EXTERNAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_STATIC => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_REGISTER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_EXTERNAL_DEF => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_LABEL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_UNDEFINED_LABEL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_MEMBER_OF_STRUCT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_ARGUMENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_STRUCT_TAG => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_MEMBER_OF_UNION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_UNION_TAG => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_TYPE_DEFINITION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_UNDEFINED_STATIC => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_ENUM_TAG => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_MEMBER_OF_ENUM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_REGISTER_PARAM => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_BIT_FIELD => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_FAR_EXTERNAL => 68

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_BLOCK => 100

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_FUNCTION => 101

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_END_OF_STRUCT => 102

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_FILE => 103

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_SECTION => 104

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_WEAK_EXTERNAL => 105

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SYM_CLASS_CLR_TOKEN => 107

    /**
     * @type {Integer (UInt32)}
     */
    static N_BTMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static N_TMASK => 48

    /**
     * @type {Integer (UInt32)}
     */
    static N_TMASK1 => 192

    /**
     * @type {Integer (UInt32)}
     */
    static N_TMASK2 => 240

    /**
     * @type {Integer (UInt32)}
     */
    static N_BTSHFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static N_TSHIFT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_NODUPLICATES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_ANY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_SAME_SIZE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_EXACT_MATCH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_ASSOCIATIVE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_LARGEST => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_COMDAT_SELECT_NEWEST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_WEAK_EXTERN_SEARCH_NOLIBRARY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_WEAK_EXTERN_SEARCH_LIBRARY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_WEAK_EXTERN_SEARCH_ALIAS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_WEAK_EXTERN_ANTI_DEPENDENCY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_DIR16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_REL16 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_DIR32 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_DIR32NB => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_SEG12 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_SECTION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_SECREL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_TOKEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_SECREL7 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_I386_REL32 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_REFHALF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_REFWORD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_JMPADDR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_REFHI => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_REFLO => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_GPREL => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_LITERAL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_SECTION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_SECREL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_SECRELLO => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_SECRELHI => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_TOKEN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_JMPADDR16 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_REFWORDNB => 34

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_MIPS_PAIR => 37

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFLONG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFQUAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_GPREL32 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_LITERAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_LITUSE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_GPDISP => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_BRADDR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_HINT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_INLINE_REFLONG => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFHI => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFLO => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_PAIR => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_MATCH => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_SECTION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_SECREL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFLONGNB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_SECRELLO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_SECRELHI => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFQ3 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFQ2 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_REFQ1 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_GPRELLO => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ALPHA_GPRELHI => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR64 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR24 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR14 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_REL24 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_REL14 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_TOCREL16 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_TOCREL14 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_ADDR32NB => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_SECREL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_SECTION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_IFGLUE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_IMGLUE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_SECREL16 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_REFHI => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_REFLO => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_PAIR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_SECRELLO => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_SECRELHI => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_GPREL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_TOKEN => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_TYPEMASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_NEG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_BRTAKEN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_BRNTAKEN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_PPC_TOCDEFN => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT8 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT8_WORD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT8_LONG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT4 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT4_WORD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT4_LONG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_PCREL8_WORD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_PCREL8_LONG => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_PCREL12_WORD => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_STARTOF_SECTION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_SIZEOF_SECTION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_SECTION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_SECREL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_DIRECT32_NB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_GPREL4_LONG => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH3_TOKEN => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_PCRELPT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_REFLO => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_REFHALF => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_RELLO => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_RELHALF => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SHM_PAIR => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_SH_NOMODE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_ADDR32NB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BRANCH24 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BRANCH11 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_TOKEN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_GPREL12 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_GPREL7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BLX24 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BLX11 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_SECTION => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_SECREL => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_MOV32A => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_MOV32 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_MOV32T => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_THUMB_MOV32 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BRANCH20T => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_THUMB_BRANCH20 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BRANCH24T => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_THUMB_BRANCH24 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM_BLX23T => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_THUMB_BLX23 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_ADDR32NB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_CALL32 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_FUNCINFO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_REL32_1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_REL32_2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_SECREL => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_SECTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AM_TOKEN => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_ADDR32NB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_BRANCH26 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_PAGEBASE_REL21 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_REL21 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_PAGEOFFSET_12A => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_PAGEOFFSET_12L => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_SECREL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_SECREL_LOW12A => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_SECREL_HIGH12A => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_SECREL_LOW12L => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_TOKEN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_SECTION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_ADDR64 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_ARM64_BRANCH19 => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_ADDR64 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_ADDR32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_ADDR32NB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32_1 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32_2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32_3 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32_4 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_REL32_5 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_SECTION => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_SECREL => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_SECREL7 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_TOKEN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_SREL32 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_PAIR => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_SSPAN32 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_EHANDLER => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_IMPORT_BR => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_IMPORT_CALL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_CFG_BR => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_CFG_BR_REX => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_CFG_CALL => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_INDIR_BR => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_INDIR_BR_REX => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_INDIR_CALL => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_INDIR_BR_SWITCHTABLE_FIRST => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_AMD64_INDIR_BR_SWITCHTABLE_LAST => 47

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_IMM14 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_IMM22 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_IMM64 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_DIR32 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_DIR64 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL21B => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL21M => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL21F => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_GPREL22 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_LTOFF22 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SECTION => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SECREL22 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SECREL64I => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SECREL32 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_DIR32NB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SREL14 => 17

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SREL22 => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_SREL32 => 19

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_UREL32 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL60X => 21

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL60B => 22

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL60F => 23

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL60I => 24

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_PCREL60M => 25

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_IMMGPREL64 => 26

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_TOKEN => 27

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_GPREL32 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_IA64_ADDEND => 31

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_ADDR64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_ADDR32NB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_SECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_SECREL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEF_TOKEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_ADDR64 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_ADDR32NB => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_SECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_SECREL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_CEE_TOKEN => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_ADDR32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_ADDR32NB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_ADDR24 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_GPREL16 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_PCREL24 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_PCREL16 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_PCREL8 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_REFHALF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_REFHI => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_REFLO => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_PAIR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_SECTION => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_SECREL32 => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_M32R_TOKEN => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_EBC_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_EBC_ADDR32NB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_EBC_REL32 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_EBC_SECTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_EBC_SECREL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM7B_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM7B_SIZE_X => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM7B_INST_WORD_POS_X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM7B_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM9D_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM9D_SIZE_X => 9

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM9D_INST_WORD_POS_X => 18

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM9D_VAL_POS_X => 7

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM5C_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM5C_SIZE_X => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM5C_INST_WORD_POS_X => 13

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM5C_VAL_POS_X => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IC_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IC_SIZE_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IC_INST_WORD_POS_X => 12

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IC_VAL_POS_X => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41a_INST_WORD_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41a_SIZE_X => 10

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41a_INST_WORD_POS_X => 14

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41a_VAL_POS_X => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41b_INST_WORD_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41b_SIZE_X => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41b_INST_WORD_POS_X => 24

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41b_VAL_POS_X => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41c_INST_WORD_X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41c_SIZE_X => 23

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41c_INST_WORD_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_IMM41c_VAL_POS_X => 40

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_SIGN_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_SIGN_SIZE_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_SIGN_INST_WORD_POS_X => 27

    /**
     * @type {Integer (UInt32)}
     */
    static EMARCH_ENC_I17_SIGN_VAL_POS_X => 63

    /**
     * @type {Integer (UInt32)}
     */
    static X3_OPCODE_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_OPCODE_SIZE_X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3_OPCODE_INST_WORD_POS_X => 28

    /**
     * @type {Integer (UInt32)}
     */
    static X3_OPCODE_SIGN_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_I_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_I_SIZE_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static X3_I_INST_WORD_POS_X => 27

    /**
     * @type {Integer (UInt32)}
     */
    static X3_I_SIGN_VAL_POS_X => 59

    /**
     * @type {Integer (UInt32)}
     */
    static X3_D_WH_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_D_WH_SIZE_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_D_WH_INST_WORD_POS_X => 24

    /**
     * @type {Integer (UInt32)}
     */
    static X3_D_WH_SIGN_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM20_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM20_SIZE_X => 20

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM20_INST_WORD_POS_X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM20_SIGN_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_1_INST_WORD_X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_1_SIZE_X => 23

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_1_INST_WORD_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_1_SIGN_VAL_POS_X => 36

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_2_INST_WORD_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_2_SIZE_X => 16

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_2_INST_WORD_POS_X => 16

    /**
     * @type {Integer (UInt32)}
     */
    static X3_IMM39_2_SIGN_VAL_POS_X => 20

    /**
     * @type {Integer (UInt32)}
     */
    static X3_P_INST_WORD_X => 3

    /**
     * @type {Integer (UInt32)}
     */
    static X3_P_SIZE_X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3_P_INST_WORD_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_P_SIGN_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_TMPLT_INST_WORD_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_TMPLT_SIZE_X => 4

    /**
     * @type {Integer (UInt32)}
     */
    static X3_TMPLT_INST_WORD_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_TMPLT_SIGN_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_BTYPE_QP_INST_WORD_X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static X3_BTYPE_QP_SIZE_X => 9

    /**
     * @type {Integer (UInt32)}
     */
    static X3_BTYPE_QP_INST_WORD_POS_X => 23

    /**
     * @type {Integer (UInt32)}
     */
    static X3_BTYPE_QP_INST_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static X3_EMPTY_INST_WORD_X => 1

    /**
     * @type {Integer (UInt32)}
     */
    static X3_EMPTY_SIZE_X => 2

    /**
     * @type {Integer (UInt32)}
     */
    static X3_EMPTY_INST_WORD_POS_X => 14

    /**
     * @type {Integer (UInt32)}
     */
    static X3_EMPTY_INST_VAL_POS_X => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_ABSOLUTE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_HIGH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_LOW => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_HIGHLOW => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_HIGHADJ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MACHINE_SPECIFIC_5 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_RESERVED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MACHINE_SPECIFIC_7 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MACHINE_SPECIFIC_8 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MACHINE_SPECIFIC_9 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_DIR64 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_IA64_IMM64 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MIPS_JMPADDR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_MIPS_JMPADDR16 => 9

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_ARM_MOV32 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_REL_BASED_THUMB_MOV32 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ARCHIVE_START_SIZE => 8

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_START => "!<arch>" Chr(10) ""

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_END => "``" Chr(10) ""

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_PAD => "" Chr(10) ""

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_LINKER_MEMBER => "/               "

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_LONGNAMES_MEMBER => "//              "

    /**
     * @type {String}
     */
    static IMAGE_ARCHIVE_HYBRIDMAP_MEMBER => "/<HYBRIDMAP>/   "

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SIZEOF_ARCHIVE_MEMBER_HDR => 60

    /**
     * @type {Integer (UInt64)}
     */
    static IMAGE_ORDINAL_FLAG64 => 9223372036854775808

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ORDINAL_FLAG32 => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_RESOURCE_NAME_IS_STRING => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_RESOURCE_DATA_IS_DIRECTORY => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_GUARD_RF_PROLOGUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_GUARD_RF_EPILOGUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_GUARD_IMPORT_CONTROL_TRANSFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_GUARD_INDIR_CONTROL_TRANSFER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_GUARD_SWITCHTABLE_BRANCH => 5

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_FUNCTION_OVERRIDE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_ARM64_KERNEL_IMPORT_CALL_TRANSFER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DYNAMIC_RELOCATION_IMPORT_CONTROL_TRANSFER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FUNCTION_OVERRIDE_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FUNCTION_OVERRIDE_X64_REL32 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FUNCTION_OVERRIDE_ARM64_BRANCH26 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_FUNCTION_OVERRIDE_ARM64_THUNK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_INFO_FLAG_PATCHORDERCRITICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_INFO_FLAG_HOTSWAP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_BASE_OBLIGATORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_BASE_CAN_ROLL_BACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_BASE_MACHINE_I386 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_BASE_MACHINE_ARM64 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_BASE_MACHINE_AMD64 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_INVERSE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_OBLIGATORY => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_RESERVED => 1072705536

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_TYPE => 1032192

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_SOURCE_RVA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_TARGET_RVA => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CHUNK_SIZE => 4095

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_FUNCTION => 114688

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_ABSOLUTE => 180224

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_REL32 => 245760

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_CALL_TARGET => 278528

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_INDIRECT => 376832

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_NO_CALL_TARGET => 409600

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_HOT_PATCH_DYNAMIC_VALUE => 491520

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_INSTRUMENTED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CFW_INSTRUMENTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_FUNCTION_TABLE_PRESENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_SECURITY_COOKIE_UNUSED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_PROTECT_DELAYLOAD_IAT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_DELAYLOAD_IAT_IN_ITS_OWN_SECTION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_EXPORT_SUPPRESSION_INFO_PRESENT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_ENABLE_EXPORT_SUPPRESSION => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_LONGJUMP_TABLE_PRESENT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_RF_INSTRUMENTED => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_RF_ENABLE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_RF_STRICT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_RETPOLINE_PRESENT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_EH_CONTINUATION_TABLE_PRESENT => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_XFG_ENABLED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CASTGUARD_PRESENT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_MEMCPY_PRESENT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_FUNCTION_TABLE_SIZE_MASK => 4026531840

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_CF_FUNCTION_TABLE_SIZE_SHIFT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_FLAG_FID_SUPPRESSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_FLAG_EXPORT_SUPPRESSED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_FLAG_FID_LANGEXCPTHANDLER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_GUARD_FLAG_FID_XFG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_LONG_ID_LENGTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_SHORT_ID_LENGTH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_POLICY_DEBUGGABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_FLAG_PRIMARY_IMAGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_IMPORT_MATCH_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_IMPORT_MATCH_UNIQUE_ID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_IMPORT_MATCH_AUTHOR_ID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_IMPORT_MATCH_FAMILY_ID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_ENCLAVE_IMPORT_MATCH_IMAGE_ID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_OMAP_TO_SRC => 7

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_OMAP_FROM_SRC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_RESERVED10 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_BBT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_CLSID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_VC_FEATURE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_POGO => 13

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_ILTCG => 14

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_MPX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_REPRO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_SPGO => 18

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FRAME_FPO => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FRAME_TRAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FRAME_TSS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FRAME_NONFPO => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SIZEOF_RFPO_DATA => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_DEBUG_MISC_EXENAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SEPARATE_DEBUG_SIGNATURE => 18756

    /**
     * @type {Integer (UInt32)}
     */
    static NON_PAGED_DEBUG_SIGNATURE => 18766

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SEPARATE_DEBUG_FLAGS_MASK => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_SEPARATE_DEBUG_MISMATCH => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static IMPORT_OBJECT_HDR_SIG2 => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static UNWIND_HISTORY_TABLE_SIZE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_LEGACY_GS_VIOLATION => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_VTGUARD_CHECK_FAILURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_STACK_COOKIE_CHECK_FAILURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CORRUPT_LIST_ENTRY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INCORRECT_STACK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_ARG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GS_COOKIE_INIT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_FATAL_APP_EXIT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_RANGE_CHECK_FAILURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNSAFE_REGISTRY_ACCESS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_ICALL_CHECK_FAILURE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_WRITE_CHECK_FAILURE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_FIBER_SWITCH => 12

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_SET_OF_CONTEXT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_REFERENCE_COUNT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_JUMP_BUFFER => 18

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_MRDATA_MODIFIED => 19

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CERTIFICATION_FAILURE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_EXCEPTION_CHAIN => 21

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CRYPTO_LIBRARY => 22

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_CALL_IN_DLL_CALLOUT => 23

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_IMAGE_BASE => 24

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_DLOAD_PROTECTION_FAILURE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNSAFE_EXTENSION_CALL => 26

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_DEPRECATED_SERVICE_INVOKED => 27

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_BUFFER_ACCESS => 28

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_BALANCED_TREE => 29

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_NEXT_THREAD => 30

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_ICALL_CHECK_SUPPRESSED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_APCS_DISABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_IDLE_STATE => 33

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_MRDATA_PROTECTION_FAILURE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNEXPECTED_HEAP_EXCEPTION => 35

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_LOCK_STATE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_JUMPTABLE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_LONGJUMP_TARGET => 38

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_DISPATCH_CONTEXT => 39

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_THREAD => 40

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_SYSCALL_NUMBER => 41

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_FILE_OPERATION => 42

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_LPAC_ACCESS_DENIED => 43

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_SS_FAILURE => 44

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_LOADER_CONTINUITY_FAILURE => 45

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_EXPORT_SUPPRESSION_FAILURE => 46

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_CONTROL_STACK => 47

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_SET_CONTEXT_DENIED => 48

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_IAT => 49

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_HEAP_METADATA_CORRUPTION => 50

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_PAYLOAD_RESTRICTION_VIOLATION => 51

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_LOW_LABEL_ACCESS_DENIED => 52

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_ENCLAVE_CALL_FAILURE => 53

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNHANDLED_LSS_EXCEPTON => 54

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_ADMINLESS_ACCESS_DENIED => 55

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNEXPECTED_CALL => 56

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CONTROL_INVALID_RETURN_ADDRESS => 57

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_UNEXPECTED_HOST_BEHAVIOR => 58

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_FLAGS_CORRUPTION => 59

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_VEH_CORRUPTION => 60

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_ETW_CORRUPTION => 61

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_RIO_ABORT => 62

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_PFN => 63

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_GUARD_ICALL_CHECK_FAILURE_XFG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CAST_GUARD => 65

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_HOST_VISIBILITY_CHANGE => 66

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_KERNEL_CET_SHADOW_STACK_ASSIST => 67

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_PATCH_CALLBACK_FAILED => 68

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_NTDLL_PATCH_FAILED => 69

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_FLS_DATA => 70

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_ASAN_ERROR => 71

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CLR_EXCEPTION_AOT => 72

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_POINTER_AUTH_INVALID_RETURN_ADDRESS => 73

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_THREAD_STATE => 74

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_CORRUPT_WOW64_STATE => 75

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_EXTENDED_STATE => 76

    /**
     * @type {Integer (UInt32)}
     */
    static FAST_FAIL_INVALID_FAST_FAIL_CODE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static IS_TEXT_UNICODE_DBCS_LEADBYTE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IS_TEXT_UNICODE_UTF8 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_ENGINE_STANDARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_ENGINE_MAXIMUM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_ENGINE_HIBER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_AI_USE_EXTRA_PARAMS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_FORCE_USER_MODE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SEF_NORMALIZE_OUTPUT_DESCRIPTOR => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MESSAGE_RESOURCE_UNICODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MESSAGE_RESOURCE_UTF8 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_EQUAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_GREATER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_GREATER_EQUAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VER_LESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VER_LESS_EQUAL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static VER_AND => 6

    /**
     * @type {Integer (UInt32)}
     */
    static VER_OR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VER_CONDITION_MASK => 7

    /**
     * @type {Integer (UInt32)}
     */
    static VER_NUM_BITS_PER_CONDITION_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VER_NT_WORKSTATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_NT_DOMAIN_CONTROLLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VER_NT_SERVER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_UMS_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VRL_PREDEFINED_CLASS_BEGIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VRL_CUSTOM_CLASS_BEGIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static VRL_ENABLE_KERNEL_BREAKS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CTMF_INCLUDE_APPCONTAINER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CTMF_INCLUDE_LPAC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLUSH_NV_MEMORY_IN_FLAG_NO_DRAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_NV_MEMORY_FLAG_FLUSH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_NV_MEMORY_FLAG_NON_TEMPORAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WRITE_NV_MEMORY_FLAG_NO_DRAIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FILL_NV_MEMORY_FLAG_FLUSH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILL_NV_MEMORY_FLAG_NON_TEMPORAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILL_NV_MEMORY_FLAG_NO_DRAIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IMAGE_POLICY_METADATA_VERSION => 1

    /**
     * @type {String}
     */
    static IMAGE_POLICY_SECTION_NAME => ".tPolicy"

    /**
     * @type {Integer (UInt32)}
     */
    static RTL_VIRTUAL_UNWIND2_VALIDATE_PAC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HEAP_OPTIMIZE_RESOURCES_CURRENT_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINUITHREAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINPERSISTENTIOTHREAD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEINLONGTHREAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WT_EXECUTEDELETEWAIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_PATH_TYPE_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_PATH_TYPE_WIN32_FILE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_PATH_TYPE_URL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_PATH_TYPE_ASSEMBLYREF => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_BOUNDARY_DESCRIPTOR_ADD_APPCONTAINER_SID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PERFORMANCE_DATA_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static READ_THREAD_PROFILING_FLAG_DISPATCHING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static READ_THREAD_PROFILING_FLAG_HARDWARE_COUNTERS => 2

    /**
     * @type {String}
     */
    static UNIFIEDBUILDREVISION_KEY => "\Registry\Machine\Software\Microsoft\Windows NT\CurrentVersion"

    /**
     * @type {String}
     */
    static UNIFIEDBUILDREVISION_VALUE => "UBR"

    /**
     * @type {Integer (UInt32)}
     */
    static UNIFIEDBUILDREVISION_MIN => 0

    /**
     * @type {String}
     */
    static DEVICEFAMILYDEVICEFORM_KEY => "\Registry\Machine\Software\Microsoft\Windows NT\CurrentVersion\OEM"

    /**
     * @type {String}
     */
    static DEVICEFAMILYDEVICEFORM_VALUE => "DeviceForm"

    /**
     * @type {Integer (UInt32)}
     */
    static DLL_PROCESS_ATTACH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DLL_THREAD_ATTACH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DLL_THREAD_DETACH => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DLL_PROCESS_DETACH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_START_PAIRED_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_END_PAIRED_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_END_ALL_PAIRED_EVENTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_PAIRED_EVENT_ACTIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_PAIRED_EVENT_INACTIVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MAXLOGICALLOGNAMESIZE => 256

    /**
     * @type {Integer (Int32)}
     */
    static REG_REFRESH_HIVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static REG_NO_LAZY_FLUSH => 4

    /**
     * @type {Integer (Int32)}
     */
    static REG_APP_HIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static REG_PROCESS_PRIVATE => 32

    /**
     * @type {Integer (Int32)}
     */
    static REG_START_JOURNAL => 64

    /**
     * @type {Integer (Int32)}
     */
    static REG_HIVE_EXACT_FILE_GROWTH => 128

    /**
     * @type {Integer (Int32)}
     */
    static REG_HIVE_NO_RM => 256

    /**
     * @type {Integer (Int32)}
     */
    static REG_HIVE_SINGLE_LOG => 512

    /**
     * @type {Integer (Int32)}
     */
    static REG_BOOT_HIVE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static REG_LOAD_HIVE_OPEN_HANDLE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static REG_FLUSH_HIVE_FILE_GROWTH => 4096

    /**
     * @type {Integer (Int32)}
     */
    static REG_OPEN_READ_ONLY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static REG_IMMUTABLE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static REG_NO_IMPERSONATION_FALLBACK => 32768

    /**
     * @type {Integer (Int32)}
     */
    static REG_APP_HIVE_OPEN_READ_ONLY => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static REG_FORCE_UNLOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_UNLOAD_LEGAL_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_USER_SERVICE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_USERSERVICE_INSTANCE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INTERACTIVE_PROCESS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PKG_SERVICE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_NETWORK_BOOT_LOAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_VIRTUAL_DISK_BOOT_LOAD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_USB_DISK_BOOT_LOAD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_SD_DISK_BOOT_LOAD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_USB3_DISK_BOOT_LOAD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_MEASURED_BOOT_LOAD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_VERIFIER_BOOT_LOAD => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_WINPE_BOOT_LOAD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CM_SERVICE_RAM_DISK_BOOT_LOAD => 256

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_PSEUDO_LOGICAL_POSITION => 2

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_PSEUDO_LOGICAL_BLOCK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_FIXED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_SELECT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_INITIATOR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_ERASE_SHORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_ERASE_LONG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_ERASE_BOP_ONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_ERASE_IMMEDIATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_TAPE_CAPACITY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_TAPE_REMAINING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_FIXED_BLOCK => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_VARIABLE_BLOCK => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_WRITE_PROTECT => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_EOT_WZ_SIZE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_ECC => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_COMPRESSION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_PADDING => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_REPORT_SMKS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_GET_ABSOLUTE_BLK => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_GET_LOGICAL_BLK => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_SET_EOT_WZ_SIZE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_EJECT_MEDIA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_CLEAN_REQUESTS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_SET_CMP_BOP_ONLY => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_RESERVED_BIT => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_FORMAT => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_FORMAT_IMMEDIATE => 3221225472

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_DRIVE_HIGH_FEATURES => 2147483648

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_QUERY_DRIVE_PARAMETERS => 0

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_QUERY_MEDIA_CAPACITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_CHECK_FOR_DRIVE_PROBLEM => 2

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_QUERY_IO_ERROR_DATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static TAPE_QUERY_DEVICE_ERROR_DATA => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_QUERY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_SET_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_RECOVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_RENAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_CREATE_RM => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_BIND_TRANSACTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_QUERY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_SET_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_ENLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_COMMIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_ROLLBACK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_PROPAGATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_RIGHT_RESERVED1 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_QUERY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_SET_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_RECOVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_ENLIST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_GET_NOTIFICATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_REGISTER_PROTOCOL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_COMPLETE_PROPAGATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_QUERY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_SET_INFORMATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_RECOVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_SUBORDINATE_RIGHTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_SUPERIOR_RIGHTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PcTeb => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_ASSEMBLY_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_DLL_REDIRECTION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_WINDOW_CLASS_REDIRECTION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_COM_SERVER_REDIRECTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_COM_INTERFACE_REDIRECTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_COM_TYPE_LIBRARY_REDIRECTION => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_COM_PROGID_REDIRECTION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_GLOBAL_OBJECT_RENAME_TABLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_CLR_SURROGATES => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_APPLICATION_SETTINGS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_COMPATIBILITY_INFO => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_CONTEXT_SECTION_WINRT_ACTIVATABLE_CLASSES => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ROT_COMPARE_MAX => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static WDT_INPROC_CALL => 1215587415

    /**
     * @type {Integer (UInt32)}
     */
    static WDT_REMOTE_CALL => 1383359575

    /**
     * @type {Integer (UInt32)}
     */
    static WDT_INPROC64_CALL => 1349805143

    /**
     * @type {Integer (Byte)}
     */
    static DECIMAL_NEG => 0x80

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_REGION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_UNCOMMITTED_RANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_ENTRY_BUSY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_SEG_ALLOC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_ENTRY_MOVEABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PROCESS_HEAP_ENTRY_DDESHARE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_NOCOMPACT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_NODISCARD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_MODIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_DISCARDABLE => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_VALID_FLAGS => 3954

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_INVALID_HANDLE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_DISCARDED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static LMEM_LOCKCOUNT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NUMA_NO_PREFERRED_NODE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static REDBOOK_DIGITAL_AUDIO_EXTRACTION_INFO_VERSION => 1
;@endregion Constants

;@region Methods
;@endregion Methods
}
