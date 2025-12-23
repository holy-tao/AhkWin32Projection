#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEMDEVCAPS_DIAL_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DIALOPTION_BILLING => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DIALOPTION_DIALTONE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DIALOPTION_QUIET => 128
}
