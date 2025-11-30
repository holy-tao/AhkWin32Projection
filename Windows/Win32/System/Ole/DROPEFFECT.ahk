#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/com/dropeffect-constants
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class DROPEFFECT extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static DROPEFFECT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DROPEFFECT_COPY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DROPEFFECT_MOVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DROPEFFECT_LINK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DROPEFFECT_SCROLL => 2147483648
}
