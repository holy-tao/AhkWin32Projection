#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of Windows Imaging Component (WIC) component.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wiccomponenttype
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICComponentType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A WIC decoder.
     * @type {Integer (Int32)}
     */
    static WICDecoder => 1

    /**
     * A WIC encoder.
     * @type {Integer (Int32)}
     */
    static WICEncoder => 2

    /**
     * A WIC pixel converter.
     * @type {Integer (Int32)}
     */
    static WICPixelFormatConverter => 4

    /**
     * A WIC metadata reader.
     * @type {Integer (Int32)}
     */
    static WICMetadataReader => 8

    /**
     * A WIC metadata writer.
     * @type {Integer (Int32)}
     */
    static WICMetadataWriter => 16

    /**
     * A WIC pixel format.
     * @type {Integer (Int32)}
     */
    static WICPixelFormat => 32

    /**
     * All WIC components.
     * @type {Integer (Int32)}
     */
    static WICAllComponents => 63
}
