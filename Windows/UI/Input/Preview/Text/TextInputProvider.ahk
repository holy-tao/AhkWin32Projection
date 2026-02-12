#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextInputProvider.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\TextInputProvider.ahk
#Include .\FocusEnteredEventArgs.ahk
#Include .\TextBoxInfoChangedEventArgs.ahk
#Include .\TextBoxContentChangedEventArgs.ahk
#Include .\ReconversionRequestedEventArgs.ahk
#Include .\InputDelegationModeChangedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextInputProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextInputProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextInputProvider.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    HasFocusedTextBox {
        get => this.get_HasFocusedTextBox()
    }

    /**
     * @type {TextBoxId} 
     */
    FocusedTextBoxId {
        get => this.get_FocusedTextBoxId()
    }

    /**
     * @type {TextBoxInfo} 
     */
    FocusedTextBoxInfo {
        get => this.get_FocusedTextBoxInfo()
    }

    /**
     * @type {IReference<RECT>} 
     */
    FocusedTextBoxBounds {
        get => this.get_FocusedTextBoxBounds()
    }

    /**
     * @type {IReference<RECT>} 
     */
    SelectionBounds {
        get => this.get_SelectionBounds()
    }

    OnFocusEntered {
        get {
            if(!this.HasProp("__OnFocusEntered")){
                this.__OnFocusEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{da602ecb-4884-5c20-aaf0-6396e84141a4}"),
                    TextInputProvider,
                    FocusEnteredEventArgs
                )
                this.__OnFocusEnteredToken := this.add_FocusEntered(this.__OnFocusEntered.iface)
            }
            return this.__OnFocusEntered
        }
    }

    OnFocusRemoved {
        get {
            if(!this.HasProp("__OnFocusRemoved")){
                this.__OnFocusRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b97b97e2-a03d-57f8-83e0-295b41fc772f}"),
                    TextInputProvider,
                    IInspectable
                )
                this.__OnFocusRemovedToken := this.add_FocusRemoved(this.__OnFocusRemoved.iface)
            }
            return this.__OnFocusRemoved
        }
    }

    OnTextBoxInfoChanged {
        get {
            if(!this.HasProp("__OnTextBoxInfoChanged")){
                this.__OnTextBoxInfoChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8eee49d4-5410-50ca-bc92-a63cefc9f510}"),
                    TextInputProvider,
                    TextBoxInfoChangedEventArgs
                )
                this.__OnTextBoxInfoChangedToken := this.add_TextBoxInfoChanged(this.__OnTextBoxInfoChanged.iface)
            }
            return this.__OnTextBoxInfoChanged
        }
    }

    OnTextBoxContentChanged {
        get {
            if(!this.HasProp("__OnTextBoxContentChanged")){
                this.__OnTextBoxContentChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{e71f949e-b40e-5f14-9a37-8e4e3380b510}"),
                    TextInputProvider,
                    TextBoxContentChangedEventArgs
                )
                this.__OnTextBoxContentChangedToken := this.add_TextBoxContentChanged(this.__OnTextBoxContentChanged.iface)
            }
            return this.__OnTextBoxContentChanged
        }
    }

    OnCompositionTerminated {
        get {
            if(!this.HasProp("__OnCompositionTerminated")){
                this.__OnCompositionTerminated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b97b97e2-a03d-57f8-83e0-295b41fc772f}"),
                    TextInputProvider,
                    IInspectable
                )
                this.__OnCompositionTerminatedToken := this.add_CompositionTerminated(this.__OnCompositionTerminated.iface)
            }
            return this.__OnCompositionTerminated
        }
    }

    OnReconversionRequested {
        get {
            if(!this.HasProp("__OnReconversionRequested")){
                this.__OnReconversionRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{89f1e494-9a28-5e03-82b3-cb54a6e8cfa8}"),
                    TextInputProvider,
                    ReconversionRequestedEventArgs
                )
                this.__OnReconversionRequestedToken := this.add_ReconversionRequested(this.__OnReconversionRequested.iface)
            }
            return this.__OnReconversionRequested
        }
    }

    OnInputDelegationModeChanged {
        get {
            if(!this.HasProp("__OnInputDelegationModeChanged")){
                this.__OnInputDelegationModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{858b18cd-d7f5-52d9-93b5-154d4468d57e}"),
                    TextInputProvider,
                    InputDelegationModeChangedEventArgs
                )
                this.__OnInputDelegationModeChangedToken := this.add_InputDelegationModeChanged(this.__OnInputDelegationModeChanged.iface)
            }
            return this.__OnInputDelegationModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnFocusEnteredToken")) {
            this.remove_FocusEntered(this.__OnFocusEnteredToken)
            this.__OnFocusEntered.iface.Dispose()
        }

        if(this.HasProp("__OnFocusRemovedToken")) {
            this.remove_FocusRemoved(this.__OnFocusRemovedToken)
            this.__OnFocusRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnTextBoxInfoChangedToken")) {
            this.remove_TextBoxInfoChanged(this.__OnTextBoxInfoChangedToken)
            this.__OnTextBoxInfoChanged.iface.Dispose()
        }

        if(this.HasProp("__OnTextBoxContentChangedToken")) {
            this.remove_TextBoxContentChanged(this.__OnTextBoxContentChangedToken)
            this.__OnTextBoxContentChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCompositionTerminatedToken")) {
            this.remove_CompositionTerminated(this.__OnCompositionTerminatedToken)
            this.__OnCompositionTerminated.iface.Dispose()
        }

        if(this.HasProp("__OnReconversionRequestedToken")) {
            this.remove_ReconversionRequested(this.__OnReconversionRequestedToken)
            this.__OnReconversionRequested.iface.Dispose()
        }

        if(this.HasProp("__OnInputDelegationModeChangedToken")) {
            this.remove_InputDelegationModeChanged(this.__OnInputDelegationModeChangedToken)
            this.__OnInputDelegationModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TextInputServiceSubscription} 
     */
    GetSubscription() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.GetSubscription()
    }

    /**
     * 
     * @param {TextInputServiceSubscription} subscription 
     * @returns {HRESULT} 
     */
    SetSubscription(subscription) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.SetSubscription(subscription)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocusedTextBox() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.get_HasFocusedTextBox()
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_FocusedTextBoxId() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.get_FocusedTextBoxId()
    }

    /**
     * 
     * @returns {TextBoxInfo} 
     */
    get_FocusedTextBoxInfo() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.get_FocusedTextBoxInfo()
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_FocusedTextBoxBounds() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.get_FocusedTextBoxBounds()
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionBounds() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.get_SelectionBounds()
    }

    /**
     * 
     * @returns {TextEditSession} 
     */
    CreateEditSession() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.CreateEditSession()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TryStartDelegation() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.TryStartDelegation()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopDelegation() {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.StopDelegation()
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, FocusEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEntered(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_FocusEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusEntered(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_FocusEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_FocusRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusRemoved(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_FocusRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, TextBoxInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxInfoChanged(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_TextBoxInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextBoxInfoChanged(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_TextBoxInfoChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, TextBoxContentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxContentChanged(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_TextBoxContentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextBoxContentChanged(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_TextBoxContentChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionTerminated(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_CompositionTerminated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CompositionTerminated(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_CompositionTerminated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, ReconversionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReconversionRequested(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_ReconversionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReconversionRequested(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_ReconversionRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TextInputProvider, InputDelegationModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InputDelegationModeChanged(handler) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.add_InputDelegationModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InputDelegationModeChanged(token) {
        if (!this.HasProp("__ITextInputProvider")) {
            if ((queryResult := this.QueryInterface(ITextInputProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextInputProvider := ITextInputProvider(outPtr)
        }

        return this.__ITextInputProvider.remove_InputDelegationModeChanged(token)
    }

;@endregion Instance Methods
}
