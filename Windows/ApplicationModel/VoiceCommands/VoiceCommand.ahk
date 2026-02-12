#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommand.ahk
#Include ..\..\..\Guid.ahk

/**
 * The command given to **Cortana**, using either speech or text, and routed to a background app.
  * 
  * The command must be declared in a Voice Command Definition (VCD) file registered by the app referred to in the command. See [Launch a background app with voice commands](/windows/apps/design/input/cortana-launch-a-background-app-with-voice-commands) for more info on creating and registering a Voice Command Definition (VCD) file for your app.
 * @remarks
 * Access VoiceCommand objects by calling [GetVoiceCommandAsync](voicecommandserviceconnection_getvoicecommandasync_1073619361.md) on a [VoiceCommandServiceConnection](voicecommandserviceconnection.md) that references the appropriate [Windows.ApplicationModel.AppService](../windows.applicationmodel.appservice/windows_applicationmodel_appservice.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommand
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommand extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommand

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommand.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the value of the **Name** attribute for the **Command** element declared in the Voice Command Definition (VCD) file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommand.commandname
     * @type {HSTRING} 
     */
    CommandName {
        get => this.get_CommandName()
    }

    /**
     * Gets a dictionary containing the semantic properties of the recognized phrase in the voice command.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommand.properties
     * @type {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets the [SpeechRecognitionResult](../windows.media.speechrecognition/speechrecognitionresult.md) object representing the results returned by the voice command.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommand.speechrecognitionresult
     * @type {SpeechRecognitionResult} 
     */
    SpeechRecognitionResult {
        get => this.get_SpeechRecognitionResult()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommandName() {
        if (!this.HasProp("__IVoiceCommand")) {
            if ((queryResult := this.QueryInterface(IVoiceCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommand := IVoiceCommand(outPtr)
        }

        return this.__IVoiceCommand.get_CommandName()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    get_Properties() {
        if (!this.HasProp("__IVoiceCommand")) {
            if ((queryResult := this.QueryInterface(IVoiceCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommand := IVoiceCommand(outPtr)
        }

        return this.__IVoiceCommand.get_Properties()
    }

    /**
     * 
     * @returns {SpeechRecognitionResult} 
     */
    get_SpeechRecognitionResult() {
        if (!this.HasProp("__IVoiceCommand")) {
            if ((queryResult := this.QueryInterface(IVoiceCommand.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommand := IVoiceCommand(outPtr)
        }

        return this.__IVoiceCommand.get_SpeechRecognitionResult()
    }

;@endregion Instance Methods
}
