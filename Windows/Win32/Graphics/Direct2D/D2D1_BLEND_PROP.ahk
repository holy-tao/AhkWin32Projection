#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the Blend effect.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_blend_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BLEND_PROP extends Win32Enum{

    /**
     * The blend mode used for the effect.
     *           
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects/ne-d2d1effects-d2d1_blend_mode">D2D1_BLEND_MODE</a>.
     * 
     * The default value is D2D1_BLEND_MODE_MULTIPLY.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_PROP_MODE => 0
}
