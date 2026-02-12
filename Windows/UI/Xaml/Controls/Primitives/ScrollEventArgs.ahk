#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include .\IScrollEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [Scroll](scrollbar_scroll.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrolleventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ScrollEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScrollEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScrollEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new [Value](rangebase_value.md) of the [ScrollBar](scrollbar.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrolleventargs.newvalue
     * @type {Float} 
     */
    NewValue {
        get => this.get_NewValue()
    }

    /**
     * Gets a [ScrollEventType](scrolleventtype.md) describing the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.scrolleventargs.scrolleventtype
     * @type {Integer} 
     */
    ScrollEventType {
        get => this.get_ScrollEventType()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScrollEventArgs](scrolleventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.ScrollEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NewValue() {
        if (!this.HasProp("__IScrollEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollEventArgs := IScrollEventArgs(outPtr)
        }

        return this.__IScrollEventArgs.get_NewValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScrollEventType() {
        if (!this.HasProp("__IScrollEventArgs")) {
            if ((queryResult := this.QueryInterface(IScrollEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollEventArgs := IScrollEventArgs(outPtr)
        }

        return this.__IScrollEventArgs.get_ScrollEventType()
    }

;@endregion Instance Methods
}
