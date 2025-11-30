#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Atlas effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_atlas_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ATLAS_PROP extends Win32Enum{

    /**
     * The portion of the image passed to the next effect.
     *             Type is D2D1_VECTOR_4F.
     *             Default value is (-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX).
     * @type {Integer (Int32)}
     */
    static D2D1_ATLAS_PROP_INPUT_RECT => 0

    /**
     * The maximum size sampled for the output rectangle.
     *             Type is D2D1_VECTOR_4F.
     *             Default value is (-FLT_MAX, -FLT_MAX, FLT_MAX, FLT_MAX).
     * @type {Integer (Int32)}
     */
    static D2D1_ATLAS_PROP_INPUT_PADDING_RECT => 1
}
