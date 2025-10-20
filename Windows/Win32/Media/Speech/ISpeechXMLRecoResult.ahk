#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpeechRecoResult.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechXMLRecoResult extends ISpeechRecoResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechXMLRecoResult
     * @type {Guid}
     */
    static IID => Guid("{aaec54af-8f85-4924-944d-b79d39d72e19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXMLResult", "GetXMLErrorInfo"]

    /**
     * 
     * @param {Integer} Options 
     * @param {Pointer<BSTR>} pResult 
     * @returns {HRESULT} 
     */
    GetXMLResult(Options, pResult) {
        result := ComCall(17, this, "int", Options, "ptr", pResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} LineNumber 
     * @param {Pointer<BSTR>} ScriptLine 
     * @param {Pointer<BSTR>} Source 
     * @param {Pointer<BSTR>} Description 
     * @param {Pointer<Integer>} ResultCode 
     * @param {Pointer<VARIANT_BOOL>} IsError 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(LineNumber, ScriptLine, Source, Description, ResultCode, IsError) {
        result := ComCall(18, this, "int*", LineNumber, "ptr", ScriptLine, "ptr", Source, "ptr", Description, "int*", ResultCode, "ptr", IsError, "HRESULT")
        return result
    }
}
