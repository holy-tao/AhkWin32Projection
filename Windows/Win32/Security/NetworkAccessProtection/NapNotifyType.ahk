#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Enumerates the types of service notifications sent by the NapAgent service.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-napnotifytype
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
export default struct NapNotifyType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static napNotifyTypeUnknown => 0

    /**
     * NapAgent service state change notifications. 
     * 
     * A notification of type <b>napNotifyTypeServiceState</b> is sent whenever the NapAgent service stops or starts.
     * @type {Integer (Int32)}
     */
    static napNotifyTypeServiceState => 1

    /**
     * Quarantine state change notifications. 
     * 
     * A notification of type <b>napNotifyTypeQuarState</b>  is sent whenever the isolation state changes. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-isolationstate">IsolationState</a>.
     * @type {Integer (Int32)}
     */
    static napNotifyTypeQuarState => 2
}
