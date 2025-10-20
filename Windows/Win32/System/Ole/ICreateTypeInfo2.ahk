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
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteFuncDesc(index) {
        result := ComCall(26, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @returns {HRESULT} 
     */
    DeleteFuncDescByMemId(memid, invKind) {
        result := ComCall(27, this, "int", memid, "int", invKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteVarDesc(index) {
        result := ComCall(28, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @returns {HRESULT} 
     */
    DeleteVarDescByMemId(memid) {
        result := ComCall(29, this, "int", memid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {HRESULT} 
     */
    DeleteImplType(index) {
        result := ComCall(30, this, "uint", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetCustData(guid, pVarVal) {
        result := ComCall(31, this, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetFuncCustData(index, guid, pVarVal) {
        result := ComCall(32, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} indexFunc 
     * @param {Integer} indexParam 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetParamCustData(indexFunc, indexParam, guid, pVarVal) {
        result := ComCall(33, this, "uint", indexFunc, "uint", indexParam, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetVarCustData(index, guid, pVarVal) {
        result := ComCall(34, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<VARIANT>} pVarVal 
     * @returns {HRESULT} 
     */
    SetImplTypeCustData(index, guid, pVarVal) {
        result := ComCall(35, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     */
    SetHelpStringContext(dwHelpStringContext) {
        result := ComCall(36, this, "uint", dwHelpStringContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     */
    SetFuncHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(37, this, "uint", index, "uint", dwHelpStringContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpStringContext 
     * @returns {HRESULT} 
     */
    SetVarHelpStringContext(index, dwHelpStringContext) {
        result := ComCall(38, this, "uint", index, "uint", dwHelpStringContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Invalidate() {
        result := ComCall(39, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    SetName(szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(40, this, "ptr", szName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
