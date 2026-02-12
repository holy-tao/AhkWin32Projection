#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowActivatedEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the windows activation state information returned by the [CoreWindow.Activated](corewindow_activated.md) event.
 * @remarks
 * This object is returned by a delegate registered for the [CoreWindow.Activated](corewindow_activated.md) event.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.windowactivatedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class WindowActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the activation state of the window at the time the [Activated](corewindow_activated.md) event was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.windowactivatedeventargs.windowactivationstate
     * @type {Integer} 
     */
    WindowActivationState {
        get => this.get_WindowActivationState()
    }

    /**
     * Specifies the property that gets or sets whether the window activation event was handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.windowactivatedeventargs.handled
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
     * @returns {Integer} 
     */
    get_WindowActivationState() {
        if (!this.HasProp("__IWindowActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowActivatedEventArgs := IWindowActivatedEventArgs(outPtr)
        }

        return this.__IWindowActivatedEventArgs.get_WindowActivationState()
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
