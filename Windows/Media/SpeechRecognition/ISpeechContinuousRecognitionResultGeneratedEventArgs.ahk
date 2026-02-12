#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpeechRecognitionResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechContinuousRecognitionResultGeneratedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechContinuousRecognitionResultGeneratedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{19091e1e-6e7e-5a46-40fb-76594f786504}")

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
