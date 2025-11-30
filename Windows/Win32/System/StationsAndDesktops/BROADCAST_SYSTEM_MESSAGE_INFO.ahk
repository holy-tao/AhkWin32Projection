#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.StationsAndDesktops
 * @version v4.0.30319
 */
class BROADCAST_SYSTEM_MESSAGE_INFO extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_ALLCOMPONENTS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_ALLDESKTOPS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static BSM_APPLICATIONS => 8
}
