#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
class WDS_CLI_FIRMWARE_TYPE extends Win32Enum {

    /**
     * Native name: WDS_CLI_FIRMWARE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: WDS_CLI_FIRMWARE_BIOS
     * @type {Integer (Int32)}
     */
    static BIOS => 1

    /**
     * Native name: WDS_CLI_FIRMWARE_EFI
     * @type {Integer (Int32)}
     */
    static EFI => 2
}
