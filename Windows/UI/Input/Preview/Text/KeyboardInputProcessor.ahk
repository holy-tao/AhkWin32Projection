#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKeyboardInputProcessor.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\KeyboardInputProcessor.ahk
#Include .\KeyEventReceivedEventArgs.ahk
#Include .\FocusEnteredEventArgs.ahk
#Include .\ConversionModeChangedEventArgs.ahk
#Include .\TextBoxInfoChangedEventArgs.ahk
#Include .\TextBoxContentChangedEventArgs.ahk
#Include .\ReconversionRequestedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class KeyboardInputProcessor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyboardInputProcessor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyboardInputProcessor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    InputProfile {
        get => this.get_InputProfile()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

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

    /**
     * @type {Integer} 
     */
    ConversionMode {
        get => this.get_ConversionMode()
        set => this.put_ConversionMode(value)
    }

    OnActivated {
        get {
            if(!this.HasProp("__OnActivated")){
                this.__OnActivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f2171eb7-e800-51cf-a5bf-dbd9e384bca8}"),
                    KeyboardInputProcessor,
                    IInspectable
                )
                this.__OnActivatedToken := this.add_Activated(this.__OnActivated.iface)
            }
            return this.__OnActivated
        }
    }

    OnDeactivated {
        get {
            if(!this.HasProp("__OnDeactivated")){
                this.__OnDeactivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f2171eb7-e800-51cf-a5bf-dbd9e384bca8}"),
                    KeyboardInputProcessor,
                    IInspectable
                )
                this.__OnDeactivatedToken := this.add_Deactivated(this.__OnDeactivated.iface)
            }
            return this.__OnDeactivated
        }
    }

    OnKeyEventReceived {
        get {
            if(!this.HasProp("__OnKeyEventReceived")){
                this.__OnKeyEventReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ae1de89e-6bae-5995-94c2-a62e2fbdaf69}"),
                    KeyboardInputProcessor,
                    KeyEventReceivedEventArgs
                )
                this.__OnKeyEventReceivedToken := this.add_KeyEventReceived(this.__OnKeyEventReceived.iface)
            }
            return this.__OnKeyEventReceived
        }
    }

    OnFocusEntered {
        get {
            if(!this.HasProp("__OnFocusEntered")){
                this.__OnFocusEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c50c0eea-7187-5086-ab7f-b4bcb6cce480}"),
                    KeyboardInputProcessor,
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
                    Guid("{f2171eb7-e800-51cf-a5bf-dbd9e384bca8}"),
                    KeyboardInputProcessor,
                    IInspectable
                )
                this.__OnFocusRemovedToken := this.add_FocusRemoved(this.__OnFocusRemoved.iface)
            }
            return this.__OnFocusRemoved
        }
    }

    OnConversionModeChanged {
        get {
            if(!this.HasProp("__OnConversionModeChanged")){
                this.__OnConversionModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{af7aff76-8345-5ae5-a80a-92ee36b4a233}"),
                    KeyboardInputProcessor,
                    ConversionModeChangedEventArgs
                )
                this.__OnConversionModeChangedToken := this.add_ConversionModeChanged(this.__OnConversionModeChanged.iface)
            }
            return this.__OnConversionModeChanged
        }
    }

    OnTextBoxInfoChanged {
        get {
            if(!this.HasProp("__OnTextBoxInfoChanged")){
                this.__OnTextBoxInfoChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ffba82d2-e603-5a55-b161-a5bd7b38b793}"),
                    KeyboardInputProcessor,
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
                    Guid("{473fd59d-ca4d-5ce6-97c8-d5362596d1ca}"),
                    KeyboardInputProcessor,
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
                    Guid("{f2171eb7-e800-51cf-a5bf-dbd9e384bca8}"),
                    KeyboardInputProcessor,
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
                    Guid("{b4830ed2-e0fb-5c01-b469-4dfae2946aae}"),
                    KeyboardInputProcessor,
                    ReconversionRequestedEventArgs
                )
                this.__OnReconversionRequestedToken := this.add_ReconversionRequested(this.__OnReconversionRequested.iface)
            }
            return this.__OnReconversionRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnActivatedToken")) {
            this.remove_Activated(this.__OnActivatedToken)
            this.__OnActivated.iface.Dispose()
        }

        if(this.HasProp("__OnDeactivatedToken")) {
            this.remove_Deactivated(this.__OnDeactivatedToken)
            this.__OnDeactivated.iface.Dispose()
        }

        if(this.HasProp("__OnKeyEventReceivedToken")) {
            this.remove_KeyEventReceived(this.__OnKeyEventReceivedToken)
            this.__OnKeyEventReceived.iface.Dispose()
        }

        if(this.HasProp("__OnFocusEnteredToken")) {
            this.remove_FocusEntered(this.__OnFocusEnteredToken)
            this.__OnFocusEntered.iface.Dispose()
        }

        if(this.HasProp("__OnFocusRemovedToken")) {
            this.remove_FocusRemoved(this.__OnFocusRemovedToken)
            this.__OnFocusRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnConversionModeChangedToken")) {
            this.remove_ConversionModeChanged(this.__OnConversionModeChangedToken)
            this.__OnConversionModeChanged.iface.Dispose()
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

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InputProfile() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_InputProfile()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasFocusedTextBox() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_HasFocusedTextBox()
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_FocusedTextBoxId() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_FocusedTextBoxId()
    }

    /**
     * 
     * @returns {TextBoxInfo} 
     */
    get_FocusedTextBoxInfo() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_FocusedTextBoxInfo()
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_FocusedTextBoxBounds() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_FocusedTextBoxBounds()
    }

    /**
     * 
     * @returns {IReference<RECT>} 
     */
    get_SelectionBounds() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_SelectionBounds()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConversionMode() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.get_ConversionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ConversionMode(value) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.put_ConversionMode(value)
    }

    /**
     * 
     * @returns {TextEditSession} 
     */
    CreateEditSession() {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.CreateEditSession()
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Activated(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_Activated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Activated(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_Activated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Deactivated(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_Deactivated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Deactivated(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_Deactivated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, KeyEventReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_KeyEventReceived(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_KeyEventReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_KeyEventReceived(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_KeyEventReceived(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, FocusEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusEntered(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_FocusEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusEntered(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_FocusEntered(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_FocusRemoved(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_FocusRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_FocusRemoved(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_FocusRemoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, ConversionModeChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ConversionModeChanged(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_ConversionModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ConversionModeChanged(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_ConversionModeChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, TextBoxInfoChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxInfoChanged(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_TextBoxInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextBoxInfoChanged(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_TextBoxInfoChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, TextBoxContentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TextBoxContentChanged(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_TextBoxContentChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TextBoxContentChanged(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_TextBoxContentChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CompositionTerminated(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_CompositionTerminated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CompositionTerminated(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_CompositionTerminated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<KeyboardInputProcessor, ReconversionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReconversionRequested(handler) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.add_ReconversionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReconversionRequested(token) {
        if (!this.HasProp("__IKeyboardInputProcessor")) {
            if ((queryResult := this.QueryInterface(IKeyboardInputProcessor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyboardInputProcessor := IKeyboardInputProcessor(outPtr)
        }

        return this.__IKeyboardInputProcessor.remove_ReconversionRequested(token)
    }

;@endregion Instance Methods
}
