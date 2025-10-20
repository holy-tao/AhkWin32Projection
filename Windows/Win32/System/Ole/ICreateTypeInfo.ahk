#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the tools for creating and administering the type information defined through the type description.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreatetypeinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateTypeInfo extends IUnknown{
    /**
     * The interface identifier for ICreateTypeInfo
     * @type {Guid}
     */
    static IID => Guid("{00020405-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     */
    SetGuid(guid) {
        result := ComCall(3, this, "ptr", guid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uTypeFlags 
     * @returns {HRESULT} 
     */
    SetTypeFlags(uTypeFlags) {
        result := ComCall(4, this, "uint", uTypeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pStrDoc 
     * @returns {HRESULT} 
     */
    SetDocString(pStrDoc) {
        pStrDoc := pStrDoc is String ? StrPtr(pStrDoc) : pStrDoc

        result := ComCall(5, this, "ptr", pStrDoc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(6, this, "uint", dwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wMajorVerNum 
     * @param {Integer} wMinorVerNum 
     * @returns {HRESULT} 
     */
    SetVersion(wMajorVerNum, wMinorVerNum) {
        result := ComCall(7, this, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITypeInfo>} pTInfo 
     * @param {Pointer<UInt32>} phRefType 
     * @returns {HRESULT} 
     */
    AddRefTypeInfo(pTInfo, phRefType) {
        result := ComCall(8, this, "ptr", pTInfo, "uint*", phRefType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<FUNCDESC>} pFuncDesc 
     * @returns {HRESULT} 
     */
    AddFuncDesc(index, pFuncDesc) {
        result := ComCall(9, this, "uint", index, "ptr", pFuncDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} hRefType 
     * @returns {HRESULT} 
     */
    AddImplType(index, hRefType) {
        result := ComCall(10, this, "uint", index, "uint", hRefType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} implTypeFlags 
     * @returns {HRESULT} 
     */
    SetImplTypeFlags(index, implTypeFlags) {
        result := ComCall(11, this, "uint", index, "int", implTypeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbAlignment 
     * @returns {HRESULT} 
     */
    SetAlignment(cbAlignment) {
        result := ComCall(12, this, "ushort", cbAlignment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pStrSchema 
     * @returns {HRESULT} 
     */
    SetSchema(pStrSchema) {
        pStrSchema := pStrSchema is String ? StrPtr(pStrSchema) : pStrSchema

        result := ComCall(13, this, "ptr", pStrSchema, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<VARDESC>} pVarDesc 
     * @returns {HRESULT} 
     */
    AddVarDesc(index, pVarDesc) {
        result := ComCall(14, this, "uint", index, "ptr", pVarDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @returns {HRESULT} 
     */
    SetFuncAndParamNames(index, rgszNames, cNames) {
        result := ComCall(15, this, "uint", index, "ptr", rgszNames, "uint", cNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     */
    SetVarName(index, szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(16, this, "uint", index, "ptr", szName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TYPEDESC>} pTDescAlias 
     * @returns {HRESULT} 
     */
    SetTypeDescAlias(pTDescAlias) {
        result := ComCall(17, this, "ptr", pTDescAlias, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDllName 
     * @param {PWSTR} szProcName 
     * @returns {HRESULT} 
     */
    DefineFuncAsDllEntry(index, szDllName, szProcName) {
        szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
        szProcName := szProcName is String ? StrPtr(szProcName) : szProcName

        result := ComCall(18, this, "uint", index, "ptr", szDllName, "ptr", szProcName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDocString 
     * @returns {HRESULT} 
     */
    SetFuncDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(19, this, "uint", index, "ptr", szDocString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDocString 
     * @returns {HRESULT} 
     */
    SetVarDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(20, this, "uint", index, "ptr", szDocString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    SetFuncHelpContext(index, dwHelpContext) {
        result := ComCall(21, this, "uint", index, "uint", dwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     */
    SetVarHelpContext(index, dwHelpContext) {
        result := ComCall(22, this, "uint", index, "uint", dwHelpContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {BSTR} bstrMops 
     * @returns {HRESULT} 
     */
    SetMops(index, bstrMops) {
        bstrMops := bstrMops is String ? BSTR.Alloc(bstrMops).Value : bstrMops

        result := ComCall(23, this, "uint", index, "ptr", bstrMops, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDLDESC>} pIdlDesc 
     * @returns {HRESULT} 
     */
    SetTypeIdldesc(pIdlDesc) {
        result := ComCall(24, this, "ptr", pIdlDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LayOut() {
        result := ComCall(25, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
