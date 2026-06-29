#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DWRITE_FONT_FEATURE.ahk" { DWRITE_FONT_FEATURE }

/**
 * Contains a set of typographic features to be applied during text shaping.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_typographic_features
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TYPOGRAPHIC_FEATURES {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ns-dwrite-dwrite_font_feature">DWRITE_FONT_FEATURE</a>*</b>
     * 
     * A pointer to a structure that specifies properties used to identify and execute typographic features in the font.
     */
    features : DWRITE_FONT_FEATURE.Ptr

    /**
     * Type: <b>UINT32</b>
     * 
     * A value that indicates the number of features being applied to a font face.
     */
    featureCount : UInt32

}
