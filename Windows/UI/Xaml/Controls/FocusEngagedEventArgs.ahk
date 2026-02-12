#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IFocusEngagedEventArgs.ahk
#Include .\IFocusEngagedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [FocusEngaged](control_focusengaged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.focusengagedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class FocusEngagedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFocusEngagedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFocusEngagedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.focusengagedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_Handled() {
        if (!this.HasProp("__IFocusEngagedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IFocusEngagedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusEngagedEventArgs2 := IFocusEngagedEventArgs2(outPtr)
        }

        return this.__IFocusEngagedEventArgs2.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IFocusEngagedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IFocusEngagedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFocusEngagedEventArgs2 := IFocusEngagedEventArgs2(outPtr)
        }

        return this.__IFocusEngagedEventArgs2.put_Handled(value)
    }

;@endregion Instance Methods
}
