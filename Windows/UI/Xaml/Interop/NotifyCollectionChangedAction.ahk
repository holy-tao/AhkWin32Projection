#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the action that caused a [CollectionChanged](inotifycollectionchanged_collectionchanged.md) event.
  * 
  * 
  * 
  * > **.NET**
  * > This type appears as [System.Collections.Specialized.NotifyCollectionChangedAction](/dotnet/api/system.collections.specialized.notifycollectionchangedaction?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this type is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedAction](/dotnet/api/system.collections.specialized.notifycollectionchangedaction?view=dotnet-uwp-10.0&preserve-view=true) type.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedaction
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class NotifyCollectionChangedAction extends Win32Enum{

    /**
     * One or more items were added to the collection.
     * @type {Integer (Int32)}
     */
    static Add => 0

    /**
     * One or more items were removed from the collection.
     * @type {Integer (Int32)}
     */
    static Remove => 1

    /**
     * One or more items were replaced in the collection.
     * @type {Integer (Int32)}
     */
    static Replace => 2

    /**
     * One or more items were moved within the collection.
     * @type {Integer (Int32)}
     */
    static Move => 3

    /**
     * The content of the collection changed dramatically.
     * @type {Integer (Int32)}
     */
    static Reset => 4
}
