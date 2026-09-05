#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the nature of the change to an event object.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/ne-eventsys-eoc_changetype
 * @namespace Windows.Win32.System.Com.Events
 */
class EOC_ChangeType extends Win32Enum {

    /**
     * A new object was added.
     * Native name: EOC_NewObject
     * @type {Integer (Int32)}
     */
    static NewObject => 0

    /**
     * An existing object was modified.
     * Native name: EOC_ModifiedObject
     * @type {Integer (Int32)}
     */
    static ModifiedObject => 1

    /**
     * An existing object was deleted.
     * Native name: EOC_DeletedObject
     * @type {Integer (Int32)}
     */
    static DeletedObject => 2
}
