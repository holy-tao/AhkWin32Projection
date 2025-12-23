#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWPM_SUBSCRIPTION_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE => 2
}
