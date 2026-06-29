#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DWRITE_FONT_PROPERTY_ID.ahk" { DWRITE_FONT_PROPERTY_ID }

/**
 * Font property used for filtering font sets and building a font set with explicit properties.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/ns-dwrite_3-dwrite_font_property
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_FONT_PROPERTY {
    #StructPack 8

    /**
     * Specifies the requested font property, such as DWRITE_FONT_PROPERTY_ID_FAMILY_NAME.
     */
    propertyId : DWRITE_FONT_PROPERTY_ID

    /**
     * Specifies the value, such as "Segoe UI".
     */
    propertyValue : PWSTR

    /**
     * Specifies the locale to use, such as "en-US". Simply leave this empty when used
     *           with the font set filtering functions, as they will find a match regardless of
     *           language. For passing to AddFontFaceReference, the localeName specifies the language
     *           of the property value.
     */
    localeName : PWSTR

}
