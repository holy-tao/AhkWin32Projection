#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACTIVATIONTYPE enumeration (objidl.h) specifies the kind of activation for an activatable class.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-activationtype
 * @namespace Windows.Win32.System.WinRT
 */
class ACTIVATIONTYPE extends Win32Enum {

    /**
     * Native name: ACTIVATIONTYPE_UNCATEGORIZED
     * @type {Integer (Int32)}
     */
    static UNCATEGORIZED => 0

    /**
     * Native name: ACTIVATIONTYPE_FROM_MONIKER
     * @type {Integer (Int32)}
     */
    static FROM_MONIKER => 1

    /**
     * Native name: ACTIVATIONTYPE_FROM_DATA
     * @type {Integer (Int32)}
     */
    static FROM_DATA => 2

    /**
     * Native name: ACTIVATIONTYPE_FROM_STORAGE
     * @type {Integer (Int32)}
     */
    static FROM_STORAGE => 4

    /**
     * Native name: ACTIVATIONTYPE_FROM_STREAM
     * @type {Integer (Int32)}
     */
    static FROM_STREAM => 8

    /**
     * Native name: ACTIVATIONTYPE_FROM_FILE
     * @type {Integer (Int32)}
     */
    static FROM_FILE => 16
}
