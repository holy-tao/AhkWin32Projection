#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDispError.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {IDispError} 
     */
    QueryErrorInfo(guidErrorType) {
        result := ComCall(3, this, "ptr", guidErrorType, "ptr*", &ppde := 0, "HRESULT")
        return IDispError(ppde)
    }

    /**
     * 
     * @returns {IDispError} 
     */
    GetNext() {
        result := ComCall(4, this, "ptr*", &ppde := 0, "HRESULT")
        return IDispError(ppde)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetHresult() {
        result := ComCall(5, this, "int*", &phr := 0, "HRESULT")
        return phr
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetSource() {
        pbstrSource := BSTR()
        result := ComCall(6, this, "ptr", pbstrSource, "HRESULT")
        return pbstrSource
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileName 
     * @param {Pointer<Integer>} pdwContext 
     * @returns {HRESULT} 
     */
    GetHelpInfo(pbstrFileName, pdwContext) {
        pdwContextMarshal := pdwContext is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pbstrFileName, pdwContextMarshal, pdwContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDescription() {
        pbstrDescription := BSTR()
        result := ComCall(8, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }
}
