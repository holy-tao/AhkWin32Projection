#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the alpha value, transparency behavior, of a surface.
 * @remarks
 * For more information about alpha mode, see <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 */
export default struct DXGI_ALPHA_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the transparency behavior is not specified.
     * @type {Integer (Int32)}
     */
    static DXGI_ALPHA_MODE_UNSPECIFIED => 0

    /**
     * Indicates that the transparency behavior is premultiplied. Each color is first scaled by the alpha value. The alpha value itself is the same in both straight and premultiplied alpha. Typically, no color channel value is greater than the alpha channel value. If a color channel value in a premultiplied format is greater than the alpha channel, the standard source-over blending math results in an additive blend.
     * @type {Integer (Int32)}
     */
    static DXGI_ALPHA_MODE_PREMULTIPLIED => 1

    /**
     * Indicates that the transparency behavior is not premultiplied. The alpha channel indicates the transparency of the color.
     * @type {Integer (Int32)}
     */
    static DXGI_ALPHA_MODE_STRAIGHT => 2

    /**
     * Indicates to ignore the transparency behavior.
     * @type {Integer (Int32)}
     */
    static DXGI_ALPHA_MODE_IGNORE => 3
}
