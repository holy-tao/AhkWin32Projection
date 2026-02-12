#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AttachableInputObject.ahk
#Include .\IInputActivationListener.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\InputActivationListener.ahk
#Include .\InputActivationListenerActivationChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the ability to access and observe changes to the activation state of a window, view, or other visual element.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inputactivationlistener
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class InputActivationListener extends AttachableInputObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInputActivationListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInputActivationListener.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the activation state of the window, view, or other visual element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inputactivationlistener.state
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Occurs when the window, view, or other visual element completes transition to a new activation state.
     * @type {TypedEventHandler<InputActivationListener, InputActivationListenerActivationChangedEventArgs>}
    */
    OnInputActivationChanged {
        get {
            if(!this.HasProp("__OnInputActivationChanged")){
                this.__OnInputActivationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{27256541-ca03-5192-bb2e-8ef1daf0bdeb}"),
                    InputActivationListener,
                    InputActivationListenerActivationChangedEventArgs
                )
                this.__OnInputActivationChangedToken := this.add_InputActivationChanged(this.__OnInputActivationChanged.iface)
            }
            return this.__OnInputActivationChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInputActivationChangedToken")) {
            this.remove_InputActivationChanged(this.__OnInputActivationChangedToken)
            this.__OnInputActivationChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_State() {
        if (!this.HasProp("__IInputActivationListener")) {
            if ((queryResult := this.QueryInterface(IInputActivationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputActivationListener := IInputActivationListener(outPtr)
        }

        return this.__IInputActivationListener.get_State()
    }

    /**
     * 
     * @param {TypedEventHandler<InputActivationListener, InputActivationListenerActivationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputActivationChanged(handler) {
        if (!this.HasProp("__IInputActivationListener")) {
            if ((queryResult := this.QueryInterface(IInputActivationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputActivationListener := IInputActivationListener(outPtr)
        }

        return this.__IInputActivationListener.add_InputActivationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InputActivationChanged(token) {
        if (!this.HasProp("__IInputActivationListener")) {
            if ((queryResult := this.QueryInterface(IInputActivationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInputActivationListener := IInputActivationListener(outPtr)
        }

        return this.__IInputActivationListener.remove_InputActivationChanged(token)
    }

;@endregion Instance Methods
}
