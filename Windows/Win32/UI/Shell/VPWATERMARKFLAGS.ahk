#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies watermark flags. Used by IVisualProperties::SetWatermark.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-vpwatermarkflags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct VPWATERMARKFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Default Windows XP behavior.
     * @type {Integer (Int32)}
     */
    static VPWF_DEFAULT => 0

    /**
     * Alpha blend the respective bitmap; assumed 24-bit color + 8-bit alpha.
     * @type {Integer (Int32)}
     */
    static VPWF_ALPHABLEND => 1
}
