#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a set of typographic features to be applied during text shaping.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_TYPOGRAPHIC_FEATURES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a>*</b>
     * 
     * A pointer to a structure that specifies properties used to identify and execute typographic features in the font.
     * @type {Pointer<DWRITE_FONT_FEATURE>}
     */
    features {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT32</b>
     * 
     * A value that indicates the number of features being applied to a font face.
     * @type {Integer}
     */
    featureCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
