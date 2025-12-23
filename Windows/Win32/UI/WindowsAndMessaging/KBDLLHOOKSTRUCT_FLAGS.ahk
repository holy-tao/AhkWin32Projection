#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class KBDLLHOOKSTRUCT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_EXTENDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_ALTDOWN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_UP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_INJECTED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LLKHF_LOWER_IL_INJECTED => 2
}
