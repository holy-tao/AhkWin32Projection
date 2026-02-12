#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandServiceConnection.ahk
#Include .\IVoiceCommandServiceConnectionStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\VoiceCommandServiceConnection.ahk
#Include .\VoiceCommandCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * The background app service connection to **Cortana**.
  * 
  * Used to retrieve the voice command from **Cortana** and present messages that are spoken by **Cortana** and shown on the **Cortana** canvas.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandServiceConnection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandServiceConnection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandServiceConnection.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [VoiceCommandServiceConnection](voicecommandserviceconnection.md) object from the [AppServiceTriggerDetails](../windows.applicationmodel.appservice/appservicetriggerdetails.md) that contains info associated with the background task for the app service.
     * @param {AppServiceTriggerDetails} triggerDetails Contains info associated with the background task for the app service.
     * @returns {VoiceCommandServiceConnection} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.fromappservicetriggerdetails
     */
    static FromAppServiceTriggerDetails(triggerDetails) {
        if (!VoiceCommandServiceConnection.HasProp("__IVoiceCommandServiceConnectionStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandServiceConnection")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVoiceCommandServiceConnectionStatics.IID)
            VoiceCommandServiceConnection.__IVoiceCommandServiceConnectionStatics := IVoiceCommandServiceConnectionStatics(factoryPtr)
        }

        return VoiceCommandServiceConnection.__IVoiceCommandServiceConnectionStatics.FromAppServiceTriggerDetails(triggerDetails)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the locale for the voice command.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.language
     * @type {Language} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Event raised when the voice command is completed and the background app service is about to be terminated.
     * @type {TypedEventHandler<VoiceCommandServiceConnection, VoiceCommandCompletedEventArgs>}
    */
    OnVoiceCommandCompleted {
        get {
            if(!this.HasProp("__OnVoiceCommandCompleted")){
                this.__OnVoiceCommandCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{780a6352-b400-5767-993b-90875710d937}"),
                    VoiceCommandServiceConnection,
                    VoiceCommandCompletedEventArgs
                )
                this.__OnVoiceCommandCompletedToken := this.add_VoiceCommandCompleted(this.__OnVoiceCommandCompleted.iface)
            }
            return this.__OnVoiceCommandCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVoiceCommandCompletedToken")) {
            this.remove_VoiceCommandCompleted(this.__OnVoiceCommandCompletedToken)
            this.__OnVoiceCommandCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Retrieves the voice command that the user submitted to **Cortana** by voice or text.
     * @returns {IAsyncOperation<VoiceCommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.getvoicecommandasync
     */
    GetVoiceCommandAsync() {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.GetVoiceCommandAsync()
    }

    /**
     * Sends a response to **Cortana** indicating the voice command requires confirmation.
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncOperation<VoiceCommandConfirmationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.requestconfirmationasync
     */
    RequestConfirmationAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.RequestConfirmationAsync(response)
    }

    /**
     * Sends a response to **Cortana** indicating the voice command returned more than one result and requires the user to select one.
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncOperation<VoiceCommandDisambiguationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.requestdisambiguationasync
     */
    RequestDisambiguationAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.RequestDisambiguationAsync(response)
    }

    /**
     * Sends a response to **Cortana** indicating voice command is being processed.
     * @remarks
     * **Cortana** presents the progress screen to the user for up to 5 seconds. The background app service send another progress message by calling ReportProgressAsync again, or move to the next screen in the interaction flow (confirmation, disambiguation, or completion).
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.reportprogressasync
     */
    ReportProgressAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.ReportProgressAsync(response)
    }

    /**
     * Sends a response to **Cortana** indicating the voice command has succeeded.
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.reportsuccessasync
     */
    ReportSuccessAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.ReportSuccessAsync(response)
    }

    /**
     * Sends a response to **Cortana** indicating the voice command has failed.
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.reportfailureasync
     */
    ReportFailureAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.ReportFailureAsync(response)
    }

    /**
     * Sends a response to **Cortana** indicating the command should be handled by the app in the foreground.
     * @remarks
     * To enable deep linking to an app, declare the `windows.personalAssistantLaunch` extension in the Package.appxmanifest file of the app project.
     * 
     * An app is launched to the foreground through Uniform Resource Identifier (URI) activation using a [Protocol](../windows.applicationmodel.activation/activationkind.md) contract. The app must override the [OnActivated](../windows.ui.xaml/application_onactivated_603737819.md) event and check for an [ActivationKind](../windows.applicationmodel.activation/activationkind.md) of [Protocol](../windows.applicationmodel.activation/activationkind.md). See [Handle URI activation](/windows/uwp/launch-resume/handle-uri-activation) for more info.
     * 
     * **Cortana** terminates the background app service and launches the app in foreground with the launch parameter provided by the app.
     * @param {VoiceCommandResponse} response The response from a background app service for progress, confirmation, disambiguation, completion, or failure screens displayed on the **Cortana** canvas.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandserviceconnection.requestapplaunchasync
     */
    RequestAppLaunchAsync(response) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.RequestAppLaunchAsync(response)
    }

    /**
     * 
     * @returns {Language} 
     */
    get_Language() {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.get_Language()
    }

    /**
     * 
     * @param {TypedEventHandler<VoiceCommandServiceConnection, VoiceCommandCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VoiceCommandCompleted(handler) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.add_VoiceCommandCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VoiceCommandCompleted(token) {
        if (!this.HasProp("__IVoiceCommandServiceConnection")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandServiceConnection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandServiceConnection := IVoiceCommandServiceConnection(outPtr)
        }

        return this.__IVoiceCommandServiceConnection.remove_VoiceCommandCompleted(token)
    }

;@endregion Instance Methods
}
