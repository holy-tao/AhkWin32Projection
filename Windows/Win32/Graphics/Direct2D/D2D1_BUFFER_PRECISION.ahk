#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the bit depth of the imaging pipeline in Direct2D.
 * @remarks
 * <div class="alert"><b>Note</b>   Feature level 9 may or may not support precision types other than 8BPC.
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_BUFFER_PRECISION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
