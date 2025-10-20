#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICreateTypeInfo.ahk

/**
 * Provides the tools for creating and administering the type information defined through the type description.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreatetypeinfo2
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateTypeInfo2 extends ICreateTypeInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateTypeInfo2
     * @type {Guid}
     */
    static IID => Guid("{0002040e-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteFuncDesc", "DeleteFuncDescByMemId", "DeleteVarDesc", "DeleteVarDescByMemId", "DeleteImplType", "SetCustData", "SetFuncCustData", "SetParamCustData", "SetVarCustData", "SetImplTypeCustData", "SetHelpStringContext", "SetFuncHelpStringContext", "SetVarHelpStringContext", "Invalidate", "SetName"]

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletefuncdesc
     */
    DeleteFuncDesc(index) {
        result := ComCall(26, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletefuncdescbymemid
     */
    DeleteFuncDescByMemId(memid, invKind) {
        result := ComCall(27, this, "int", memid, "int", invKind, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletevardesc
     */
    DeleteVarDesc(index) {
        result := ComCall(28, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deletevardescbymemid
     */
    DeleteVarDescByMemId(memid) {
        result := ComCall(29, this, "int", memid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-deleteimpltype
     */
    DeleteImplType(index) {
        result := ComCall(30, this, "uint", index, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setcustdata
     */
    SetCustData(guid, pVarVal) {
        result := ComCall(31, this, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setfunccustdata
     */
    SetFuncCustData(index, guid, pVarVal) {
        result := ComCall(32, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} indexFunc 
     * @param {Integer} indexParam 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setparamcustdata
     */
    SetParamCustData(indexFunc, indexParam, guid, pVarVal) {
        result := ComCall(33, this, "uint", indexFunc, "uint", indexParam, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setvarcustdata
     */
    SetVarCustData(index, guid, pVarVal) {
        result := ComCall(34, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setimpltypecustdata
     */
    SetImplTypeCustData(index, guid, pVarVal) {
        result := ComCall(35, this, "uint", index, "ptr", guid, "ptr", pVarVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-sethelpstringcontext
     */
    SetHelpStringContext(dwHelpStringContext) {
        result := ComCall(36, this, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setfunchelpstringcontext
     */
    SetFuncHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(37, this, "uint", index, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setvarhelpstringcontext
     */
    SetVarHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(38, this, "uint", index, "uint", dwHelpStringContext, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invalidate() {
        result := ComCall(39, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo2-setname
     */
    SetName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(40, this, "ptr", szName, "HRESULT")
        return result
    }
}
