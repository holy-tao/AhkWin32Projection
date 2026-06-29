#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a dialog box that might exist in a Video for Windows capture driver.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vfwcapturedialogs
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VfwCaptureDialogs {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Video source dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Source => 1

    /**
     * Video format dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Format => 2

    /**
     * Video display dialog box.
     * @type {Integer (Int32)}
     */
    static VfwCaptureDialog_Display => 4
}
