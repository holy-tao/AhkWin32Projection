#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpRecoResult.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpXMLRecoResult extends ISpRecoResult{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpXMLRecoResult
     * @type {Guid}
     */
    static IID => Guid("{ae39362b-45a8-4074-9b9e-ccf49aa2d0b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetXMLResult", "GetXMLErrorInfo"]

    /**
     * 
     * @param {Integer} Options 
     * @returns {PWSTR} 
     */
    GetXMLResult(Options) {
        result := ComCall(14, this, "ptr*", &ppszCoMemXMLResult := 0, "int", Options, "HRESULT")
        return ppszCoMemXMLResult
    }

    /**
     * 
     * @param {Pointer<SPSEMANTICERRORINFO>} pSemanticErrorInfo 
     * @returns {HRESULT} 
     */
    GetXMLErrorInfo(pSemanticErrorInfo) {
        result := ComCall(15, this, "ptr", pSemanticErrorInfo, "HRESULT")
        return result
    }
}
