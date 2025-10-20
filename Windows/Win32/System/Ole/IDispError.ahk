#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IDispError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDispError
     * @type {Guid}
     */
    static IID => Guid("{a6ef9861-c720-11d0-9337-00a0c90dcaa9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryErrorInfo", "GetNext", "GetHresult", "GetSource", "GetHelpInfo", "GetDescription"]

    /**
     * 
     * @param {Guid} guidErrorType 
     * @param {Pointer<IDispError>} ppde 
     * @returns {HRESULT} 
     */
    QueryErrorInfo(guidErrorType, ppde) {
        result := ComCall(3, this, "ptr", guidErrorType, "ptr*", ppde, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispError>} ppde 
     * @returns {HRESULT} 
     */
    GetNext(ppde) {
        result := ComCall(4, this, "ptr*", ppde, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phr 
     * @returns {HRESULT} 
     */
    GetHresult(phr) {
        result := ComCall(5, this, "ptr", phr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSource 
     * @returns {HRESULT} 
     */
    GetSource(pbstrSource) {
        result := ComCall(6, this, "ptr", pbstrSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileName 
     * @param {Pointer<Integer>} pdwContext 
     * @returns {HRESULT} 
     */
    GetHelpInfo(pbstrFileName, pdwContext) {
        result := ComCall(7, this, "ptr", pbstrFileName, "uint*", pdwContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetDescription(pbstrDescription) {
        result := ComCall(8, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }
}
