#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class SETUP_DI_PROPERTY_CHANGE_SCOPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_FLAG_GLOBAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_FLAG_CONFIGSPECIFIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_FLAG_CONFIGGENERAL => 4
}
