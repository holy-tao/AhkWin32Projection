#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class OEM_SOURCE_MEDIA_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SPOST_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SPOST_PATH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SPOST_URL => 2
}
