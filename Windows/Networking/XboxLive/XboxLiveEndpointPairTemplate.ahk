#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveEndpointPairTemplate.ahk
#Include .\IXboxLiveEndpointPairTemplateStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\XboxLiveEndpointPairTemplate.ahk
#Include .\XboxLiveInboundEndpointPairCreatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a pre-configured pattern for how to enable optimal and secure communication between two devices using sockets. The template defined by this class details how two endpoints are connected in an **XboxLiveEndpointPair**. Templates are statically declared in your app's network manifest, and are subsequently identified using unique name strings.
  * 
  * > [!NOTE]
  * > Templates are declared only in the app's network manifest. You can't declare or modify a template at runtime.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * Your code doesn't instantiate this class using a constructor. Instead, you create an instance of a particular predefined template by calling the static **XboxLiveEndpointPairTemplate.GetTemplateByName** method with the name of the template you want.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairTemplate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveEndpointPairTemplate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveEndpointPairTemplate.IID

    /**
     * Static property that lists all of the templates declared by the app. Templates are declared in the app's network manifest at build time, and cannot be declared or modified at runtime.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.templates
     * @type {IVectorView<XboxLiveEndpointPairTemplate>} 
     */
    static Templates {
        get => XboxLiveEndpointPairTemplate.get_Templates()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Static method that creates an **XboxLiveEndpointPairTemplate** for the named template. Templates are defined in the app network manifest. Each template in the manifest must have been given a unique name.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {HSTRING} name The name of the template to instantiate, as specified in the app network manifest.
     * @returns {XboxLiveEndpointPairTemplate} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.gettemplatebyname
     */
    static GetTemplateByName(name) {
        if (!XboxLiveEndpointPairTemplate.HasProp("__IXboxLiveEndpointPairTemplateStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveEndpointPairTemplateStatics.IID)
            XboxLiveEndpointPairTemplate.__IXboxLiveEndpointPairTemplateStatics := IXboxLiveEndpointPairTemplateStatics(factoryPtr)
        }

        return XboxLiveEndpointPairTemplate.__IXboxLiveEndpointPairTemplateStatics.GetTemplateByName(name)
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveEndpointPairTemplate>} 
     */
    static get_Templates() {
        if (!XboxLiveEndpointPairTemplate.HasProp("__IXboxLiveEndpointPairTemplateStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.XboxLive.XboxLiveEndpointPairTemplate")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXboxLiveEndpointPairTemplateStatics.IID)
            XboxLiveEndpointPairTemplate.__IXboxLiveEndpointPairTemplateStatics := IXboxLiveEndpointPairTemplateStatics(factoryPtr)
        }

        return XboxLiveEndpointPairTemplate.__IXboxLiveEndpointPairTemplateStatics.get_Templates()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the name of the template (declared in the app network manifest) that was used to instantiate this object.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets a value specifying the kind of socket declared by this template.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.socketkind
     * @type {Integer} 
     */
    SocketKind {
        get => this.get_SocketKind()
    }

    /**
     * Gets the lower limit of the initiator bound port range, as defined in the app network manifest.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.initiatorboundportrangelower
     * @type {Integer} 
     */
    InitiatorBoundPortRangeLower {
        get => this.get_InitiatorBoundPortRangeLower()
    }

    /**
     * Gets the upper limit of the initiator bound port range, as defined in the app network manifest.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.initiatorboundportrangeupper
     * @type {Integer} 
     */
    InitiatorBoundPortRangeUpper {
        get => this.get_InitiatorBoundPortRangeUpper()
    }

    /**
     * Gets the lower limit of the acceptor-bound port range, as defined in the app network manifest.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.acceptorboundportrangelower
     * @type {Integer} 
     */
    AcceptorBoundPortRangeLower {
        get => this.get_AcceptorBoundPortRangeLower()
    }

    /**
     * Gets the upper limit of the acceptor-bound port range, as defined in the app network manifest.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.acceptorboundportrangeupper
     * @type {Integer} 
     */
    AcceptorBoundPortRangeUpper {
        get => this.get_AcceptorBoundPortRangeUpper()
    }

    /**
     * Static property that gets a list of current **XboxLiveEndpointPair** objects that have been created using this template.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.endpointpairs
     * @type {IVectorView<XboxLiveEndpointPair>} 
     */
    EndpointPairs {
        get => this.get_EndpointPairs()
    }

    /**
     * Event raised when a remote device successfully creates an endpoint pair from itself to the local machine. Details about the new endpoint pair can be found in the event arguments.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @type {TypedEventHandler<XboxLiveEndpointPairTemplate, XboxLiveInboundEndpointPairCreatedEventArgs>}
    */
    OnInboundEndpointPairCreated {
        get {
            if(!this.HasProp("__OnInboundEndpointPairCreated")){
                this.__OnInboundEndpointPairCreated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2aef5136-6e7a-51f8-8853-cc0ce466fef9}"),
                    XboxLiveEndpointPairTemplate,
                    XboxLiveInboundEndpointPairCreatedEventArgs
                )
                this.__OnInboundEndpointPairCreatedToken := this.add_InboundEndpointPairCreated(this.__OnInboundEndpointPairCreated.iface)
            }
            return this.__OnInboundEndpointPairCreated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnInboundEndpointPairCreatedToken")) {
            this.remove_InboundEndpointPairCreated(this.__OnInboundEndpointPairCreatedToken)
            this.__OnInboundEndpointPairCreated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<XboxLiveEndpointPairTemplate, XboxLiveInboundEndpointPairCreatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InboundEndpointPairCreated(handler) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.add_InboundEndpointPairCreated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InboundEndpointPairCreated(token) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.remove_InboundEndpointPairCreated(token)
    }

    /**
     * Creates an **XboxLiveEndpointPair** between the local device and a specified remote device, while specifying how the system should behave if an **XboxLiveEndpointPair** already exists for this template and remote device.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The most common way to get an address for the *deviceAddress* parameter is to be sent one from the Xbox Live matchmaking service.
     * @param {XboxLiveDeviceAddress} deviceAddress The **XboxLiveDeviceAddress** of the remote device for the endpoint pair.
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.createendpointpairasync
     */
    CreateEndpointPairDefaultAsync(deviceAddress) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.CreateEndpointPairDefaultAsync(deviceAddress)
    }

    /**
     * Creates an **XboxLiveEndpointPair** between the local device and a specified remote device, based on the current template, with creation behavior **XboxLiveEndpointPairCreationBehaviors.None**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @remarks
     * The most common way to get an address for the *deviceAddress* parameter is to be sent one from the Xbox Live matchmaking service.
     * @param {XboxLiveDeviceAddress} deviceAddress The XboxLiveDeviceAddress of the remote device to be connected to.
     * @param {Integer} behaviors 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.createendpointpairasync
     */
    CreateEndpointPairWithBehaviorsAsync(deviceAddress, behaviors) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.CreateEndpointPairWithBehaviorsAsync(deviceAddress, behaviors)
    }

    /**
     * Creates an endpoint pair between the local device and the specified remote device, specifying specific ports from the template's designated ranges of acceptable ports, and specifying how the system should behave if an **XboxLiveEndpointPair** already exists for this template, remote device, and port combination.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {XboxLiveDeviceAddress} deviceAddress The **XboxLiveDeviceAddress** of the remote device to be connected to.
     * @param {HSTRING} initiatorPort The port to be used by the initiator, from the range of acceptable initiator ports specified in this template.
     * @param {HSTRING} acceptorPort The port to be used by the acceptor, from the range of acceptable acceptor ports specified in this template.
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.createendpointpairforportsasync
     */
    CreateEndpointPairForPortsDefaultAsync(deviceAddress, initiatorPort, acceptorPort) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.CreateEndpointPairForPortsDefaultAsync(deviceAddress, initiatorPort, acceptorPort)
    }

    /**
     * Creates an endpoint pair between the local device and the specified remote device, specifying specific ports from the template's designated range of acceptable ports, with creation behavior **XboxLiveEndpointPairCreationBehaviors.None**.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @param {XboxLiveDeviceAddress} deviceAddress The **XboxLiveDeviceAddress** of the remote device to be connected to.
     * @param {HSTRING} initiatorPort The port to be used by the initiator, from the range of acceptable initiator ports specified in this template.
     * @param {HSTRING} acceptorPort The port to be used by the acceptor, from the range of acceptable acceptor ports specified in this template.
     * @param {Integer} behaviors 
     * @returns {IAsyncOperation<XboxLiveEndpointPairCreationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairtemplate.createendpointpairforportsasync
     */
    CreateEndpointPairForPortsWithBehaviorsAsync(deviceAddress, initiatorPort, acceptorPort, behaviors) {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.CreateEndpointPairForPortsWithBehaviorsAsync(deviceAddress, initiatorPort, acceptorPort, behaviors)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SocketKind() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_SocketKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitiatorBoundPortRangeLower() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_InitiatorBoundPortRangeLower()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitiatorBoundPortRangeUpper() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_InitiatorBoundPortRangeUpper()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptorBoundPortRangeLower() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_AcceptorBoundPortRangeLower()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AcceptorBoundPortRangeUpper() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_AcceptorBoundPortRangeUpper()
    }

    /**
     * 
     * @returns {IVectorView<XboxLiveEndpointPair>} 
     */
    get_EndpointPairs() {
        if (!this.HasProp("__IXboxLiveEndpointPairTemplate")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairTemplate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairTemplate := IXboxLiveEndpointPairTemplate(outPtr)
        }

        return this.__IXboxLiveEndpointPairTemplate.get_EndpointPairs()
    }

;@endregion Instance Methods
}
