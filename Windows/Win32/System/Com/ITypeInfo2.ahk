#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITypeInfo.ahk

/**
 * Used for reading information about objects.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-itypeinfo2
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ITypeInfo2 extends ITypeInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITypeInfo2
     * @type {Guid}
     */
    static IID => Guid("{00020412-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTypeKind", "GetTypeFlags", "GetFuncIndexOfMemId", "GetVarIndexOfMemId", "GetCustData", "GetFuncCustData", "GetParamCustData", "GetVarCustData", "GetImplTypeCustData", "GetDocumentation2", "GetAllCustData", "GetAllFuncCustData", "GetAllParamCustData", "GetAllVarCustData", "GetAllImplTypeCustData"]

    /**
     * 
     * @param {Pointer<Integer>} pTypeKind 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-gettypekind
     */
    GetTypeKind(pTypeKind) {
        pTypeKindMarshal := pTypeKind is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pTypeKindMarshal, pTypeKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTypeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-gettypeflags
     */
    GetTypeFlags(pTypeFlags) {
        pTypeFlagsMarshal := pTypeFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, pTypeFlagsMarshal, pTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<Integer>} pFuncIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getfuncindexofmemid
     */
    GetFuncIndexOfMemId(memid, invKind, pFuncIndex) {
        pFuncIndexMarshal := pFuncIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "int", memid, "int", invKind, pFuncIndexMarshal, pFuncIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<Integer>} pVarIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getvarindexofmemid
     */
    GetVarIndexOfMemId(memid, pVarIndex) {
        pVarIndexMarshal := pVarIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "int", memid, pVarIndexMarshal, pVarIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getcustdata
     */
    GetCustData(guid, pVarVal) {
        result := ComCall(26, this, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getfunccustdata
     */
    GetFuncCustData(index, guid, pVarVal) {
        result := ComCall(27, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} indexFunc 
     * @param {Integer} indexParam 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getparamcustdata
     */
    GetParamCustData(indexFunc, indexParam, guid, pVarVal) {
        result := ComCall(28, this, "uint", indexFunc, "uint", indexParam, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getvarcustdata
     */
    GetVarCustData(index, guid, pVarVal) {
        result := ComCall(29, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getimpltypecustdata
     */
    GetImplTypeCustData(index, guid, pVarVal) {
        result := ComCall(30, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpString 
     * @param {Pointer<Integer>} pdwHelpStringContext 
     * @param {Pointer<BSTR>} pbstrHelpStringDll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getdocumentation2
     */
    GetDocumentation2(memid, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        pdwHelpStringContextMarshal := pdwHelpStringContext is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "int", memid, "uint", lcid, "ptr", pbstrHelpString, pdwHelpStringContextMarshal, pdwHelpStringContext, "ptr", pbstrHelpStringDll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallcustdata
     */
    GetAllCustData(pCustData) {
        result := ComCall(32, this, "ptr", pCustData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallfunccustdata
     */
    GetAllFuncCustData(index, pCustData) {
        result := ComCall(33, this, "uint", index, "ptr", pCustData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} indexFunc 
     * @param {Integer} indexParam 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallparamcustdata
     */
    GetAllParamCustData(indexFunc, indexParam, pCustData) {
        result := ComCall(34, this, "uint", indexFunc, "uint", indexParam, "ptr", pCustData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallvarcustdata
     */
    GetAllVarCustData(index, pCustData) {
        result := ComCall(35, this, "uint", index, "ptr", pCustData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-itypeinfo2-getallimpltypecustdata
     */
    GetAllImplTypeCustData(index, pCustData) {
        result := ComCall(36, this, "uint", index, "ptr", pCustData, "HRESULT")
        return result
    }
}
