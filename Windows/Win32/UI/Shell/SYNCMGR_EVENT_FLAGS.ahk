#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies flags for a synchronization event.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_event_flags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGR_EVENT_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags specified.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EF_NONE => 0

    /**
     * Same as <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EF_NONE</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EF_VALID => 0
}
