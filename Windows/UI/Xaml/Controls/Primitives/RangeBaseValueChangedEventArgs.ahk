#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\RoutedEventArgs.ahk
#Include .\IRangeBaseValueChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data about a change in range value for the [ValueChanged](rangebase_valuechanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebasevaluechangedeventargs
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class RangeBaseValueChangedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRangeBaseValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRangeBaseValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the previous value of a range value property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebasevaluechangedeventargs.oldvalue
     * @type {Float} 
     */
    OldValue {
        get => this.get_OldValue()
    }

    /**
     * Gets the new value of a range value property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.rangebasevaluechangedeventargs.newvalue
     * @type {Float} 
     */
    NewValue {
        get => this.get_NewValue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OldValue() {
        if (!this.HasProp("__IRangeBaseValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRangeBaseValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBaseValueChangedEventArgs := IRangeBaseValueChangedEventArgs(outPtr)
        }

        return this.__IRangeBaseValueChangedEventArgs.get_OldValue()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NewValue() {
        if (!this.HasProp("__IRangeBaseValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRangeBaseValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeBaseValueChangedEventArgs := IRangeBaseValueChangedEventArgs(outPtr)
        }

        return this.__IRangeBaseValueChangedEventArgs.get_NewValue()
    }

;@endregion Instance Methods
}
