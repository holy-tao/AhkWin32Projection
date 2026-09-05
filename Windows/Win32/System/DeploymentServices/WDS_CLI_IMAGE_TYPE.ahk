#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
class WDS_CLI_IMAGE_TYPE extends Win32Enum {

    /**
     * Native name: WDS_CLI_IMAGE_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: WDS_CLI_IMAGE_TYPE_WIM
     * @type {Integer (Int32)}
     */
    static WIM => 1

    /**
     * Native name: WDS_CLI_IMAGE_TYPE_VHD
     * @type {Integer (Int32)}
     */
    static VHD => 2

    /**
     * Native name: WDS_CLI_IMAGE_TYPE_VHDX
     * @type {Integer (Int32)}
     */
    static VHDX => 3
}
