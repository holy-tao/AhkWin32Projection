#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies decode options.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicdecodeoptions
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICDecodeOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Cache metadata when needed.
     * @type {Integer (Int32)}
     */
    static WICDecodeMetadataCacheOnDemand => 0

    /**
     * Cache metadata when decoder is loaded.
     * @type {Integer (Int32)}
     */
    static WICDecodeMetadataCacheOnLoad => 1
}
