#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @version v4.0.30319
 */
class DISCDLGSTRUCT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DISC_UPDATE_PROFILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DISC_NO_FORCE => 64
}
