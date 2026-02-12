#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandResponse.ahk
#Include .\IVoiceCommandResponseStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
 * @remarks
 * The background app service cannot use the VoiceCommandResponse object to display anything on the **Cortana** canvas unless the app has access to a [VoiceCommandServiceConnection](voicecommandserviceconnection.md) object. A [VoiceCommandServiceConnection](voicecommandserviceconnection.md) object is created only when the background app service is invoked from **Cortana**.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandResponse extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandResponse

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandResponse.IID

    /**
     * Gets the maximum number of content tiles the background app service can display on the **Cortana** canvas.
     * @remarks
     * The maximum number of tiles that can be displayed depends on the feedback screen being shown. One item when the [VoiceCommandResponse](voicecommandresponse.md) is created for [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md) or [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md), and more than one item when the [VoiceCommandResponse](voicecommandresponse.md) is created for [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.maxsupportedvoicecommandcontenttiles
     * @type {Integer} 
     */
    static MaxSupportedVoiceCommandContentTiles {
        get => VoiceCommandResponse.get_MaxSupportedVoiceCommandContentTiles()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxSupportedVoiceCommandContentTiles() {
        if (!VoiceCommandResponse.HasProp("__IVoiceCommandResponseStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandResponseStatics.IID)
            VoiceCommandResponse.__IVoiceCommandResponseStatics := IVoiceCommandResponseStatics(factoryPtr)
        }

        return VoiceCommandResponse.__IVoiceCommandResponseStatics.get_MaxSupportedVoiceCommandContentTiles()
    }

    /**
     * Creates a [VoiceCommandResponse](voicecommandresponse.md) object used in calls to [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md), [ReportSuccessAsync](voicecommandserviceconnection_reportsuccessasync_2126991650.md) or [ReportFailureAsync](voicecommandserviceconnection_reportfailureasync_1581497711.md).
     * @param {VoiceCommandUserMessage} userMessage 
     * @returns {VoiceCommandResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.createresponse
     */
    static CreateResponse(userMessage) {
        if (!VoiceCommandResponse.HasProp("__IVoiceCommandResponseStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandResponseStatics.IID)
            VoiceCommandResponse.__IVoiceCommandResponseStatics := IVoiceCommandResponseStatics(factoryPtr)
        }

        return VoiceCommandResponse.__IVoiceCommandResponseStatics.CreateResponse(userMessage)
    }

    /**
     * Creates a [VoiceCommandResponse](voicecommandresponse.md) object used in calls to [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md), [ReportSuccessAsync](voicecommandserviceconnection_reportsuccessasync_2126991650.md) or [ReportFailureAsync](voicecommandserviceconnection_reportfailureasync_1581497711.md).
     * @param {VoiceCommandUserMessage} message 
     * @param {IIterable<VoiceCommandContentTile>} contentTiles 
     * @returns {VoiceCommandResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.createresponse
     */
    static CreateResponseWithTiles(message, contentTiles) {
        if (!VoiceCommandResponse.HasProp("__IVoiceCommandResponseStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandResponseStatics.IID)
            VoiceCommandResponse.__IVoiceCommandResponseStatics := IVoiceCommandResponseStatics(factoryPtr)
        }

        return VoiceCommandResponse.__IVoiceCommandResponseStatics.CreateResponseWithTiles(message, contentTiles)
    }

    /**
     * Creates a [VoiceCommandResponse](voicecommandresponse.md) object used in calls to [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md) or [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md).
     * @param {VoiceCommandUserMessage} message The initial message that is spoken by **Cortana** and shown on the **Cortana** canvas. 
     * This message should be one of the following:
     * 
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @param {VoiceCommandUserMessage} repeatMessage The secondary message that is spoken by **Cortana** and shown on the **Cortana** canvas, if a response was not understood.
     * This message should be both a variation of the first message and one of the following:
     * 
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @returns {VoiceCommandResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.createresponseforprompt
     */
    static CreateResponseForPrompt(message, repeatMessage) {
        if (!VoiceCommandResponse.HasProp("__IVoiceCommandResponseStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandResponseStatics.IID)
            VoiceCommandResponse.__IVoiceCommandResponseStatics := IVoiceCommandResponseStatics(factoryPtr)
        }

        return VoiceCommandResponse.__IVoiceCommandResponseStatics.CreateResponseForPrompt(message, repeatMessage)
    }

    /**
     * Creates a [VoiceCommandResponse](voicecommandresponse.md) object used in calls to [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md) or [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md).
     * @param {VoiceCommandUserMessage} message The initial message that is spoken by **Cortana** and shown on the **Cortana** canvas. 
     * This message should be one of the following:
     * 
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @param {VoiceCommandUserMessage} repeatMessage The secondary message that is spoken by **Cortana** and shown on the **Cortana** canvas, if a response was not understood.
     * This message should be both a variation of the first message and one of the following:
     * 
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @param {IIterable<VoiceCommandContentTile>} contentTiles 
     * @returns {VoiceCommandResponse} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.createresponseforprompt
     */
    static CreateResponseForPromptWithTiles(message, repeatMessage, contentTiles) {
        if (!VoiceCommandResponse.HasProp("__IVoiceCommandResponseStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandResponse")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandResponseStatics.IID)
            VoiceCommandResponse.__IVoiceCommandResponseStatics := IVoiceCommandResponseStatics(factoryPtr)
        }

        return VoiceCommandResponse.__IVoiceCommandResponseStatics.CreateResponseForPromptWithTiles(message, repeatMessage, contentTiles)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The initial message that is spoken by **Cortana** and shown on the **Cortana** canvas.
     * 
     * 
     * This message should be:
     * 
     * + An informative statement on progress, completion, and error screens (see [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md), [ReportSuccessAsync](voicecommandserviceconnection_reportsuccessasync_2126991650.md), [ReportFailureAsync](voicecommandserviceconnection_reportfailureasync_1581497711.md)).
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.message
     * @type {VoiceCommandUserMessage} 
     */
    Message {
        get => this.get_Message()
        set => this.put_Message(value)
    }

    /**
     * The secondary message (for disambiguation and confirmation screens only) that is spoken by **Cortana** and shown on the **Cortana** canvas, if a response was not understood.
     * 
     * 
     * This message should be both a variation of the first message and one of the following:
     * 
     * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
     * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.repeatmessage
     * @type {VoiceCommandUserMessage} 
     */
    RepeatMessage {
        get => this.get_RepeatMessage()
        set => this.put_RepeatMessage(value)
    }

    /**
     * Gets or sets a string as a launch parameter that can be associated with the response by the background app service.
     * 
     * AppLaunchArgument is used to specify the state or context of the foreground app when launched through a deep link in **Cortana**.
     * @remarks
     * To enable deep linking to an app, declare the `windows.personalAssistantLaunch` extension in the Package.appxmanifest file of the app project.
     * 
     * An app is launched to the foreground through Uniform Resource Identifier (URI) activation using a [Protocol](../windows.applicationmodel.activation/activationkind.md) contract. The app must override the [OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) event and check for an [ActivationKind](../windows.applicationmodel.activation/activationkind.md) of [Protocol](../windows.applicationmodel.activation/activationkind.md). See [Handle URI activation](/windows/uwp/launch-resume/handle-uri-activation) for more info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.applaunchargument
     * @type {HSTRING} 
     */
    AppLaunchArgument {
        get => this.get_AppLaunchArgument()
        set => this.put_AppLaunchArgument(value)
    }

    /**
     * The collection of assets, containing image and text data, provided by the background app service for display on the **Cortana** canvas.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandresponse.voicecommandcontenttiles
     * @type {IVector<VoiceCommandContentTile>} 
     */
    VoiceCommandContentTiles {
        get => this.get_VoiceCommandContentTiles()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VoiceCommandUserMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.get_Message()
    }

    /**
     * 
     * @param {VoiceCommandUserMessage} value 
     * @returns {HRESULT} 
     */
    put_Message(value) {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.put_Message(value)
    }

    /**
     * 
     * @returns {VoiceCommandUserMessage} 
     */
    get_RepeatMessage() {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.get_RepeatMessage()
    }

    /**
     * 
     * @param {VoiceCommandUserMessage} value 
     * @returns {HRESULT} 
     */
    put_RepeatMessage(value) {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.put_RepeatMessage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppLaunchArgument() {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.get_AppLaunchArgument()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AppLaunchArgument(value) {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.put_AppLaunchArgument(value)
    }

    /**
     * 
     * @returns {IVector<VoiceCommandContentTile>} 
     */
    get_VoiceCommandContentTiles() {
        if (!this.HasProp("__IVoiceCommandResponse")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandResponse.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandResponse := IVoiceCommandResponse(outPtr)
        }

        return this.__IVoiceCommandResponse.get_VoiceCommandContentTiles()
    }

;@endregion Instance Methods
}
