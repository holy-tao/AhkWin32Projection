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
        ComCall(3, this, "ptr", hEnum)
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-countenum
     */
    CountEnum(hEnum, pulCount) {
        result := ComCall(4, this, "ptr", hEnum, "uint*", pulCount, "HRESULT")
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
        result := ComCall(5, this, "ptr", hEnum, "uint", ulPos, "HRESULT")
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
        result := ComCall(6, this, "ptr*", phEnum, "uint*", rTypeDefs, "uint", cMax, "uint*", pcTypeDefs, "HRESULT")
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
        result := ComCall(7, this, "ptr*", phEnum, "uint", td, "uint*", rImpls, "uint", cMax, "uint*", pcImpls, "HRESULT")
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
        result := ComCall(8, this, "ptr*", phEnum, "uint*", rTypeRefs, "uint", cMax, "uint*", pcTypeRefs, "HRESULT")
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

        result := ComCall(9, this, "ptr", szTypeDef, "uint", tkEnclosingClass, "uint*", ptd, "HRESULT")
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

        result := ComCall(10, this, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pmvid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataimport-getmodulefromscope
     */
    GetModuleFromScope(pmd) {
        result := ComCall(11, this, "uint*", pmd, "HRESULT")
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

        result := ComCall(12, this, "uint", td, "ptr", szTypeDef, "uint", cchTypeDef, "uint*", pchTypeDef, "uint*", pdwTypeDefFlags, "uint*", ptkExtends, "HRESULT")
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
        result := ComCall(13, this, "uint", iiImpl, "uint*", pClass, "uint*", ptkIface, "HRESULT")
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

        result := ComCall(14, this, "uint", tr, "uint*", ptkResolutionScope, "ptr", szName, "uint", cchName, "uint*", pchName, "HRESULT")
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
        result := ComCall(15, this, "uint", tr, "ptr", riid, "ptr*", ppIScope, "uint*", ptd, "HRESULT")
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
        result := ComCall(16, this, "ptr*", phEnum, "uint", cl, "uint*", rMembers, "uint", cMax, "uint*", pcTokens, "HRESULT")
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

        result := ComCall(17, this, "ptr*", phEnum, "uint", cl, "ptr", szName, "uint*", rMembers, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(18, this, "ptr*", phEnum, "uint", cl, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "HRESULT")
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

        result := ComCall(19, this, "ptr*", phEnum, "uint", cl, "ptr", szName, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(20, this, "ptr*", phEnum, "uint", cl, "uint*", rFields, "uint", cMax, "uint*", pcTokens, "HRESULT")
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

        result := ComCall(21, this, "ptr*", phEnum, "uint", cl, "ptr", szName, "uint*", rFields, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(22, this, "ptr*", phEnum, "uint", mb, "uint*", rParams, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(23, this, "ptr*", phEnum, "uint", tkParent, "uint*", rMemberRefs, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(24, this, "ptr*", phEnum, "uint", td, "uint*", rMethodBody, "uint*", rMethodDecl, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(25, this, "ptr*", phEnum, "uint", tk, "uint", dwActions, "uint*", rPermission, "uint", cMax, "uint*", pcTokens, "HRESULT")
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

        result := ComCall(26, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "HRESULT")
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

        result := ComCall(27, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "HRESULT")
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

        result := ComCall(28, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "HRESULT")
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

        result := ComCall(29, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmr, "HRESULT")
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

        result := ComCall(30, this, "uint", mb, "uint*", pClass, "ptr", szMethod, "uint", cchMethod, "uint*", pchMethod, "uint*", pdwAttr, "ptr*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "HRESULT")
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

        result := ComCall(31, this, "uint", mr, "uint*", ptk, "ptr", szMember, "uint", cchMember, "uint*", pchMember, "ptr*", ppvSigBlob, "uint*", pbSig, "HRESULT")
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
        result := ComCall(32, this, "ptr*", phEnum, "uint", td, "uint*", rProperties, "uint", cMax, "uint*", pcProperties, "HRESULT")
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
        result := ComCall(33, this, "ptr*", phEnum, "uint", td, "uint*", rEvents, "uint", cMax, "uint*", pcEvents, "HRESULT")
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

        result := ComCall(34, this, "uint", ev, "uint*", pClass, "ptr", szEvent, "uint", cchEvent, "uint*", pchEvent, "uint*", pdwEventFlags, "uint*", ptkEventType, "uint*", pmdAddOn, "uint*", pmdRemoveOn, "uint*", pmdFire, "uint*", rmdOtherMethod, "uint", cMax, "uint*", pcOtherMethod, "HRESULT")
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
        result := ComCall(35, this, "ptr*", phEnum, "uint", mb, "uint*", rEventProp, "uint", cMax, "uint*", pcEventProp, "HRESULT")
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
        result := ComCall(36, this, "uint", mb, "uint", tkEventProp, "uint*", pdwSemanticsFlags, "HRESULT")
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
        result := ComCall(37, this, "uint", td, "uint*", pdwPackSize, "ptr", rFieldOffset, "uint", cMax, "uint*", pcFieldOffset, "uint*", pulClassSize, "HRESULT")
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
        result := ComCall(38, this, "uint", tk, "ptr*", ppvNativeType, "uint*", pcbNativeType, "HRESULT")
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
        result := ComCall(39, this, "uint", tk, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "HRESULT")
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
        result := ComCall(40, this, "uint", pm, "uint*", pdwAction, "ptr*", ppvPermission, "uint*", pcbPermission, "HRESULT")
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
        result := ComCall(41, this, "uint", mdSig, "ptr*", ppvSig, "uint*", pcbSig, "HRESULT")
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

        result := ComCall(42, this, "uint", mur, "ptr", szName, "uint", cchName, "uint*", pchName, "HRESULT")
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
        result := ComCall(43, this, "ptr*", phEnum, "uint*", rModuleRefs, "uint", cmax, "uint*", pcModuleRefs, "HRESULT")
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
        result := ComCall(44, this, "uint", typespec, "ptr*", ppvSig, "uint*", pcbSig, "HRESULT")
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
        result := ComCall(45, this, "uint", tk, "ptr*", pszUtf8NamePtr, "HRESULT")
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
        result := ComCall(46, this, "ptr*", phEnum, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "HRESULT")
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

        result := ComCall(47, this, "uint", stk, "ptr", szString, "uint", cchString, "uint*", pchString, "HRESULT")
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

        result := ComCall(48, this, "uint", tk, "uint*", pdwMappingFlags, "ptr", szImportName, "uint", cchImportName, "uint*", pchImportName, "uint*", pmrImportDLL, "HRESULT")
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
        result := ComCall(49, this, "ptr*", phEnum, "uint*", rSignatures, "uint", cmax, "uint*", pcSignatures, "HRESULT")
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
        result := ComCall(50, this, "ptr*", phEnum, "uint*", rTypeSpecs, "uint", cmax, "uint*", pcTypeSpecs, "HRESULT")
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
        result := ComCall(51, this, "ptr*", phEnum, "uint*", rStrings, "uint", cmax, "uint*", pcStrings, "HRESULT")
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
        result := ComCall(52, this, "uint", md, "uint", ulParamSeq, "uint*", ppd, "HRESULT")
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
        result := ComCall(53, this, "ptr*", phEnum, "uint", tk, "uint", tkType, "uint*", rCustomAttributes, "uint", cMax, "uint*", pcCustomAttributes, "HRESULT")
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
        result := ComCall(54, this, "uint", cv, "uint*", ptkObj, "uint*", ptkType, "ptr*", ppBlob, "uint*", pcbSize, "HRESULT")
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

        result := ComCall(55, this, "uint", tkResolutionScope, "ptr", szName, "uint*", ptr, "HRESULT")
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

        result := ComCall(56, this, "uint", mb, "uint*", pClass, "ptr", szMember, "uint", cchMember, "uint*", pchMember, "uint*", pdwAttr, "ptr*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "uint*", pdwCPlusTypeFlag, "ptr*", ppValue, "uint*", pcchValue, "HRESULT")
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

        result := ComCall(57, this, "uint", mb, "uint*", pClass, "ptr", szField, "uint", cchField, "uint*", pchField, "uint*", pdwAttr, "ptr*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pdwCPlusTypeFlag, "ptr*", ppValue, "uint*", pcchValue, "HRESULT")
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

        result := ComCall(58, this, "uint", prop, "uint*", pClass, "ptr", szProperty, "uint", cchProperty, "uint*", pchProperty, "uint*", pdwPropFlags, "ptr*", ppvSig, "uint*", pbSig, "uint*", pdwCPlusTypeFlag, "ptr*", ppDefaultValue, "uint*", pcchDefaultValue, "uint*", pmdSetter, "uint*", pmdGetter, "uint*", rmdOtherMethod, "uint", cMax, "uint*", pcOtherMethod, "HRESULT")
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

        result := ComCall(59, this, "uint", tk, "uint*", pmd, "uint*", pulSequence, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", pdwAttr, "uint*", pdwCPlusTypeFlag, "ptr*", ppValue, "uint*", pcchValue, "HRESULT")
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

        result := ComCall(60, this, "uint", tkObj, "ptr", szName, "ptr*", ppData, "uint*", pcbData, "HRESULT")
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
        result := ComCall(62, this, "uint", tdNestedClass, "uint*", ptdEnclosingClass, "HRESULT")
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
        result := ComCall(63, this, "ptr", pvSig, "uint", cbSig, "uint*", pCallConv, "HRESULT")
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
        result := ComCall(64, this, "uint", pd, "int*", pbGlobal, "HRESULT")
        return result
    }
}
