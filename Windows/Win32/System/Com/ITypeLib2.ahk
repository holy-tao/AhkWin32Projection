#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeLib.ahk

/**
 * Represents a type library, the data that describes a set of objects.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypelib2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeLib2 extends ITypeLib{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeLib2
     * @type {Guid}
     */
    static IID => Guid("{00020411-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCustData", "GetLibStatistics", "GetDocumentation2", "GetAllCustData"]

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib2-getcustdata
     */
    GetCustData(guid, pVarVal) {
        result := ComCall(13, this, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcUniqueNames 
     * @param {Pointer<Integer>} pcchUniqueNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib2-getlibstatistics
     */
    GetLibStatistics(pcUniqueNames, pcchUniqueNames) {
        pcUniqueNamesMarshal := pcUniqueNames is VarRef ? "uint*" : "ptr"
        pcchUniqueNamesMarshal := pcchUniqueNames is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pcUniqueNamesMarshal, pcUniqueNames, pcchUniqueNamesMarshal, pcchUniqueNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpString 
     * @param {Pointer<Integer>} pdwHelpStringContext 
     * @param {Pointer<BSTR>} pbstrHelpStringDll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib2-getdocumentation2
     */
    GetDocumentation2(index, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        pdwHelpStringContextMarshal := pdwHelpStringContext is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "int", index, "uint", lcid, "ptr", pbstrHelpString, pdwHelpStringContextMarshal, pdwHelpStringContext, "ptr", pbstrHelpStringDll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypelib2-getallcustdata
     */
    GetAllCustData(pCustData) {
        result := ComCall(16, this, "ptr", pCustData, "HRESULT")
        return result
    }
}
