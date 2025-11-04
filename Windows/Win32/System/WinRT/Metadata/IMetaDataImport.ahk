#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides methods for importing and manipulating existing metadata from a portable executable (PE) file or other source, such as a type library or a stand-alone, run-time metadata binary.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadataimport
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataImport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataImport
     * @type {Guid}
     */
    static IID => Guid("{7dac8207-d3ae-4c75-9b67-92801a497d44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CloseEnum", "CountEnum", "ResetEnum", "EnumTypeDefs", "EnumInterfaceImpls", "EnumTypeRefs", "FindTypeDefByName", "GetScopeProps", "GetModuleFromScope", "GetTypeDefProps", "GetInterfaceImplProps", "GetTypeRefProps", "ResolveTypeRef", "EnumMembers", "EnumMembersWithName", "EnumMethods", "EnumMethodsWithName", "EnumFields", "EnumFieldsWithName", "EnumParams", "EnumMemberRefs", "EnumMethodImpls", "EnumPermissionSets", "FindMember", "FindMethod", "FindField", "FindMemberRef", "GetMethodProps", "GetMemberRefProps", "EnumProperties", "EnumEvents", "GetEventProps", "EnumMethodSemantics", "GetMethodSemantics", "GetClassLayout", "GetFieldMarshal", "GetRVA", "GetPermissionSetProps", "GetSigFromToken", "GetModuleRefProps", "EnumModuleRefs", "GetTypeSpecFromToken", "GetNameFromToken", "EnumUnresolvedMethods", "GetUserString", "GetPinvokeMap", "EnumSignatures", "EnumTypeSpecs", "EnumUserStrings", "GetParamForMethodIndex", "EnumCustomAttributes", "GetCustomAttributeProps", "FindTypeRef", "GetMemberProps", "GetFieldProps", "GetPropertyProps", "GetParamProps", "GetCustomAttributeByName", "IsValidToken", "GetNestedClassProps", "GetNativeCallConvFromSig", "IsGlobal"]

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-closeenum
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        ComCall(3, this, hEnumMarshal, hEnum)
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-countenum
     */
    CountEnum(hEnum, pulCount) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, hEnumMarshal, hEnum, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Integer} ulPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-resetenum
     */
    ResetEnum(hEnum, ulPos) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, hEnumMarshal, hEnum, "uint", ulPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rTypeDefs 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTypeDefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumtypedefs
     */
    EnumTypeDefs(phEnum, rTypeDefs, cMax, pcTypeDefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeDefsMarshal := rTypeDefs is VarRef ? "uint*" : "ptr"
        pcTypeDefsMarshal := pcTypeDefs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, phEnumMarshal, phEnum, rTypeDefsMarshal, rTypeDefs, "uint", cMax, pcTypeDefsMarshal, pcTypeDefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<Integer>} rImpls 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcImpls 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enuminterfaceimpls
     */
    EnumInterfaceImpls(phEnum, td, rImpls, cMax, pcImpls) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rImplsMarshal := rImpls is VarRef ? "uint*" : "ptr"
        pcImplsMarshal := pcImpls is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, phEnumMarshal, phEnum, "uint", td, rImplsMarshal, rImpls, "uint", cMax, pcImplsMarshal, pcImpls, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rTypeRefs 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTypeRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumtyperefs
     */
    EnumTypeRefs(phEnum, rTypeRefs, cMax, pcTypeRefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeRefsMarshal := rTypeRefs is VarRef ? "uint*" : "ptr"
        pcTypeRefsMarshal := pcTypeRefs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, phEnumMarshal, phEnum, rTypeRefsMarshal, rTypeRefs, "uint", cMax, pcTypeRefsMarshal, pcTypeRefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} tkEnclosingClass 
     * @param {Pointer<Integer>} ptd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-findtypedefbyname
     */
    FindTypeDefByName(szTypeDef, tkEnclosingClass, ptd) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        ptdMarshal := ptd is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", szTypeDef, "uint", tkEnclosingClass, ptdMarshal, ptd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<Guid>} pmvid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getscopeprops
     */
    GetScopeProps(szName, cchName, pchName, pmvid) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "ptr", pmvid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmodulefromscope
     */
    GetModuleFromScope(pmd) {
        pmdMarshal := pmd is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pmdMarshal, pmd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} cchTypeDef 
     * @param {Pointer<Integer>} pchTypeDef 
     * @param {Pointer<Integer>} pdwTypeDefFlags 
     * @param {Pointer<Integer>} ptkExtends 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-gettypedefprops
     */
    GetTypeDefProps(td, szTypeDef, cchTypeDef, pchTypeDef, pdwTypeDefFlags, ptkExtends) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        pchTypeDefMarshal := pchTypeDef is VarRef ? "uint*" : "ptr"
        pdwTypeDefFlagsMarshal := pdwTypeDefFlags is VarRef ? "uint*" : "ptr"
        ptkExtendsMarshal := ptkExtends is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", td, "ptr", szTypeDef, "uint", cchTypeDef, pchTypeDefMarshal, pchTypeDef, pdwTypeDefFlagsMarshal, pdwTypeDefFlags, ptkExtendsMarshal, ptkExtends, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iiImpl 
     * @param {Pointer<Integer>} pClass 
     * @param {Pointer<Integer>} ptkIface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getinterfaceimplprops
     */
    GetInterfaceImplProps(iiImpl, pClass, ptkIface) {
        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        ptkIfaceMarshal := ptkIface is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", iiImpl, pClassMarshal, pClass, ptkIfaceMarshal, ptkIface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<Integer>} ptkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-gettyperefprops
     */
    GetTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkResolutionScopeMarshal := ptkResolutionScope is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", tr, ptkResolutionScopeMarshal, ptkResolutionScope, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppIScope 
     * @param {Pointer<Integer>} ptd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-resolvetyperef
     */
    ResolveTypeRef(tr, riid, ppIScope, ptd) {
        ptdMarshal := ptd is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", tr, "ptr", riid, "ptr*", ppIScope, ptdMarshal, ptd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rMembers 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummembers
     */
    EnumMembers(phEnum, cl, rMembers, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMembersMarshal := rMembers is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, phEnumMarshal, phEnum, "uint", cl, rMembersMarshal, rMembers, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} rMembers 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummemberswithname
     */
    EnumMembersWithName(phEnum, cl, szName, rMembers, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMembersMarshal := rMembers is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, phEnumMarshal, phEnum, "uint", cl, "ptr", szName, rMembersMarshal, rMembers, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummethods
     */
    EnumMethods(phEnum, cl, rMethods, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodsMarshal := rMethods is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, phEnumMarshal, phEnum, "uint", cl, rMethodsMarshal, rMethods, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummethodswithname
     */
    EnumMethodsWithName(phEnum, cl, szName, rMethods, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodsMarshal := rMethods is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, phEnumMarshal, phEnum, "uint", cl, "ptr", szName, rMethodsMarshal, rMethods, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rFields 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumfields
     */
    EnumFields(phEnum, cl, rFields, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rFieldsMarshal := rFields is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, phEnumMarshal, phEnum, "uint", cl, rFieldsMarshal, rFields, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} rFields 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumfieldswithname
     */
    EnumFieldsWithName(phEnum, cl, szName, rFields, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rFieldsMarshal := rFields is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, phEnumMarshal, phEnum, "uint", cl, "ptr", szName, rFieldsMarshal, rFields, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} mb 
     * @param {Pointer<Integer>} rParams 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumparams
     */
    EnumParams(phEnum, mb, rParams, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rParamsMarshal := rParams is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, phEnumMarshal, phEnum, "uint", mb, rParamsMarshal, rParams, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tkParent 
     * @param {Pointer<Integer>} rMemberRefs 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummemberrefs
     */
    EnumMemberRefs(phEnum, tkParent, rMemberRefs, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMemberRefsMarshal := rMemberRefs is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, phEnumMarshal, phEnum, "uint", tkParent, rMemberRefsMarshal, rMemberRefs, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<Integer>} rMethodBody 
     * @param {Pointer<Integer>} rMethodDecl 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummethodimpls
     */
    EnumMethodImpls(phEnum, td, rMethodBody, rMethodDecl, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodBodyMarshal := rMethodBody is VarRef ? "uint*" : "ptr"
        rMethodDeclMarshal := rMethodDecl is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, phEnumMarshal, phEnum, "uint", td, rMethodBodyMarshal, rMethodBody, rMethodDeclMarshal, rMethodDecl, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tk 
     * @param {Integer} dwActions 
     * @param {Pointer<Integer>} rPermission 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumpermissionsets
     */
    EnumPermissionSets(phEnum, tk, dwActions, rPermission, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rPermissionMarshal := rPermission is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, phEnumMarshal, phEnum, "uint", tk, "uint", dwActions, rPermissionMarshal, rPermission, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmb 
     * @returns {HRESULT} 
     */
    FindMember(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmbMarshal := pmb is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "uint", td, "ptr", szName, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmbMarshal, pmb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmb 
     * @returns {HRESULT} 
     */
    FindMethod(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmbMarshal := pmb is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, "uint", td, "ptr", szName, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmbMarshal, pmb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmb 
     * @returns {HRESULT} 
     */
    FindField(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmbMarshal := pmb is VarRef ? "uint*" : "ptr"

        result := ComCall(28, this, "uint", td, "ptr", szName, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmbMarshal, pmb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<Integer>} pmr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-findmemberref
     */
    FindMemberRef(td, szName, pvSigBlob, cbSigBlob, pmr) {
        szName := szName is String ? StrPtr(szName) : szName

        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmrMarshal := pmr is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "uint", td, "ptr", szName, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmrMarshal, pmr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szMethod 
     * @param {Integer} cchMethod 
     * @param {Pointer<Integer>} pchMethod 
     * @param {Pointer<Integer>} pdwAttr 
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob 
     * @param {Pointer<Integer>} pcbSigBlob 
     * @param {Pointer<Integer>} pulCodeRVA 
     * @param {Pointer<Integer>} pdwImplFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmethodprops
     */
    GetMethodProps(mb, pClass, szMethod, cchMethod, pchMethod, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags) {
        szMethod := szMethod is String ? StrPtr(szMethod) : szMethod

        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        pchMethodMarshal := pchMethod is VarRef ? "uint*" : "ptr"
        pdwAttrMarshal := pdwAttr is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pcbSigBlobMarshal := pcbSigBlob is VarRef ? "uint*" : "ptr"
        pulCodeRVAMarshal := pulCodeRVA is VarRef ? "uint*" : "ptr"
        pdwImplFlagsMarshal := pdwImplFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "uint", mb, pClassMarshal, pClass, "ptr", szMethod, "uint", cchMethod, pchMethodMarshal, pchMethod, pdwAttrMarshal, pdwAttr, ppvSigBlobMarshal, ppvSigBlob, pcbSigBlobMarshal, pcbSigBlob, pulCodeRVAMarshal, pulCodeRVA, pdwImplFlagsMarshal, pdwImplFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mr 
     * @param {Pointer<Integer>} ptk 
     * @param {PWSTR} szMember 
     * @param {Integer} cchMember 
     * @param {Pointer<Integer>} pchMember 
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob 
     * @param {Pointer<Integer>} pbSig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmemberrefprops
     */
    GetMemberRefProps(mr, ptk, szMember, cchMember, pchMember, ppvSigBlob, pbSig) {
        szMember := szMember is String ? StrPtr(szMember) : szMember

        ptkMarshal := ptk is VarRef ? "uint*" : "ptr"
        pchMemberMarshal := pchMember is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pbSigMarshal := pbSig is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", mr, ptkMarshal, ptk, "ptr", szMember, "uint", cchMember, pchMemberMarshal, pchMember, ppvSigBlobMarshal, ppvSigBlob, pbSigMarshal, pbSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<Integer>} rProperties 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumproperties
     */
    EnumProperties(phEnum, td, rProperties, cMax, pcProperties) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rPropertiesMarshal := rProperties is VarRef ? "uint*" : "ptr"
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, phEnumMarshal, phEnum, "uint", td, rPropertiesMarshal, rProperties, "uint", cMax, pcPropertiesMarshal, pcProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<Integer>} rEvents 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumevents
     */
    EnumEvents(phEnum, td, rEvents, cMax, pcEvents) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rEventsMarshal := rEvents is VarRef ? "uint*" : "ptr"
        pcEventsMarshal := pcEvents is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, phEnumMarshal, phEnum, "uint", td, rEventsMarshal, rEvents, "uint", cMax, pcEventsMarshal, pcEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ev 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szEvent 
     * @param {Integer} cchEvent 
     * @param {Pointer<Integer>} pchEvent 
     * @param {Pointer<Integer>} pdwEventFlags 
     * @param {Pointer<Integer>} ptkEventType 
     * @param {Pointer<Integer>} pmdAddOn 
     * @param {Pointer<Integer>} pmdRemoveOn 
     * @param {Pointer<Integer>} pmdFire 
     * @param {Pointer<Integer>} rmdOtherMethod 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcOtherMethod 
     * @returns {HRESULT} 
     */
    GetEventProps(ev, pClass, szEvent, cchEvent, pchEvent, pdwEventFlags, ptkEventType, pmdAddOn, pmdRemoveOn, pmdFire, rmdOtherMethod, cMax, pcOtherMethod) {
        szEvent := szEvent is String ? StrPtr(szEvent) : szEvent

        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        pchEventMarshal := pchEvent is VarRef ? "uint*" : "ptr"
        pdwEventFlagsMarshal := pdwEventFlags is VarRef ? "uint*" : "ptr"
        ptkEventTypeMarshal := ptkEventType is VarRef ? "uint*" : "ptr"
        pmdAddOnMarshal := pmdAddOn is VarRef ? "uint*" : "ptr"
        pmdRemoveOnMarshal := pmdRemoveOn is VarRef ? "uint*" : "ptr"
        pmdFireMarshal := pmdFire is VarRef ? "uint*" : "ptr"
        rmdOtherMethodMarshal := rmdOtherMethod is VarRef ? "uint*" : "ptr"
        pcOtherMethodMarshal := pcOtherMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, "uint", ev, pClassMarshal, pClass, "ptr", szEvent, "uint", cchEvent, pchEventMarshal, pchEvent, pdwEventFlagsMarshal, pdwEventFlags, ptkEventTypeMarshal, ptkEventType, pmdAddOnMarshal, pmdAddOn, pmdRemoveOnMarshal, pmdRemoveOn, pmdFireMarshal, pmdFire, rmdOtherMethodMarshal, rmdOtherMethod, "uint", cMax, pcOtherMethodMarshal, pcOtherMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} mb 
     * @param {Pointer<Integer>} rEventProp 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcEventProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummethodsemantics
     */
    EnumMethodSemantics(phEnum, mb, rEventProp, cMax, pcEventProp) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rEventPropMarshal := rEventProp is VarRef ? "uint*" : "ptr"
        pcEventPropMarshal := pcEventProp is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, phEnumMarshal, phEnum, "uint", mb, rEventPropMarshal, rEventProp, "uint", cMax, pcEventPropMarshal, pcEventProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Integer} tkEventProp 
     * @param {Pointer<Integer>} pdwSemanticsFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmethodsemantics
     */
    GetMethodSemantics(mb, tkEventProp, pdwSemanticsFlags) {
        pdwSemanticsFlagsMarshal := pdwSemanticsFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "uint", mb, "uint", tkEventProp, pdwSemanticsFlagsMarshal, pdwSemanticsFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {Pointer<Integer>} pdwPackSize 
     * @param {Pointer<COR_FIELD_OFFSET>} rFieldOffset 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcFieldOffset 
     * @param {Pointer<Integer>} pulClassSize 
     * @returns {HRESULT} 
     */
    GetClassLayout(td, pdwPackSize, rFieldOffset, cMax, pcFieldOffset, pulClassSize) {
        pdwPackSizeMarshal := pdwPackSize is VarRef ? "uint*" : "ptr"
        pcFieldOffsetMarshal := pcFieldOffset is VarRef ? "uint*" : "ptr"
        pulClassSizeMarshal := pulClassSize is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", td, pdwPackSizeMarshal, pdwPackSize, "ptr", rFieldOffset, "uint", cMax, pcFieldOffsetMarshal, pcFieldOffset, pulClassSizeMarshal, pulClassSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Pointer<Integer>>} ppvNativeType 
     * @param {Pointer<Integer>} pcbNativeType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getfieldmarshal
     */
    GetFieldMarshal(tk, ppvNativeType, pcbNativeType) {
        ppvNativeTypeMarshal := ppvNativeType is VarRef ? "ptr*" : "ptr"
        pcbNativeTypeMarshal := pcbNativeType is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "uint", tk, ppvNativeTypeMarshal, ppvNativeType, pcbNativeTypeMarshal, pcbNativeType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} pulCodeRVA 
     * @param {Pointer<Integer>} pdwImplFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getrva
     */
    GetRVA(tk, pulCodeRVA, pdwImplFlags) {
        pulCodeRVAMarshal := pulCodeRVA is VarRef ? "uint*" : "ptr"
        pdwImplFlagsMarshal := pdwImplFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "uint", tk, pulCodeRVAMarshal, pulCodeRVA, pdwImplFlagsMarshal, pdwImplFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pm 
     * @param {Pointer<Integer>} pdwAction 
     * @param {Pointer<Pointer<Void>>} ppvPermission 
     * @param {Pointer<Integer>} pcbPermission 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getpermissionsetprops
     */
    GetPermissionSetProps(pm, pdwAction, ppvPermission, pcbPermission) {
        pdwActionMarshal := pdwAction is VarRef ? "uint*" : "ptr"
        ppvPermissionMarshal := ppvPermission is VarRef ? "ptr*" : "ptr"
        pcbPermissionMarshal := pcbPermission is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "uint", pm, pdwActionMarshal, pdwAction, ppvPermissionMarshal, ppvPermission, pcbPermissionMarshal, pcbPermission, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mdSig 
     * @param {Pointer<Pointer<Integer>>} ppvSig 
     * @param {Pointer<Integer>} pcbSig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getsigfromtoken
     */
    GetSigFromToken(mdSig, ppvSig, pcbSig) {
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pcbSigMarshal := pcbSig is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "uint", mdSig, ppvSigMarshal, ppvSig, pcbSigMarshal, pcbSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mur 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmodulerefprops
     */
    GetModuleRefProps(mur, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, "uint", mur, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rModuleRefs 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcModuleRefs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enummodulerefs
     */
    EnumModuleRefs(phEnum, rModuleRefs, cmax, pcModuleRefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rModuleRefsMarshal := rModuleRefs is VarRef ? "uint*" : "ptr"
        pcModuleRefsMarshal := pcModuleRefs is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, phEnumMarshal, phEnum, rModuleRefsMarshal, rModuleRefs, "uint", cmax, pcModuleRefsMarshal, pcModuleRefs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} typespec 
     * @param {Pointer<Pointer<Integer>>} ppvSig 
     * @param {Pointer<Integer>} pcbSig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-gettypespecfromtoken
     */
    GetTypeSpecFromToken(typespec, ppvSig, pcbSig) {
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pcbSigMarshal := pcbSig is VarRef ? "uint*" : "ptr"

        result := ComCall(44, this, "uint", typespec, ppvSigMarshal, ppvSig, pcbSigMarshal, pcbSig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Pointer<Integer>>} pszUtf8NamePtr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getnamefromtoken
     */
    GetNameFromToken(tk, pszUtf8NamePtr) {
        pszUtf8NamePtrMarshal := pszUtf8NamePtr is VarRef ? "ptr*" : "ptr"

        result := ComCall(45, this, "uint", tk, pszUtf8NamePtrMarshal, pszUtf8NamePtr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumunresolvedmethods
     */
    EnumUnresolvedMethods(phEnum, rMethods, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodsMarshal := rMethods is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, phEnumMarshal, phEnum, rMethodsMarshal, rMethods, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} stk 
     * @param {PWSTR} szString 
     * @param {Integer} cchString 
     * @param {Pointer<Integer>} pchString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getuserstring
     */
    GetUserString(stk, szString, cchString, pchString) {
        szString := szString is String ? StrPtr(szString) : szString

        pchStringMarshal := pchString is VarRef ? "uint*" : "ptr"

        result := ComCall(47, this, "uint", stk, "ptr", szString, "uint", cchString, pchStringMarshal, pchString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} pdwMappingFlags 
     * @param {PWSTR} szImportName 
     * @param {Integer} cchImportName 
     * @param {Pointer<Integer>} pchImportName 
     * @param {Pointer<Integer>} pmrImportDLL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getpinvokemap
     */
    GetPinvokeMap(tk, pdwMappingFlags, szImportName, cchImportName, pchImportName, pmrImportDLL) {
        szImportName := szImportName is String ? StrPtr(szImportName) : szImportName

        pdwMappingFlagsMarshal := pdwMappingFlags is VarRef ? "uint*" : "ptr"
        pchImportNameMarshal := pchImportName is VarRef ? "uint*" : "ptr"
        pmrImportDLLMarshal := pmrImportDLL is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, "uint", tk, pdwMappingFlagsMarshal, pdwMappingFlags, "ptr", szImportName, "uint", cchImportName, pchImportNameMarshal, pchImportName, pmrImportDLLMarshal, pmrImportDLL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rSignatures 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcSignatures 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumsignatures
     */
    EnumSignatures(phEnum, rSignatures, cmax, pcSignatures) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rSignaturesMarshal := rSignatures is VarRef ? "uint*" : "ptr"
        pcSignaturesMarshal := pcSignatures is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, phEnumMarshal, phEnum, rSignaturesMarshal, rSignatures, "uint", cmax, pcSignaturesMarshal, pcSignatures, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rTypeSpecs 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcTypeSpecs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumtypespecs
     */
    EnumTypeSpecs(phEnum, rTypeSpecs, cmax, pcTypeSpecs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeSpecsMarshal := rTypeSpecs is VarRef ? "uint*" : "ptr"
        pcTypeSpecsMarshal := pcTypeSpecs is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, phEnumMarshal, phEnum, rTypeSpecsMarshal, rTypeSpecs, "uint", cmax, pcTypeSpecsMarshal, pcTypeSpecs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rStrings 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcStrings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumuserstrings
     */
    EnumUserStrings(phEnum, rStrings, cmax, pcStrings) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rStringsMarshal := rStrings is VarRef ? "uint*" : "ptr"
        pcStringsMarshal := pcStrings is VarRef ? "uint*" : "ptr"

        result := ComCall(51, this, phEnumMarshal, phEnum, rStringsMarshal, rStrings, "uint", cmax, pcStringsMarshal, pcStrings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} ulParamSeq 
     * @param {Pointer<Integer>} ppd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getparamformethodindex
     */
    GetParamForMethodIndex(md, ulParamSeq, ppd) {
        ppdMarshal := ppd is VarRef ? "uint*" : "ptr"

        result := ComCall(52, this, "uint", md, "uint", ulParamSeq, ppdMarshal, ppd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Integer} tk 
     * @param {Integer} tkType 
     * @param {Pointer<Integer>} rCustomAttributes 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcCustomAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-enumcustomattributes
     */
    EnumCustomAttributes(phEnum, tk, tkType, rCustomAttributes, cMax, pcCustomAttributes) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rCustomAttributesMarshal := rCustomAttributes is VarRef ? "uint*" : "ptr"
        pcCustomAttributesMarshal := pcCustomAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(53, this, phEnumMarshal, phEnum, "uint", tk, "uint", tkType, rCustomAttributesMarshal, rCustomAttributes, "uint", cMax, pcCustomAttributesMarshal, pcCustomAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cv 
     * @param {Pointer<Integer>} ptkObj 
     * @param {Pointer<Integer>} ptkType 
     * @param {Pointer<Pointer<Void>>} ppBlob 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getcustomattributeprops
     */
    GetCustomAttributeProps(cv, ptkObj, ptkType, ppBlob, pcbSize) {
        ptkObjMarshal := ptkObj is VarRef ? "uint*" : "ptr"
        ptkTypeMarshal := ptkType is VarRef ? "uint*" : "ptr"
        ppBlobMarshal := ppBlob is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(54, this, "uint", cv, ptkObjMarshal, ptkObj, ptkTypeMarshal, ptkType, ppBlobMarshal, ppBlob, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} ptr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-findtyperef
     */
    FindTypeRef(tkResolutionScope, szName, ptr) {
        szName := szName is String ? StrPtr(szName) : szName

        ptrMarshal := ptr is VarRef ? "uint*" : "ptr"

        result := ComCall(55, this, "uint", tkResolutionScope, "ptr", szName, ptrMarshal, ptr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szMember 
     * @param {Integer} cchMember 
     * @param {Pointer<Integer>} pchMember 
     * @param {Pointer<Integer>} pdwAttr 
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob 
     * @param {Pointer<Integer>} pcbSigBlob 
     * @param {Pointer<Integer>} pulCodeRVA 
     * @param {Pointer<Integer>} pdwImplFlags 
     * @param {Pointer<Integer>} pdwCPlusTypeFlag 
     * @param {Pointer<Pointer<Void>>} ppValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmemberprops
     */
    GetMemberProps(mb, pClass, szMember, cchMember, pchMember, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szMember := szMember is String ? StrPtr(szMember) : szMember

        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        pchMemberMarshal := pchMember is VarRef ? "uint*" : "ptr"
        pdwAttrMarshal := pdwAttr is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pcbSigBlobMarshal := pcbSigBlob is VarRef ? "uint*" : "ptr"
        pulCodeRVAMarshal := pulCodeRVA is VarRef ? "uint*" : "ptr"
        pdwImplFlagsMarshal := pdwImplFlags is VarRef ? "uint*" : "ptr"
        pdwCPlusTypeFlagMarshal := pdwCPlusTypeFlag is VarRef ? "uint*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "uint*" : "ptr"

        result := ComCall(56, this, "uint", mb, pClassMarshal, pClass, "ptr", szMember, "uint", cchMember, pchMemberMarshal, pchMember, pdwAttrMarshal, pdwAttr, ppvSigBlobMarshal, ppvSigBlob, pcbSigBlobMarshal, pcbSigBlob, pulCodeRVAMarshal, pulCodeRVA, pdwImplFlagsMarshal, pdwImplFlags, pdwCPlusTypeFlagMarshal, pdwCPlusTypeFlag, ppValueMarshal, ppValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szField 
     * @param {Integer} cchField 
     * @param {Pointer<Integer>} pchField 
     * @param {Pointer<Integer>} pdwAttr 
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob 
     * @param {Pointer<Integer>} pcbSigBlob 
     * @param {Pointer<Integer>} pdwCPlusTypeFlag 
     * @param {Pointer<Pointer<Void>>} ppValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getfieldprops
     */
    GetFieldProps(mb, pClass, szField, cchField, pchField, pdwAttr, ppvSigBlob, pcbSigBlob, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szField := szField is String ? StrPtr(szField) : szField

        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        pchFieldMarshal := pchField is VarRef ? "uint*" : "ptr"
        pdwAttrMarshal := pdwAttr is VarRef ? "uint*" : "ptr"
        ppvSigBlobMarshal := ppvSigBlob is VarRef ? "ptr*" : "ptr"
        pcbSigBlobMarshal := pcbSigBlob is VarRef ? "uint*" : "ptr"
        pdwCPlusTypeFlagMarshal := pdwCPlusTypeFlag is VarRef ? "uint*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "uint*" : "ptr"

        result := ComCall(57, this, "uint", mb, pClassMarshal, pClass, "ptr", szField, "uint", cchField, pchFieldMarshal, pchField, pdwAttrMarshal, pdwAttr, ppvSigBlobMarshal, ppvSigBlob, pcbSigBlobMarshal, pcbSigBlob, pdwCPlusTypeFlagMarshal, pdwCPlusTypeFlag, ppValueMarshal, ppValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} prop 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szProperty 
     * @param {Integer} cchProperty 
     * @param {Pointer<Integer>} pchProperty 
     * @param {Pointer<Integer>} pdwPropFlags 
     * @param {Pointer<Pointer<Integer>>} ppvSig 
     * @param {Pointer<Integer>} pbSig 
     * @param {Pointer<Integer>} pdwCPlusTypeFlag 
     * @param {Pointer<Pointer<Void>>} ppDefaultValue 
     * @param {Pointer<Integer>} pcchDefaultValue 
     * @param {Pointer<Integer>} pmdSetter 
     * @param {Pointer<Integer>} pmdGetter 
     * @param {Pointer<Integer>} rmdOtherMethod 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcOtherMethod 
     * @returns {HRESULT} 
     */
    GetPropertyProps(prop, pClass, szProperty, cchProperty, pchProperty, pdwPropFlags, ppvSig, pbSig, pdwCPlusTypeFlag, ppDefaultValue, pcchDefaultValue, pmdSetter, pmdGetter, rmdOtherMethod, cMax, pcOtherMethod) {
        szProperty := szProperty is String ? StrPtr(szProperty) : szProperty

        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        pchPropertyMarshal := pchProperty is VarRef ? "uint*" : "ptr"
        pdwPropFlagsMarshal := pdwPropFlags is VarRef ? "uint*" : "ptr"
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pbSigMarshal := pbSig is VarRef ? "uint*" : "ptr"
        pdwCPlusTypeFlagMarshal := pdwCPlusTypeFlag is VarRef ? "uint*" : "ptr"
        ppDefaultValueMarshal := ppDefaultValue is VarRef ? "ptr*" : "ptr"
        pcchDefaultValueMarshal := pcchDefaultValue is VarRef ? "uint*" : "ptr"
        pmdSetterMarshal := pmdSetter is VarRef ? "uint*" : "ptr"
        pmdGetterMarshal := pmdGetter is VarRef ? "uint*" : "ptr"
        rmdOtherMethodMarshal := rmdOtherMethod is VarRef ? "uint*" : "ptr"
        pcOtherMethodMarshal := pcOtherMethod is VarRef ? "uint*" : "ptr"

        result := ComCall(58, this, "uint", prop, pClassMarshal, pClass, "ptr", szProperty, "uint", cchProperty, pchPropertyMarshal, pchProperty, pdwPropFlagsMarshal, pdwPropFlags, ppvSigMarshal, ppvSig, pbSigMarshal, pbSig, pdwCPlusTypeFlagMarshal, pdwCPlusTypeFlag, ppDefaultValueMarshal, ppDefaultValue, pcchDefaultValueMarshal, pcchDefaultValue, pmdSetterMarshal, pmdSetter, pmdGetterMarshal, pmdGetter, rmdOtherMethodMarshal, rmdOtherMethod, "uint", cMax, pcOtherMethodMarshal, pcOtherMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Integer>} pmd 
     * @param {Pointer<Integer>} pulSequence 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<Integer>} pdwAttr 
     * @param {Pointer<Integer>} pdwCPlusTypeFlag 
     * @param {Pointer<Pointer<Void>>} ppValue 
     * @param {Pointer<Integer>} pcchValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getparamprops
     */
    GetParamProps(tk, pmd, pulSequence, szName, cchName, pchName, pdwAttr, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szName := szName is String ? StrPtr(szName) : szName

        pmdMarshal := pmd is VarRef ? "uint*" : "ptr"
        pulSequenceMarshal := pulSequence is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        pdwAttrMarshal := pdwAttr is VarRef ? "uint*" : "ptr"
        pdwCPlusTypeFlagMarshal := pdwCPlusTypeFlag is VarRef ? "uint*" : "ptr"
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcchValueMarshal := pcchValue is VarRef ? "uint*" : "ptr"

        result := ComCall(59, this, "uint", tk, pmdMarshal, pmd, pulSequenceMarshal, pulSequence, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, pdwAttrMarshal, pdwAttr, pdwCPlusTypeFlagMarshal, pdwCPlusTypeFlag, ppValueMarshal, ppValue, pcchValueMarshal, pcchValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tkObj 
     * @param {PWSTR} szName 
     * @param {Pointer<Pointer<Void>>} ppData 
     * @param {Pointer<Integer>} pcbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getcustomattributebyname
     */
    GetCustomAttributeByName(tkObj, szName, ppData, pcbData) {
        szName := szName is String ? StrPtr(szName) : szName

        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, "uint", tkObj, "ptr", szName, ppDataMarshal, ppData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-isvalidtoken
     */
    IsValidToken(tk) {
        result := ComCall(61, this, "uint", tk, "int")
        return result
    }

    /**
     * 
     * @param {Integer} tdNestedClass 
     * @param {Pointer<Integer>} ptdEnclosingClass 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getnestedclassprops
     */
    GetNestedClassProps(tdNestedClass, ptdEnclosingClass) {
        ptdEnclosingClassMarshal := ptdEnclosingClass is VarRef ? "uint*" : "ptr"

        result := ComCall(62, this, "uint", tdNestedClass, ptdEnclosingClassMarshal, ptdEnclosingClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvSig 
     * @param {Integer} cbSig 
     * @param {Pointer<Integer>} pCallConv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getnativecallconvfromsig
     */
    GetNativeCallConvFromSig(pvSig, cbSig, pCallConv) {
        pvSigMarshal := pvSig is VarRef ? "ptr" : "ptr"
        pCallConvMarshal := pCallConv is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, pvSigMarshal, pvSig, "uint", cbSig, pCallConvMarshal, pCallConv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pd 
     * @param {Pointer<Integer>} pbGlobal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-isglobal
     */
    IsGlobal(pd, pbGlobal) {
        pbGlobalMarshal := pbGlobal is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, "uint", pd, pbGlobalMarshal, pbGlobal, "HRESULT")
        return result
    }
}
