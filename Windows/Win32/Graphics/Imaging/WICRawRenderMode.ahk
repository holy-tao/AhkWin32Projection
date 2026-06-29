#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the render intent of the next CopyPixels call.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicrawrendermode
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawRenderMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use speed priority mode.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeDraft => 1

    /**
     * Use normal priority mode. Balance of speed and quality.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeNormal => 2

    /**
     * Use best quality mode.
     * @type {Integer (Int32)}
     */
    static WICRawRenderModeBestQuality => 3
}
