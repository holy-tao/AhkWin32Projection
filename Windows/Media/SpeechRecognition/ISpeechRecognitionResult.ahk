#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SpeechRecognitionSemanticInterpretation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SpeechRecognitionResult.ahk
#Include .\ISpeechRecognitionConstraint.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.SpeechRecognition
 * @version WindowsRuntime 1.4
 */
class ISpeechRecognitionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecognitionResult
     * @type {Guid}
     */
    static IID => Guid("{4e303157-034e-4652-857e-d0454cc4beec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Text", "get_Confidence", "get_SemanticInterpretation", "GetAlternates", "get_Constraint", "get_RulePath", "get_RawConfidence"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {Integer} 
     */
    Confidence {
        get => this.get_Confidence()
    }

    /**
     * @type {SpeechRecognitionSemanticInterpretation} 
     */
    SemanticInterpretation {
        get => this.get_SemanticInterpretation()
    }

    /**
     * @type {ISpeechRecognitionConstraint} 
     */
    Constraint {
        get => this.get_Constraint()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    RulePath {
        get => this.get_RulePath()
    }

    /**
     * @type {Float} 
     */
    RawConfidence {
        get => this.get_RawConfidence()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Confidence() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SpeechRecognitionSemanticInterpretation} 
     */
    get_SemanticInterpretation() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpeechRecognitionSemanticInterpretation(value)
    }

    /**
     * 
     * @param {Integer} maxAlternates 
     * @returns {IVectorView<SpeechRecognitionResult>} 
     */
    GetAlternates(maxAlternates) {
        result := ComCall(10, this, "uint", maxAlternates, "ptr*", &alternates := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(SpeechRecognitionResult, alternates)
    }

    /**
     * 
     * @returns {ISpeechRecognitionConstraint} 
     */
    get_Constraint() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechRecognitionConstraint(value)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_RulePath() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawConfidence() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
