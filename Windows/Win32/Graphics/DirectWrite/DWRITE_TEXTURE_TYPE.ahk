#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies a type of alpha texture.
 * @remarks
 * An alpha texture is a bitmap of alpha values, each representing opacity of a pixel or subpixel.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_texture_type
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_TEXTURE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies an alpha texture for aliased text rendering (that is,  each pixel is either fully opaque or fully transparent), with one byte per pixel.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXTURE_ALIASED_1x1 => 0

    /**
     * Specifies an alpha texture for ClearType text rendering, with three bytes per pixel in the horizontal dimension and one byte per pixel in the vertical dimension.
     * @type {Integer (Int32)}
     */
    static DWRITE_TEXTURE_CLEARTYPE_3x1 => 1
}
