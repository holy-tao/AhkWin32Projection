#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
class SetupFileLogInfo extends Win32Enum {

    /**
     * Native name: SetupFileLogSourceFilename
     * @type {Integer (Int32)}
     */
    static SourceFilename => 0

    /**
     * Native name: SetupFileLogChecksum
     * @type {Integer (Int32)}
     */
    static Checksum => 1

    /**
     * Native name: SetupFileLogDiskTagfile
     * @type {Integer (Int32)}
     */
    static DiskTagfile => 2

    /**
     * Native name: SetupFileLogDiskDescription
     * @type {Integer (Int32)}
     */
    static DiskDescription => 3

    /**
     * Native name: SetupFileLogOtherInfo
     * @type {Integer (Int32)}
     */
    static OtherInfo => 4

    /**
     * Native name: SetupFileLogMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
