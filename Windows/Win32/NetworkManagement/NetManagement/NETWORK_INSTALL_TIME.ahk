#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class NETWORK_INSTALL_TIME extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static NSF_PRIMARYINSTALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static NSF_POSTSYSINSTALL => 2
}
