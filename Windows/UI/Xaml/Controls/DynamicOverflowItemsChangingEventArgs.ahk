#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDynamicOverflowItemsChangingEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [CommandBar.DynamicOverflowItemsChanging](commandbar_dynamicoverflowitemschanging.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dynamicoverflowitemschangingeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DynamicOverflowItemsChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDynamicOverflowItemsChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDynamicOverflowItemsChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether items were added to or removed from the [CommandBar](commandbar.md) overflow menu.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dynamicoverflowitemschangingeventargs.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [DynamicOverflowItemsChangingEventArgs](dynamicoverflowitemschangingeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DynamicOverflowItemsChangingEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        if (!this.HasProp("__IDynamicOverflowItemsChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IDynamicOverflowItemsChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDynamicOverflowItemsChangingEventArgs := IDynamicOverflowItemsChangingEventArgs(outPtr)
        }

        return this.__IDynamicOverflowItemsChangingEventArgs.get_Action()
    }

;@endregion Instance Methods
}
