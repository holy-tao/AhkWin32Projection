#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type that contains the binary information for an image in a Journal note.
 * @see https://learn.microsoft.com/windows/win32/tablet/imagetype-complex-type
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeBitmap => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImageTypeMetafile => 2
}
