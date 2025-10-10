#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifiers for properties of the Sepia effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_2/ne-d2d1effects_2-d2d1_sepia_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SEPIA_PROP{

    /**
     * The D2D1_SEPIA_PROP_INTENSITY property is a float value indicating the intesity of the sepia effect. The allowed range is 0.0 to 1.0.  The default value is 0.5.
     * @type {Integer (Int32)}
     */
    static D2D1_SEPIA_PROP_INTENSITY => 0

    /**
     * The D2D1_SEPIA_PROP_ALPHA_MODE property is a <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a> enumeration value indicating the alpha mode of the input file.
 *           See the About Alpha Modes section of the <a href="https://docs.microsoft.com/windows/desktop/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel Formats and Alpha Modes</a> topic for additional information..  
 *           The default value is D2D1_ALPHA_MODE_PREMULTIPLIED.
     * @type {Integer (Int32)}
     */
    static D2D1_SEPIA_PROP_ALPHA_MODE => 1
}
