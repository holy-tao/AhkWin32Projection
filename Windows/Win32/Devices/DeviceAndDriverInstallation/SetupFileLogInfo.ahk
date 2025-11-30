#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SetupFileLogInfo extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogSourceFilename => 0

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogChecksum => 1

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogDiskTagfile => 2

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogDiskDescription => 3

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogOtherInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static SetupFileLogMax => 5
}
