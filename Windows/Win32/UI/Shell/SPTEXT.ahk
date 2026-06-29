#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of descriptive text being provided to an IActionProgress interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-sptext
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SPTEXT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The text is a high level, short description.
     * @type {Integer (Int32)}
     */
    static SPTEXT_ACTIONDESCRIPTION => 1

    /**
     * The text is a detailed description.
     * @type {Integer (Int32)}
     */
    static SPTEXT_ACTIONDETAIL => 2
}
