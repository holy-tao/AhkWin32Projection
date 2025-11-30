#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class PEEK_MESSAGE_REMOVE_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PM_NOREMOVE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PM_REMOVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PM_NOYIELD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_INPUT => 67567616

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_POSTMESSAGE => 9961472

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_PAINT => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PM_QS_SENDMESSAGE => 4194304
}
