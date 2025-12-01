#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * NLM_NETWORK_CLASS enumeration defines a set of flags that specify if a network has been identified.
 * @see https://learn.microsoft.com/windows/win32/api/netlistmgr/ne-netlistmgr-nlm_network_class
 * @namespace Windows.Win32.Networking.NetworkListManager
 * @version v4.0.30319
 */
class NLM_NETWORK_CLASS extends Win32Enum{

    /**
     * The network is being identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_IDENTIFYING => 1

    /**
     * The network has been identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_IDENTIFIED => 2

    /**
     * The network has not been identified.
     * @type {Integer (Int32)}
     */
    static NLM_NETWORK_UNIDENTIFIED => 3
}
