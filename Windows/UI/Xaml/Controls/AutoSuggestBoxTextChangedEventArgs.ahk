#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IAutoSuggestBoxTextChangedEventArgs.ahk
#Include .\IAutoSuggestBoxTextChangedEventArgsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [TextChanged](autosuggestbox_textchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxtextchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class AutoSuggestBoxTextChangedEventArgs extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoSuggestBoxTextChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoSuggestBoxTextChangedEventArgs.IID

    /**
     * Identifies the [Reason](autosuggestboxtextchangedeventargs_reason.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxtextchangedeventargs.reasonproperty
     * @type {DependencyProperty} 
     */
    static ReasonProperty {
        get => AutoSuggestBoxTextChangedEventArgs.get_ReasonProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ReasonProperty() {
        if (!AutoSuggestBoxTextChangedEventArgs.HasProp("__IAutoSuggestBoxTextChangedEventArgsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBoxTextChangedEventArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxTextChangedEventArgsStatics.IID)
            AutoSuggestBoxTextChangedEventArgs.__IAutoSuggestBoxTextChangedEventArgsStatics := IAutoSuggestBoxTextChangedEventArgsStatics(factoryPtr)
        }

        return AutoSuggestBoxTextChangedEventArgs.__IAutoSuggestBoxTextChangedEventArgsStatics.get_ReasonProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates the reason for the text changing in the [AutoSuggestBox](autosuggestbox.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxtextchangedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
        set => this.put_Reason(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AutoSuggestBoxTextChangedEventArgs](autosuggestboxtextchangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.AutoSuggestBoxTextChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IAutoSuggestBoxTextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxTextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxTextChangedEventArgs := IAutoSuggestBoxTextChangedEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxTextChangedEventArgs.get_Reason()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Reason(value) {
        if (!this.HasProp("__IAutoSuggestBoxTextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxTextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxTextChangedEventArgs := IAutoSuggestBoxTextChangedEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxTextChangedEventArgs.put_Reason(value)
    }

    /**
     * Returns a Boolean value indicating if the current value of the [TextBox](textbox.md) is unchanged from the point in time when the [TextChanged](autosuggestbox_textchanged.md) event was raised.
     * @remarks
     * This method is useful in determining if the text has changed since the event was raised, such as after obtaining suggestions from an asynchronous operation, in which time the user may have altered the text. Returns true if the text has not changed, false if it has.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.autosuggestboxtextchangedeventargs.checkcurrent
     */
    CheckCurrent() {
        if (!this.HasProp("__IAutoSuggestBoxTextChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutoSuggestBoxTextChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoSuggestBoxTextChangedEventArgs := IAutoSuggestBoxTextChangedEventArgs(outPtr)
        }

        return this.__IAutoSuggestBoxTextChangedEventArgs.CheckCurrent()
    }

;@endregion Instance Methods
}
