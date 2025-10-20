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
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {String} Nothing - always returns an empty string
     */
    CloseEnum(hEnum) {
        ComCall(3, this, "ptr", hEnum)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    CountEnum(hEnum, pulCount) {
        result := ComCall(4, this, "ptr", hEnum, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @param {Integer} ulPos 
     * @returns {HRESULT} 
     */
    ResetEnum(hEnum, ulPos) {
        result := ComCall(5, this, "ptr", hEnum, "uint", ulPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rTypeDefs 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTypeDefs 
     * @returns {HRESULT} 
     */
    EnumTypeDefs(phEnum, rTypeDefs, cMax, pcTypeDefs) {
        result := ComCall(6, this, "ptr", phEnum, "uint*", rTypeDefs, "uint", cMax, "uint*", pcTypeDefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<UInt32>} rImpls 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcImpls 
     * @returns {HRESULT} 
     */
    EnumInterfaceImpls(phEnum, td, rImpls, cMax, pcImpls) {
        result := ComCall(7, this, "ptr", phEnum, "uint", td, "uint*", rImpls, "uint", cMax, "uint*", pcImpls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rTypeRefs 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTypeRefs 
     * @returns {HRESULT} 
     */
    EnumTypeRefs(phEnum, rTypeRefs, cMax, pcTypeRefs) {
        result := ComCall(8, this, "ptr", phEnum, "uint*", rTypeRefs, "uint", cMax, "uint*", pcTypeRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} tkEnclosingClass 
     * @param {Pointer<UInt32>} ptd 
     * @returns {HRESULT} 
     */
    FindTypeDefByName(szTypeDef, tkEnclosingClass, ptd) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        result := ComCall(9, this, "ptr", szTypeDef, "uint", tkEnclosingClass, "uint*", ptd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<Guid>} pmvid 
     * @returns {HRESULT} 
     */
    GetScopeProps(szName, cchName, pchName, pmvid) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(10, this, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pmvid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pmd 
     * @returns {HRESULT} 
     */
    GetModuleFromScope(pmd) {
        result := ComCall(11, this, "uint*", pmd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szTypeDef 
     * @param {Integer} cchTypeDef 
     * @param {Pointer<UInt32>} pchTypeDef 
     * @param {Pointer<UInt32>} pdwTypeDefFlags 
     * @param {Pointer<UInt32>} ptkExtends 
     * @returns {HRESULT} 
     */
    GetTypeDefProps(td, szTypeDef, cchTypeDef, pchTypeDef, pdwTypeDefFlags, ptkExtends) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        result := ComCall(12, this, "uint", td, "ptr", szTypeDef, "uint", cchTypeDef, "uint*", pchTypeDef, "uint*", pdwTypeDefFlags, "uint*", ptkExtends, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iiImpl 
     * @param {Pointer<UInt32>} pClass 
     * @param {Pointer<UInt32>} ptkIface 
     * @returns {HRESULT} 
     */
    GetInterfaceImplProps(iiImpl, pClass, ptkIface) {
        result := ComCall(13, this, "uint", iiImpl, "uint*", pClass, "uint*", ptkIface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<UInt32>} ptkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @returns {HRESULT} 
     */
    GetTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(14, this, "uint", tr, "uint*", ptkResolutionScope, "ptr", szName, "uint", cchName, "uint*", pchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tr 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppIScope 
     * @param {Pointer<UInt32>} ptd 
     * @returns {HRESULT} 
     */
    ResolveTypeRef(tr, riid, ppIScope, ptd) {
        result := ComCall(15, this, "uint", tr, "ptr", riid, "ptr", ppIScope, "uint*", ptd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<UInt32>} rMembers 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMembers(phEnum, cl, rMembers, cMax, pcTokens) {
        result := ComCall(16, this, "ptr", phEnum, "uint", cl, "uint*", rMembers, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} rMembers 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMembersWithName(phEnum, cl, szName, rMembers, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(17, this, "ptr", phEnum, "uint", cl, "ptr", szName, "uint*", rMembers, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<UInt32>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMethods(phEnum, cl, rMethods, cMax, pcTokens) {
        result := ComCall(18, this, "ptr", phEnum, "uint", cl, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMethodsWithName(phEnum, cl, szName, rMethods, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(19, this, "ptr", phEnum, "uint", cl, "ptr", szName, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {Pointer<UInt32>} rFields 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumFields(phEnum, cl, rFields, cMax, pcTokens) {
        result := ComCall(20, this, "ptr", phEnum, "uint", cl, "uint*", rFields, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} cl 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} rFields 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumFieldsWithName(phEnum, cl, szName, rFields, cMax, pcTokens) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(21, this, "ptr", phEnum, "uint", cl, "ptr", szName, "uint*", rFields, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} mb 
     * @param {Pointer<UInt32>} rParams 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumParams(phEnum, mb, rParams, cMax, pcTokens) {
        result := ComCall(22, this, "ptr", phEnum, "uint", mb, "uint*", rParams, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tkParent 
     * @param {Pointer<UInt32>} rMemberRefs 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMemberRefs(phEnum, tkParent, rMemberRefs, cMax, pcTokens) {
        result := ComCall(23, this, "ptr", phEnum, "uint", tkParent, "uint*", rMemberRefs, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<UInt32>} rMethodBody 
     * @param {Pointer<UInt32>} rMethodDecl 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumMethodImpls(phEnum, td, rMethodBody, rMethodDecl, cMax, pcTokens) {
        result := ComCall(24, this, "ptr", phEnum, "uint", td, "uint*", rMethodBody, "uint*", rMethodDecl, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tk 
     * @param {Integer} dwActions 
     * @param {Pointer<UInt32>} rPermission 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumPermissionSets(phEnum, tk, dwActions, rPermission, cMax, pcTokens) {
        result := ComCall(25, this, "ptr", phEnum, "uint", tk, "uint", dwActions, "uint*", rPermission, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Byte>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<UInt32>} pmb 
     * @returns {HRESULT} 
     */
    FindMember(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(26, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Byte>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<UInt32>} pmb 
     * @returns {HRESULT} 
     */
    FindMethod(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(27, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Byte>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<UInt32>} pmb 
     * @returns {HRESULT} 
     */
    FindField(td, szName, pvSigBlob, cbSigBlob, pmb) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(28, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {PWSTR} szName 
     * @param {Pointer<Byte>} pvSigBlob 
     * @param {Integer} cbSigBlob 
     * @param {Pointer<UInt32>} pmr 
     * @returns {HRESULT} 
     */
    FindMemberRef(td, szName, pvSigBlob, cbSigBlob, pmr) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(29, this, "uint", td, "ptr", szName, "char*", pvSigBlob, "uint", cbSigBlob, "uint*", pmr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<UInt32>} pClass 
     * @param {PWSTR} szMethod 
     * @param {Integer} cchMethod 
     * @param {Pointer<UInt32>} pchMethod 
     * @param {Pointer<UInt32>} pdwAttr 
     * @param {Pointer<Byte>} ppvSigBlob 
     * @param {Pointer<UInt32>} pcbSigBlob 
     * @param {Pointer<UInt32>} pulCodeRVA 
     * @param {Pointer<UInt32>} pdwImplFlags 
     * @returns {HRESULT} 
     */
    GetMethodProps(mb, pClass, szMethod, cchMethod, pchMethod, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags) {
        szMethod := szMethod is String ? StrPtr(szMethod) : szMethod

        result := ComCall(30, this, "uint", mb, "uint*", pClass, "ptr", szMethod, "uint", cchMethod, "uint*", pchMethod, "uint*", pdwAttr, "char*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mr 
     * @param {Pointer<UInt32>} ptk 
     * @param {PWSTR} szMember 
     * @param {Integer} cchMember 
     * @param {Pointer<UInt32>} pchMember 
     * @param {Pointer<Byte>} ppvSigBlob 
     * @param {Pointer<UInt32>} pbSig 
     * @returns {HRESULT} 
     */
    GetMemberRefProps(mr, ptk, szMember, cchMember, pchMember, ppvSigBlob, pbSig) {
        szMember := szMember is String ? StrPtr(szMember) : szMember

        result := ComCall(31, this, "uint", mr, "uint*", ptk, "ptr", szMember, "uint", cchMember, "uint*", pchMember, "char*", ppvSigBlob, "uint*", pbSig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<UInt32>} rProperties 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcProperties 
     * @returns {HRESULT} 
     */
    EnumProperties(phEnum, td, rProperties, cMax, pcProperties) {
        result := ComCall(32, this, "ptr", phEnum, "uint", td, "uint*", rProperties, "uint", cMax, "uint*", pcProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} td 
     * @param {Pointer<UInt32>} rEvents 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcEvents 
     * @returns {HRESULT} 
     */
    EnumEvents(phEnum, td, rEvents, cMax, pcEvents) {
        result := ComCall(33, this, "ptr", phEnum, "uint", td, "uint*", rEvents, "uint", cMax, "uint*", pcEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ev 
     * @param {Pointer<UInt32>} pClass 
     * @param {PWSTR} szEvent 
     * @param {Integer} cchEvent 
     * @param {Pointer<UInt32>} pchEvent 
     * @param {Pointer<UInt32>} pdwEventFlags 
     * @param {Pointer<UInt32>} ptkEventType 
     * @param {Pointer<UInt32>} pmdAddOn 
     * @param {Pointer<UInt32>} pmdRemoveOn 
     * @param {Pointer<UInt32>} pmdFire 
     * @param {Pointer<UInt32>} rmdOtherMethod 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcOtherMethod 
     * @returns {HRESULT} 
     */
    GetEventProps(ev, pClass, szEvent, cchEvent, pchEvent, pdwEventFlags, ptkEventType, pmdAddOn, pmdRemoveOn, pmdFire, rmdOtherMethod, cMax, pcOtherMethod) {
        szEvent := szEvent is String ? StrPtr(szEvent) : szEvent

        result := ComCall(34, this, "uint", ev, "uint*", pClass, "ptr", szEvent, "uint", cchEvent, "uint*", pchEvent, "uint*", pdwEventFlags, "uint*", ptkEventType, "uint*", pmdAddOn, "uint*", pmdRemoveOn, "uint*", pmdFire, "uint*", rmdOtherMethod, "uint", cMax, "uint*", pcOtherMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} mb 
     * @param {Pointer<UInt32>} rEventProp 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcEventProp 
     * @returns {HRESULT} 
     */
    EnumMethodSemantics(phEnum, mb, rEventProp, cMax, pcEventProp) {
        result := ComCall(35, this, "ptr", phEnum, "uint", mb, "uint*", rEventProp, "uint", cMax, "uint*", pcEventProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Integer} tkEventProp 
     * @param {Pointer<UInt32>} pdwSemanticsFlags 
     * @returns {HRESULT} 
     */
    GetMethodSemantics(mb, tkEventProp, pdwSemanticsFlags) {
        result := ComCall(36, this, "uint", mb, "uint", tkEventProp, "uint*", pdwSemanticsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} td 
     * @param {Pointer<UInt32>} pdwPackSize 
     * @param {Pointer<COR_FIELD_OFFSET>} rFieldOffset 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcFieldOffset 
     * @param {Pointer<UInt32>} pulClassSize 
     * @returns {HRESULT} 
     */
    GetClassLayout(td, pdwPackSize, rFieldOffset, cMax, pcFieldOffset, pulClassSize) {
        result := ComCall(37, this, "uint", td, "uint*", pdwPackSize, "ptr", rFieldOffset, "uint", cMax, "uint*", pcFieldOffset, "uint*", pulClassSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<Byte>} ppvNativeType 
     * @param {Pointer<UInt32>} pcbNativeType 
     * @returns {HRESULT} 
     */
    GetFieldMarshal(tk, ppvNativeType, pcbNativeType) {
        result := ComCall(38, this, "uint", tk, "char*", ppvNativeType, "uint*", pcbNativeType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} pulCodeRVA 
     * @param {Pointer<UInt32>} pdwImplFlags 
     * @returns {HRESULT} 
     */
    GetRVA(tk, pulCodeRVA, pdwImplFlags) {
        result := ComCall(39, this, "uint", tk, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pm 
     * @param {Pointer<UInt32>} pdwAction 
     * @param {Pointer<Void>} ppvPermission 
     * @param {Pointer<UInt32>} pcbPermission 
     * @returns {HRESULT} 
     */
    GetPermissionSetProps(pm, pdwAction, ppvPermission, pcbPermission) {
        result := ComCall(40, this, "uint", pm, "uint*", pdwAction, "ptr", ppvPermission, "uint*", pcbPermission, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mdSig 
     * @param {Pointer<Byte>} ppvSig 
     * @param {Pointer<UInt32>} pcbSig 
     * @returns {HRESULT} 
     */
    GetSigFromToken(mdSig, ppvSig, pcbSig) {
        result := ComCall(41, this, "uint", mdSig, "char*", ppvSig, "uint*", pcbSig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mur 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @returns {HRESULT} 
     */
    GetModuleRefProps(mur, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(42, this, "uint", mur, "ptr", szName, "uint", cchName, "uint*", pchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rModuleRefs 
     * @param {Integer} cmax 
     * @param {Pointer<UInt32>} pcModuleRefs 
     * @returns {HRESULT} 
     */
    EnumModuleRefs(phEnum, rModuleRefs, cmax, pcModuleRefs) {
        result := ComCall(43, this, "ptr", phEnum, "uint*", rModuleRefs, "uint", cmax, "uint*", pcModuleRefs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} typespec 
     * @param {Pointer<Byte>} ppvSig 
     * @param {Pointer<UInt32>} pcbSig 
     * @returns {HRESULT} 
     */
    GetTypeSpecFromToken(typespec, ppvSig, pcbSig) {
        result := ComCall(44, this, "uint", typespec, "char*", ppvSig, "uint*", pcbSig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<SByte>} pszUtf8NamePtr 
     * @returns {HRESULT} 
     */
    GetNameFromToken(tk, pszUtf8NamePtr) {
        result := ComCall(45, this, "uint", tk, "char*", pszUtf8NamePtr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rMethods 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumUnresolvedMethods(phEnum, rMethods, cMax, pcTokens) {
        result := ComCall(46, this, "ptr", phEnum, "uint*", rMethods, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} stk 
     * @param {PWSTR} szString 
     * @param {Integer} cchString 
     * @param {Pointer<UInt32>} pchString 
     * @returns {HRESULT} 
     */
    GetUserString(stk, szString, cchString, pchString) {
        szString := szString is String ? StrPtr(szString) : szString

        result := ComCall(47, this, "uint", stk, "ptr", szString, "uint", cchString, "uint*", pchString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} pdwMappingFlags 
     * @param {PWSTR} szImportName 
     * @param {Integer} cchImportName 
     * @param {Pointer<UInt32>} pchImportName 
     * @param {Pointer<UInt32>} pmrImportDLL 
     * @returns {HRESULT} 
     */
    GetPinvokeMap(tk, pdwMappingFlags, szImportName, cchImportName, pchImportName, pmrImportDLL) {
        szImportName := szImportName is String ? StrPtr(szImportName) : szImportName

        result := ComCall(48, this, "uint", tk, "uint*", pdwMappingFlags, "ptr", szImportName, "uint", cchImportName, "uint*", pchImportName, "uint*", pmrImportDLL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rSignatures 
     * @param {Integer} cmax 
     * @param {Pointer<UInt32>} pcSignatures 
     * @returns {HRESULT} 
     */
    EnumSignatures(phEnum, rSignatures, cmax, pcSignatures) {
        result := ComCall(49, this, "ptr", phEnum, "uint*", rSignatures, "uint", cmax, "uint*", pcSignatures, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rTypeSpecs 
     * @param {Integer} cmax 
     * @param {Pointer<UInt32>} pcTypeSpecs 
     * @returns {HRESULT} 
     */
    EnumTypeSpecs(phEnum, rTypeSpecs, cmax, pcTypeSpecs) {
        result := ComCall(50, this, "ptr", phEnum, "uint*", rTypeSpecs, "uint", cmax, "uint*", pcTypeSpecs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rStrings 
     * @param {Integer} cmax 
     * @param {Pointer<UInt32>} pcStrings 
     * @returns {HRESULT} 
     */
    EnumUserStrings(phEnum, rStrings, cmax, pcStrings) {
        result := ComCall(51, this, "ptr", phEnum, "uint*", rStrings, "uint", cmax, "uint*", pcStrings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} md 
     * @param {Integer} ulParamSeq 
     * @param {Pointer<UInt32>} ppd 
     * @returns {HRESULT} 
     */
    GetParamForMethodIndex(md, ulParamSeq, ppd) {
        result := ComCall(52, this, "uint", md, "uint", ulParamSeq, "uint*", ppd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Integer} tk 
     * @param {Integer} tkType 
     * @param {Pointer<UInt32>} rCustomAttributes 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcCustomAttributes 
     * @returns {HRESULT} 
     */
    EnumCustomAttributes(phEnum, tk, tkType, rCustomAttributes, cMax, pcCustomAttributes) {
        result := ComCall(53, this, "ptr", phEnum, "uint", tk, "uint", tkType, "uint*", rCustomAttributes, "uint", cMax, "uint*", pcCustomAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cv 
     * @param {Pointer<UInt32>} ptkObj 
     * @param {Pointer<UInt32>} ptkType 
     * @param {Pointer<Void>} ppBlob 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetCustomAttributeProps(cv, ptkObj, ptkType, ppBlob, pcbSize) {
        result := ComCall(54, this, "uint", cv, "uint*", ptkObj, "uint*", ptkType, "ptr", ppBlob, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tkResolutionScope 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} ptr 
     * @returns {HRESULT} 
     */
    FindTypeRef(tkResolutionScope, szName, ptr) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(55, this, "uint", tkResolutionScope, "ptr", szName, "uint*", ptr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<UInt32>} pClass 
     * @param {PWSTR} szMember 
     * @param {Integer} cchMember 
     * @param {Pointer<UInt32>} pchMember 
     * @param {Pointer<UInt32>} pdwAttr 
     * @param {Pointer<Byte>} ppvSigBlob 
     * @param {Pointer<UInt32>} pcbSigBlob 
     * @param {Pointer<UInt32>} pulCodeRVA 
     * @param {Pointer<UInt32>} pdwImplFlags 
     * @param {Pointer<UInt32>} pdwCPlusTypeFlag 
     * @param {Pointer<Void>} ppValue 
     * @param {Pointer<UInt32>} pcchValue 
     * @returns {HRESULT} 
     */
    GetMemberProps(mb, pClass, szMember, cchMember, pchMember, pdwAttr, ppvSigBlob, pcbSigBlob, pulCodeRVA, pdwImplFlags, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szMember := szMember is String ? StrPtr(szMember) : szMember

        result := ComCall(56, this, "uint", mb, "uint*", pClass, "ptr", szMember, "uint", cchMember, "uint*", pchMember, "uint*", pdwAttr, "char*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pulCodeRVA, "uint*", pdwImplFlags, "uint*", pdwCPlusTypeFlag, "ptr", ppValue, "uint*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mb 
     * @param {Pointer<UInt32>} pClass 
     * @param {PWSTR} szField 
     * @param {Integer} cchField 
     * @param {Pointer<UInt32>} pchField 
     * @param {Pointer<UInt32>} pdwAttr 
     * @param {Pointer<Byte>} ppvSigBlob 
     * @param {Pointer<UInt32>} pcbSigBlob 
     * @param {Pointer<UInt32>} pdwCPlusTypeFlag 
     * @param {Pointer<Void>} ppValue 
     * @param {Pointer<UInt32>} pcchValue 
     * @returns {HRESULT} 
     */
    GetFieldProps(mb, pClass, szField, cchField, pchField, pdwAttr, ppvSigBlob, pcbSigBlob, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szField := szField is String ? StrPtr(szField) : szField

        result := ComCall(57, this, "uint", mb, "uint*", pClass, "ptr", szField, "uint", cchField, "uint*", pchField, "uint*", pdwAttr, "char*", ppvSigBlob, "uint*", pcbSigBlob, "uint*", pdwCPlusTypeFlag, "ptr", ppValue, "uint*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} prop 
     * @param {Pointer<UInt32>} pClass 
     * @param {PWSTR} szProperty 
     * @param {Integer} cchProperty 
     * @param {Pointer<UInt32>} pchProperty 
     * @param {Pointer<UInt32>} pdwPropFlags 
     * @param {Pointer<Byte>} ppvSig 
     * @param {Pointer<UInt32>} pbSig 
     * @param {Pointer<UInt32>} pdwCPlusTypeFlag 
     * @param {Pointer<Void>} ppDefaultValue 
     * @param {Pointer<UInt32>} pcchDefaultValue 
     * @param {Pointer<UInt32>} pmdSetter 
     * @param {Pointer<UInt32>} pmdGetter 
     * @param {Pointer<UInt32>} rmdOtherMethod 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcOtherMethod 
     * @returns {HRESULT} 
     */
    GetPropertyProps(prop, pClass, szProperty, cchProperty, pchProperty, pdwPropFlags, ppvSig, pbSig, pdwCPlusTypeFlag, ppDefaultValue, pcchDefaultValue, pmdSetter, pmdGetter, rmdOtherMethod, cMax, pcOtherMethod) {
        szProperty := szProperty is String ? StrPtr(szProperty) : szProperty

        result := ComCall(58, this, "uint", prop, "uint*", pClass, "ptr", szProperty, "uint", cchProperty, "uint*", pchProperty, "uint*", pdwPropFlags, "char*", ppvSig, "uint*", pbSig, "uint*", pdwCPlusTypeFlag, "ptr", ppDefaultValue, "uint*", pcchDefaultValue, "uint*", pmdSetter, "uint*", pmdGetter, "uint*", rmdOtherMethod, "uint", cMax, "uint*", pcOtherMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @param {Pointer<UInt32>} pmd 
     * @param {Pointer<UInt32>} pulSequence 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<UInt32>} pdwAttr 
     * @param {Pointer<UInt32>} pdwCPlusTypeFlag 
     * @param {Pointer<Void>} ppValue 
     * @param {Pointer<UInt32>} pcchValue 
     * @returns {HRESULT} 
     */
    GetParamProps(tk, pmd, pulSequence, szName, cchName, pchName, pdwAttr, pdwCPlusTypeFlag, ppValue, pcchValue) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(59, this, "uint", tk, "uint*", pmd, "uint*", pulSequence, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", pdwAttr, "uint*", pdwCPlusTypeFlag, "ptr", ppValue, "uint*", pcchValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tkObj 
     * @param {PWSTR} szName 
     * @param {Pointer<Void>} ppData 
     * @param {Pointer<UInt32>} pcbData 
     * @returns {HRESULT} 
     */
    GetCustomAttributeByName(tkObj, szName, ppData, pcbData) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(60, this, "uint", tkObj, "ptr", szName, "ptr", ppData, "uint*", pcbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} tk 
     * @returns {BOOL} 
     */
    IsValidToken(tk) {
        result := ComCall(61, this, "uint", tk, "int")
        return result
    }

    /**
     * 
     * @param {Integer} tdNestedClass 
     * @param {Pointer<UInt32>} ptdEnclosingClass 
     * @returns {HRESULT} 
     */
    GetNestedClassProps(tdNestedClass, ptdEnclosingClass) {
        result := ComCall(62, this, "uint", tdNestedClass, "uint*", ptdEnclosingClass, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvSig 
     * @param {Integer} cbSig 
     * @param {Pointer<UInt32>} pCallConv 
     * @returns {HRESULT} 
     */
    GetNativeCallConvFromSig(pvSig, cbSig, pCallConv) {
        result := ComCall(63, this, "ptr", pvSig, "uint", cbSig, "uint*", pCallConv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pd 
     * @param {Pointer<Int32>} pbGlobal 
     * @returns {HRESULT} 
     */
    IsGlobal(pd, pbGlobal) {
        result := ComCall(64, this, "uint", pd, "int*", pbGlobal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
