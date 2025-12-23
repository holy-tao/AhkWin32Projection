#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_CLI_FIRMWARE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_FIRMWARE_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_FIRMWARE_BIOS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_CLI_FIRMWARE_EFI => 2
}
