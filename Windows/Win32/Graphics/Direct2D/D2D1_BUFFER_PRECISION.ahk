#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the bit depth of the imaging pipeline in Direct2D.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>   Feature level 9 may or may not support precision types other than 8BPC.
 * </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_buffer_precision
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BUFFER_PRECISION extends Win32Enum{

    /**
     * The buffer precision is not specified.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_UNKNOWN => 0

    /**
     * Use 8-bit normalized integer per channel.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_8BPC_UNORM => 1

    /**
     * Use 8-bit normalized integer standard RGB data per channel.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_8BPC_UNORM_SRGB => 2

    /**
     * Use 16-bit normalized integer per channel.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_16BPC_UNORM => 3

    /**
     * Use 16-bit floats per channel.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_16BPC_FLOAT => 4

    /**
     * Use 32-bit floats per channel.
     * @type {Integer (Int32)}
     */
    static D2D1_BUFFER_PRECISION_32BPC_FLOAT => 5
}
