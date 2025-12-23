#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NET_REQUEST_PROVISION_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static NETSETUP_PROVISION_ONLINE_CALLER => 1073741824
}
