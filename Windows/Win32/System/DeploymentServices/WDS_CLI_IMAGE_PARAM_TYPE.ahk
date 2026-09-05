#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
class WDS_CLI_IMAGE_PARAM_TYPE extends Win32Enum {

    /**
     * Native name: WDS_CLI_IMAGE_PARAM_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: WDS_CLI_IMAGE_PARAM_SPARSE_FILE
     * @type {Integer (Int32)}
     */
    static SPARSE_FILE => 1

    /**
     * Native name: WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES
     * @type {Integer (Int32)}
     */
    static SUPPORTED_FIRMWARES => 2
}
