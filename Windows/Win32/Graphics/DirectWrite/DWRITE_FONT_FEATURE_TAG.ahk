#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A value that indicates the typographic feature of text supplied by the font.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ne-dwrite-dwrite_font_feature_tag
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_FEATURE_TAG extends Win32Enum{

    /**
     * Replaces figures separated by a slash with an alternative form.
     * 
     * <b>Equivalent OpenType tag:</b> 'afrc'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_ALTERNATIVE_FRACTIONS => 1668441697

    /**
     * Turns capital characters into petite capitals. It is generally used for words which would otherwise be set in all caps, such as acronyms, but which are desired in petite-cap form to avoid disrupting the flow of text. See the pcap feature description for notes on the relationship of caps, smallcaps and petite caps.
     * 
     * <b>Equivalent OpenType tag:</b> 'c2pc'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS_FROM_CAPITALS => 1668297315

    /**
     * Turns capital characters into small capitals. It is generally used for words which would otherwise be set in all caps, such as acronyms, but which are desired in small-cap form to avoid disrupting the flow of text. 
     * 
     * <b>Equivalent OpenType tag:</b> 'c2sc'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS_FROM_CAPITALS => 1668493923

    /**
     * In specified situations, replaces default glyphs with alternate forms which provide better joining behavior. Used in script typefaces which are designed to have some or all of their glyphs join.
     * 
     * <b>Equivalent OpenType tag:</b> 'calt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_ALTERNATES => 1953259875

    /**
     * Shifts various punctuation marks up to a position that works better with all-capital sequences or sets of lining figures; also changes oldstyle figures to lining figures. By default, glyphs in a text face are designed to work with lowercase characters. Some characters should be shifted vertically to fit the higher visual center of all-capital or lining text. Also, lining figures are the same height (or close to it) as capitals, and fit much better with all-capital text.
     * 
     * <b>Equivalent OpenType tag:</b> 'case'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CASE_SENSITIVE_FORMS => 1702060387

    /**
     * To minimize the number of glyph alternates, it is sometimes desired to decompose a character into two glyphs. Additionally, it may be preferable to compose two characters into a single glyph for better glyph processing. This feature permits such composition/decomposition. The feature should be processed as the first feature processed, and should be processed only when it is called.
     * 
     * <b>Equivalent OpenType tag:</b> 'ccmp'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_GLYPH_COMPOSITION_DECOMPOSITION => 1886217059

    /**
     * Replaces a sequence of glyphs with a single glyph which is preferred for typographic purposes. Unlike other ligature features, clig specifies the context in which the ligature is recommended. This capability is important in some script designs and for swash ligatures.
     * 
     * <b>Equivalent OpenType tag:</b> 'clig'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_LIGATURES => 1734962275

    /**
     * Globally adjusts inter-glyph spacing for all-capital text. Most typefaces contain capitals and lowercase characters, and the capitals are positioned to work with the lowercase. When capitals are used for words, they need more space between them for legibility and esthetics. This feature would not apply to monospaced designs. Of course the user may want to override this behavior in order to do more pronounced letterspacing for esthetic reasons.
     * 
     * 
     * 
     * <b>Equivalent OpenType tag:</b> 'cpsp'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CAPITAL_SPACING => 1886613603

    /**
     * Replaces default character glyphs with corresponding swash glyphs in a specified context. Note that there may be more than one swash alternate for a given character.
     * 
     * 
     * 
     * <b>Equivalent OpenType tag:</b> 'cswh'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CONTEXTUAL_SWASH => 1752658787

    /**
     * In cursive scripts like Arabic, this feature cursively positions adjacent glyphs.
     * 
     * <b>Equivalent OpenType tag:</b> 'curs'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_CURSIVE_POSITIONING => 1936880995

    /**
     * The default.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_DEFAULT => 1953261156

    /**
     * Replaces a sequence of glyphs with a single glyph which is preferred for typographic purposes. This feature covers those ligatures which may be used for special effect, at the user's preference.
     * 
     * <b>Equivalent OpenType tag:</b> 'dlig'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_DISCRETIONARY_LIGATURES => 1734962276

    /**
     * Replaces standard forms in Japanese fonts with corresponding forms preferred by typographers.  For example, a user would invoke this feature to replace kanji character U+5516 with U+555E.
     * 
     * 
     * <b>Equivalent OpenType tag:</b> 'expt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_EXPERT_FORMS => 1953527909

    /**
     * Replaces figures separated by a slash with 'common' (diagonal) fractions.
     * 
     * <b>Equivalent OpenType tag:</b> 'frac'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_FRACTIONS => 1667330662

    /**
     * Replaces glyphs set on other widths with glyphs set on full (usually em) widths. In a CJKV font, this may include "lower ASCII" Latin characters and various symbols. In a European font, this feature replaces proportionally-spaced glyphs with monospaced glyphs, which are generally set on widths of 0.6 em. For example, a user may invoke this feature in a Japanese font to get full monospaced Latin glyphs instead of the corresponding proportionally-spaced versions.
     * 
     * <b>Equivalent OpenType tag:</b> 'fwid'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_FULL_WIDTH => 1684633446

    /**
     * Produces the half forms of consonants in Indic scripts. For example, in Hindi (Devanagari script), the conjunct KKa, obtained by doubling the Ka, is denoted with a half form of Ka followed by the full form. 
     * 
     * <b>Equivalent OpenType tag:</b> 'half'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HALF_FORMS => 1718378856

    /**
     * Produces the halant forms of consonants in Indic scripts. For example, in Sanskrit (Devanagari script), syllable final consonants are frequently required in their halant form.
     * 
     * <b>Equivalent OpenType tag:</b> 'haln'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HALANT_FORMS => 1852596584

    /**
     * Respaces glyphs designed to be set on full-em widths, fitting them onto half-em widths. This differs from hwid in that it does not substitute new glyphs.
     * 
     * <b>Equivalent OpenType tag:</b> 'halt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_ALTERNATE_HALF_WIDTH => 1953259880

    /**
     * Replaces the default (current) forms with the historical alternates. While some ligatures are also used for historical effect, this feature deals only with single characters. Some fonts include the historical forms as alternates, so they can be used for a 'period' effect.  
     * 
     * <b>Equivalent OpenType tag:</b> 'hist'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HISTORICAL_FORMS => 1953720680

    /**
     * Replaces standard kana with forms that have been specially designed for only horizontal writing. This is a typographic optimization for improved fit and more even color.
     * 
     * <b>Equivalent OpenType tag:</b> 'hkna'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HORIZONTAL_KANA_ALTERNATES => 1634626408

    /**
     * Replaces the default (current) forms with the historical alternates. Some ligatures were in common use in the past, but appear anachronistic today. Some fonts include the historical forms as alternates, so they can be used for a 'period' effect.
     * 
     * <b>Equivalent OpenType tag:</b> 'hlig'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HISTORICAL_LIGATURES => 1734962280

    /**
     * Replaces glyphs on proportional widths, or fixed widths other than half an em, with glyphs on half-em (en) widths. Many CJKV fonts have glyphs which are set on multiple widths; this feature selects the half-em version. There are various contexts in which this is the preferred behavior, including compatibility with older desktop documents.
     * 
     * <b>Equivalent OpenType tag:</b> 'hwid'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HALF_WIDTH => 1684633448

    /**
     * Used to access the JIS X 0212-1990 glyphs for the cases when the JIS X 0213:2004 form is encoded. The JIS X 0212-1990 (aka, "Hojo Kanji") and JIS X 0213:2004 character sets overlap significantly. In some cases their prototypical glyphs differ. When building fonts that support both JIS X 0212-1990 and JIS X 0213:2004 (such as those supporting the Adobe-Japan 1-6 character collection), it is recommended that JIS X 0213:2004 forms be the preferred encoded form.
     * 
     * <b>Equivalent OpenType tag:</b> 'hojo'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_HOJO_KANJI_FORMS => 1869246312

    /**
     * The National Language Council (NLC) of Japan has defined new glyph shapes for a number of JIS characters, which were incorporated into JIS X 0213:2004 as new prototypical forms. The 'jp04' feature is A subset of the 'nlck' feature, and is used to access these prototypical glyphs in a manner that maintains the integrity of JIS X 0213:2004.
     * 
     * <b>Equivalent OpenType tag:</b> 'jp04'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_JIS04_FORMS => 875589738

    /**
     * Replaces default (JIS90) Japanese glyphs with the corresponding forms from the JIS C 6226-1978 (JIS78) specification.
     * 
     * <b>Equivalent OpenType tag:</b> 'jp78'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_JIS78_FORMS => 943157354

    /**
     * Replaces default (JIS90) Japanese glyphs with the corresponding forms from the JIS X 0208-1983 (JIS83) specification.
     * 
     * <b>Equivalent OpenType tag:</b> 'jp83'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_JIS83_FORMS => 859336810

    /**
     * Replaces Japanese glyphs from the JIS78 or JIS83 specifications with the corresponding forms from the JIS X 0208-1990 (JIS90) specification.
     * 
     * <b>Equivalent OpenType tag:</b> 'jp90'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_JIS90_FORMS => 809070698

    /**
     * Adjusts amount of space between glyphs, generally to provide optically consistent spacing between glyphs. Although a well-designed typeface has consistent inter-glyph spacing overall, some glyph combinations require adjustment for improved legibility. Besides standard adjustment in the horizontal direction, this feature can supply size-dependent kerning data via device tables, "cross-stream" kerning in the Y text direction, and adjustment of glyph placement independent of the advance adjustment. Note that this feature may apply to runs of more than two glyphs, and would not be used in monospaced fonts. Also note that this feature does not apply to text set vertically.
     * 
     * <b>Equivalent OpenType tag:</b> 'kern'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_KERNING => 1852990827

    /**
     * Replaces a sequence of glyphs with a single glyph which is preferred for typographic purposes. This feature covers the ligatures which the designer/manufacturer judges should be used in normal conditions.
     * 
     * <b>Equivalent OpenType tag:</b> 'liga'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STANDARD_LIGATURES => 1634167148

    /**
     * Changes selected figures from oldstyle to the default lining form. For example, a user may invoke this feature in order to get lining figures, which fit better with all-capital text. This feature overrides results of the Oldstyle Figures feature (onum).
     * 
     * <b>Equivalent OpenType tag:</b> 'lnum'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_LINING_FIGURES => 1836412524

    /**
     * Enables localized forms of glyphs to be substituted for default forms. Many scripts used to write multiple languages over wide geographical areas have developed localized variant forms of specific letters, which are used by individual literary communities. For example, a number of letters in the Bulgarian and Serbian alphabets have forms distinct from their Russian counterparts and from each other. In some cases the localized form differs only subtly from the script 'norm', in others the forms are radically distinct. 
     * 
     * <b>Equivalent OpenType tag:</b> 'locl'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_LOCALIZED_FORMS => 1818455916

    /**
     * Positions mark glyphs with respect to base glyphs. For example, in Arabic script positioning the Hamza above the Yeh.
     * 
     * <b>Equivalent OpenType tag: </b> 'mark'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_MARK_POSITIONING => 1802658157

    /**
     * Replaces standard typographic forms of Greek glyphs with corresponding forms commonly used in mathematical notation (which are a subset of the Greek alphabet).
     * 
     * <b>Equivalent OpenType tag:</b> 'mgrk'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_MATHEMATICAL_GREEK => 1802659693

    /**
     * Positions marks with respect to other marks. Required in various non-Latin scripts like Arabic. For example, in Arabic, the ligaturised mark Ha with Hamza above it can also be obtained by positioning these marks relative to one another.
     * 
     * <b>Equivalent OpenType tag:</b>  'mkmk'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_MARK_TO_MARK_POSITIONING => 1802333037

    /**
     * Replaces default glyphs with various notational forms (such as glyphs placed in open or solid circles, squares, parentheses, diamonds or rounded boxes). In some cases an annotation form may already be present, but the user may want a different one.
     * 
     * <b>Equivalent OpenType tag:</b> 'nalt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_ALTERNATE_ANNOTATION_FORMS => 1953259886

    /**
     * Used to access  glyphs made from glyph shapes defined by the National Language Council (NLC) of Japan for a number of JIS characters in 2000. 
     * 
     * <b>Equivalent OpenType tag:</b> 'nlck'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_NLC_KANJI_FORMS => 1801677934

    /**
     * Changes selected figures from the default lining style to oldstyle form. For example, a user may invoke this feature to get oldstyle figures, which fit better into the flow of normal upper- and lowercase text. This feature overrides results of the Lining Figures feature (lnum).
     * 
     * <b>Equivalent OpenType tag:</b> 'onum'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_OLD_STYLE_FIGURES => 1836412527

    /**
     * Replaces default alphabetic glyphs with the corresponding ordinal forms for use after figures. One exception to the follows-a-figure rule is the numero character (U+2116), which is actually a ligature substitution, but is best accessed through this feature.
     * 
     * <b>Equivalent OpenType tag:</b> 'ordn'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_ORDINALS => 1852076655

    /**
     * Respaces glyphs designed to be set on full-em widths, fitting them onto individual (more or less proportional) horizontal widths. This differs from pwid in that it does not substitute new glyphs (GPOS, not GSUB feature). The user may prefer the monospaced form, or may simply want to ensure that the glyph is well-fit and not rotated in vertical setting (Latin forms designed for proportional spacing would be rotated).
     * 
     * <b>Equivalent OpenType tag:</b> 'palt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_ALTERNATE_WIDTH => 1953259888

    /**
     * Turns lowercase characters into petite capitals. Forms related to petite capitals, such as specially designed figures, may be included. Some fonts contain an additional size of capital letters, shorter than the regular smallcaps and it is referred to as petite caps. Such forms are most likely to be found in designs with a small lowercase x-height, where they better harmonise with lowercase text than the taller smallcaps (for examples of petite caps, see the Emigre type families Mrs Eaves and Filosofia). 
     * 
     * <b>Equivalent OpenType tag:</b> 'pcap'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_PETITE_CAPITALS => 1885430640

    /**
     * Replaces figure glyphs set on uniform (tabular) widths with corresponding glyphs set on glyph-specific (proportional) widths. Tabular widths will generally be the default, but this cannot be safely assumed. Of course this feature would not be present in monospaced designs.
     * 
     * <b>Equivalent OpenType tag:</b> 'pnum'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_FIGURES => 1836412528

    /**
     * Replaces glyphs set on uniform widths (typically full or half-em) with proportionally spaced glyphs. The proportional variants are often used for the Latin characters in CJKV fonts, but may also be used for Kana in Japanese fonts.
     * 
     * <b>Equivalent OpenType tag:</b> 'pwid'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_PROPORTIONAL_WIDTHS => 1684633456

    /**
     * Replaces glyphs on other widths with glyphs set on widths of one quarter of an em (half an en). The characters involved are normally figures and some forms of punctuation.
     * 
     * <b>Equivalent OpenType tag:</b> 'qwid'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_QUARTER_WIDTHS => 1684633457

    /**
     * Replaces a sequence of glyphs with a single glyph which is preferred for typographic purposes. This feature covers those ligatures, which the script determines as required to be used in normal conditions. This feature is important for some scripts to ensure correct glyph formation. 
     * 
     * <b>Equivalent OpenType tag:</b> 'rlig'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_REQUIRED_LIGATURES => 1734962290

    /**
     * Identifies glyphs in the font which have been designed for "ruby", from the old typesetting term for four-point-sized type. Japanese typesetting often uses smaller kana glyphs, generally in superscripted form, to clarify the meaning of kanji which may be unfamiliar to the reader. 
     * 
     * <b>Equivalent OpenType tag:</b> 'ruby'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_RUBY_NOTATION_FORMS => 2036495730

    /**
     * Replaces the default forms with the stylistic alternates. Many fonts contain alternate glyph designs for a purely esthetic effect; these don't always fit into a clear category like swash or historical. As in the case of swash glyphs, there may be more than one alternate form.  
     * 
     * <b>Equivalent OpenType tag:</b> 'salt'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_ALTERNATES => 1953259891

    /**
     * Replaces lining or oldstyle figures with inferior figures (smaller glyphs which sit lower than the standard baseline, primarily for chemical or mathematical notation). May also replace lowercase characters with alphabetic inferiors.
     * 
     * <b>Equivalent OpenType tag:</b> 'sinf'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SCIENTIFIC_INFERIORS => 1718511987

    /**
     * Turns lowercase characters into small capitals. This corresponds to the common SC font layout. It is generally used for display lines set in Large &amp; small caps, such as titles. Forms related to small capitals, such as oldstyle figures, may be included.
     * 
     * <b>Equivalent OpenType tag:</b> 'smcp'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SMALL_CAPITALS => 1885564275

    /**
     * Replaces 'traditional' Chinese or Japanese forms with the corresponding 'simplified' forms.
     * 
     * <b>Equivalent OpenType tag:</b> 'smpl'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SIMPLIFIED_FORMS => 1819307379

    /**
     * In addition to, or instead of, stylistic alternatives of individual glyphs (see 'salt' feature), some fonts may contain sets of stylistic variant glyphs corresponding to portions of the character set, such as multiple variants for lowercase letters in a Latin font. Glyphs in stylistic sets may be designed to harmonise visually, interract in particular ways, or otherwise work together. Examples of fonts including stylistic sets are Zapfino Linotype and Adobe's Poetica. Individual features numbered sequentially with the tag name convention 'ss01' 'ss02' 'ss03' . 'ss20' provide a mechanism for glyphs in these sets to be associated via GSUB lookup indexes to default forms and to each other, and for users to select from available stylistic sets
     * 
     * <b>Equivalent OpenType tag:</b> 'ss01'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1 => 825258867

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss02'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_2 => 842036083

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss03'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_3 => 858813299

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss04'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_4 => 875590515

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss05'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_5 => 892367731

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss06'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_6 => 909144947

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss07'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_7 => 925922163

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss08'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_8 => 942699379

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss09'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_9 => 959476595

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss10'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_10 => 808547187

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss11'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_11 => 825324403

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss12'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_12 => 842101619

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss13'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_13 => 858878835

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss14'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_14 => 875656051

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss15'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_15 => 892433267

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss16'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_16 => 909210483

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss17'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_17 => 925987699

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss18'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_18 => 942764915

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss19'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_19 => 959542131

    /**
     * See the description for <a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_font_feature_tag">DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_1</a>.
     * 
     * <b>Equivalent OpenType tag:</b> 'ss20'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_STYLISTIC_SET_20 => 808612723

    /**
     * May replace a default glyph with a subscript glyph, or it may combine a glyph substitution with positioning adjustments for proper placement.
     * 
     * <b>Equivalent OpenType tag:</b> 'subs'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SUBSCRIPT => 1935832435

    /**
     * Replaces lining or oldstyle figures with superior figures (primarily for footnote indication), and replaces lowercase letters with superior letters (primarily for abbreviated French titles).
     * 
     * <b>Equivalent OpenType tag:</b> 'sups'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SUPERSCRIPT => 1936749939

    /**
     * Replaces default character glyphs with corresponding swash glyphs. Note that there may be more than one swash alternate for a given character.
     * 
     * <b>Equivalent OpenType tag:</b> 'swsh'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SWASH => 1752397683

    /**
     * Replaces the default glyphs with corresponding forms designed specifically for titling. These may be all-capital and/or larger on the body, and adjusted for viewing at larger sizes.
     * 
     * <b>Equivalent OpenType tag:</b> 'titl'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_TITLING => 1819568500

    /**
     * Replaces 'simplified' Japanese kanji forms with the corresponding 'traditional' forms. This is equivalent to the Traditional Forms feature, but explicitly limited to the traditional forms considered proper for use in personal names (as many as 205 glyphs in some fonts).
     * 
     * <b>Equivalent OpenType tag:</b> 'tnam'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_TRADITIONAL_NAME_FORMS => 1835101812

    /**
     * Replaces figure glyphs set on proportional widths with corresponding glyphs set on uniform (tabular) widths. Tabular widths will generally be the default, but this cannot be safely assumed. Of course this feature would not be present in monospaced designs.
     * 
     * <b>Equivalent OpenType tag:</b> 'tnum'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_TABULAR_FIGURES => 1836412532

    /**
     * Replaces 'simplified' Chinese hanzi or Japanese kanji forms with the corresponding 'traditional' forms.
     * 
     * <b>Equivalent OpenType tag:</b> 'trad'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_TRADITIONAL_FORMS => 1684107892

    /**
     * Replaces glyphs on other widths with glyphs set on widths of one third of an em. The characters involved are normally figures and some forms of punctuation.
     * 
     * <b>Equivalent OpenType tag:</b> 'twid'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_THIRD_WIDTHS => 1684633460

    /**
     * Maps upper- and lowercase letters to a mixed set of lowercase and small capital forms, resulting in a single case alphabet (for an example of unicase, see the Emigre type family Filosofia). The letters substituted may vary from font to font, as appropriate to the design. If aligning to the x-height, smallcap glyphs may be substituted, or specially designed unicase forms might be used. Substitutions might also include specially designed figures.
     * 
     * 
     * <b>Equivalent OpenType tag:</b> 'unic'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_UNICASE => 1667853941

    /**
     * Indicates that the font is displayed vertically.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_VERTICAL_WRITING => 1953654134

    /**
     * Replaces normal figures with figures adjusted for vertical display.
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_VERTICAL_ALTERNATES_AND_ROTATION => 846492278

    /**
     * Allows the user to change from the default 0 to a slashed form. Some fonts contain both a default form of zero, and an alternative form which uses a diagonal slash through the counter. Especially in condensed designs, it can be difficult to distinguish between 0 and O (zero and capital O) in any situation where capitals and lining figures may be arbitrarily mixed. 
     * 
     * <b>Equivalent OpenType tag:</b> 'zero'
     * @type {Integer (UInt32)}
     */
    static DWRITE_FONT_FEATURE_TAG_SLASHED_ZERO => 1869768058
}
