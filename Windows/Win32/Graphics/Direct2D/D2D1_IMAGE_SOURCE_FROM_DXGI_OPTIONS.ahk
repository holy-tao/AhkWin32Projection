#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Option flags controlling primary conversion performed by CreateImageSourceFromDxgi, if any.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ne-d2d1_3-d2d1_image_source_from_dxgi_options
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No primary conversion is performed.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_NONE => 0

    /**
     * Low quality primary conversion is performed.
     * @type {Integer (Int32)}
     */
    static D2D1_IMAGE_SOURCE_FROM_DXGI_OPTIONS_LOW_QUALITY_PRIMARY_CONVERSION => 1
}
