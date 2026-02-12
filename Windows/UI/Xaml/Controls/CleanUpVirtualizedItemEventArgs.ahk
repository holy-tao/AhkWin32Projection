#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\ICleanUpVirtualizedItemEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [CleanUpVirtualizedItemEvent](virtualizingstackpanel_cleanupvirtualizeditemevent.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.cleanupvirtualizeditemeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class CleanUpVirtualizedItemEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICleanUpVirtualizedItemEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICleanUpVirtualizedItemEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that represents the original data value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.cleanupvirtualizeditemeventargs.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets an instance of the visual element that represents the data value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.cleanupvirtualizeditemeventargs.uielement
     * @type {UIElement} 
     */
    UIElement {
        get => this.get_UIElement()
    }

    /**
     * Gets or sets a value that indicates whether this item should not be revirtualized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.cleanupvirtualizeditemeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
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
    get_Value() {
        if (!this.HasProp("__ICleanUpVirtualizedItemEventArgs")) {
            if ((queryResult := this.QueryInterface(ICleanUpVirtualizedItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICleanUpVirtualizedItemEventArgs := ICleanUpVirtualizedItemEventArgs(outPtr)
        }

        return this.__ICleanUpVirtualizedItemEventArgs.get_Value()
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_UIElement() {
        if (!this.HasProp("__ICleanUpVirtualizedItemEventArgs")) {
            if ((queryResult := this.QueryInterface(ICleanUpVirtualizedItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICleanUpVirtualizedItemEventArgs := ICleanUpVirtualizedItemEventArgs(outPtr)
        }

        return this.__ICleanUpVirtualizedItemEventArgs.get_UIElement()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__ICleanUpVirtualizedItemEventArgs")) {
            if ((queryResult := this.QueryInterface(ICleanUpVirtualizedItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICleanUpVirtualizedItemEventArgs := ICleanUpVirtualizedItemEventArgs(outPtr)
        }

        return this.__ICleanUpVirtualizedItemEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__ICleanUpVirtualizedItemEventArgs")) {
            if ((queryResult := this.QueryInterface(ICleanUpVirtualizedItemEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICleanUpVirtualizedItemEventArgs := ICleanUpVirtualizedItemEventArgs(outPtr)
        }

        return this.__ICleanUpVirtualizedItemEventArgs.put_Cancel(value)
    }

;@endregion Instance Methods
}
