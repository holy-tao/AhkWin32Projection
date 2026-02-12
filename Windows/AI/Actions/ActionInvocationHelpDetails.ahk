#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActionInvocationHelpDetails.ahk
#Include .\IActionInvocationHelpDetails2.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ActionInvocationHelpDetails.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Enables app action providers to provide end-user help content relevant to the current action invocation context.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class ActionInvocationHelpDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActionInvocationHelpDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActionInvocationHelpDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the kind of help included in the help details.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets the displayed title of the help details.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the text description of the help details.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the URI that links to content related to the help details.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.helpuri
     * @type {Uri} 
     */
    HelpUri {
        get => this.get_HelpUri()
        set => this.put_HelpUri(value)
    }

    /**
     * Gets or sets the description of the help URI that is specified in the [Description](actioninvocationhelpdetails_description.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.helpuridescription
     * @type {HSTRING} 
     */
    HelpUriDescription {
        get => this.get_HelpUriDescription()
        set => this.put_HelpUriDescription(value)
    }

    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b40f316f-ed8e-58ba-9274-7ceec66746b2}"),
                    ActionInvocationHelpDetails,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.put_Description(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_HelpUri() {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.get_HelpUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_HelpUri(value) {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.put_HelpUri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HelpUriDescription() {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.get_HelpUriDescription()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_HelpUriDescription(value) {
        if (!this.HasProp("__IActionInvocationHelpDetails")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails := IActionInvocationHelpDetails(outPtr)
        }

        return this.__IActionInvocationHelpDetails.put_HelpUriDescription(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ActionInvocationHelpDetails, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IActionInvocationHelpDetails2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails2 := IActionInvocationHelpDetails2(outPtr)
        }

        return this.__IActionInvocationHelpDetails2.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IActionInvocationHelpDetails2")) {
            if ((queryResult := this.QueryInterface(IActionInvocationHelpDetails2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActionInvocationHelpDetails2 := IActionInvocationHelpDetails2(outPtr)
        }

        return this.__IActionInvocationHelpDetails2.remove_Changed(token)
    }

    /**
     * Closes and releases any resources used by this **ActionInvocationHelpDetails**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ai.actions.actioninvocationhelpdetails.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
