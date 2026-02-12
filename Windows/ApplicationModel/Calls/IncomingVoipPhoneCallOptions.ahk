#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIncomingVoipPhoneCallOptions.ahk
#Include .\IIncomingVoipPhoneCallOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents options to use when creating a new call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class IncomingVoipPhoneCallOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIncomingVoipPhoneCallOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIncomingVoipPhoneCallOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [IncomingVoipPhoneCallOptions](./incomingvoipphonecalloptions.md) from a list of device interface ids of call control devices to associate with the call.
     * @param {IIterable<HSTRING>} associatedDeviceIds A list of device interface ids of call control devices to associate with the call. The list may be empty, but *associatedDeviceIds* may not be null (otherwise returns **E_INVALIDARG**). Specifying this parameter results in the [VoipPhoneCall.IsUsingAssociatedDevicesList](./voipphonecall_isusingassociateddeviceslist.md) property of a new call created with these options to be initialized to `true`, meaning that only associated devices will show the call state and be able to answer the call.
     * @returns {IncomingVoipPhoneCallOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.#ctor
     */
    static CreateInstance(associatedDeviceIds) {
        if (!IncomingVoipPhoneCallOptions.HasProp("__IIncomingVoipPhoneCallOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.IncomingVoipPhoneCallOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IIncomingVoipPhoneCallOptionsFactory.IID)
            IncomingVoipPhoneCallOptions.__IIncomingVoipPhoneCallOptionsFactory := IIncomingVoipPhoneCallOptionsFactory(factoryPtr)
        }

        return IncomingVoipPhoneCallOptions.__IIncomingVoipPhoneCallOptionsFactory.CreateInstance(associatedDeviceIds)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a string that's passed to the VoIP app's foreground UI process as a deep link. This might be the contact name, or other data that helps the UI display more quickly.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.context
     * @type {HSTRING} 
     */
    Context {
        get => this.get_Context()
        set => this.put_Context(value)
    }

    /**
     * Gets or sets the contact name or ID of the caller to be displayed on the call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.contactname
     * @type {HSTRING} 
     */
    ContactName {
        get => this.get_ContactName()
        set => this.put_ContactName(value)
    }

    /**
     * Gets or sets the phone number of the caller to be displayed on the call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.contactnumber
     * @type {HSTRING} 
     */
    ContactNumber {
        get => this.get_ContactNumber()
        set => this.put_ContactNumber(value)
    }

    /**
     * Gets or sets the contact image of the caller to be displayed on the call UI.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.contactimage
     * @type {Uri} 
     */
    ContactImage {
        get => this.get_ContactImage()
        set => this.put_ContactImage(value)
    }

    /**
     * Gets or sets the name of the VoIP service or application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
        set => this.put_ServiceName(value)
    }

    /**
     * Gets or sets the uri of an audio asset file containing the branding image of the VoIP service or application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.brandingimage
     * @type {Uri} 
     */
    BrandingImage {
        get => this.get_BrandingImage()
        set => this.put_BrandingImage(value)
    }

    /**
     * Gets or sets a string containing details of the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.calldetails
     * @type {HSTRING} 
     */
    CallDetails {
        get => this.get_CallDetails()
        set => this.put_CallDetails(value)
    }

    /**
     * Gets or sets the uri of an audio asset file containing the ringtone.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.ringtone
     * @type {Uri} 
     */
    Ringtone {
        get => this.get_Ringtone()
        set => this.put_Ringtone(value)
    }

    /**
     * Gets or sets the media types of the new incoming call (either audio and video or audio only).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.media
     * @type {Integer} 
     */
    Media {
        get => this.get_Media()
        set => this.put_Media(value)
    }

    /**
     * Gets or sets the timeout value of the call.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.ringtimeout
     * @type {TimeSpan} 
     */
    RingTimeout {
        get => this.get_RingTimeout()
        set => this.put_RingTimeout(value)
    }

    /**
     * Gets or sets the remote ID of the caller.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.contactremoteid
     * @type {HSTRING} 
     */
    ContactRemoteId {
        get => this.get_ContactRemoteId()
        set => this.put_ContactRemoteId(value)
    }

    /**
     * Gets the list of device interface ids of call control devices that will be associated with the call on creation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.incomingvoipphonecalloptions.associateddeviceids
     * @type {IVector<HSTRING>} 
     */
    AssociatedDeviceIds {
        get => this.get_AssociatedDeviceIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a default instance of [IncomingVoipPhoneCallOptions](./incomingvoipphonecalloptions.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.IncomingVoipPhoneCallOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Context() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_Context()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Context(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_Context(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactName() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_ContactName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactName(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_ContactName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactNumber() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_ContactNumber()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactNumber(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_ContactNumber(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ContactImage() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_ContactImage()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_ContactImage(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_ContactImage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_ServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ServiceName(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_ServiceName(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_BrandingImage() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_BrandingImage()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_BrandingImage(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_BrandingImage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CallDetails() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_CallDetails()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CallDetails(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_CallDetails(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Ringtone() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_Ringtone()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Ringtone(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_Ringtone(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Media() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_Media()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Media(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_Media(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RingTimeout() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_RingTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RingTimeout(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_RingTimeout(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactRemoteId() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_ContactRemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactRemoteId(value) {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.put_ContactRemoteId(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_AssociatedDeviceIds() {
        if (!this.HasProp("__IIncomingVoipPhoneCallOptions")) {
            if ((queryResult := this.QueryInterface(IIncomingVoipPhoneCallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIncomingVoipPhoneCallOptions := IIncomingVoipPhoneCallOptions(outPtr)
        }

        return this.__IIncomingVoipPhoneCallOptions.get_AssociatedDeviceIds()
    }

;@endregion Instance Methods
}
