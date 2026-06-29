#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SYNCMGRREGISTERFLAGS enumeration values are used in methods of the ISyncMgrRegister interface to identify events for which the handler is registered to be notified.
 * @remarks
 * The SYNCMGRREGISTERFLAGS_MASK value can be used to identify valid <b>SYNCMGRREGISTERFLAGS</b> values.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrregisterflags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRREGISTERFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Network connect events.
     * @type {Integer (Int32)}
     */
    static SYNCMGRREGISTERFLAG_CONNECT => 1

    /**
     * Pending network disconnect event.
     * @type {Integer (Int32)}
     */
    static SYNCMGRREGISTERFLAG_PENDINGDISCONNECT => 2

    /**
     * Idle events.
     * @type {Integer (Int32)}
     */
    static SYNCMGRREGISTERFLAG_IDLE => 4
}
