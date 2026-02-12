#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Media\SpeechRecognition\SpeechRecognitionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents the activated event object that contains the event info when the app is launched through a voice command.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ivoicecommandactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IVoiceCommandActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommandActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ab92dcfd-8d43-4de6-9775-20704b581b00}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result"]

    /**
     * Gets the [SpeechRecognitionResult](../windows.media.speechrecognition/speechrecognitionresult.md) object representing the voice command that activated the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ivoicecommandactivatedeventargs.result
     * @type {SpeechRecognitionResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {SpeechRecognitionResult} 
     */
    get_Result() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionResult(value)
    }
}
