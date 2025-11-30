#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_FILE_OPERATION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOP_DELETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILEOP_COPY => 0
}
