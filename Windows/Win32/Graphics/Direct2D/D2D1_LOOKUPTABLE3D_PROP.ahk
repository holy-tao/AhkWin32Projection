#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for the properties of the 3D Lookup Table effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_lookuptable3d_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_LOOKUPTABLE3D_PROP extends Win32Enum{

    /**
     * The D2D1_LOOKUPTABLE3D_PROP_LUT property is a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_3/nn-d2d1_3-id2d1lookuptable3d">ID2D1LookupTable3D</a> object.  The default value is null.
     * @type {Integer (Int32)}
     */
    static D2D1_LOOKUPTABLE3D_PROP_LUT => 0

    /**
     * The D2D1_LOOKUPTABLE3D_PROP_ALPHA_MODE property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a> value indicating the alpha mode of the input file.
     *           See the About Alpha Modes section of the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a> topic for additional information.
     * @type {Integer (Int32)}
     */
    static D2D1_LOOKUPTABLE3D_PROP_ALPHA_MODE => 1
}
