#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPivotItemEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Event arguments for dynamically interacting with the [PivotItem](pivotitem.md) before use, allowing for delay load scenarios.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotitemeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PivotItemEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotItemEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotItemEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the pivot item instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotitemeventargs.item
     * @type {PivotItem} 
     */
    Item {
        get => this.get_Item()
        set => this.put_Item(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PivotItemEventArgs](pivotitemeventargs.md) type
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.PivotItemEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PivotItem} 
     */
    get_Item() {
        if (!this.HasProp("__IPivotItemEventArgs")) {
            if ((queryResult := this.QueryInterface(IPivotItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivotItemEventArgs := IPivotItemEventArgs(outPtr)
        }

        return this.__IPivotItemEventArgs.get_Item()
    }

    /**
     * 
     * @param {PivotItem} value 
     * @returns {HRESULT} 
     */
    put_Item(value) {
        if (!this.HasProp("__IPivotItemEventArgs")) {
            if ((queryResult := this.QueryInterface(IPivotItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPivotItemEventArgs := IPivotItemEventArgs(outPtr)
        }

        return this.__IPivotItemEventArgs.put_Item(value)
    }

;@endregion Instance Methods
}
