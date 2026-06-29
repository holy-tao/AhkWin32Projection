#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how the Crop effect handles the crop rectangle falling on fractional pixel coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effects/ne-d2d1effects-d2d1_border_mode
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D1_BORDER_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If the crop rectangle falls on fractional pixel coordinates, the effect applies antialiasing which results in a soft edge.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_MODE_SOFT => 0

    /**
     * If the crop rectangle falls on fractional pixel coordinates, the effect clamps which results in a hard edge.
     * @type {Integer (Int32)}
     */
    static D2D1_BORDER_MODE_HARD => 1
}
