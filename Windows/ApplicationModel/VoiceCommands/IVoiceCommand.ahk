#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Media\SpeechRecognition\SpeechRecognitionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.VoiceCommands
 * @version WindowsRuntime 1.4
 */
class IVoiceCommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVoiceCommand
     * @type {Guid}
     */
    static IID => Guid("{936f5273-ec82-42a6-a55c-d2d79ec6f920}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CommandName", "get_Properties", "get_SpeechRecognitionResult"]

    /**
     * @type {HSTRING} 
     */
    CommandName {
        get => this.get_CommandName()
    }

    /**
     * @type {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {SpeechRecognitionResult} 
     */
    SpeechRecognitionResult {
        get => this.get_SpeechRecognitionResult()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommandName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IVectorView<HSTRING>>} 
     */
    get_Properties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IVectorView.Call.Bind(IVectorView, (ptr) => HSTRING({ Value: ptr })), value)
    }

    /**
     * 
     * @returns {SpeechRecognitionResult} 
     */
    get_SpeechRecognitionResult() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionResult(value)
    }
}
