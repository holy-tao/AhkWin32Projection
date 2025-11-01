#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IErrorLookup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorLookup
     * @type {Guid}
     */
    static IID => Guid("{0c733a66-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetErrorDescription", "GetHelpInfo", "ReleaseErrors"]

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} dwLookupID 
     * @param {Pointer<DISPPARAMS>} pdispparams 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrSource 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    GetErrorDescription(hrError, dwLookupID, pdispparams, lcid, pbstrSource, pbstrDescription) {
        result := ComCall(3, this, "int", hrError, "uint", dwLookupID, "ptr", pdispparams, "uint", lcid, "ptr", pbstrSource, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {Integer} dwLookupID 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpFile 
     * @param {Pointer<Integer>} pdwHelpContext 
     * @returns {HRESULT} 
     */
    GetHelpInfo(hrError, dwLookupID, lcid, pbstrHelpFile, pdwHelpContext) {
        pdwHelpContextMarshal := pdwHelpContext is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "int", hrError, "uint", dwLookupID, "uint", lcid, "ptr", pbstrHelpFile, pdwHelpContextMarshal, pdwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwDynamicErrorID 
     * @returns {HRESULT} 
     */
    ReleaseErrors(dwDynamicErrorID) {
        result := ComCall(5, this, "uint", dwDynamicErrorID, "HRESULT")
        return result
    }
}
