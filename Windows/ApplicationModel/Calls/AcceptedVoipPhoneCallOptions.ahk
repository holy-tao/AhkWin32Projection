#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAcceptedVoipPhoneCallOptions.ahk
#Include .\IAcceptedVoipPhoneCallOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents options to use when creating a new call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class AcceptedVoipPhoneCallOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAcceptedVoipPhoneCallOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAcceptedVoipPhoneCallOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md) from a list of device interface ids of call control devices to associate with the call.
     * @param {IIterable<HSTRING>} associatedDeviceIds A list of device interface ids of call control devices to associate with the call. The list may be empty, but *associatedDeviceIds* may not be null (otherwise returns **E_INVALIDARG**). Specifying this parameter results in the [VoipPhoneCall.IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) property of a new call created with these options to be initialized to `true`, meaning that only associated devices will show the call state and be able to answer the call.
     * @returns {AcceptedVoipPhoneCallOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.#ctor
     */
    static CreateInstance(associatedDeviceIds) {
        if (!AcceptedVoipPhoneCallOptions.HasProp("__IAcceptedVoipPhoneCallOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.AcceptedVoipPhoneCallOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAcceptedVoipPhoneCallOptionsFactory.IID)
            AcceptedVoipPhoneCallOptions.__IAcceptedVoipPhoneCallOptionsFactory := IAcceptedVoipPhoneCallOptionsFactory(factoryPtr)
        }

        return AcceptedVoipPhoneCallOptions.__IAcceptedVoipPhoneCallOptionsFactory.CreateInstance(associatedDeviceIds)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a string that's passed to the VoIP app's foreground UI process as a deep link. This might be the contact name, or other data that helps the UI display more quickly.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.context
     * @type {HSTRING} 
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * Gets or sets the contact name or ID of the caller to be displayed on the call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.contactname
     * @type {HSTRING} 
     */
    ContactName {
        get => this.get_ContactName()
        set => this.put_ContactName(value)
    }

    /**
     * Gets or sets the phone number (if applicable) of the caller to be displayed on the call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.contactnumber
     * @type {HSTRING} 
     */
    ContactNumber {
        get => this.get_ContactNumber()
        set => this.put_ContactNumber(value)
    }

    /**
     * Gets or sets the name of the VoIP service or application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
        set => this.put_ServiceName(value)
    }

    /**
     * Gets or sets the media types of the new incoming call (either audio and video or audio only).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.media
     * @type {Integer} 
     */
    Media {
        get => this.get_Media()
        set => this.put_Media(value)
    }

    /**
     * Gets the list of device interface ids of call control devices that will be associated with the call on creation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.acceptedvoipphonecalloptions.associateddeviceids
     * @type {IVector<HSTRING>} 
     */
    AssociatedDeviceIds {
        get => this.get_AssociatedDeviceIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a default instance of [AcceptedVoipPhoneCallOptions](./acceptedvoipphonecalloptions.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.AcceptedVoipPhoneCallOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Context() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_Context()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Context(value) {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.put_Context(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactName() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_ContactName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactName(value) {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.put_ContactName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactNumber() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_ContactNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactNumber(value) {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.put_ContactNumber(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_ServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ServiceName(value) {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.put_ServiceName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Media() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_Media()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Media(value) {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.put_Media(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AssociatedDeviceIds() {
        if (!this.HasProp("__IAcceptedVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IAcceptedVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAcceptedVoipPhoneCallOptions := IAcceptedVoipPhoneCallOptions(outPtr)
        }

        return this.__IAcceptedVoipPhoneCallOptions.get_AssociatedDeviceIds()
    }

;@endregion Instance Methods
}
