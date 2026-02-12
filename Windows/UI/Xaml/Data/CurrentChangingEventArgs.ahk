#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICurrentChangingEventArgs.ahk
#Include .\ICurrentChangingEventArgsFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [CurrentChanging](icollectionview_currentchanging.md) event.
 * @remarks
 * The [CurrentChanging](icollectionview_currentchanging.md) event occurs when the [CurrentItem](icollectionview_currentitem.md) property value changes in an [ICollectionView](icollectionview.md) implementation. The [ICollectionView](icollectionview.md) implementation uses the CurrentChangingEventArgs constructor to specify whether you can cancel the [CurrentItem](icollectionview_currentitem.md) change in a [CurrentChanging](icollectionview_currentchanging.md) event handler. If the [IsCancelable](currentchangingeventargs_iscancelable.md) property value is **true**, you can cancel the [CurrentItem](icollectionview_currentitem.md) change by setting the [Cancel](currentchangingeventargs_cancel.md) property to **true**. Otherwise, you cannot cancel the [CurrentItem](icollectionview_currentitem.md) change.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.currentchangingeventargs
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class CurrentChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICurrentChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICurrentChangingEventArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {CurrentChangingEventArgs} 
     */
    static CreateInstance() {
        if (!CurrentChangingEventArgs.HasProp("__ICurrentChangingEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CurrentChangingEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentChangingEventArgsFactory.IID)
            CurrentChangingEventArgs.__ICurrentChangingEventArgsFactory := ICurrentChangingEventArgsFactory(factoryPtr)
        }

        return CurrentChangingEventArgs.__ICurrentChangingEventArgsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {Boolean} isCancelable 
     * @returns {CurrentChangingEventArgs} 
     */
    static CreateWithCancelableParameter(isCancelable) {
        if (!CurrentChangingEventArgs.HasProp("__ICurrentChangingEventArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.CurrentChangingEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICurrentChangingEventArgsFactory.IID)
            CurrentChangingEventArgs.__ICurrentChangingEventArgsFactory := ICurrentChangingEventArgsFactory(factoryPtr)
        }

        return CurrentChangingEventArgs.__ICurrentChangingEventArgsFactory.CreateWithCancelableParameter(isCancelable, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the [CurrentItem](icollectionview_currentitem.md) change should be canceled.
     * @remarks
     * If the [IsCancelable](currentchangingeventargs_iscancelable.md) property value is **false**, setting the Cancel property to **true** will throw an **InvalidOperationException**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.currentchangingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets a value that indicates whether the [CurrentItem](icollectionview_currentitem.md) change can be canceled.
     * @remarks
     * If the IsCancelable property value is **false**, setting the [Cancel](currentchangingeventargs_cancel.md) property to **true** will throw an InvalidOperationException.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.currentchangingeventargs.iscancelable
     * @type {Boolean} 
     */
    IsCancelable {
        get => this.get_IsCancelable()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ICurrentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentChangingEventArgs := ICurrentChangingEventArgs(outPtr)
        }

        return this.__ICurrentChangingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ICurrentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentChangingEventArgs := ICurrentChangingEventArgs(outPtr)
        }

        return this.__ICurrentChangingEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCancelable() {
        if (!this.HasProp("__ICurrentChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(ICurrentChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICurrentChangingEventArgs := ICurrentChangingEventArgs(outPtr)
        }

        return this.__ICurrentChangingEventArgs.get_IsCancelable()
    }

;@endregion Instance Methods
}
