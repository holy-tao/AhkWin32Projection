#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpeechRecognitionHypothesis.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionHypothesisGeneratedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionHypothesisGeneratedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{55161a7a-8023-5866-411d-1213bb271476}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Hypothesis"]

    /**
     * @type {SpeechRecognitionHypothesis} 
     */
    Hypothesis {
        get => this.get_Hypothesis()
    }

    /**
     * 
     * @returns {SpeechRecognitionHypothesis} 
     */
    get_Hypothesis() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionHypothesis(value)
    }
}
