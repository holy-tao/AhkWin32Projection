#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVoiceCommandCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [VoiceCommandCompleted](voicecommandserviceconnection_voicecommandcompleted.md) event.
 * @remarks
 * **JavaScript:** This object is accessed in a [VoiceCommandCompleted](voicecommandserviceconnection_voicecommandcompleted.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcompletedeventargs
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class VoiceCommandCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVoiceCommandCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVoiceCommandCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The reason the voice command completed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.voicecommands.voicecommandcompletedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IVoiceCommandCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVoiceCommandCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVoiceCommandCompletedEventArgs := IVoiceCommandCompletedEventArgs(outPtr)
        }

        return this.__IVoiceCommandCompletedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
