#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UScriptCode{

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_INVALID_CODE => -1

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_COMMON => 0

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_INHERITED => 1

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ARABIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ARMENIAN => 3

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BENGALI => 4

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BOPOMOFO => 5

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CHEROKEE => 6

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_COPTIC => 7

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CYRILLIC => 8

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DESERET => 9

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DEVANAGARI => 10

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ETHIOPIC => 11

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GEORGIAN => 12

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GOTHIC => 13

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GREEK => 14

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GUJARATI => 15

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GURMUKHI => 16

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HAN => 17

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HANGUL => 18

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HEBREW => 19

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HIRAGANA => 20

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KANNADA => 21

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KATAKANA => 22

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHMER => 23

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LAO => 24

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LATIN => 25

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MALAYALAM => 26

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MONGOLIAN => 27

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MYANMAR => 28

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OGHAM => 29

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_ITALIC => 30

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ORIYA => 31

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_RUNIC => 32

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SINHALA => 33

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SYRIAC => 34

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAMIL => 35

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TELUGU => 36

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_THAANA => 37

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_THAI => 38

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TIBETAN => 39

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CANADIAN_ABORIGINAL => 40

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_UCAS => 40

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_YI => 41

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAGALOG => 42

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HANUNOO => 43

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BUHID => 44

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAGBANWA => 45

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BRAILLE => 46

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CYPRIOT => 47

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LIMBU => 48

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LINEAR_B => 49

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OSMANYA => 50

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SHAVIAN => 51

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAI_LE => 52

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_UGARITIC => 53

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KATAKANA_OR_HIRAGANA => 54

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BUGINESE => 55

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GLAGOLITIC => 56

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHAROSHTHI => 57

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SYLOTI_NAGRI => 58

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NEW_TAI_LUE => 59

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TIFINAGH => 60

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_PERSIAN => 61

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BALINESE => 62

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BATAK => 63

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BLISSYMBOLS => 64

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BRAHMI => 65

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CHAM => 66

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CIRTH => 67

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_CHURCH_SLAVONIC_CYRILLIC => 68

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DEMOTIC_EGYPTIAN => 69

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HIERATIC_EGYPTIAN => 70

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_EGYPTIAN_HIEROGLYPHS => 71

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHUTSURI => 72

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SIMPLIFIED_HAN => 73

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TRADITIONAL_HAN => 74

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PAHAWH_HMONG => 75

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_HUNGARIAN => 76

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HARAPPAN_INDUS => 77

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_JAVANESE => 78

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KAYAH_LI => 79

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LATIN_FRAKTUR => 80

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LATIN_GAELIC => 81

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LEPCHA => 82

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LINEAR_A => 83

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MANDAIC => 84

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MANDAEAN => 84

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MAYAN_HIEROGLYPHS => 85

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MEROITIC_HIEROGLYPHS => 86

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MEROITIC => 86

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NKO => 87

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ORKHON => 88

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_PERMIC => 89

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PHAGS_PA => 90

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PHOENICIAN => 91

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MIAO => 92

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PHONETIC_POLLARD => 92

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_RONGORONGO => 93

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SARATI => 94

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ESTRANGELO_SYRIAC => 95

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_WESTERN_SYRIAC => 96

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_EASTERN_SYRIAC => 97

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TENGWAR => 98

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_VAI => 99

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_VISIBLE_SPEECH => 100

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CUNEIFORM => 101

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_UNWRITTEN_LANGUAGES => 102

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_UNKNOWN => 103

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CARIAN => 104

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_JAPANESE => 105

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LANNA => 106

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LYCIAN => 107

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LYDIAN => 108

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OL_CHIKI => 109

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_REJANG => 110

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SAURASHTRA => 111

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SIGN_WRITING => 112

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SUNDANESE => 113

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MOON => 114

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MEITEI_MAYEK => 115

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_IMPERIAL_ARAMAIC => 116

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_AVESTAN => 117

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CHAKMA => 118

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KOREAN => 119

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KAITHI => 120

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MANICHAEAN => 121

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_INSCRIPTIONAL_PAHLAVI => 122

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PSALTER_PAHLAVI => 123

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BOOK_PAHLAVI => 124

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_INSCRIPTIONAL_PARTHIAN => 125

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SAMARITAN => 126

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAI_VIET => 127

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MATHEMATICAL_NOTATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SYMBOLS => 129

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BAMUM => 130

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LISU => 131

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NAKHI_GEBA => 132

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_SOUTH_ARABIAN => 133

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BASSA_VAH => 134

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DUPLOYAN => 135

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ELBASAN => 136

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GRANTHA => 137

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KPELLE => 138

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_LOMA => 139

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MENDE => 140

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MEROITIC_CURSIVE => 141

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_NORTH_ARABIAN => 142

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NABATAEAN => 143

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PALMYRENE => 144

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHUDAWADI => 145

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SINDHI => 145

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_WARANG_CITI => 146

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_AFAKA => 147

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_JURCHEN => 148

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MRO => 149

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NUSHU => 150

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SHARADA => 151

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SORA_SOMPENG => 152

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TAKRI => 153

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TANGUT => 154

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_WOLEAI => 155

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ANATOLIAN_HIEROGLYPHS => 156

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHOJKI => 157

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_TIRHUTA => 158

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CAUCASIAN_ALBANIAN => 159

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MAHAJANI => 160

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_AHOM => 161

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HATRAN => 162

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MODI => 163

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MULTANI => 164

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_PAU_CIN_HAU => 165

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SIDDHAM => 166

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ADLAM => 167

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_BHAIKSUKI => 168

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MARCHEN => 169

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NEWA => 170

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OSAGE => 171

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HAN_WITH_BOPOMOFO => 172

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_JAMO => 173

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SYMBOLS_EMOJI => 174

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MASARAM_GONDI => 175

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SOYOMBO => 176

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ZANABAZAR_SQUARE => 177

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DOGRA => 178

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_GUNJALA_GONDI => 179

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MAKASAR => 180

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_MEDEFAIDRIN => 181

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_HANIFI_ROHINGYA => 182

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_SOGDIAN => 183

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_OLD_SOGDIAN => 184

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_ELYMAIC => 185

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NYIAKENG_PUACHUE_HMONG => 186

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_NANDINAGARI => 187

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_WANCHO => 188

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_CHORASMIAN => 189

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_DIVES_AKURU => 190

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_KHITAN_SMALL_SCRIPT => 191

    /**
     * @type {Integer (Int32)}
     */
    static USCRIPT_YEZIDI => 192
}
