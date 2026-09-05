#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the types of service notifications sent by the NapAgent service.
 * @see https://learn.microsoft.com/windows/win32/api/naptypes/ne-naptypes-napnotifytype
 * @namespace Windows.Win32.Security.NetworkAccessProtection
 */
class NapNotifyType extends Win32Enum {

    /**
     * Not used.
     * Native name: napNotifyTypeUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * NapAgent service state change notifications. 
     * 
     * A notification of type <b>napNotifyTypeServiceState</b> is sent whenever the NapAgent service stops or starts.
     * Native name: napNotifyTypeServiceState
     * @type {Integer (Int32)}
     */
    static ServiceState => 1

    /**
     * Quarantine state change notifications. 
     * 
     * A notification of type <b>napNotifyTypeQuarState</b>  is sent whenever the isolation state changes. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/naptypes/ne-naptypes-isolationstate">IsolationState</a>.
     * Native name: napNotifyTypeQuarState
     * @type {Integer (Int32)}
     */
    static QuarState => 2
}
