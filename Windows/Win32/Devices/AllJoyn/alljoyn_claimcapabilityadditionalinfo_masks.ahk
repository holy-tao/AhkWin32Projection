#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_claimcapabilityadditionalinfo_masks extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PASSWORD_GENERATED_BY_SECURITY_MANAGER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PASSWORD_GENERATED_BY_APPLICATION => 2
}
