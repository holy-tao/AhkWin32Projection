#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_CLI_IMAGE_PARAM_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_IMAGE_PARAM_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_IMAGE_PARAM_SPARSE_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_IMAGE_PARAM_SUPPORTED_FIRMWARES => 2
}
