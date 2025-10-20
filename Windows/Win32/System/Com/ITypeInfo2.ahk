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
     * 
     * @param {Pointer<Int32>} pTypeKind 
     * @returns {HRESULT} 
     */
    GetTypeKind(pTypeKind) {
        result := ComCall(22, this, "int*", pTypeKind, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pTypeFlags 
     * @returns {HRESULT} 
     */
    GetTypeFlags(pTypeFlags) {
        result := ComCall(23, this, "uint*", pTypeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} invKind 
     * @param {Pointer<UInt32>} pFuncIndex 
     * @returns {HRESULT} 
     */
    GetFuncIndexOfMemId(memid, invKind, pFuncIndex) {
        result := ComCall(24, this, "int", memid, "int", invKind, "uint*", pFuncIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Pointer<UInt32>} pVarIndex 
     * @returns {HRESULT} 
     */
    GetVarIndexOfMemId(memid, pVarIndex) {
        result := ComCall(25, this, "int", memid, "uint*", pVarIndex, "int")
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
    GetCustData(guid, pVarVal) {
        result := ComCall(26, this, "ptr", guid, "ptr", pVarVal, "int")
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
    GetFuncCustData(index, guid, pVarVal) {
        result := ComCall(27, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
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
    GetParamCustData(indexFunc, indexParam, guid, pVarVal) {
        result := ComCall(28, this, "uint", indexFunc, "uint", indexParam, "ptr", guid, "ptr", pVarVal, "int")
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
    GetVarCustData(index, guid, pVarVal) {
        result := ComCall(29, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
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
    GetImplTypeCustData(index, guid, pVarVal) {
        result := ComCall(30, this, "uint", index, "ptr", guid, "ptr", pVarVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} memid 
     * @param {Integer} lcid 
     * @param {Pointer<BSTR>} pbstrHelpString 
     * @param {Pointer<UInt32>} pdwHelpStringContext 
     * @param {Pointer<BSTR>} pbstrHelpStringDll 
     * @returns {HRESULT} 
     */
    GetDocumentation2(memid, lcid, pbstrHelpString, pdwHelpStringContext, pbstrHelpStringDll) {
        result := ComCall(31, this, "int", memid, "uint", lcid, "ptr", pbstrHelpString, "uint*", pdwHelpStringContext, "ptr", pbstrHelpStringDll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllCustData(pCustData) {
        result := ComCall(32, this, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllFuncCustData(index, pCustData) {
        result := ComCall(33, this, "uint", index, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} indexFunc 
     * @param {Integer} indexParam 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllParamCustData(indexFunc, indexParam, pCustData) {
        result := ComCall(34, this, "uint", indexFunc, "uint", indexParam, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllVarCustData(index, pCustData) {
        result := ComCall(35, this, "uint", index, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<CUSTDATA>} pCustData 
     * @returns {HRESULT} 
     */
    GetAllImplTypeCustData(index, pCustData) {
        result := ComCall(36, this, "uint", index, "ptr", pCustData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
