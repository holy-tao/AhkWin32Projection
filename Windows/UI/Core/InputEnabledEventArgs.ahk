#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInputEnabledEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the window input state returned by the [CoreWindow.InputEnabled](corewindow_inputenabled.md) event.
 * @remarks
 * This object is returned by a delegate registered for the [CoreWindow.InputEnabled](corewindow_inputenabled.md) event.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.inputenabledeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class InputEnabledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputEnabledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputEnabledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the window is enabled for input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.inputenabledeventargs.inputenabled
     * @type {Boolean} 
     */
    InputEnabled {
        get => this.get_InputEnabled()
    }

    /**
     * Gets or sets whether the input enable event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.inputenabledeventargs.handled
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
    get_InputEnabled() {
        if (!this.HasProp("__IInputEnabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IInputEnabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputEnabledEventArgs := IInputEnabledEventArgs(outPtr)
        }

        return this.__IInputEnabledEventArgs.get_InputEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
