#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWPM_SUBSCRIPTION_FLAGS extends Win32Enum {

    /**
     * Native name: FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_ADD
     * @type {Integer (UInt32)}
     */
    static FLAG_NOTIFY_ON_ADD => 1

    /**
     * Native name: FWPM_SUBSCRIPTION_FLAG_NOTIFY_ON_DELETE
     * @type {Integer (UInt32)}
     */
    static FLAG_NOTIFY_ON_DELETE => 2
}
