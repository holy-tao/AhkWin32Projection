#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class NL_BANDWIDTH_FLAG extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NlbwDisabled => 0

    /**
     * @type {Integer (Int32)}
     */
    static NlbwEnabled => 1

    /**
     * @type {Integer (Int32)}
     */
    static NlbwUnchanged => -1
}
