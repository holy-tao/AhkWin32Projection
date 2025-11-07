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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGuid", "SetTypeFlags", "SetDocString", "SetHelpContext", "SetVersion", "AddRefTypeInfo", "AddFuncDesc", "AddImplType", "SetImplTypeFlags", "SetAlignment", "SetSchema", "AddVarDesc", "SetFuncAndParamNames", "SetVarName", "SetTypeDescAlias", "DefineFuncAsDllEntry", "SetFuncDocString", "SetVarDocString", "SetFuncHelpContext", "SetVarHelpContext", "SetMops", "SetTypeIdldesc", "LayOut"]

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setguid
     */
    SetGuid(guid) {
        result := ComCall(3, this, "ptr", guid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uTypeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-settypeflags
     */
    SetTypeFlags(uTypeFlags) {
        result := ComCall(4, this, "uint", uTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pStrDoc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setdocstring
     */
    SetDocString(pStrDoc) {
        pStrDoc := pStrDoc is String ? StrPtr(pStrDoc) : pStrDoc

        result := ComCall(5, this, "ptr", pStrDoc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(6, this, "uint", dwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wMajorVerNum 
     * @param {Integer} wMinorVerNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setversion
     */
    SetVersion(wMajorVerNum, wMinorVerNum) {
        result := ComCall(7, this, "ushort", wMajorVerNum, "ushort", wMinorVerNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITypeInfo} pTInfo 
     * @param {Pointer<Integer>} phRefType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-addreftypeinfo
     */
    AddRefTypeInfo(pTInfo, phRefType) {
        phRefTypeMarshal := phRefType is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pTInfo, phRefTypeMarshal, phRefType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<FUNCDESC>} pFuncDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-addfuncdesc
     */
    AddFuncDesc(index, pFuncDesc) {
        result := ComCall(9, this, "uint", index, "ptr", pFuncDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} hRefType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-addimpltype
     */
    AddImplType(index, hRefType) {
        result := ComCall(10, this, "uint", index, "uint", hRefType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} implTypeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setimpltypeflags
     */
    SetImplTypeFlags(index, implTypeFlags) {
        result := ComCall(11, this, "uint", index, "int", implTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbAlignment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setalignment
     */
    SetAlignment(cbAlignment) {
        result := ComCall(12, this, "ushort", cbAlignment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pStrSchema 
     * @returns {HRESULT} 
     */
    SetSchema(pStrSchema) {
        pStrSchema := pStrSchema is String ? StrPtr(pStrSchema) : pStrSchema

        result := ComCall(13, this, "ptr", pStrSchema, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<VARDESC>} pVarDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-addvardesc
     */
    AddVarDesc(index, pVarDesc) {
        result := ComCall(14, this, "uint", index, "ptr", pVarDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PWSTR>} rgszNames 
     * @param {Integer} cNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setfuncandparamnames
     */
    SetFuncAndParamNames(index, rgszNames, cNames) {
        rgszNamesMarshal := rgszNames is VarRef ? "ptr*" : "ptr"

        result := ComCall(15, this, "uint", index, rgszNamesMarshal, rgszNames, "uint", cNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setvarname
     */
    SetVarName(index, szName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(16, this, "uint", index, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TYPEDESC>} pTDescAlias 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-settypedescalias
     */
    SetTypeDescAlias(pTDescAlias) {
        result := ComCall(17, this, "ptr", pTDescAlias, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDllName 
     * @param {PWSTR} szProcName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-definefuncasdllentry
     */
    DefineFuncAsDllEntry(index, szDllName, szProcName) {
        szDllName := szDllName is String ? StrPtr(szDllName) : szDllName
        szProcName := szProcName is String ? StrPtr(szProcName) : szProcName

        result := ComCall(18, this, "uint", index, "ptr", szDllName, "ptr", szProcName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDocString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setfuncdocstring
     */
    SetFuncDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(19, this, "uint", index, "ptr", szDocString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {PWSTR} szDocString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setvardocstring
     */
    SetVarDocString(index, szDocString) {
        szDocString := szDocString is String ? StrPtr(szDocString) : szDocString

        result := ComCall(20, this, "uint", index, "ptr", szDocString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setfunchelpcontext
     */
    SetFuncHelpContext(index, dwHelpContext) {
        result := ComCall(21, this, "uint", index, "uint", dwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setvarhelpcontext
     */
    SetVarHelpContext(index, dwHelpContext) {
        result := ComCall(22, this, "uint", index, "uint", dwHelpContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {BSTR} bstrMops 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-setmops
     */
    SetMops(index, bstrMops) {
        bstrMops := bstrMops is String ? BSTR.Alloc(bstrMops).Value : bstrMops

        result := ComCall(23, this, "uint", index, "ptr", bstrMops, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDLDESC>} pIdlDesc 
     * @returns {HRESULT} 
     */
    SetTypeIdldesc(pIdlDesc) {
        result := ComCall(24, this, "ptr", pIdlDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreatetypeinfo-layout
     */
    LayOut() {
        result := ComCall(25, this, "HRESULT")
        return result
    }
}
