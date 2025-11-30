#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class DIINSTALLDEVICE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_SHOWSEARCHUI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_NOFINISHINSTALLUI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_INSTALLNULLDRIVER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_INSTALLCOPYINFDRIVERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIIDFLAG_BITS => 15
}
