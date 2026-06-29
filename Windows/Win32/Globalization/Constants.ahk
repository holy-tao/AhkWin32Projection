#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Globalization
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global LANG_SYSTEM_DEFAULT := 2048

/**
 * @type {Integer (Int32)}
 */
export global LANG_USER_DEFAULT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SYSTEM_DEFAULT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_USER_DEFAULT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_CUSTOM_DEFAULT := 3072

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_CUSTOM_UNSPECIFIED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_CUSTOM_UI_DEFAULT := 5120

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_NEUTRAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INVARIANT := 127

/**
 * @type {Integer (UInt32)}
 */
export global ALL_SERVICE_TYPES := 0

/**
 * @type {Integer (UInt32)}
 */
export global HIGHLEVEL_SERVICE_TYPES := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOWLEVEL_SERVICE_TYPES := 2

/**
 * @type {Integer (UInt32)}
 */
export global ALL_SERVICES := 0

/**
 * @type {Integer (UInt32)}
 */
export global ONLINE_SERVICES := 1

/**
 * @type {Integer (UInt32)}
 */
export global OFFLINE_SERVICES := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LEADBYTES := 12

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DEFAULTCHAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global HIGH_SURROGATE_START := 55296

/**
 * @type {Integer (UInt32)}
 */
export global HIGH_SURROGATE_END := 56319

/**
 * @type {Integer (UInt32)}
 */
export global LOW_SURROGATE_START := 56320

/**
 * @type {Integer (UInt32)}
 */
export global LOW_SURROGATE_END := 57343

/**
 * @type {Integer (UInt32)}
 */
export global WC_COMPOSITECHECK := 512

/**
 * @type {Integer (UInt32)}
 */
export global WC_DISCARDNS := 16

/**
 * @type {Integer (UInt32)}
 */
export global WC_SEPCHARS := 32

/**
 * @type {Integer (UInt32)}
 */
export global WC_DEFAULTCHAR := 64

/**
 * @type {Integer (UInt32)}
 */
export global WC_ERR_INVALID_CHARS := 128

/**
 * @type {Integer (UInt32)}
 */
export global WC_NO_BEST_FIT_CHARS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CT_CTYPE1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CT_CTYPE2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CT_CTYPE3 := 4

/**
 * @type {Integer (UInt32)}
 */
export global C1_UPPER := 1

/**
 * @type {Integer (UInt32)}
 */
export global C1_LOWER := 2

/**
 * @type {Integer (UInt32)}
 */
export global C1_DIGIT := 4

/**
 * @type {Integer (UInt32)}
 */
export global C1_SPACE := 8

/**
 * @type {Integer (UInt32)}
 */
export global C1_PUNCT := 16

/**
 * @type {Integer (UInt32)}
 */
export global C1_CNTRL := 32

/**
 * @type {Integer (UInt32)}
 */
export global C1_BLANK := 64

/**
 * @type {Integer (UInt32)}
 */
export global C1_XDIGIT := 128

/**
 * @type {Integer (UInt32)}
 */
export global C1_ALPHA := 256

/**
 * @type {Integer (UInt32)}
 */
export global C1_DEFINED := 512

/**
 * @type {Integer (UInt32)}
 */
export global C2_LEFTTORIGHT := 1

/**
 * @type {Integer (UInt32)}
 */
export global C2_RIGHTTOLEFT := 2

/**
 * @type {Integer (UInt32)}
 */
export global C2_EUROPENUMBER := 3

/**
 * @type {Integer (UInt32)}
 */
export global C2_EUROPESEPARATOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global C2_EUROPETERMINATOR := 5

/**
 * @type {Integer (UInt32)}
 */
export global C2_ARABICNUMBER := 6

/**
 * @type {Integer (UInt32)}
 */
export global C2_COMMONSEPARATOR := 7

/**
 * @type {Integer (UInt32)}
 */
export global C2_BLOCKSEPARATOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global C2_SEGMENTSEPARATOR := 9

/**
 * @type {Integer (UInt32)}
 */
export global C2_WHITESPACE := 10

/**
 * @type {Integer (UInt32)}
 */
export global C2_OTHERNEUTRAL := 11

/**
 * @type {Integer (UInt32)}
 */
export global C2_NOTAPPLICABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global C3_NONSPACING := 1

/**
 * @type {Integer (UInt32)}
 */
export global C3_DIACRITIC := 2

/**
 * @type {Integer (UInt32)}
 */
export global C3_VOWELMARK := 4

/**
 * @type {Integer (UInt32)}
 */
export global C3_SYMBOL := 8

/**
 * @type {Integer (UInt32)}
 */
export global C3_KATAKANA := 16

/**
 * @type {Integer (UInt32)}
 */
export global C3_HIRAGANA := 32

/**
 * @type {Integer (UInt32)}
 */
export global C3_HALFWIDTH := 64

/**
 * @type {Integer (UInt32)}
 */
export global C3_FULLWIDTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global C3_IDEOGRAPH := 256

/**
 * @type {Integer (UInt32)}
 */
export global C3_KASHIDA := 512

/**
 * @type {Integer (UInt32)}
 */
export global C3_LEXICAL := 1024

/**
 * @type {Integer (UInt32)}
 */
export global C3_HIGHSURROGATE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global C3_LOWSURROGATE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global C3_ALPHA := 32768

/**
 * @type {Integer (UInt32)}
 */
export global C3_NOTAPPLICABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_LOWERCASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_UPPERCASE := 512

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_TITLECASE := 768

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_SORTKEY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_BYTEREV := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_HIRAGANA := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_KATAKANA := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_HALFWIDTH := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_FULLWIDTH := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_LINGUISTIC_CASING := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_SIMPLIFIED_CHINESE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_TRADITIONAL_CHINESE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_SORTHANDLE := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LCMAP_HASH := 262144

/**
 * @type {Integer (UInt32)}
 */
export global FIND_STARTSWITH := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global FIND_ENDSWITH := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global FIND_FROMSTART := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global FIND_FROMEND := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global LCID_ALTERNATE_SORTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ALL := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_WINDOWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SUPPLEMENTAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ALTERNATE_SORTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_REPLACEMENT := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_NEUTRALDATA := 16

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPECIFICDATA := 32

/**
 * @type {Integer (UInt32)}
 */
export global CP_ACP := 0

/**
 * @type {Integer (UInt32)}
 */
export global CP_OEMCP := 1

/**
 * @type {Integer (UInt32)}
 */
export global CP_MACCP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CP_THREAD_ACP := 3

/**
 * @type {Integer (UInt32)}
 */
export global CP_SYMBOL := 42

/**
 * @type {Integer (UInt32)}
 */
export global CP_UTF7 := 65000

/**
 * @type {Integer (UInt32)}
 */
export global CP_UTF8 := 65001

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ALBANIA := 355

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ALGERIA := 213

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ARGENTINA := 54

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ARMENIA := 374

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_AUSTRALIA := 61

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_AUSTRIA := 43

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_AZERBAIJAN := 994

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BAHRAIN := 973

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BELARUS := 375

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BELGIUM := 32

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BELIZE := 501

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BOLIVIA := 591

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BRAZIL := 55

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BRUNEI_DARUSSALAM := 673

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_BULGARIA := 359

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_CANADA := 2

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_CARIBBEAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_CHILE := 56

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_COLOMBIA := 57

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_COSTA_RICA := 506

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_CROATIA := 385

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_CZECH := 420

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_DENMARK := 45

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_DOMINICAN_REPUBLIC := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ECUADOR := 593

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_EGYPT := 20

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_EL_SALVADOR := 503

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ESTONIA := 372

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_FAEROE_ISLANDS := 298

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_FINLAND := 358

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_FRANCE := 33

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_GEORGIA := 995

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_GERMANY := 49

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_GREECE := 30

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_GUATEMALA := 502

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_HONDURAS := 504

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_HONG_KONG := 852

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_HUNGARY := 36

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ICELAND := 354

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_INDIA := 91

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_INDONESIA := 62

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_IRAN := 981

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_IRAQ := 964

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_IRELAND := 353

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ISRAEL := 972

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ITALY := 39

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_JAMAICA := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_JAPAN := 81

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_JORDAN := 962

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_KAZAKSTAN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_KENYA := 254

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_KUWAIT := 965

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_KYRGYZSTAN := 996

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LATVIA := 371

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LEBANON := 961

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LIBYA := 218

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LIECHTENSTEIN := 41

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LITHUANIA := 370

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_LUXEMBOURG := 352

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MACAU := 853

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MACEDONIA := 389

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MALAYSIA := 60

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MALDIVES := 960

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MEXICO := 52

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MONACO := 33

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MONGOLIA := 976

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_MOROCCO := 212

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_NETHERLANDS := 31

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_NEW_ZEALAND := 64

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_NICARAGUA := 505

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_NORWAY := 47

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_OMAN := 968

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PAKISTAN := 92

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PANAMA := 507

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PARAGUAY := 595

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PERU := 51

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PHILIPPINES := 63

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_POLAND := 48

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PORTUGAL := 351

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PRCHINA := 86

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_PUERTO_RICO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_QATAR := 974

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ROMANIA := 40

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_RUSSIA := 7

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SAUDI_ARABIA := 966

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SERBIA := 381

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SINGAPORE := 65

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SLOVAK := 421

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SLOVENIA := 386

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SOUTH_AFRICA := 27

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SOUTH_KOREA := 82

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SPAIN := 34

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SWEDEN := 46

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SWITZERLAND := 41

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_SYRIA := 963

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_TAIWAN := 886

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_TATARSTAN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_THAILAND := 66

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_TRINIDAD_Y_TOBAGO := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_TUNISIA := 216

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_TURKEY := 90

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_UAE := 971

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_UKRAINE := 380

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_UNITED_KINGDOM := 44

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_UNITED_STATES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_URUGUAY := 598

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_UZBEKISTAN := 7

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_VENEZUELA := 58

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_VIET_NAM := 84

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_YEMEN := 967

/**
 * @type {Integer (UInt32)}
 */
export global CTRY_ZIMBABWE := 263

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_NOUSEROVERRIDE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_USE_CP_ACP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_RETURN_NUMBER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_RETURN_GENITIVE_NAMES := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ALLOW_NEUTRAL_NAMES := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLOCALIZEDDISPLAYNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGLISHDISPLAYNAME := 114

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVEDISPLAYNAME := 115

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLOCALIZEDLANGUAGENAME := 111

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGLISHLANGUAGENAME := 4097

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVELANGUAGENAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLOCALIZEDCOUNTRYNAME := 6

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGLISHCOUNTRYNAME := 4098

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVECOUNTRYNAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDIALINGCODE := 5

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLIST := 12

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IMEASURE := 13

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDECIMAL := 14

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_STHOUSAND := 15

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SGROUPING := 16

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDIGITS := 17

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ILZERO := 18

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGNUMBER := 4112

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVEDIGITS := 19

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SCURRENCY := 20

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SINTLSYMBOL := 21

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONDECIMALSEP := 22

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHOUSANDSEP := 23

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONGROUPING := 24

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICURRDIGITS := 25

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICURRENCY := 27

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGCURR := 28

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTDATE := 31

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLONGDATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_STIMEFORMAT := 4099

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SAM := 40

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPM := 41

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICALENDARTYPE := 4105

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IOPTIONALCALENDAR := 4107

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IFIRSTDAYOFWEEK := 4108

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IFIRSTWEEKOFYEAR := 4109

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME1 := 42

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME2 := 43

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME3 := 44

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME4 := 45

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME5 := 46

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME6 := 47

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDAYNAME7 := 48

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME1 := 49

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME2 := 50

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME3 := 51

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME4 := 52

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME5 := 53

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME6 := 54

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVDAYNAME7 := 55

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME1 := 56

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME2 := 57

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME3 := 58

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME4 := 59

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME5 := 60

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME6 := 61

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME7 := 62

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME8 := 63

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME9 := 64

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME10 := 65

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME11 := 66

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME12 := 67

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHNAME13 := 4110

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME1 := 68

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME2 := 69

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME3 := 70

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME4 := 71

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME5 := 72

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME6 := 73

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME7 := 74

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME8 := 75

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME9 := 76

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME10 := 77

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME11 := 78

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME12 := 79

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVMONTHNAME13 := 4111

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPOSITIVESIGN := 80

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNEGATIVESIGN := 81

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IPOSSIGNPOSN := 82

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGSIGNPOSN := 83

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IPOSSYMPRECEDES := 84

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IPOSSEPBYSPACE := 85

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGSYMPRECEDES := 86

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGSEPBYSPACE := 87

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_FONTSIGNATURE := 88

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SISO639LANGNAME := 89

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SISO3166CTRYNAME := 90

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IPAPERSIZE := 4106

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGCURRNAME := 4103

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVECURRNAME := 4104

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SYEARMONTH := 4102

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSORTNAME := 4115

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDIGITSUBSTITUTION := 4116

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNAME := 92

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDURATION := 93

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME1 := 96

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME2 := 97

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME3 := 98

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME4 := 99

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME5 := 100

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME6 := 101

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTDAYNAME7 := 102

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SISO639LANGNAME2 := 103

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SISO3166CTRYNAME2 := 104

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNAN := 105

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPOSINFINITY := 106

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNEGINFINITY := 107

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSCRIPTS := 108

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPARENT := 109

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SCONSOLEFALLBACKNAME := 110

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IREADINGLAYOUT := 112

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEUTRAL := 113

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_INEGATIVEPERCENT := 116

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IPOSITIVEPERCENT := 117

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPERCENT := 118

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SPERMILLE := 119

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SMONTHDAY := 120

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTTIME := 121

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SOPENTYPELANGUAGETAG := 122

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSORTLOCALE := 123

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SRELATIVELONGDATE := 124

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICONSTRUCTEDLOCALE := 125

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTAM := 126

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SSHORTESTPM := 127

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IUSEUTF8LEGACYACP := 1638

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IUSEUTF8LEGACYOEMCP := 2457

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTCODEPAGE := 11

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTANSICODEPAGE := 4100

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTMACCODEPAGE := 4113

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTEBCDICCODEPAGE := 4114

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ILANGUAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVLANGNAME := 3

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SABBREVCTRYNAME := 7

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IGEOID := 91

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTLANGUAGE := 9

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDEFAULTCOUNTRY := 10

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IINTLCURRDIGITS := 26

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SDATE := 29

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_STIME := 30

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDATE := 33

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ILDATE := 34

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ITIME := 35

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ITIMEMARKPOSN := 4101

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICENTURY := 36

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ITLZERO := 37

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IDAYLZERO := 38

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_IMONLZERO := 39

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SKEYBOARDSTOINSTALL := 94

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLANGUAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SLANGDISPLAYNAME := 111

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGLANGUAGE := 4097

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVELANGNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SCOUNTRY := 6

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SENGCOUNTRY := 4098

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_SNATIVECTRYNAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_ICOUNTRY := 5

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_S1159 := 40

/**
 * @type {Integer (UInt32)}
 */
export global LOCALE_S2359 := 41

/**
 * @type {Integer (UInt32)}
 */
export global CAL_NOUSEROVERRIDE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CAL_USE_CP_ACP := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CAL_RETURN_NUMBER := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global CAL_RETURN_GENITIVE_NAMES := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global CAL_ICALINTVALUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SCALNAME := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAL_IYEAROFFSETRANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SERASTRING := 4

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTDATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SLONGDATE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME1 := 7

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME2 := 8

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME3 := 9

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME4 := 10

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME5 := 11

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME6 := 12

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SDAYNAME7 := 13

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME1 := 14

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME2 := 15

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME3 := 16

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME4 := 17

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME5 := 18

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME6 := 19

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVDAYNAME7 := 20

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME1 := 21

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME2 := 22

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME3 := 23

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME4 := 24

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME5 := 25

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME6 := 26

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME7 := 27

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME8 := 28

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME9 := 29

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME10 := 30

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME11 := 31

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME12 := 32

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHNAME13 := 33

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME1 := 34

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME2 := 35

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME3 := 36

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME4 := 37

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME5 := 38

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME6 := 39

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME7 := 40

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME8 := 41

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME9 := 42

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME10 := 43

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME11 := 44

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME12 := 45

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVMONTHNAME13 := 46

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SYEARMONTH := 47

/**
 * @type {Integer (UInt32)}
 */
export global CAL_ITWODIGITYEARMAX := 48

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME1 := 49

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME2 := 50

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME3 := 51

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME4 := 52

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME5 := 53

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME6 := 54

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SSHORTESTDAYNAME7 := 55

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SMONTHDAY := 56

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SABBREVERASTRING := 57

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SRELATIVELONGDATE := 58

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SENGLISHERANAME := 59

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SENGLISHABBREVERANAME := 60

/**
 * @type {Integer (UInt32)}
 */
export global CAL_SJAPANESEERAFIRSTYEAR := 61

/**
 * @type {Integer (UInt32)}
 */
export global ENUM_ALL_CALENDARS := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN_US := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAL_JAPAN := 3

/**
 * @type {Integer (UInt32)}
 */
export global CAL_TAIWAN := 4

/**
 * @type {Integer (UInt32)}
 */
export global CAL_KOREA := 5

/**
 * @type {Integer (UInt32)}
 */
export global CAL_HIJRI := 6

/**
 * @type {Integer (UInt32)}
 */
export global CAL_THAI := 7

/**
 * @type {Integer (UInt32)}
 */
export global CAL_HEBREW := 8

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN_ME_FRENCH := 9

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN_ARABIC := 10

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN_XLIT_ENGLISH := 11

/**
 * @type {Integer (UInt32)}
 */
export global CAL_GREGORIAN_XLIT_FRENCH := 12

/**
 * @type {Integer (UInt32)}
 */
export global CAL_PERSIAN := 22

/**
 * @type {Integer (UInt32)}
 */
export global CAL_UMALQURA := 23

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_WESTERN_EUROPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_CENTRAL_EUROPE := 2

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_BALTIC := 3

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_GREEK := 4

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_CYRILLIC := 5

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_TURKIC := 6

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_TURKISH := 6

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_JAPANESE := 7

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_KOREAN := 8

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_TRADITIONAL_CHINESE := 9

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_SIMPLIFIED_CHINESE := 10

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_THAI := 11

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_HEBREW := 12

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_ARABIC := 13

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_VIETNAMESE := 14

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_INDIC := 15

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_GEORGIAN := 16

/**
 * @type {Integer (UInt32)}
 */
export global LGRPID_ARMENIAN := 17

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANGUAGE_ID := 4

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANGUAGE_NAME := 8

/**
 * @type {Integer (UInt32)}
 */
export global MUI_MERGE_SYSTEM_FALLBACK := 16

/**
 * @type {Integer (UInt32)}
 */
export global MUI_MERGE_USER_FALLBACK := 32

/**
 * @type {Integer (UInt32)}
 */
export global MUI_THREAD_LANGUAGES := 64

/**
 * @type {Integer (UInt32)}
 */
export global MUI_CONSOLE_FILTER := 256

/**
 * @type {Integer (UInt32)}
 */
export global MUI_COMPLEX_SCRIPT_FILTER := 512

/**
 * @type {Integer (UInt32)}
 */
export global MUI_RESET_FILTERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_USER_PREFERRED_UI_LANGUAGES := 16

/**
 * @type {Integer (UInt32)}
 */
export global MUI_USE_INSTALLED_LANGUAGES := 32

/**
 * @type {Integer (UInt32)}
 */
export global MUI_USE_SEARCH_ALL_LANGUAGES := 64

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANG_NEUTRAL_PE_FILE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MUI_NON_LANG_NEUTRAL_FILE := 512

/**
 * @type {Integer (UInt32)}
 */
export global MUI_MACHINE_LANGUAGE_SETTINGS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI := 4

/**
 * @type {Integer (UInt32)}
 */
export global MUI_QUERY_TYPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_QUERY_CHECKSUM := 2

/**
 * @type {Integer (UInt32)}
 */
export global MUI_QUERY_LANGUAGE_NAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global MUI_QUERY_RESOURCE_TYPES := 8

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FILEINFO_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FULL_LANGUAGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_PARTIAL_LANGUAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LIP_LANGUAGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANGUAGE_INSTALLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANGUAGE_LICENSED := 64

/**
 * @type {Integer (Int32)}
 */
export global GEOID_NOT_AVAILABLE := -1

/**
 * @type {Integer (UInt32)}
 */
export global SORTING_PARADIGM_NLS := 0

/**
 * @type {Integer (UInt32)}
 */
export global SORTING_PARADIGM_ICU := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global IDN_ALLOW_UNASSIGNED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IDN_USE_STD3_ASCII_RULES := 2

/**
 * @type {Integer (UInt32)}
 */
export global IDN_EMAIL_ADDRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global IDN_RAW_PUNYCODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global VS_ALLOW_LATIN := 1

/**
 * @type {Integer (UInt32)}
 */
export global GSS_ALLOW_INHERITED_COMMON := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FORMAT_REG_COMPAT := 1

/**
 * @type {Integer (UInt32)}
 */
export global MUI_FORMAT_INF_COMPAT := 2

/**
 * @type {Integer (UInt32)}
 */
export global MUI_VERIFY_FILE_EXISTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global MUI_SKIP_STRING_CACHE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MUI_IMMUTABLE_LOOKUP := 16

/**
 * @type {String}
 */
export global LOCALE_NAME_INVARIANT := ""

/**
 * @type {String}
 */
export global LOCALE_NAME_SYSTEM_DEFAULT := "!x-sys-default-locale"

/**
 * @type {Integer (UInt32)}
 */
export global MIN_SPELLING_NTDDI := 100794368

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_UNDEFINED := 0

/**
 * @type {Integer (Int32)}
 */
export global USP_E_SCRIPT_NOT_IN_FONT := -2147220992

/**
 * @type {Integer (UInt32)}
 */
export global SGCM_RTL := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSA_PASSWORD := 1

/**
 * @type {Integer (UInt32)}
 */
export global SSA_TAB := 2

/**
 * @type {Integer (UInt32)}
 */
export global SSA_CLIP := 4

/**
 * @type {Integer (UInt32)}
 */
export global SSA_FIT := 8

/**
 * @type {Integer (UInt32)}
 */
export global SSA_DZWG := 16

/**
 * @type {Integer (UInt32)}
 */
export global SSA_FALLBACK := 32

/**
 * @type {Integer (UInt32)}
 */
export global SSA_BREAK := 64

/**
 * @type {Integer (UInt32)}
 */
export global SSA_GLYPHS := 128

/**
 * @type {Integer (UInt32)}
 */
export global SSA_RTL := 256

/**
 * @type {Integer (UInt32)}
 */
export global SSA_GCP := 512

/**
 * @type {Integer (UInt32)}
 */
export global SSA_HOTKEY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SSA_METAFILE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SSA_LINK := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SSA_HIDEHOTKEY := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SSA_HOTKEYONLY := 9216

/**
 * @type {Integer (UInt32)}
 */
export global SSA_FULLMEASURE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global SSA_LPKANSIFALLBACK := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global SSA_PIDX := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SSA_LAYOUTRTL := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SSA_DONTGLYPH := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SSA_NOKASHIDA := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_DIGITSUBSTITUTE_CONTEXT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_DIGITSUBSTITUTE_NONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_DIGITSUBSTITUTE_NATIONAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_DIGITSUBSTITUTE_TRADITIONAL := 3

/**
 * @type {Integer (UInt32)}
 */
export global UNISCRIBE_OPENTYPE := 256

/**
 * @type {Integer (UInt32)}
 */
export global SCRIPT_TAG_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global MUI_LANGUAGE_EXACT := 16

/**
 * @type {Integer (UInt32)}
 */
export global NLS_CP_CPINFO := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global NLS_CP_MBTOWC := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global NLS_CP_WCTOMB := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global U_DISABLE_RENAMING := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_SHOW_CPLUSPLUS_API := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_DEFAULT_SHOW_DRAFT := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_HIDE_DRAFT_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HIDE_DEPRECATED_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HIDE_OBSOLETE_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HIDE_INTERNAL_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_NO_DEFAULT_INCLUDE_UTF_HEADERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_DEBUG := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCLN_NO_AUTO_CLEANUP := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_OVERRIDE_CXX_ALLOCATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_ENABLE_TRACING := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_ENABLE_PLUGINS := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_ENABLE_DYLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_CHECK_DYLOAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_LIB_SUFFIX := 1

/**
 * @type {String}
 */
export global U_LIB_SUFFIX_C_NAME_STRING := ""

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_ONLY_COLLATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_BREAK_ITERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_IDNA := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_FORMATTING := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_TRANSLITERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_REGULAR_EXPRESSIONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_FILE_IO := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_CONVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_LEGACY_CONVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_ONLY_HTML_CONVERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_NORMALIZATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_COLLATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_SERVICE := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_HAVE_PARSEALLINPUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_NO_FILTERED_BREAK_ITERATION := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_UNKNOWN := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_WINDOWS := 1000

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_MINGW := 1800

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_CYGWIN := 1900

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_HPUX := 2100

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_SOLARIS := 2600

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_BSD := 3000

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_AIX := 3100

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_IRIX := 3200

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_DARWIN := 3500

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_IPHONE := 3550

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_QNX := 3700

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_LINUX := 4000

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_BROWSER_NATIVE_CLIENT := 4020

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_ANDROID := 4050

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_FUCHSIA := 4100

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_EMSCRIPTEN := 5010

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_OS390 := 9000

/**
 * @type {Integer (UInt32)}
 */
export global U_PF_OS400 := 9400

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM := 1800

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_USES_ONLY_WIN32_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_HAS_WIN32_API := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_IMPLEMENTS_POSIX := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_IS_LINUX_BASED := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_IS_DARWIN_BASED := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_STDINT_H := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_INTTYPES_H := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_GCC_MAJOR_MINOR := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_IS_BIG_ENDIAN := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_PLACEMENT_NEW := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_DEBUG_LOCATION_NEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_CPLUSPLUS_VERSION := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_ASCII_FAMILY := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_EBCDIC_FAMILY := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_CHARSET_FAMILY := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_CHARSET_IS_UTF8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_WCHAR_H := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SIZEOF_WCHAR_T := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_WCSCPY := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_CHAR16_T := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_DEFINE_FALSE_AND_TRUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_SIZEOF_UCHAR := 2

/**
 * @type {Integer (UInt32)}
 */
export global U_CHAR16_IS_TYPEDEF := 1

/**
 * @type {Integer (Int32)}
 */
export global U_SENTINEL := -1

/**
 * @type {String}
 */
export global U8_LEAD3_T1_BITS := " 000000000000" Chr(16) "00"

/**
 * @type {String}
 */
export global U8_LEAD4_T1_BITS := "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(30) "" Chr(15) "" Chr(15) "" Chr(15) "" Chr(0) "" Chr(0) "" Chr(0) "" Chr(0) ""

/**
 * @type {Integer (UInt32)}
 */
export global U8_MAX_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global U16_MAX_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global U_HIDE_OBSOLETE_UTF_OLD_H := 0

/**
 * @type {Integer (UInt32)}
 */
export global UTF_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global UTF8_ERROR_VALUE_1 := 21

/**
 * @type {Integer (UInt32)}
 */
export global UTF8_ERROR_VALUE_2 := 159

/**
 * @type {Integer (UInt32)}
 */
export global UTF_ERROR_VALUE := 65535

/**
 * @type {Integer (UInt32)}
 */
export global UTF8_MAX_CHAR_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global UTF16_MAX_CHAR_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global UTF32_MAX_CHAR_LENGTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global UTF_MAX_CHAR_LENGTH := 2

/**
 * @type {Integer (UInt32)}
 */
export global U_COPYRIGHT_STRING_LENGTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global U_MAX_VERSION_LENGTH := 4

/**
 * @type {Integer (UInt32)}
 */
export global U_MAX_VERSION_STRING_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global U_MILLIS_PER_SECOND := 1000

/**
 * @type {Integer (UInt32)}
 */
export global U_MILLIS_PER_MINUTE := 60000

/**
 * @type {Integer (UInt32)}
 */
export global U_MILLIS_PER_HOUR := 3600000

/**
 * @type {Integer (UInt32)}
 */
export global U_MILLIS_PER_DAY := 86400000

/**
 * @type {Integer (UInt32)}
 */
export global U_COMBINED_IMPLEMENTATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LENGTH_GROW_SHRINK := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_RESIZE := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LENGTH_FIXED_SPACES_NEAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_NEAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LENGTH_FIXED_SPACES_AT_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_END := 2

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LENGTH_FIXED_SPACES_AT_BEGINNING := 3

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_BEGIN := 3

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_AUTO := 65536

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LENGTH_MASK := 65539

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LAMALEF_MASK := 65539

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TEXT_DIRECTION_LOGICAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TEXT_DIRECTION_VISUAL_RTL := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TEXT_DIRECTION_VISUAL_LTR := 4

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TEXT_DIRECTION_MASK := 4

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LETTERS_NOOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LETTERS_SHAPE := 8

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LETTERS_UNSHAPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LETTERS_SHAPE_TASHKEEL_ISOLATED := 24

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_LETTERS_MASK := 24

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_NOOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_EN2AN := 32

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_AN2EN := 64

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_ALEN2AN_INIT_LR := 96

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_ALEN2AN_INIT_AL := 128

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_RESERVED := 160

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGITS_MASK := 224

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGIT_TYPE_AN := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGIT_TYPE_AN_EXTENDED := 256

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGIT_TYPE_RESERVED := 512

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_DIGIT_TYPE_MASK := 768

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_AGGREGATE_TASHKEEL := 16384

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_AGGREGATE_TASHKEEL_NOOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_AGGREGATE_TASHKEEL_MASK := 16384

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_PRESERVE_PRESENTATION := 32768

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_PRESERVE_PRESENTATION_NOOP := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_PRESERVE_PRESENTATION_MASK := 32768

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_SEEN_TWOCELL_NEAR := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_SEEN_MASK := 7340032

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_YEHHAMZA_TWOCELL_NEAR := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_YEHHAMZA_MASK := 58720256

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TASHKEEL_BEGIN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TASHKEEL_END := 393216

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TASHKEEL_RESIZE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TASHKEEL_REPLACE_BY_TATWEEL := 786432

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TASHKEEL_MASK := 917504

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_SPACES_RELATIVE_TO_TEXT_BEGIN_END := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_SPACES_RELATIVE_TO_TEXT_MASK := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TAIL_NEW_UNICODE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global U_SHAPE_TAIL_TYPE_MASK := 134217728

/**
 * @type {String}
 */
export global ULOC_CHINESE := "zh"

/**
 * @type {String}
 */
export global ULOC_ENGLISH := "en"

/**
 * @type {String}
 */
export global ULOC_FRENCH := "fr"

/**
 * @type {String}
 */
export global ULOC_GERMAN := "de"

/**
 * @type {String}
 */
export global ULOC_ITALIAN := "it"

/**
 * @type {String}
 */
export global ULOC_JAPANESE := "ja"

/**
 * @type {String}
 */
export global ULOC_KOREAN := "ko"

/**
 * @type {String}
 */
export global ULOC_SIMPLIFIED_CHINESE := "zh_CN"

/**
 * @type {String}
 */
export global ULOC_TRADITIONAL_CHINESE := "zh_TW"

/**
 * @type {String}
 */
export global ULOC_CANADA := "en_CA"

/**
 * @type {String}
 */
export global ULOC_CANADA_FRENCH := "fr_CA"

/**
 * @type {String}
 */
export global ULOC_CHINA := "zh_CN"

/**
 * @type {String}
 */
export global ULOC_PRC := "zh_CN"

/**
 * @type {String}
 */
export global ULOC_FRANCE := "fr_FR"

/**
 * @type {String}
 */
export global ULOC_GERMANY := "de_DE"

/**
 * @type {String}
 */
export global ULOC_ITALY := "it_IT"

/**
 * @type {String}
 */
export global ULOC_JAPAN := "ja_JP"

/**
 * @type {String}
 */
export global ULOC_KOREA := "ko_KR"

/**
 * @type {String}
 */
export global ULOC_TAIWAN := "zh_TW"

/**
 * @type {String}
 */
export global ULOC_UK := "en_GB"

/**
 * @type {String}
 */
export global ULOC_US := "en_US"

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_LANG_CAPACITY := 12

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_COUNTRY_CAPACITY := 4

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_FULLNAME_CAPACITY := 157

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_SCRIPT_CAPACITY := 6

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_KEYWORDS_CAPACITY := 96

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_KEYWORD_AND_VALUES_CAPACITY := 100

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_KEYWORD_SEPARATOR_UNICODE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_KEYWORD_ASSIGN_UNICODE := 61

/**
 * @type {Integer (UInt32)}
 */
export global ULOC_KEYWORD_ITEM_SEPARATOR_UNICODE := 59

/**
 * @type {String}
 */
export global UCNV_SUB_STOP_ON_ILLEGAL := "i"

/**
 * @type {String}
 */
export global UCNV_SKIP_STOP_ON_ILLEGAL := "i"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_JAVA := "J"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_C := "C"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_XML_DEC := "D"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_XML_HEX := "X"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_UNICODE := "U"

/**
 * @type {String}
 */
export global UCNV_ESCAPE_CSS2 := "S"

/**
 * @type {Integer (UInt32)}
 */
export global UCNV_MAX_CONVERTER_NAME_LENGTH := 60

/**
 * @type {Integer (UInt32)}
 */
export global UCNV_SI := 15

/**
 * @type {Integer (UInt32)}
 */
export global UCNV_SO := 14

/**
 * @type {String}
 */
export global UCNV_OPTION_SEP_STRING := ","

/**
 * @type {String}
 */
export global UCNV_VALUE_SEP_STRING := "="

/**
 * @type {String}
 */
export global UCNV_LOCALE_OPTION_STRING := ",locale="

/**
 * @type {String}
 */
export global UCNV_VERSION_OPTION_STRING := ",version="

/**
 * @type {String}
 */
export global UCNV_SWAP_LFNL_OPTION_STRING := ",swaplfnl"

/**
 * @type {Integer (UInt32)}
 */
export global U_FOLD_CASE_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_FOLD_CASE_EXCLUDE_SPECIAL_I := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_TITLECASE_WHOLE_STRING := 32

/**
 * @type {Integer (UInt32)}
 */
export global U_TITLECASE_SENTENCES := 64

/**
 * @type {Integer (UInt32)}
 */
export global U_TITLECASE_NO_LOWERCASE := 256

/**
 * @type {Integer (UInt32)}
 */
export global U_TITLECASE_NO_BREAK_ADJUSTMENT := 512

/**
 * @type {Integer (UInt32)}
 */
export global U_TITLECASE_ADJUST_TO_CASED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global U_EDITS_NO_RESET := 8192

/**
 * @type {Integer (UInt32)}
 */
export global U_OMIT_UNCHANGED_TEXT := 16384

/**
 * @type {Integer (UInt32)}
 */
export global U_COMPARE_CODE_POINT_ORDER := 32768

/**
 * @type {Integer (UInt32)}
 */
export global U_COMPARE_IGNORE_CASE := 65536

/**
 * @type {Integer (UInt32)}
 */
export global UNORM_INPUT_IS_FCD := 131072

/**
 * @type {Integer (UInt32)}
 */
export global UCHAR_MIN_VALUE := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCHAR_MAX_VALUE := 1114111

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_DEFAULT_LTR := 254

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_DEFAULT_RTL := 255

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_MAX_EXPLICIT_LEVEL := 125

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_LEVEL_OVERRIDE := 128

/**
 * @type {Integer (Int32)}
 */
export global UBIDI_MAP_NOWHERE := -1

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_KEEP_BASE_COMBINING := 1

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_DO_MIRRORING := 2

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_INSERT_LRM_FOR_NUMERIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_REMOVE_BIDI_CONTROLS := 8

/**
 * @type {Integer (UInt32)}
 */
export global UBIDI_OUTPUT_REVERSE := 16

/**
 * @type {Integer (UInt32)}
 */
export global USPREP_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global USPREP_ALLOW_UNASSIGNED := 1

/**
 * @type {String}
 */
export global U_ICU_VERSION_BUNDLE := "icuver"

/**
 * @type {String}
 */
export global U_ICU_DATA_KEY := "DataVersion"

/**
 * @type {String}
 */
export global UCAL_UNKNOWN_ZONE_ID := "Etc/Unknown"

/**
 * @type {String}
 */
export global UDAT_YEAR := "y"

/**
 * @type {String}
 */
export global UDAT_QUARTER := "QQQQ"

/**
 * @type {String}
 */
export global UDAT_ABBR_QUARTER := "QQQ"

/**
 * @type {String}
 */
export global UDAT_YEAR_QUARTER := "yQQQQ"

/**
 * @type {String}
 */
export global UDAT_YEAR_ABBR_QUARTER := "yQQQ"

/**
 * @type {String}
 */
export global UDAT_MONTH := "MMMM"

/**
 * @type {String}
 */
export global UDAT_ABBR_MONTH := "MMM"

/**
 * @type {String}
 */
export global UDAT_NUM_MONTH := "M"

/**
 * @type {String}
 */
export global UDAT_YEAR_MONTH := "yMMMM"

/**
 * @type {String}
 */
export global UDAT_YEAR_ABBR_MONTH := "yMMM"

/**
 * @type {String}
 */
export global UDAT_YEAR_NUM_MONTH := "yM"

/**
 * @type {String}
 */
export global UDAT_DAY := "d"

/**
 * @type {String}
 */
export global UDAT_YEAR_MONTH_DAY := "yMMMMd"

/**
 * @type {String}
 */
export global UDAT_YEAR_ABBR_MONTH_DAY := "yMMMd"

/**
 * @type {String}
 */
export global UDAT_YEAR_NUM_MONTH_DAY := "yMd"

/**
 * @type {String}
 */
export global UDAT_WEEKDAY := "EEEE"

/**
 * @type {String}
 */
export global UDAT_ABBR_WEEKDAY := "E"

/**
 * @type {String}
 */
export global UDAT_YEAR_MONTH_WEEKDAY_DAY := "yMMMMEEEEd"

/**
 * @type {String}
 */
export global UDAT_YEAR_ABBR_MONTH_WEEKDAY_DAY := "yMMMEd"

/**
 * @type {String}
 */
export global UDAT_YEAR_NUM_MONTH_WEEKDAY_DAY := "yMEd"

/**
 * @type {String}
 */
export global UDAT_MONTH_DAY := "MMMMd"

/**
 * @type {String}
 */
export global UDAT_ABBR_MONTH_DAY := "MMMd"

/**
 * @type {String}
 */
export global UDAT_NUM_MONTH_DAY := "Md"

/**
 * @type {String}
 */
export global UDAT_MONTH_WEEKDAY_DAY := "MMMMEEEEd"

/**
 * @type {String}
 */
export global UDAT_ABBR_MONTH_WEEKDAY_DAY := "MMMEd"

/**
 * @type {String}
 */
export global UDAT_NUM_MONTH_WEEKDAY_DAY := "MEd"

/**
 * @type {String}
 */
export global UDAT_HOUR := "j"

/**
 * @type {String}
 */
export global UDAT_HOUR24 := "H"

/**
 * @type {String}
 */
export global UDAT_MINUTE := "m"

/**
 * @type {String}
 */
export global UDAT_HOUR_MINUTE := "jm"

/**
 * @type {String}
 */
export global UDAT_HOUR24_MINUTE := "Hm"

/**
 * @type {String}
 */
export global UDAT_SECOND := "s"

/**
 * @type {String}
 */
export global UDAT_HOUR_MINUTE_SECOND := "jms"

/**
 * @type {String}
 */
export global UDAT_HOUR24_MINUTE_SECOND := "Hms"

/**
 * @type {String}
 */
export global UDAT_MINUTE_SECOND := "ms"

/**
 * @type {String}
 */
export global UDAT_LOCATION_TZ := "VVVV"

/**
 * @type {String}
 */
export global UDAT_GENERIC_TZ := "vvvv"

/**
 * @type {String}
 */
export global UDAT_ABBR_GENERIC_TZ := "v"

/**
 * @type {String}
 */
export global UDAT_SPECIFIC_TZ := "zzzz"

/**
 * @type {String}
 */
export global UDAT_ABBR_SPECIFIC_TZ := "z"

/**
 * @type {String}
 */
export global UDAT_ABBR_UTC_TZ := "ZZZZ"

/**
 * @type {Integer (Int32)}
 */
export global USEARCH_DONE := -1

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_STD_STRING := 0

/**
 * @type {Integer (UInt32)}
 */
export global UCONFIG_FORMAT_FASTPATHS_49 := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_PLATFORM_HAS_WINUWP_API := 0

/**
 * @type {Integer (UInt32)}
 */
export global U_IOSTREAM_SOURCE := 199711

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_RVALUE_REFERENCES := 1

/**
 * @type {Integer (UInt32)}
 */
export global U_USING_ICU_NAMESPACE := 1

/**
 * @type {String}
 */
export global U_ICUDATA_TYPE_LETTER := "e"

/**
 * @type {String}
 */
export global U_UNICODE_VERSION := "8.0"

/**
 * @type {Integer (UInt32)}
 */
export global CANITER_SKIP_ZEROES := 1

/**
 * @type {Integer (UInt32)}
 */
export global NUMSYS_NAME_CAPACITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global U_HAVE_RBNF := 0

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MIMECP_NAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MIMECSET_NAME := 50

/**
 * @type {Integer (UInt32)}
 */
export global MAX_MIMEFACE_NAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_RFC1766_NAME := 6

/**
 * @type {Integer (UInt32)}
 */
export global MAX_LOCALE_NAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_SCRIPT_NAME := 48

/**
 * @type {Integer (Int32)}
 */
export global CPIOD_PEEK := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global CPIOD_FORCE_PROMPT := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global UITER_UNKNOWN_INDEX := -2

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_FAST_SHIFT := 6

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_FAST_DATA_BLOCK_LENGTH := 64

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_FAST_DATA_MASK := 63

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_SMALL_MAX := 4095

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_ERROR_VALUE_NEG_DATA_OFFSET := 1

/**
 * @type {Integer (Int32)}
 */
export global UCPTRIE_HIGH_VALUE_NEG_DATA_OFFSET := 2

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_PROVIDER_LENGTH_IS_EXPENSIVE := 1

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_PROVIDER_STABLE_CHUNKS := 2

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_PROVIDER_WRITABLE := 3

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_PROVIDER_HAS_META_DATA := 4

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_PROVIDER_OWNS_TEXT := 5

/**
 * @type {Integer (Int32)}
 */
export global UTEXT_MAGIC := 878368812

/**
 * @type {Integer (Int32)}
 */
export global USET_IGNORE_SPACE := 1

/**
 * @type {Integer (Int32)}
 */
export global USET_CASE_INSENSITIVE := 2

/**
 * @type {Integer (Int32)}
 */
export global USET_ADD_CASE_MAPPINGS := 4

/**
 * @type {Integer (Int32)}
 */
export global USET_SERIALIZED_STATIC_ARRAY_CAPACITY := 8

/**
 * @type {Integer (Int32)}
 */
export global U_PARSE_CONTEXT_LEN := 16

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_DEFAULT := 0

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_USE_STD3_RULES := 2

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_CHECK_BIDI := 4

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_CHECK_CONTEXTJ := 8

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_NONTRANSITIONAL_TO_ASCII := 16

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_NONTRANSITIONAL_TO_UNICODE := 32

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_CHECK_CONTEXTO := 64

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_EMPTY_LABEL := 1

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_LABEL_TOO_LONG := 2

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_DOMAIN_NAME_TOO_LONG := 4

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_LEADING_HYPHEN := 8

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_TRAILING_HYPHEN := 16

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_HYPHEN_3_4 := 32

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_LEADING_COMBINING_MARK := 64

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_DISALLOWED := 128

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_PUNYCODE := 256

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_LABEL_HAS_DOT := 512

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_INVALID_ACE_LABEL := 1024

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_BIDI := 2048

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_CONTEXTJ := 4096

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_CONTEXTO_PUNCTUATION := 8192

/**
 * @type {Integer (Int32)}
 */
export global UIDNA_ERROR_CONTEXTO_DIGITS := 16384

/**
 * @type {Guid}
 */
export global ELS_GUID_LANGUAGE_DETECTION := Guid("{cf7e00b1-909b-4d95-a8f4-611f7c377702}")

/**
 * @type {Guid}
 */
export global ELS_GUID_SCRIPT_DETECTION := Guid("{2d64b439-6caf-4f6b-b688-e5d0f4faa7d7}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_HANT_TO_HANS := Guid("{a3a8333b-f4fc-42f6-a0c4-0462fe7317cb}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_HANS_TO_HANT := Guid("{3caccdc8-5590-42dc-9a7b-b5a6b5b3b63b}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_MALAYALAM_TO_LATIN := Guid("{d8b983b1-f8bf-4a2b-bcd5-5b5ea20613e1}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_DEVANAGARI_TO_LATIN := Guid("{c4a4dcfe-2661-4d02-9835-f48187109803}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_CYRILLIC_TO_LATIN := Guid("{3dd12a98-5afd-4903-a13f-e17e6c0bfe01}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_BENGALI_TO_LATIN := Guid("{f4dfd825-91a4-489f-855e-9ad9bee55727}")

/**
 * @type {Guid}
 */
export global ELS_GUID_TRANSLITERATION_HANGUL_DECOMPOSITION := Guid("{4ba2a721-e43d-41b7-b330-536ae1e48863}")

/**
 * @type {Integer (Int32)}
 */
export global UMSGPAT_ARG_NAME_NOT_NUMBER := -1

/**
 * @type {Integer (Int32)}
 */
export global UMSGPAT_ARG_NAME_NOT_VALID := -2
;@endregion Constants
