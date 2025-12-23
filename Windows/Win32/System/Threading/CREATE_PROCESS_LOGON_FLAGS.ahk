#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class CREATE_PROCESS_LOGON_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_WITH_PROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LOGON_NETCREDENTIALS_ONLY => 2
}
