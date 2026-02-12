#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandUserMessage.ahk
#Include ..\..\..\Guid.ahk

/**
 * The message that is spoken by **Cortana** and shown on the **Cortana** canvas.
  * 
  * 
  * This message should be:
  * 
  * + An informative statement on progress, completion, and error screens (see [ReportProgressAsync](voicecommandserviceconnection_reportprogressasync_197749011.md), [ReportSuccessAsync](voicecommandserviceconnection_reportsuccessasync_2126991650.md), [ReportFailureAsync](voicecommandserviceconnection_reportfailureasync_1581497711.md)).
  * + An unambiguous question that can be answered with either yes or no on confirmation screens (see [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md)).
  * + A request for the user to select from the list of choices presented on disambiguation screens (see [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md)).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandusermessage
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandUserMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandUserMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandUserMessage.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the message that is shown on the **Cortana** canvas.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandusermessage.displaymessage
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

    /**
     * The message that is spoken by **Cortana**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandusermessage.spokenmessage
     * @type {HSTRING} 
     */
    SpokenMessage {
        get => this.get_SpokenMessage()
        set => this.put_SpokenMessage(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [VoiceCommandUserMessage](voicecommandusermessage.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.VoiceCommands.VoiceCommandUserMessage")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        if (!this.HasProp("__IVoiceCommandUserMessage")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandUserMessage := IVoiceCommandUserMessage(outPtr)
        }

        return this.__IVoiceCommandUserMessage.get_DisplayMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if (!this.HasProp("__IVoiceCommandUserMessage")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandUserMessage := IVoiceCommandUserMessage(outPtr)
        }

        return this.__IVoiceCommandUserMessage.put_DisplayMessage(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SpokenMessage() {
        if (!this.HasProp("__IVoiceCommandUserMessage")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandUserMessage := IVoiceCommandUserMessage(outPtr)
        }

        return this.__IVoiceCommandUserMessage.get_SpokenMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SpokenMessage(value) {
        if (!this.HasProp("__IVoiceCommandUserMessage")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandUserMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandUserMessage := IVoiceCommandUserMessage(outPtr)
        }

        return this.__IVoiceCommandUserMessage.put_SpokenMessage(value)
    }

;@endregion Instance Methods
}
