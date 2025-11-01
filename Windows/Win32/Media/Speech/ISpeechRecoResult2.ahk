#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechRecoResult.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechRecoResult2 extends ISpeechRecoResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechRecoResult2
     * @type {Guid}
     */
    static IID => Guid("{8e0a246d-d3c8-45de-8657-04290c458c3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTextFeedback"]

    /**
     * 
     * @param {BSTR} Feedback 
     * @param {VARIANT_BOOL} WasSuccessful 
     * @returns {HRESULT} 
     */
    SetTextFeedback(Feedback, WasSuccessful) {
        Feedback := Feedback is String ? BSTR.Alloc(Feedback).Value : Feedback

        result := ComCall(17, this, "ptr", Feedback, "short", WasSuccessful, "HRESULT")
        return result
    }
}
