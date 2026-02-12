#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentControl.ahk
#Include .\IPivotItem.ahk
#Include .\IPivotItemFactory.ahk
#Include .\IPivotItemStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the container for an item in a [Pivot](pivot.md) control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotitem
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PivotItem extends ContentControl {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotItem.IID

    /**
     * Identifies the [Header](pivotitem_header.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotitem.headerproperty
     * @type {DependencyProperty} 
     */
    static HeaderProperty {
        get => PivotItem.get_HeaderProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {PivotItem} 
     */
    static CreateInstance() {
        if (!PivotItem.HasProp("__IPivotItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PivotItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotItemFactory.IID)
            PivotItem.__IPivotItemFactory := IPivotItemFactory(factoryPtr)
        }

        return PivotItem.__IPivotItemFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeaderProperty() {
        if (!PivotItem.HasProp("__IPivotItemStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PivotItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotItemStatics.IID)
            PivotItem.__IPivotItemStatics := IPivotItemStatics(factoryPtr)
        }

        return PivotItem.__IPivotItemStatics.get_HeaderProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the header for the [PivotItem](pivotitem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotitem.header
     * @type {IInspectable} 
     */
    Header {
        get => this.get_Header()
        set => this.put_Header(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Header() {
        if (!this.HasProp("__IPivotItem")) {
            if ((queryResult := this.QueryInterface(IPivotItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivotItem := IPivotItem(outPtr)
        }

        return this.__IPivotItem.get_Header()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Header(value) {
        if (!this.HasProp("__IPivotItem")) {
            if ((queryResult := this.QueryInterface(IPivotItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivotItem := IPivotItem(outPtr)
        }

        return this.__IPivotItem.put_Header(value)
    }

;@endregion Instance Methods
}
