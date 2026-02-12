#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\INoFocusCandidateFoundEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [NoFocusCandidateFound](../windows.ui.xaml/uielement_nofocuscandidatefound.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.nofocuscandidatefoundeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class NoFocusCandidateFoundEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INoFocusCandidateFoundEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INoFocusCandidateFoundEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the direction that focus moved from element to element within the app UI.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.nofocuscandidatefoundeventargs.direction
     * @type {Integer} 
     */
    Direction {
        get => this.get_Direction()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.nofocuscandidatefoundeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the input device type from which input events are received.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.nofocuscandidatefoundeventargs.inputdevice
     * @type {Integer} 
     */
    InputDevice {
        get => this.get_InputDevice()
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
    get_Direction() {
        if (!this.HasProp("__INoFocusCandidateFoundEventArgs")) {
            if ((queryResult := this.QueryInterface(INoFocusCandidateFoundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoFocusCandidateFoundEventArgs := INoFocusCandidateFoundEventArgs(outPtr)
        }

        return this.__INoFocusCandidateFoundEventArgs.get_Direction()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__INoFocusCandidateFoundEventArgs")) {
            if ((queryResult := this.QueryInterface(INoFocusCandidateFoundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoFocusCandidateFoundEventArgs := INoFocusCandidateFoundEventArgs(outPtr)
        }

        return this.__INoFocusCandidateFoundEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__INoFocusCandidateFoundEventArgs")) {
            if ((queryResult := this.QueryInterface(INoFocusCandidateFoundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoFocusCandidateFoundEventArgs := INoFocusCandidateFoundEventArgs(outPtr)
        }

        return this.__INoFocusCandidateFoundEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDevice() {
        if (!this.HasProp("__INoFocusCandidateFoundEventArgs")) {
            if ((queryResult := this.QueryInterface(INoFocusCandidateFoundEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INoFocusCandidateFoundEventArgs := INoFocusCandidateFoundEventArgs(outPtr)
        }

        return this.__INoFocusCandidateFoundEventArgs.get_InputDevice()
    }

;@endregion Instance Methods
}
