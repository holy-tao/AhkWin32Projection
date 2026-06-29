#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes match criteria. Used by methods of the IKnownFolderManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fffp_mode
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FFFP_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Exact match.
     * @type {Integer (Int32)}
     */
    static FFFP_EXACTMATCH => 0

    /**
     * Nearest parent match.
     * @type {Integer (Int32)}
     */
    static FFFP_NEARESTPARENTMATCH => 1
}
