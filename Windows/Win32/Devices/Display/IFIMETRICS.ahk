#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include ..\..\Graphics\Gdi\PANOSE.ahk

/**
 * The IFIMETRICS structure defines information for a given typeface that GDI can use.
 * @remarks
 * Additional information for a typeface can optionally be specified in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifiextra">IFIEXTRA</a> structure.
 * 
 * A driver's <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-drvqueryfont">DrvQueryFont</a> routine fills out and returns an IFIMETRICS structure to GDI.
 * 
 * The IFIMETRICS structure defines all the information for a typeface that GDI understands. Most of the members are FWORD values, which are signed 16-bit quantities in design space. If the font is a raster font, design space and device space are the same and a font unit is equivalent to the distance between pixels.
 * 
 * The coordinate system in the font/notional space is such that the y coordinate increases in an upward direction and the x coordinate increases to the right.
 * 
 * The IFIMETRICS structure's <b>Align</b> member causes it to be larger for x64 machines than for x32 machines, which has ramifications for binary font format files formatted according to this structure. Starting with Windows Server 2003 SP1, an additional, fixed-size structure has been added to Prntfont.h: <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/prntfont/ns-prntfont-_printifi32">PRINTIFI32</a>. The PRINTIFI32 structure is identical to the IFIMETRICS structure, except that it does not contain an <b>Align</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-ifimetrics
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class IFIMETRICS extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * Specifies the size in bytes of this structure. The specified size includes any Unicode strings appended to the end of this structure, plus the size in bytes of the optional <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-ifiextra">IFIEXTRA</a> structure.
     * @type {Integer}
     */
    cjThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the size in bytes of the IFIEXTRA structure that follows this IFIMETRICS structure. A value of zero indicates that no IFIEXTRA structure is present.
     * @type {Integer}
     */
    cjIfiExtra {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the offset in bytes to a null-terminated Unicode string containing the family name of the font (for example, "Times Roman"). Generally, this string immediately follows the IFIMETRICS structure. This string should be the same as the name recorded in the <b>lfFaceName</b> member of the Win32 LOGFONT structure.
     * @type {Integer}
     */
    dpwszFamilyName {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Specifies the offset in bytes to a null-terminated Unicode string describing the style of the font (for example, "Bold").
     * @type {Integer}
     */
    dpwszStyleName {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the offset in bytes to a null-terminated Unicode string representing the unique and complete name of the font. The name contains the family and subfamily names of the font (for example, "Times New Roman Bold").
     * @type {Integer}
     */
    dpwszFaceName {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the offset in bytes to a null-terminated Unicode string representing the unique identifier of the font (for example, "Monotype:Times New Roman:1990").
     * @type {Integer}
     */
    dpwszUniqueName {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Specifies the offset in bytes from the beginning of this IFIMETRICS structure to a <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontsim">FONTSIM</a> structure that describes the simulations that the font supports. The driver should set this member to a nonzero value only if the font supports bold, italic, or bold italic simulations; otherwise, the driver should set this to zero.
     * 
     * Note that if a font is italic by design, the driver should not indicate font support for italic simulation although it can indicate font support for bold italic simulation. Similarly, the driver should not indicate font support for bold simulation if the font is bold by design, but can indicate font support for bold italic simulation. If the font is both bold and italic by design, it should not support any simulations.
     * 
     * The offsets in the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fontsim">FONTSIM</a> structure are relative to the base of the FONTSIM structure.
     * @type {Integer}
     */
    dpFontSim {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies the Embedding ID of the font. This value is TrueType-specific and should be set to zero by all other font providers.
     * @type {Integer}
     */
    lEmbedId {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies the italic angle of the font. This value is TrueType-specific and should be set to zero by all other font providers.
     * @type {Integer}
     */
    lItalicAngle {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies the character bias. This value is TrueType-specific and should be set to zero by all other font providers.
     * @type {Integer}
     */
    lCharBias {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Specifies the offset from the beginning of this IFIMETRICS structure to an array containing a list of all Windows character sets supported by this font. The array is 16 bytes in size and is always terminated with DEFAULT_CHARSET. The first value of the array should identify the Windows character set that has the best and most complete coverage in the font; this value should also be stored in <b>jWinCharSet</b>. For instance, if this is a Japanese font that also supports US ANSI and Cyrillic character sets, then <b>jWinCharSet</b> should be set to SHIFTJIS_CHARSET and the array identified by <b>dpCharSets</b> would contain SHIFTJIS_CHARSET, ANSI_CHARSET, RUSSIAN_CHARSET, DEFAULT_CHARSET.
     * 
     * If this font does not support more than one Windows character set, <b>dpCharSets</b> should be set to zero.
     * @type {Integer}
     */
    dpCharSets {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    jWinCharSet {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * 
     * @type {Integer}
     */
    jWinPitchAndFamily {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * Specifies the weight of the font in the range 0 to 1000 (for example, 400 is normal and 700 is bold). This value is provided to the application in the <b>lfWeight</b> member of the Win32 LOGFONT structure.
     * @type {Integer}
     */
    usWinWeight {
        get => NumGet(this, 46, "ushort")
        set => NumPut("ushort", value, this, 46)
    }

    /**
     * Specifies additional information about the font. This field can be a combination of the following flag values:
     * @type {Integer}
     */
    flInfo {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Specifies a combination of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_BOLD
     * 
     * </td>
     * <td>
     * Set if the characters of the font are bold.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_ITALIC
     * 
     * </td>
     * <td>
     * Set if the characters of the font are italic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_NEGATIVE
     * 
     * </td>
     * <td>
     * Set if the characters of the font have the foreground and background reversed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_OUTLINED
     * 
     * </td>
     * <td>
     * Set if the characters of the font are hollow.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_REGULAR
     * 
     * </td>
     * <td>
     * Set if the characters of the font are normal weight.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_STRIKEOUT
     * 
     * </td>
     * <td>
     * Set if the characters of the font are struck out by default; otherwise strikeouts must be simulated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_SEL_UNDERSCORE
     * 
     * </td>
     * <td>
     * Set if all the characters of the font are underscored by default; otherwise underscoring must be simulated.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fsSelection {
        get => NumGet(this, 52, "ushort")
        set => NumPut("ushort", value, this, 52)
    }

    /**
     * This is a TrueType-specific bitfield indicating certain properties for the font, such as font embedding and licensing rights for the font. Embeddable fonts can be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font can be loaded for temporary (and in some cases permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the font vendor. The following flags can be set:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * FM_EDITABLE_EMBED
     * 
     * </td>
     * <td>
     * Set if the font can be embedded and temporarily loaded on other systems. Documents containing Editable fonts can be opened for reading and writing.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * FM_READONLY_EMBED
     * 
     * </td>
     * <td>
     * Set if read/write embedding is not permitted; only "preview and print" encapsulation is allowed. When this bit is set, the font can be embedded and temporarily loaded on the remote system. Documents containing "preview and print" fonts must be opened "read-only;" no edits can be applied to the document.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * 
     * <dl>
     * <dt>FM_TYPE_LICENSED</dt>
     * <dt>FM_NO_EMBEDDING</dt>
     * </dl>
     * 
     * 
     * </td>
     * <td>
     * Set if the font is a Restricted License font. When only this bit is set, this font <i>must not be modified, embedded, or exchanged in any manner</i> without first obtaining permission of the legal owner. For Restricted License embedding to take effect, it must be the only level of embedding selected.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Fonts with the FM_READONLY_EMBED bit set indicate that they can be embedded within documents but must only be installed <i>temporarily</i> on the remote system. Any document that includes an FM_READONLY_EMBED font must be opened "read-only." That is, the application can let the user view and/or print the document, but not edit it.
     * 
     * Fonts with the FM_EDITABLE_EMBED bit set indicate that they can be embedded in documents, but must only be installed <i>temporarily</i> on the remote system. In contrast to FM_READONLY_EMBED fonts, documents containing Editable fonts can be opened "read/write;" editing is permitted, and changes can be saved.
     * 
     * Fonts with no <b>fsType</b> bits set indicate that they can be embedded and permanently installed on the remote system by an application. The user of the remote system acquires the identical rights, obligations, and licenses for that font as the original purchaser of the font, and is subject to the same end-user license agreement, copyright, design patent, and/or trademark as was the original purchaser.
     * 
     * Applications that implement support for font embedding, either through use of the Font Embedding DLL or through other means, must not embed fonts that are not licensed to permit embedding. Further, applications loading embedded fonts for temporary use <i>must</i> delete the fonts when the document containing the embedded font is closed.
     * 
     * If multiple embedding bits are set, the <i>least</i> restrictive license granted takes precedence. For example, if bits 1 and 3 are set, bit 3 takes precedence over bit 1and the font can be embedded with Editable rights. For compatibility purposes, most vendors granting Editable embedding rights also set the Preview &amp; Print bit (0x000C). This permits an application that only supports Preview &amp; Print embedding to detect that font embedding is allowed.
     * @type {Integer}
     */
    fsType {
        get => NumGet(this, 54, "ushort")
        set => NumPut("ushort", value, this, 54)
    }

    /**
     * Specifies the em-height of the font.
     * @type {Integer}
     */
    fwdUnitsPerEm {
        get => NumGet(this, 56, "short")
        set => NumPut("short", value, this, 56)
    }

    /**
     * Specifies the smallest readable size of the font, in pixels. This value is ignored for bitmap fonts.
     * @type {Integer}
     */
    fwdLowestPPEm {
        get => NumGet(this, 58, "short")
        set => NumPut("short", value, this, 58)
    }

    /**
     * Specifies the Windows ascender value for the font.
     * @type {Integer}
     */
    fwdWinAscender {
        get => NumGet(this, 60, "short")
        set => NumPut("short", value, this, 60)
    }

    /**
     * Specifies the Windows descender value for the font.
     * @type {Integer}
     */
    fwdWinDescender {
        get => NumGet(this, 62, "short")
        set => NumPut("short", value, this, 62)
    }

    /**
     * Specifies the Macintosh ascender value for the font.
     * @type {Integer}
     */
    fwdMacAscender {
        get => NumGet(this, 64, "short")
        set => NumPut("short", value, this, 64)
    }

    /**
     * Specifies the Macintosh descender value for the font. This number is typically less than zero. It measures the signed displacement from the base line of the lowest descender in the Macintosh character set.
     * @type {Integer}
     */
    fwdMacDescender {
        get => NumGet(this, 66, "short")
        set => NumPut("short", value, this, 66)
    }

    /**
     * Specifies the Macintosh line gap for the font. The suggested Macintosh interline spacing is equal to <b>fwdMacLineGap</b> + <b>fwdMacAscender</b> − <b>fwdMacDescender</b>.
     * @type {Integer}
     */
    fwdMacLineGap {
        get => NumGet(this, 68, "short")
        set => NumPut("short", value, this, 68)
    }

    /**
     * Specifies the typographic ascender value for the font.
     * @type {Integer}
     */
    fwdTypoAscender {
        get => NumGet(this, 70, "short")
        set => NumPut("short", value, this, 70)
    }

    /**
     * Specifies the typographic descender value for the font. This value specifies the signed displacement of the lowest descender from the baseline.
     * @type {Integer}
     */
    fwdTypoDescender {
        get => NumGet(this, 72, "short")
        set => NumPut("short", value, this, 72)
    }

    /**
     * Specifies the typographic line gap for the font.
     * @type {Integer}
     */
    fwdTypoLineGap {
        get => NumGet(this, 74, "short")
        set => NumPut("short", value, this, 74)
    }

    /**
     * Specifies the arithmetic average of the width of all of the 26 lower case letters 'a' through 'z' of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, then this member should be set equal to the weighted average of all glyphs in the font.
     * @type {Integer}
     */
    fwdAveCharWidth {
        get => NumGet(this, 76, "short")
        set => NumPut("short", value, this, 76)
    }

    /**
     * Specifies the maximum character increment of all glyphs in the font.
     * @type {Integer}
     */
    fwdMaxCharInc {
        get => NumGet(this, 78, "short")
        set => NumPut("short", value, this, 78)
    }

    /**
     * Specifies the height of the optical line describing the top of the uppercase 'H' in font units (FUnits). This might not be the same as the measured height of the uppercase 'H.' If this information does not exist, <b>fwdCapHeight</b> should be set to zero, which indicates that it is undefined.
     * @type {Integer}
     */
    fwdCapHeight {
        get => NumGet(this, 80, "short")
        set => NumPut("short", value, this, 80)
    }

    /**
     * Specifies the height of the optical line describing the height of the lowercase 'x' in font units. This might not be the same as the measured height of the lowercase 'x.' A value of zero indicates that this member is undefined.
     * @type {Integer}
     */
    fwdXHeight {
        get => NumGet(this, 82, "short")
        set => NumPut("short", value, this, 82)
    }

    /**
     * Specifies the suggested character width (the size along the baseline direction) of the subscript font.
     * @type {Integer}
     */
    fwdSubscriptXSize {
        get => NumGet(this, 84, "short")
        set => NumPut("short", value, this, 84)
    }

    /**
     * Specifies the suggested character height (the size along the ascender direction) of the subscript font.
     * @type {Integer}
     */
    fwdSubscriptYSize {
        get => NumGet(this, 86, "short")
        set => NumPut("short", value, this, 86)
    }

    /**
     * Specifies the suggested offset in the baseline direction of the subscript character. The offset is with respect to the character origin of the base character.
     * @type {Integer}
     */
    fwdSubscriptXOffset {
        get => NumGet(this, 88, "short")
        set => NumPut("short", value, this, 88)
    }

    /**
     * Specifies the suggested offset in the baseline direction of the subscript character. The offset is taken from the character origin of the base character.
     * @type {Integer}
     */
    fwdSubscriptYOffset {
        get => NumGet(this, 90, "short")
        set => NumPut("short", value, this, 90)
    }

    /**
     * Specifies the suggested character width (the size along the baseline direction) of the superscript font.
     * @type {Integer}
     */
    fwdSuperscriptXSize {
        get => NumGet(this, 92, "short")
        set => NumPut("short", value, this, 92)
    }

    /**
     * Specifies the suggested character height (the size along the ascender direction) of the superscript font.
     * @type {Integer}
     */
    fwdSuperscriptYSize {
        get => NumGet(this, 94, "short")
        set => NumPut("short", value, this, 94)
    }

    /**
     * Specifies the suggested offset in the baseline direction of the superscript character. The offset is taken from the character origin of the base character.
     * @type {Integer}
     */
    fwdSuperscriptXOffset {
        get => NumGet(this, 96, "short")
        set => NumPut("short", value, this, 96)
    }

    /**
     * Specifies the suggested offset in the baseline direction of the superscript character. The offset is taken from the character origin of the base character.
     * @type {Integer}
     */
    fwdSuperscriptYOffset {
        get => NumGet(this, 98, "short")
        set => NumPut("short", value, this, 98)
    }

    /**
     * Specifies the suggested width of the underscore bar, in font units.
     * @type {Integer}
     */
    fwdUnderscoreSize {
        get => NumGet(this, 100, "short")
        set => NumPut("short", value, this, 100)
    }

    /**
     * Specifies the suggested displacement, in font units, from the base line to the middle of the underscore bar.
     * @type {Integer}
     */
    fwdUnderscorePosition {
        get => NumGet(this, 102, "short")
        set => NumPut("short", value, this, 102)
    }

    /**
     * Specifies the suggested width of the strike-out bar, in font coordinates.
     * @type {Integer}
     */
    fwdStrikeoutSize {
        get => NumGet(this, 104, "short")
        set => NumPut("short", value, this, 104)
    }

    /**
     * Specifies the suggested displacement of the middle of the strikeout bar from the baseline.
     * @type {Integer}
     */
    fwdStrikeoutPosition {
        get => NumGet(this, 106, "short")
        set => NumPut("short", value, this, 106)
    }

    /**
     * Specifies the lowest supported character in the code page specified in <b>jWinCharSet</b>. This field is provided for Windows 3.1 compatibility.
     * @type {Integer}
     */
    chFirstChar {
        get => NumGet(this, 108, "char")
        set => NumPut("char", value, this, 108)
    }

    /**
     * Specifies the highest supported character in the code page specified in <b>jWinCharSet</b>. This field is provided for Windows 3.1 compatibility.
     * @type {Integer}
     */
    chLastChar {
        get => NumGet(this, 109, "char")
        set => NumPut("char", value, this, 109)
    }

    /**
     * Specifies the default character in the code page specified in <b>jWinCharSet</b>. This field is provided for Windows 3.1 compatibility.
     * @type {Integer}
     */
    chDefaultChar {
        get => NumGet(this, 110, "char")
        set => NumPut("char", value, this, 110)
    }

    /**
     * Specifies the break character in the code page specified in <b>jWinCharSet</b>. This field is provided for Windows 3.1 compatibility.
     * @type {Integer}
     */
    chBreakChar {
        get => NumGet(this, 111, "char")
        set => NumPut("char", value, this, 111)
    }

    /**
     * Specifies the supported character with the smallest Unicode character code.
     * @type {Integer}
     */
    wcFirstChar {
        get => NumGet(this, 112, "char")
        set => NumPut("char", value, this, 112)
    }

    /**
     * Specifies the supported character with the largest Unicode character code.
     * @type {Integer}
     */
    wcLastChar {
        get => NumGet(this, 114, "char")
        set => NumPut("char", value, this, 114)
    }

    /**
     * Specifies the character to be substituted when an application requests a character that is not supported by the font.
     * @type {Integer}
     */
    wcDefaultChar {
        get => NumGet(this, 116, "char")
        set => NumPut("char", value, this, 116)
    }

    /**
     * Specifies the code point of the space character or its equivalent.
     * @type {Integer}
     */
    wcBreakChar {
        get => NumGet(this, 118, "char")
        set => NumPut("char", value, this, 118)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the intended writing direction of this font. For example, a typical Latin font specifies a value of (1,0).
     * @type {POINTL}
     */
    ptlBaseline{
        get {
            if(!this.HasProp("__ptlBaseline"))
                this.__ptlBaseline := POINTL(120, this)
            return this.__ptlBaseline
        }
    }

    /**
     * Specifies a POINTL structure that contains the aspect ratio of the pixel centers for which the bitmap font was designed. This value is used only by bitmap fonts.
     * @type {POINTL}
     */
    ptlAspect{
        get {
            if(!this.HasProp("__ptlAspect"))
                this.__ptlAspect := POINTL(128, this)
            return this.__ptlAspect
        }
    }

    /**
     * Specifies a POINTL structure that contains the direction of the ascender direction of the font. For example, the value for a nonitalicized Latin font is (0,1) while an italicized Latin font might specify a value of (2,5).
     * @type {POINTL}
     */
    ptlCaret{
        get {
            if(!this.HasProp("__ptlCaret"))
                this.__ptlCaret := POINTL(136, this)
            return this.__ptlCaret
        }
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rectl">RECTL</a> structure that describes the bounding box of all glyphs in the font in design space.
     * @type {RECTL}
     */
    rclFontBox{
        get {
            if(!this.HasProp("__rclFontBox"))
                this.__rclFontBox := RECTL(144, this)
            return this.__rclFontBox
        }
    }

    /**
     * Specifies a four character identifier for the font vendor. Identifiers are documented in the Microsoft TrueType specification.
     * @type {Array<Byte>}
     */
    achVendId{
        get {
            if(!this.HasProp("__achVendIdProxyArray"))
                this.__achVendIdProxyArray := Win32FixedArray(this.ptr + 160, 4, Primitive, "char")
            return this.__achVendIdProxyArray
        }
    }

    /**
     * Specifies the number of kerning pairs associated with this font.
     * @type {Integer}
     */
    cKerningPairs {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Specifies the manner in which to interpret the panose number. This number should be set to FM_PANOSE_CULTURE_LATIN for Latin-based fonts. See the Microsoft Window SDK documentation for information about the PANOSE structure.
     * @type {Integer}
     */
    ulPanoseCulture {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Is an array of 10 bytes used to describe the visual characteristics of a given typeface. These characteristics are then used to associate the font with other fonts of similar appearance having different names. See the Window SDK documentation for information about the PANOSE structure.
     * @type {PANOSE}
     */
    panose{
        get {
            if(!this.HasProp("__panose"))
                this.__panose := PANOSE(176, this)
            return this.__panose
        }
    }

    /**
     * <i>This member is defined only if the _WIN64 constant is defined</i>. Its only purpose is to ensure that this structure is aligned correctly under the Itanium architecture.
     * @type {Pointer<Void>}
     */
    Align {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }
}
