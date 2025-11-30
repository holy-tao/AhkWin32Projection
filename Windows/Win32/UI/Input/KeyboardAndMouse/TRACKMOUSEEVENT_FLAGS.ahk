#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class TRACKMOUSEEVENT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TME_CANCEL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static TME_HOVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TME_LEAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TME_NONCLIENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TME_QUERY => 1073741824
}
