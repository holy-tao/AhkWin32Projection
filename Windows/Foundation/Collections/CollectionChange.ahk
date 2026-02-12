#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the action that causes a change to a collection.
 * @remarks
 * There is only one notification per type of change to a collection. For example, if an item is inserted, then only a notification for an insertion is sent to a listener that is subscribed to receive change notifications. Use the [Index](ivectorchangedeventargs_index.md) property of the [IVectorChangedEventArgs](ivectorchangedeventargs.md) interface or the [Key](imapchangedeventargs_1_key.md) property of the [IMapChangedEventArgs<K>](imapchangedeventargs_1.md) interface to determine the location of the change.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.collectionchange
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class CollectionChange extends Win32Enum{

    /**
     * The collection is changed.
     * @type {Integer (Int32)}
     */
    static Reset => 0

    /**
     * An item is added to the collection.
     * @type {Integer (Int32)}
     */
    static ItemInserted => 1

    /**
     * An item is removed from the collection.
     * @type {Integer (Int32)}
     */
    static ItemRemoved => 2

    /**
     * An item is changed in the collection.
     * @type {Integer (Int32)}
     */
    static ItemChanged => 3
}
