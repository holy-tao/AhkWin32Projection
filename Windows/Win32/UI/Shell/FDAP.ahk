#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies list placement.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fdap
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FDAP {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The place is added to the bottom of the default list.
     * @type {Integer (Int32)}
     */
    static FDAP_BOTTOM => 0

    /**
     * The place is added to the top of the default list.
     * @type {Integer (Int32)}
     */
    static FDAP_TOP => 1
}
