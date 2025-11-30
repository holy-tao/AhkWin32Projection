#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Saturation effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects/ne-d2d1effects-d2d1_saturation_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SATURATION_PROP extends Win32Enum{

    /**
     * The saturation of the image. You can set the saturation to a value between 0 and 1. If you set it to 1 the output image is fully saturated. 
     *           If you set it to 0 the output image is monochrome. The saturation value is unitless.
     *           
     * 
     * The type is FLOAT.
     * 
     * The default is 0.5f.
     * @type {Integer (Int32)}
     */
    static D2D1_SATURATION_PROP_SATURATION => 0
}
