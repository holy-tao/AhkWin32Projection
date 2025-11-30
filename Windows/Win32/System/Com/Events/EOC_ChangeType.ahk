#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the nature of the change to an event object.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/ne-eventsys-eoc_changetype
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class EOC_ChangeType extends Win32Enum{

    /**
     * A new object was added.
     * @type {Integer (Int32)}
     */
    static EOC_NewObject => 0

    /**
     * An existing object was modified.
     * @type {Integer (Int32)}
     */
    static EOC_ModifiedObject => 1

    /**
     * An existing object was deleted.
     * @type {Integer (Int32)}
     */
    static EOC_DeletedObject => 2
}
