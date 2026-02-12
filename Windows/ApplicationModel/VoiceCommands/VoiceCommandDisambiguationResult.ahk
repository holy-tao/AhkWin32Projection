#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandDisambiguationResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * The result obtained from the disambiguation screen displayed on the **Cortana** canvas.
  * 
  * Calling [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md) from the background app service causes **Cortana** to display the disambiguation screen.
 * @remarks
 * Access [VoiceCommandDisambiguationResult](voicecommand.md) objects by calling [RequestDisambiguationAsync](voicecommandserviceconnection_requestdisambiguationasync_117243970.md) on a [VoiceCommandServiceConnection](voicecommandserviceconnection.md) that references the appropriate [Windows.ApplicationModel.AppService](../windows.applicationmodel.appservice/windows_applicationmodel_appservice.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddisambiguationresult
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandDisambiguationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandDisambiguationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandDisambiguationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The item selected from the list of items displayed on the **Cortana** disambiguation screen.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommanddisambiguationresult.selecteditem
     * @type {VoiceCommandContentTile} 
     */
    SelectedItem {
        get => this.get_SelectedItem()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VoiceCommandContentTile} 
     */
    get_SelectedItem() {
        if (!this.HasProp("__IVoiceCommandDisambiguationResult")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandDisambiguationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandDisambiguationResult := IVoiceCommandDisambiguationResult(outPtr)
        }

        return this.__IVoiceCommandDisambiguationResult.get_SelectedItem()
    }

;@endregion Instance Methods
}
