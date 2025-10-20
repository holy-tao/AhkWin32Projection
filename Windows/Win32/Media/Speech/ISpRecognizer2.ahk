#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpRecognizer2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpRecognizer2
     * @type {Guid}
     */
    static IID => Guid("{8fc6d974-c81e-4098-93c5-0147f61ed4d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EmulateRecognitionEx", "SetTrainingState", "ResetAcousticModelAdaptation"]

    /**
     * 
     * @param {ISpPhrase} pPhrase 
     * @param {Integer} dwCompareFlags 
     * @returns {HRESULT} 
     */
    EmulateRecognitionEx(pPhrase, dwCompareFlags) {
        result := ComCall(3, this, "ptr", pPhrase, "uint", dwCompareFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fDoingTraining 
     * @param {BOOL} fAdaptFromTrainingData 
     * @returns {HRESULT} 
     */
    SetTrainingState(fDoingTraining, fAdaptFromTrainingData) {
        result := ComCall(4, this, "int", fDoingTraining, "int", fAdaptFromTrainingData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAcousticModelAdaptation() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
