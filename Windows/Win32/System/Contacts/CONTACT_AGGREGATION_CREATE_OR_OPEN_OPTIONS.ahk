#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 */
class CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static CA_CREATE_LOCAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static CA_CREATE_EXTERNAL => 1
}
