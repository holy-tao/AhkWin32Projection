#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class ENUM_BINDING_PATHS_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static EBP_ABOVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static EBP_BELOW => 2
}
