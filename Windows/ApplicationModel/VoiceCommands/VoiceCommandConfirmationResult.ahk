#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandConfirmationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The response to the question specified by the background app and shown on the **Cortana** confirmation screen. This screen is displayed when the background app service calls [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md).
 * @remarks
 * Access the VoiceCommandConfirmationResult object by calling [RequestConfirmationAsync](voicecommandserviceconnection_requestconfirmationasync_1656186355.md) on a [VoiceCommandServiceConnection](voicecommandserviceconnection.md) that references the appropriate [Windows.ApplicationModel.AppService](../windows.applicationmodel.appservice/windows_applicationmodel_appservice.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandconfirmationresult
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandConfirmationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandConfirmationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandConfirmationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the response to the question specified by the background app and shown on the **Cortana** confirmation screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandconfirmationresult.confirmed
     * @type {Boolean} 
     */
    Confirmed {
        get => this.get_Confirmed()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Confirmed() {
        if (!this.HasProp("__IVoiceCommandConfirmationResult")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandConfirmationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandConfirmationResult := IVoiceCommandConfirmationResult(outPtr)
        }

        return this.__IVoiceCommandConfirmationResult.get_Confirmed()
    }

;@endregion Instance Methods
}
