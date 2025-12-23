#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETWORK_UPGRADE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WIN16_UPGRADE => 16

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WIN95_UPGRADE => 32

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_WKS_UPGRADE => 64

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_SVR_UPGRADE => 128

    /**
     * @type {Integer (Int32)}
     */
    static NSF_WINNT_SBS_UPGRADE => 256

    /**
     * @type {Integer (Int32)}
     */
    static NSF_COMPONENT_UPDATE => 512
}
