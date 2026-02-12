#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INotifyCollectionChangedEventArgs.ahk
#Include .\INotifyCollectionChangedEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the event data for a [CollectionChanged](inotifycollectionchanged_collectionchanged.md) event.
  * 
  * 
  * 
  * > **.NET**
  * > This class appears as [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class NotifyCollectionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INotifyCollectionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INotifyCollectionChangedEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} action 
     * @param {IBindableVector} newItems 
     * @param {IBindableVector} oldItems 
     * @param {Integer} newIndex 
     * @param {Integer} oldIndex 
     * @returns {NotifyCollectionChangedEventArgs} 
     */
    static CreateInstanceWithAllParameters(action, newItems, oldItems, newIndex, oldIndex) {
        if (!NotifyCollectionChangedEventArgs.HasProp("__INotifyCollectionChangedEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Interop.NotifyCollectionChangedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INotifyCollectionChangedEventArgsFactory.IID)
            NotifyCollectionChangedEventArgs.__INotifyCollectionChangedEventArgsFactory := INotifyCollectionChangedEventArgsFactory(factoryPtr)
        }

        return NotifyCollectionChangedEventArgs.__INotifyCollectionChangedEventArgsFactory.CreateInstanceWithAllParameters(action, newItems, oldItems, newIndex, oldIndex, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the description of the action that caused the event.
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * Gets the items affected by an action.
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs.newitems
     * @type {IBindableVector} 
     */
    NewItems {
        get => this.get_NewItems()
    }

    /**
     * Gets the item affected by a **Replace** or **Remove** action.
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs.olditems
     * @type {IBindableVector} 
     */
    OldItems {
        get => this.get_OldItems()
    }

    /**
     * Gets the index at which the change occurred.
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * 
     * NewStartingIndex will contain the following values, depending on the [Action](notifycollectionchangedeventargs_action.md) being reported in the event data. 
     * 
     * | Action | Value |
     * |---|---|
     * | **Add** | The index of the newly added item. |
     * | **Move** | The index of the newly added item. Because a **Move** can logically be considered a virtual **Remove** followed by a virtual **Add**, the index reported here might already be adjusted for the virtual **Remove**. |
     * | **Remove** | -1 |
     * | **Replace** | The index of the replaced item. |
     * | **Reset** | -1 |
     * 
     * Note that this value is signed. This enables the -1 value cases.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs.newstartingindex
     * @type {Integer} 
     */
    NewStartingIndex {
        get => this.get_NewStartingIndex()
    }

    /**
     * Gets the starting index at which a **Move**, **Remove**, or **Replace** action occurred.
     * @remarks
     * When programming with .NET, this class is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventArgs](/dotnet/api/system.collections.specialized.notifycollectionchangedeventargs?view=dotnet-uwp-10.0&preserve-view=true) class.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventargs.oldstartingindex
     * @type {Integer} 
     */
    OldStartingIndex {
        get => this.get_OldStartingIndex()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        if (!this.HasProp("__INotifyCollectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyCollectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyCollectionChangedEventArgs := INotifyCollectionChangedEventArgs(outPtr)
        }

        return this.__INotifyCollectionChangedEventArgs.get_Action()
    }

    /**
     * 
     * @returns {IBindableVector} 
     */
    get_NewItems() {
        if (!this.HasProp("__INotifyCollectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyCollectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyCollectionChangedEventArgs := INotifyCollectionChangedEventArgs(outPtr)
        }

        return this.__INotifyCollectionChangedEventArgs.get_NewItems()
    }

    /**
     * 
     * @returns {IBindableVector} 
     */
    get_OldItems() {
        if (!this.HasProp("__INotifyCollectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyCollectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyCollectionChangedEventArgs := INotifyCollectionChangedEventArgs(outPtr)
        }

        return this.__INotifyCollectionChangedEventArgs.get_OldItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewStartingIndex() {
        if (!this.HasProp("__INotifyCollectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyCollectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyCollectionChangedEventArgs := INotifyCollectionChangedEventArgs(outPtr)
        }

        return this.__INotifyCollectionChangedEventArgs.get_NewStartingIndex()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OldStartingIndex() {
        if (!this.HasProp("__INotifyCollectionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(INotifyCollectionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INotifyCollectionChangedEventArgs := INotifyCollectionChangedEventArgs(outPtr)
        }

        return this.__INotifyCollectionChangedEventArgs.get_OldStartingIndex()
    }

;@endregion Instance Methods
}
