#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACTIVATIONTYPE enumeration (objidl.h) specifies the kind of activation for an activatable class.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-activationtype
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class ACTIVATIONTYPE extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_UNCATEGORIZED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_FROM_MONIKER => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_FROM_DATA => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_FROM_STORAGE => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_FROM_STREAM => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ACTIVATIONTYPE_FROM_FILE => 16
}
