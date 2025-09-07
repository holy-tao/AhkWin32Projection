#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UBlockCode{

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NO_BLOCK => 0

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BASIC_LATIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_1_SUPPLEMENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_A => 3

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_B => 4

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_IPA_EXTENSIONS => 5

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SPACING_MODIFIER_LETTERS => 6

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMBINING_DIACRITICAL_MARKS => 7

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GREEK => 8

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC => 9

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARMENIAN => 10

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HEBREW => 11

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC => 12

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SYRIAC => 13

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_THAANA => 14

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DEVANAGARI => 15

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BENGALI => 16

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GURMUKHI => 17

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GUJARATI => 18

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ORIYA => 19

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAMIL => 20

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TELUGU => 21

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KANNADA => 22

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MALAYALAM => 23

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SINHALA => 24

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_THAI => 25

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LAO => 26

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TIBETAN => 27

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MYANMAR => 28

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GEORGIAN => 29

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANGUL_JAMO => 30

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ETHIOPIC => 31

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHEROKEE => 32

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS => 33

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OGHAM => 34

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_RUNIC => 35

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHMER => 36

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MONGOLIAN => 37

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_ADDITIONAL => 38

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GREEK_EXTENDED => 39

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GENERAL_PUNCTUATION => 40

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPERSCRIPTS_AND_SUBSCRIPTS => 41

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CURRENCY_SYMBOLS => 42

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMBINING_MARKS_FOR_SYMBOLS => 43

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LETTERLIKE_SYMBOLS => 44

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NUMBER_FORMS => 45

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARROWS => 46

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MATHEMATICAL_OPERATORS => 47

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_TECHNICAL => 48

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CONTROL_PICTURES => 49

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OPTICAL_CHARACTER_RECOGNITION => 50

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ENCLOSED_ALPHANUMERICS => 51

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BOX_DRAWING => 52

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BLOCK_ELEMENTS => 53

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GEOMETRIC_SHAPES => 54

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_SYMBOLS => 55

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DINGBATS => 56

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BRAILLE_PATTERNS => 57

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_RADICALS_SUPPLEMENT => 58

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KANGXI_RADICALS => 59

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_IDEOGRAPHIC_DESCRIPTION_CHARACTERS => 60

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_SYMBOLS_AND_PUNCTUATION => 61

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HIRAGANA => 62

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KATAKANA => 63

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BOPOMOFO => 64

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANGUL_COMPATIBILITY_JAMO => 65

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KANBUN => 66

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BOPOMOFO_EXTENDED => 67

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ENCLOSED_CJK_LETTERS_AND_MONTHS => 68

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_COMPATIBILITY => 69

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A => 70

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS => 71

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_YI_SYLLABLES => 72

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_YI_RADICALS => 73

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANGUL_SYLLABLES => 74

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HIGH_SURROGATES => 75

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HIGH_PRIVATE_USE_SURROGATES => 76

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LOW_SURROGATES => 77

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PRIVATE_USE_AREA => 78

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PRIVATE_USE => 78

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS => 79

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ALPHABETIC_PRESENTATION_FORMS => 80

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC_PRESENTATION_FORMS_A => 81

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMBINING_HALF_MARKS => 82

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_COMPATIBILITY_FORMS => 83

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SMALL_FORM_VARIANTS => 84

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC_PRESENTATION_FORMS_B => 85

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SPECIALS => 86

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HALFWIDTH_AND_FULLWIDTH_FORMS => 87

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_ITALIC => 88

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GOTHIC => 89

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DESERET => 90

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BYZANTINE_MUSICAL_SYMBOLS => 91

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MUSICAL_SYMBOLS => 92

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MATHEMATICAL_ALPHANUMERIC_SYMBOLS => 93

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B => 94

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT => 95

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAGS => 96

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC_SUPPLEMENT => 97

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC_SUPPLEMENTARY => 97

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAGALOG => 98

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANUNOO => 99

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BUHID => 100

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAGBANWA => 101

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A => 102

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_ARROWS_A => 103

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_ARROWS_B => 104

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B => 105

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_MATHEMATICAL_OPERATORS => 106

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KATAKANA_PHONETIC_EXTENSIONS => 107

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_VARIATION_SELECTORS => 108

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_A => 109

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTARY_PRIVATE_USE_AREA_B => 110

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LIMBU => 111

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAI_LE => 112

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHMER_SYMBOLS => 113

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PHONETIC_EXTENSIONS => 114

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_SYMBOLS_AND_ARROWS => 115

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_YIJING_HEXAGRAM_SYMBOLS => 116

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LINEAR_B_SYLLABARY => 117

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LINEAR_B_IDEOGRAMS => 118

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_AEGEAN_NUMBERS => 119

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_UGARITIC => 120

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SHAVIAN => 121

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OSMANYA => 122

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYPRIOT_SYLLABARY => 123

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAI_XUAN_JING_SYMBOLS => 124

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_VARIATION_SELECTORS_SUPPLEMENT => 125

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ANCIENT_GREEK_MUSICAL_NOTATION => 126

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ANCIENT_GREEK_NUMBERS => 127

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC_SUPPLEMENT => 128

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BUGINESE => 129

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_STROKES => 130

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMBINING_DIACRITICAL_MARKS_SUPPLEMENT => 131

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COPTIC => 132

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ETHIOPIC_EXTENDED => 133

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ETHIOPIC_SUPPLEMENT => 134

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GEORGIAN_SUPPLEMENT => 135

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GLAGOLITIC => 136

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHAROSHTHI => 137

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MODIFIER_TONE_LETTERS => 138

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NEW_TAI_LUE => 139

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_PERSIAN => 140

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PHONETIC_EXTENSIONS_SUPPLEMENT => 141

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_PUNCTUATION => 142

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SYLOTI_NAGRI => 143

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TIFINAGH => 144

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_VERTICAL_FORMS => 145

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NKO => 146

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BALINESE => 147

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_C => 148

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_D => 149

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PHAGS_PA => 150

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PHOENICIAN => 151

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CUNEIFORM => 152

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CUNEIFORM_NUMBERS_AND_PUNCTUATION => 153

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COUNTING_ROD_NUMERALS => 154

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUNDANESE => 155

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LEPCHA => 156

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OL_CHIKI => 157

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC_EXTENDED_A => 158

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_VAI => 159

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC_EXTENDED_B => 160

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SAURASHTRA => 161

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KAYAH_LI => 162

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_REJANG => 163

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHAM => 164

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ANCIENT_SYMBOLS => 165

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PHAISTOS_DISC => 166

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LYCIAN => 167

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CARIAN => 168

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LYDIAN => 169

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MAHJONG_TILES => 170

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DOMINO_TILES => 171

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SAMARITAN => 172

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED => 173

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAI_THAM => 174

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_VEDIC_EXTENSIONS => 175

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LISU => 176

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BAMUM => 177

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMMON_INDIC_NUMBER_FORMS => 178

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DEVANAGARI_EXTENDED => 179

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANGUL_JAMO_EXTENDED_A => 180

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_JAVANESE => 181

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MYANMAR_EXTENDED_A => 182

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAI_VIET => 183

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MEETEI_MAYEK => 184

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANGUL_JAMO_EXTENDED_B => 185

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_IMPERIAL_ARAMAIC => 186

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_SOUTH_ARABIAN => 187

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_AVESTAN => 188

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_INSCRIPTIONAL_PARTHIAN => 189

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_INSCRIPTIONAL_PAHLAVI => 190

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_TURKIC => 191

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_RUMI_NUMERAL_SYMBOLS => 192

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KAITHI => 193

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_EGYPTIAN_HIEROGLYPHS => 194

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ENCLOSED_ALPHANUMERIC_SUPPLEMENT => 195

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ENCLOSED_IDEOGRAPHIC_SUPPLEMENT => 196

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C => 197

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MANDAIC => 198

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BATAK => 199

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ETHIOPIC_EXTENDED_A => 200

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BRAHMI => 201

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BAMUM_SUPPLEMENT => 202

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KANA_SUPPLEMENT => 203

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PLAYING_CARDS => 204

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS => 205

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_EMOTICONS => 206

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TRANSPORT_AND_MAP_SYMBOLS => 207

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ALCHEMICAL_SYMBOLS => 208

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D => 209

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC_EXTENDED_A => 210

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS => 211

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHAKMA => 212

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MEETEI_MAYEK_EXTENSIONS => 213

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MEROITIC_CURSIVE => 214

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MEROITIC_HIEROGLYPHS => 215

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MIAO => 216

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SHARADA => 217

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SORA_SOMPENG => 218

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUNDANESE_SUPPLEMENT => 219

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAKRI => 220

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BASSA_VAH => 221

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CAUCASIAN_ALBANIAN => 222

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COPTIC_EPACT_NUMBERS => 223

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_COMBINING_DIACRITICAL_MARKS_EXTENDED => 224

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DUPLOYAN => 225

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ELBASAN => 226

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GEOMETRIC_SHAPES_EXTENDED => 227

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GRANTHA => 228

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHOJKI => 229

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHUDAWADI => 230

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LATIN_EXTENDED_E => 231

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LINEAR_A => 232

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MAHAJANI => 233

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MANICHAEAN => 234

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MENDE_KIKAKUI => 235

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MODI => 236

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MRO => 237

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MYANMAR_EXTENDED_B => 238

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NABATAEAN => 239

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_NORTH_ARABIAN => 240

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_PERMIC => 241

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ORNAMENTAL_DINGBATS => 242

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PAHAWH_HMONG => 243

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PALMYRENE => 244

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PAU_CIN_HAU => 245

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_PSALTER_PAHLAVI => 246

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SHORTHAND_FORMAT_CONTROLS => 247

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SIDDHAM => 248

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SINHALA_ARCHAIC_NUMBERS => 249

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_ARROWS_C => 250

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TIRHUTA => 251

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_WARANG_CITI => 252

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_AHOM => 253

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ANATOLIAN_HIEROGLYPHS => 254

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHEROKEE_SUPPLEMENT => 255

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E => 256

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_EARLY_DYNASTIC_CUNEIFORM => 257

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HATRAN => 258

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MULTANI => 259

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_HUNGARIAN => 260

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS => 261

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SUTTON_SIGNWRITING => 262

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ADLAM => 263

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_BHAIKSUKI => 264

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CYRILLIC_EXTENDED_C => 265

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GLAGOLITIC_SUPPLEMENT => 266

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION => 267

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MARCHEN => 268

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MONGOLIAN_SUPPLEMENT => 269

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NEWA => 270

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OSAGE => 271

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TANGUT => 272

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TANGUT_COMPONENTS => 273

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_F => 274

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KANA_EXTENDED_A => 275

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MASARAM_GONDI => 276

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NUSHU => 277

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SOYOMBO => 278

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SYRIAC_SUPPLEMENT => 279

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ZANABAZAR_SQUARE => 280

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHESS_SYMBOLS => 281

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DOGRA => 282

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GEORGIAN_EXTENDED => 283

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_GUNJALA_GONDI => 284

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_HANIFI_ROHINGYA => 285

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_INDIC_SIYAQ_NUMBERS => 286

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MAKASAR => 287

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MAYAN_NUMERALS => 288

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_MEDEFAIDRIN => 289

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OLD_SOGDIAN => 290

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SOGDIAN => 291

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_EGYPTIAN_HIEROGLYPH_FORMAT_CONTROLS => 292

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_ELYMAIC => 293

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NANDINAGARI => 294

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_NYIAKENG_PUACHUE_HMONG => 295

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_OTTOMAN_SIYAQ_NUMBERS => 296

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SMALL_KANA_EXTENSION => 297

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SYMBOLS_AND_PICTOGRAPHS_EXTENDED_A => 298

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TAMIL_SUPPLEMENT => 299

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_WANCHO => 300

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CHORASMIAN => 301

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_CJK_UNIFIED_IDEOGRAPHS_EXTENSION_G => 302

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_DIVES_AKURU => 303

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_KHITAN_SMALL_SCRIPT => 304

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_LISU_SUPPLEMENT => 305

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_SYMBOLS_FOR_LEGACY_COMPUTING => 306

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_TANGUT_SUPPLEMENT => 307

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_YEZIDI => 308

    /**
     * @type {Integer (Int32)}
     */
    static UBLOCK_INVALID_CODE => -1
}
