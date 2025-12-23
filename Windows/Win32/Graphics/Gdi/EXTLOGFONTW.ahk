#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\LOGFONTW.ahk
#Include .\PANOSE.ahk

/**
 * The EXTLOGFONT structure defines the attributes of a font. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines EXTLOGFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-extlogfontw
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 * @charset Unicode
 */
class EXTLOGFONTW extends Win32Struct
{
    static sizeof => 320

    static packingSize => 4

    /**
     * Specifies some of the attributes of the specified font. This member is a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     * @type {LOGFONTW}
     */
    elfLogFont{
        get {
            if(!this.HasProp("__elfLogFont"))
                this.__elfLogFont := LOGFONTW(0, this)
            return this.__elfLogFont
        }
    }

    /**
     * A unique name for the font (for example, ABCD Font Company TrueType Bold Italic Sans Serif).
     * @type {String}
     */
    elfFullName {
        get => StrGet(this.ptr + 92, 63, "UTF-16")
        set => StrPut(value, this.ptr + 92, 63, "UTF-16")
    }

    /**
     * The style of the font (for example, Bold Italic).
     * @type {String}
     */
    elfStyle {
        get => StrGet(this.ptr + 220, 31, "UTF-16")
        set => StrPut(value, this.ptr + 220, 31, "UTF-16")
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    elfVersion {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * This member only has meaning for hinted fonts. It specifies the point size at which the font is hinted. If set to zero, which is its default value, the font is hinted at the point size corresponding to the <b>lfHeight</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure specified by <b>elfLogFont</b>.
     * @type {Integer}
     */
    elfStyleSize {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * A unique identifier for an enumerated font. This will be filled in by the graphics device interface (GDI) upon font enumeration.
     * @type {Integer}
     */
    elfMatch {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    elfReserved {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * A 4-byte identifier of the font vendor.
     * @type {Array<Byte>}
     */
    elfVendorId{
        get {
            if(!this.HasProp("__elfVendorIdProxyArray"))
                this.__elfVendorIdProxyArray := Win32FixedArray(this.ptr + 300, 4, Primitive, "char")
            return this.__elfVendorIdProxyArray
        }
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    elfCulture {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-panose">PANOSE</a> structure that specifies the shape of the font. If all members of this structure are set to zero, the <b>elfPanose</b> member is ignored by the font mapper.
     * @type {PANOSE}
     */
    elfPanose{
        get {
            if(!this.HasProp("__elfPanose"))
                this.__elfPanose := PANOSE(308, this)
            return this.__elfPanose
        }
    }
}
