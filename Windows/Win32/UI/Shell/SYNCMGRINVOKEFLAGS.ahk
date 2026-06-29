#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SYNCMGRINVOKEFLAGS enumeration value specifies how the Sync Manager is to be invoked in the ISyncMgrSynchronizeInvoke::UpdateItems method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrinvokeflags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRINVOKEFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Immediately start the synchronization without displaying the <b>Choice</b> dialog box.
     * @type {Integer (Int32)}
     */
    static SYNCMGRINVOKE_STARTSYNC => 2

    /**
     * Indicates that the <b>Choice</b> dialog should be minimized by default.
     * @type {Integer (Int32)}
     */
    static SYNCMGRINVOKE_MINIMIZED => 4
}
