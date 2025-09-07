#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Font property used for filtering font sets and building a font set with explicit properties.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_property
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_FONT_PROPERTY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies the requested font property, such as DWRITE_FONT_PROPERTY_ID_FAMILY_NAME.
     * @type {Integer}
     */
    propertyId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the value, such as "Segoe UI".
     * @type {PWSTR}
     */
    propertyValue{
        get {
            if(!this.HasProp("__propertyValue"))
                this.__propertyValue := PWSTR(this.ptr + 8)
            return this.__propertyValue
        }
    }

    /**
     * Specifies the locale to use, such as "en-US". Simply leave this empty when used
     *           with the font set filtering functions, as they will find a match regardless of
     *           language. For passing to AddFontFaceReference, the localeName specifies the language
     *           of the property value.
     * @type {PWSTR}
     */
    localeName{
        get {
            if(!this.HasProp("__localeName"))
                this.__localeName := PWSTR(this.ptr + 16)
            return this.__localeName
        }
    }
}
