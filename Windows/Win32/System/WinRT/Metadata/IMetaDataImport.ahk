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
     * Closes the enumerator that is identified by the specified handle.
     * @remarks
     * 
     * The handle specified by <i>hEnum</i> is obtained from a previous <b>Enum</b><i>Name</i> call (for example, <a href="https://docs.microsoft.com/windows/desktop/api/rometadataapi/nf-rometadataapi-imetadataimport-enumtypedefs">IMetaDataImport::EnumTypeDefs</a>).
     * 
     * 
     * @param {Pointer<Void>} hEnum The handle of the enumerator to close.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-closeenum
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        ComCall(3, this, hEnumMarshal, hEnum)
    }

    /**
     * Gets the number of elements in the enumeration that was retrieved by the specified enumerator.
     * @param {Pointer<Void>} hEnum The handle for the enumerator.
     * @param {Pointer<Integer>} pulCount The number of elements enumerated.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-countenum
     */
    CountEnum(hEnum, pulCount) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"
        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, hEnumMarshal, hEnum, pulCountMarshal, pulCount, "HRESULT")
        return result
    }

    /**
     * Resets the specified enumerator to the specified position.
     * @param {Pointer<Void>} hEnum The enumerator to reset.
     * @param {Integer} ulPos The new position at which to place the enumerator.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-resetenum
     */
    ResetEnum(hEnum, ulPos) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, hEnumMarshal, hEnum, "uint", ulPos, "HRESULT")
        return result
    }

    /**
     * Enumerates TypeDef tokens representing all types within the current scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the new enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rTypeDefs 
     * @param {Integer} cMax The maximum size of the <i>rgTypeDefs</i> array.
     * @param {Pointer<Integer>} pcTypeDefs The number of TypeDef tokens returned in <i>rgTypeDefs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumTypeDefs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTypeDefs</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumtypedefs
     */
    EnumTypeDefs(phEnum, rTypeDefs, cMax, pcTypeDefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeDefsMarshal := rTypeDefs is VarRef ? "uint*" : "ptr"
        pcTypeDefsMarshal := pcTypeDefs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, phEnumMarshal, phEnum, rTypeDefsMarshal, rTypeDefs, "uint", cMax, pcTypeDefsMarshal, pcTypeDefs, "HRESULT")
        return result
    }

    /**
     * Enumerates MethodDef tokens representing interface implementations.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} td The token of the TypeDef whose MethodDef tokens representing interface implementations are to be enumerated.
     * @param {Pointer<Integer>} rImpls The array used to store the MethodDef tokens.
     * @param {Integer} cMax The maximum size of the <i>rImpls</i> array.
     * @param {Pointer<Integer>} pcImpls The actual number of tokens returned in <i>rImpls</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumInterfaceImpls</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no MethodDef tokens to enumerate. In this case, <i>pcImpls</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enuminterfaceimpls
     */
    EnumInterfaceImpls(phEnum, td, rImpls, cMax, pcImpls) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rImplsMarshal := rImpls is VarRef ? "uint*" : "ptr"
        pcImplsMarshal := pcImpls is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, phEnumMarshal, phEnum, "uint", td, rImplsMarshal, rImpls, "uint", cMax, pcImplsMarshal, pcImpls, "HRESULT")
        return result
    }

    /**
     * Enumerates TypeRef tokens defined in the current metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rTypeRefs 
     * @param {Integer} cMax The maximum size of the <i>rgTypeRefs</i> array.
     * @param {Pointer<Integer>} pcTypeRefs A pointer to the number of TypeRef tokens returned in <i>rgTypeRefs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumTypeRefs </b>returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTypeRefs</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumtyperefs
     */
    EnumTypeRefs(phEnum, rTypeRefs, cMax, pcTypeRefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeRefsMarshal := rTypeRefs is VarRef ? "uint*" : "ptr"
        pcTypeRefsMarshal := pcTypeRefs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, phEnumMarshal, phEnum, rTypeRefsMarshal, rTypeRefs, "uint", cMax, pcTypeRefsMarshal, pcTypeRefs, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the TypeDef metadata token for the Type with the specified name.
     * @param {PWSTR} szTypeDef The name of the type for which to get the TypeDef token.
     * @param {Integer} tkEnclosingClass A TypeDef or TypeRef token representing the enclosing class. If the type to find is not a nested class, set this value to NULL.
     * @param {Pointer<Integer>} ptd 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-findtypedefbyname
     */
    FindTypeDefByName(szTypeDef, tkEnclosingClass, ptd) {
        szTypeDef := szTypeDef is String ? StrPtr(szTypeDef) : szTypeDef

        ptdMarshal := ptd is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", szTypeDef, "uint", tkEnclosingClass, ptdMarshal, ptd, "HRESULT")
        return result
    }

    /**
     * Gets the name and optionally the version identifier of the assembly or module in the current metadata scope.
     * @param {PWSTR} szName A buffer for the assembly or module name.
     * @param {Integer} cchName The size in wide characters of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The number of wide characters returned in <i>szName</i>.
     * @param {Pointer<Guid>} pmvid A pointer to a GUID that uniquely identifies the version of the assembly or module.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getscopeprops
     */
    GetScopeProps(szName, cchName, pchName, pmvid) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "ptr", pmvid, "HRESULT")
        return result
    }

    /**
     * Gets a metadata token for the module referenced in the current metadata scope.
     * @param {Pointer<Integer>} pmd 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmodulefromscope
     */
    GetModuleFromScope(pmd) {
        pmdMarshal := pmd is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pmdMarshal, pmd, "HRESULT")
        return result
    }

    /**
     * Returns metadata information for the Type represented by the specified TypeDef token.
     * @param {Integer} td 
     * @param {PWSTR} szTypeDef A buffer containing the type name.
     * @param {Integer} cchTypeDef The size in wide characters of <i>szTypeDef</i>.
     * @param {Pointer<Integer>} pchTypeDef The number of wide characters returned in <i>szTypeDef</i>.
     * @param {Pointer<Integer>} pdwTypeDefFlags A pointer to any flags that modify the type definition. This value is a bitmask from the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/cortypeattr-enumeration">CorTypeAttr</a> enumeration.
     * @param {Pointer<Integer>} ptkExtends A TypeDef or TypeRef metadata token that represents the base type of the requested type.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-gettypedefprops
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
     * Gets a pointer to the metadata tokens for the Type that implements the specified method, and for the interface that declares that method.
     * @param {Integer} iiImpl 
     * @param {Pointer<Integer>} pClass 
     * @param {Pointer<Integer>} ptkIface The metadata token representing the interface that defines the implemented method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getinterfaceimplprops
     */
    GetInterfaceImplProps(iiImpl, pClass, ptkIface) {
        pClassMarshal := pClass is VarRef ? "uint*" : "ptr"
        ptkIfaceMarshal := ptkIface is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", iiImpl, pClassMarshal, pClass, ptkIfaceMarshal, ptkIface, "HRESULT")
        return result
    }

    /**
     * Gets the metadata associated with the Type referenced by the specified TypeRef token.
     * @param {Integer} tr 
     * @param {Pointer<Integer>} ptkResolutionScope A pointer to the scope in which the reference is made. This value is an AssemblyRef or ModuleRef token.
     * @param {PWSTR} szName A buffer containing the type name.
     * @param {Integer} cchName The requested size in wide characters of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The returned size in wide characters of <i>szName</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-gettyperefprops
     */
    GetTypeRefProps(tr, ptkResolutionScope, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkResolutionScopeMarshal := ptkResolutionScope is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", tr, ptkResolutionScopeMarshal, ptkResolutionScope, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    /**
     * Resolves a Type reference represented by the specified TypeRef token.
     * @param {Integer} tr 
     * @param {Pointer<Guid>} riid The IID of the interface to return in ppIScope. Typically, this would be IID_IMetaDataImport.
     * @param {Pointer<Integer>} ptd 
     * @returns {IUnknown} An interface to the module scope in which the referenced type is defined.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-resolvetyperef
     */
    ResolveTypeRef(tr, riid, ptd) {
        ptdMarshal := ptd is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", tr, "ptr", riid, "ptr*", &ppIScope := 0, ptdMarshal, ptd, "HRESULT")
        return IUnknown(ppIScope)
    }

    /**
     * Enumerates MemberDef tokens representing members of the specified type.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rMembers 
     * @param {Integer} cMax The maximum size of the <i>rgMembers</i> array.
     * @param {Pointer<Integer>} pcTokens The actual number of MemberDef tokens returned in <i>rgMembers</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMembers</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no MemberRef tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummembers
     */
    EnumMembers(phEnum, cl, rMembers, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMembersMarshal := rMembers is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, phEnumMarshal, phEnum, "uint", cl, rMembersMarshal, rMembers, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates MemberDef tokens representing members of the specified type with the specified name.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} cl 
     * @param {PWSTR} szName The member name that limits the scope of the enumerator.
     * @param {Pointer<Integer>} rMembers 
     * @param {Integer} cMax The maximum size of the <i>rgMembers</i> array.
     * @param {Pointer<Integer>} pcTokens The actual number of MemberDef tokens returned in <i>rgMembers</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMembersWithName</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no MemberRef tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummemberswithname
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
     * Enumerates MethodDef tokens representing methods of the specified type.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax The maximum size of the MethodDef <i>rgMethods</i> array.
     * @param {Pointer<Integer>} pcTokens The number of MethodDef tokens returned in <i>rgMethods</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMethods</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no MethodDef tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummethods
     */
    EnumMethods(phEnum, cl, rMethods, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodsMarshal := rMethods is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(18, this, phEnumMarshal, phEnum, "uint", cl, rMethodsMarshal, rMethods, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates methods that have the specified name and that are defined by the type referenced by the specified TypeDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} cl 
     * @param {PWSTR} szName The name that limits the scope of the enumeration.
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax The maximum size of the <i>rgMethods</i> array.
     * @param {Pointer<Integer>} pcTokens The number of MethodDef tokens returned in <i>rgMethods</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMethodsWithName</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummethodswithname
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
     * Enumerates FieldDef tokens for the type referenced by the specified TypeDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} cl 
     * @param {Pointer<Integer>} rFields 
     * @param {Integer} cMax The maximum size of the <i>rgFields</i> array.
     * @param {Pointer<Integer>} pcTokens The actual number of FieldDef tokens returned in <i>rgFields</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumFields</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no fields to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumfields
     */
    EnumFields(phEnum, cl, rFields, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rFieldsMarshal := rFields is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, phEnumMarshal, phEnum, "uint", cl, rFieldsMarshal, rFields, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates FieldDef tokens of the specified type with the specified name.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} cl 
     * @param {PWSTR} szName The field name that limits the scope of the enumeration.
     * @param {Pointer<Integer>} rFields Array used to store the FieldDef tokens.
     * @param {Integer} cMax The maximum size of the <i>rFields</i> array.
     * @param {Pointer<Integer>} pcTokens The actual number of FieldDef tokens returned in <i>rFields</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumFieldsWithName</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no fields to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumfieldswithname
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
     * Enumerates ParamDef tokens representing the parameters of the method referenced by the specified MethodDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} mb 
     * @param {Pointer<Integer>} rParams The array used to store the ParamDef tokens.
     * @param {Integer} cMax The maximum size of the <i>rParams array</i>.
     * @param {Pointer<Integer>} pcTokens The number of ParamDef tokens returned in <i>rParams</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumParams</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumparams
     */
    EnumParams(phEnum, mb, rParams, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rParamsMarshal := rParams is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, phEnumMarshal, phEnum, "uint", mb, rParamsMarshal, rParams, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates MemberRef tokens representing members of the specified type.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} tkParent A TypeDef, TypeRef, MethodDef, or ModuleRef token for the type whose members are to be enumerated.
     * @param {Pointer<Integer>} rMemberRefs 
     * @param {Integer} cMax The maximum size of the <i>rgMemberRefs</i> array.
     * @param {Pointer<Integer>} pcTokens The actual number of MemberRef tokens returned in <i>rgMemberRefs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMemberRefs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no MemberRef tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummemberrefs
     */
    EnumMemberRefs(phEnum, tkParent, rMemberRefs, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMemberRefsMarshal := rMemberRefs is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, phEnumMarshal, phEnum, "uint", tkParent, rMemberRefsMarshal, rMemberRefs, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates MethodBody and MethodDeclaration tokens representing methods of the specified type.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} td 
     * @param {Pointer<Integer>} rMethodBody The array to store the MethodBody tokens.
     * @param {Pointer<Integer>} rMethodDecl The array to store the MethodDeclaration tokens.
     * @param {Integer} cMax The maximum size of the <i>rMethodBody</i> and <i>rMethodDecl</i> arrays.
     * @param {Pointer<Integer>} pcTokens The actual number of methods returned in <i>rMethodBody</i> and <i>rMethodDecl</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMethodImpls</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no method tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummethodimpls
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
     * Enumerates permissions for the objects in a specified metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} tk A metadata token that limits the scope of the search, or NULL to search the widest scope possible.
     * @param {Integer} dwActions Flags representing the <a href="https://docs.microsoft.com/dotnet/api/system.security.permissions.securityaction">SecurityAction</a> values to include in <i>rPermission</i>, or zero to return all actions.
     * @param {Pointer<Integer>} rPermission The array used to store the Permission tokens.
     * @param {Integer} cMax The maximum size of the <i>rPermission</i> array.
     * @param {Pointer<Integer>} pcTokens The number of Permission tokens returned in <i>rPermission</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumPermissionSets</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumpermissionsets
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
     * Gets a pointer to the MemberRef token for the member reference that is enclosed by the specified Type and that has the specified name and metadata signature.
     * @param {Integer} td 
     * @param {PWSTR} szName The name of the member reference to search for.
     * @param {Pointer<Integer>} pvSigBlob A pointer to the binary metadata signature of the member reference.
     * @param {Integer} cbSigBlob The size in bytes of <i>pvSigBlob</i>.
     * @param {Pointer<Integer>} pmr 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-findmemberref
     */
    FindMemberRef(td, szName, pvSigBlob, cbSigBlob, pmr) {
        szName := szName is String ? StrPtr(szName) : szName

        pvSigBlobMarshal := pvSigBlob is VarRef ? "char*" : "ptr"
        pmrMarshal := pmr is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "uint", td, "ptr", szName, pvSigBlobMarshal, pvSigBlob, "uint", cbSigBlob, pmrMarshal, pmr, "HRESULT")
        return result
    }

    /**
     * Gets the metadata associated with the method referenced by the specified MethodDef token.
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szMethod A Pointer to a buffer that has the method's name.
     * @param {Integer} cchMethod The requested size of <i>szMethod</i>.
     * @param {Pointer<Integer>} pchMethod A pointer to the size in wide characters of <i>szMethod</i>, or in the case of truncation, the actual number of wide characters in the method name.
     * @param {Pointer<Integer>} pdwAttr A pointer to any flags associated with the method.
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob A pointer to the binary metadata signature of the method.
     * @param {Pointer<Integer>} pcbSigBlob A pointer to the size in bytes of <i>ppvSigBlob</i>.
     * @param {Pointer<Integer>} pulCodeRVA A pointer to the relative virtual address of the method.
     * @param {Pointer<Integer>} pdwImplFlags A pointer to any implementation flags for the method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmethodprops
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
     * Gets metadata associated with the member referenced by the specified token.
     * @param {Integer} mr 
     * @param {Pointer<Integer>} ptk A TypeDef or TypeRef, or TypeSpec token that represents the class that declares the member, or a ModuleRef token that represents the module class that declares the member, or a MethodDef that represents the member.
     * @param {PWSTR} szMember A string buffer for the member's name.
     * @param {Integer} cchMember The requested size in wide characters of <i>szMember</i>.
     * @param {Pointer<Integer>} pchMember The returned size in wide characters of <i>szMember</i>.
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob A pointer to the binary metadata signature for the member.
     * @param {Pointer<Integer>} pbSig 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmemberrefprops
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
     * Enumerates PropertyDef tokens representing the properties of the type referenced by the specified TypeDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} td 
     * @param {Pointer<Integer>} rProperties 
     * @param {Integer} cMax The maximum size of the <i>rgProperties</i> array.
     * @param {Pointer<Integer>} pcProperties The number of PropertyDef tokens returned in <i>rgProperties</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumProperties</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcProperties</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumproperties
     */
    EnumProperties(phEnum, td, rProperties, cMax, pcProperties) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rPropertiesMarshal := rProperties is VarRef ? "uint*" : "ptr"
        pcPropertiesMarshal := pcProperties is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, phEnumMarshal, phEnum, "uint", td, rPropertiesMarshal, rProperties, "uint", cMax, pcPropertiesMarshal, pcProperties, "HRESULT")
        return result
    }

    /**
     * Enumerates event definition tokens for the specified TypeDef token.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator.
     * @param {Integer} td 
     * @param {Pointer<Integer>} rEvents 
     * @param {Integer} cMax The maximum size of the <i>rgEvents</i> array.
     * @param {Pointer<Integer>} pcEvents The actual number of events returned in <i>rgEvents</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumEvents</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no events to enumerate. In this case, <i>pcEvents</i> is zero.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumevents
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
     * Enumerates the properties and the property-change events to which the specified method is related.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Integer} mb 
     * @param {Pointer<Integer>} rEventProp 
     * @param {Integer} cMax The maximum size of the <i>rgEventProp</i> array.
     * @param {Pointer<Integer>} pcEventProp The number of events or properties returned in <i>rgEventProp</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumMethodSemantics</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no events or properties to enumerate. In this case, <i>pcEventProp</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummethodsemantics
     */
    EnumMethodSemantics(phEnum, mb, rEventProp, cMax, pcEventProp) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rEventPropMarshal := rEventProp is VarRef ? "uint*" : "ptr"
        pcEventPropMarshal := pcEventProp is VarRef ? "uint*" : "ptr"

        result := ComCall(35, this, phEnumMarshal, phEnum, "uint", mb, rEventPropMarshal, rEventProp, "uint", cMax, pcEventPropMarshal, pcEventProp, "HRESULT")
        return result
    }

    /**
     * Gets flags indicating the relationship between the method referenced by the specified MethodDef token and the paired property and event referenced by the specified EventProp token.
     * @param {Integer} mb 
     * @param {Integer} tkEventProp A token representing the paired property and event for which to get the method's role.
     * @param {Pointer<Integer>} pdwSemanticsFlags A pointer to the associated semantics flags. This value is a bitmask from the CorMethodSemanticsAttr enumeration.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmethodsemantics
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
     * Gets a pointer to the native, unmanaged type of the field represented by the specified field metadata token.
     * @param {Integer} tk The metadata token that represents the field to get interop marshaling information for.
     * @param {Pointer<Pointer<Integer>>} ppvNativeType A pointer to the metadata signature of the field's native type.
     * @param {Pointer<Integer>} pcbNativeType The size in bytes of <i>ppvNativeType</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getfieldmarshal
     */
    GetFieldMarshal(tk, ppvNativeType, pcbNativeType) {
        ppvNativeTypeMarshal := ppvNativeType is VarRef ? "ptr*" : "ptr"
        pcbNativeTypeMarshal := pcbNativeType is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "uint", tk, ppvNativeTypeMarshal, ppvNativeType, pcbNativeTypeMarshal, pcbNativeType, "HRESULT")
        return result
    }

    /**
     * Gets the relative virtual address (RVA) and the implementation flags of the method or field represented by the specified token.
     * @param {Integer} tk A MethodDef or FieldDef metadata token that represents the code object to return the RVA for. If the token is a FieldDef, the field must be a global variable.
     * @param {Pointer<Integer>} pulCodeRVA A pointer to the relative virtual address of the code object represented by the token.
     * @param {Pointer<Integer>} pdwImplFlags A pointer to the implementation flags for the method. This value is a bitmask from the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/cormethodimpl-enumeration">CorMethodImpl</a> enumeration. The value of <i>pdwImplFlags</i> is valid only if <i>tk</i> is a MethodDef token.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getrva
     */
    GetRVA(tk, pulCodeRVA, pdwImplFlags) {
        pulCodeRVAMarshal := pulCodeRVA is VarRef ? "uint*" : "ptr"
        pdwImplFlagsMarshal := pdwImplFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, "uint", tk, pulCodeRVAMarshal, pulCodeRVA, pdwImplFlagsMarshal, pdwImplFlags, "HRESULT")
        return result
    }

    /**
     * Gets the metadata associated with the System.Security.PermissionSet represented by the specified Permission token.
     * @param {Integer} pm 
     * @param {Pointer<Integer>} pdwAction A pointer to the permission set.
     * @param {Pointer<Pointer<Void>>} ppvPermission A pointer to the binary metadata signature of the permission set.
     * @param {Pointer<Integer>} pcbPermission The size in bytes of <i>const</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getpermissionsetprops
     */
    GetPermissionSetProps(pm, pdwAction, ppvPermission, pcbPermission) {
        pdwActionMarshal := pdwAction is VarRef ? "uint*" : "ptr"
        ppvPermissionMarshal := ppvPermission is VarRef ? "ptr*" : "ptr"
        pcbPermissionMarshal := pcbPermission is VarRef ? "uint*" : "ptr"

        result := ComCall(40, this, "uint", pm, pdwActionMarshal, pdwAction, ppvPermissionMarshal, ppvPermission, pcbPermissionMarshal, pcbPermission, "HRESULT")
        return result
    }

    /**
     * Gets the binary metadata signature associated with the specified token.
     * @param {Integer} mdSig 
     * @param {Pointer<Pointer<Integer>>} ppvSig A pointer to the returned metadata signature.
     * @param {Pointer<Integer>} pcbSig The size in bytes of the binary metadata signature.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getsigfromtoken
     */
    GetSigFromToken(mdSig, ppvSig, pcbSig) {
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pcbSigMarshal := pcbSig is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "uint", mdSig, ppvSigMarshal, ppvSig, pcbSigMarshal, pcbSig, "HRESULT")
        return result
    }

    /**
     * Gets the name of the module referenced by the specified metadata token.
     * @param {Integer} mur 
     * @param {PWSTR} szName A buffer to hold the module name.
     * @param {Integer} cchName The requested size of <i>szName</i> in wide characters.
     * @param {Pointer<Integer>} pchName The returned size of <i>szName</i> in wide characters.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmodulerefprops
     */
    GetModuleRefProps(mur, szName, cchName, pchName) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"

        result := ComCall(42, this, "uint", mur, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "HRESULT")
        return result
    }

    /**
     * Enumerates ModuleRef tokens that represent imported modules.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rModuleRefs 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcModuleRefs The number of ModuleRef tokens returned in <i>rgModuleRefs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumModuleRefs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcModuleRefs</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enummodulerefs
     */
    EnumModuleRefs(phEnum, rModuleRefs, cmax, pcModuleRefs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rModuleRefsMarshal := rModuleRefs is VarRef ? "uint*" : "ptr"
        pcModuleRefsMarshal := pcModuleRefs is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, phEnumMarshal, phEnum, rModuleRefsMarshal, rModuleRefs, "uint", cmax, pcModuleRefsMarshal, pcModuleRefs, "HRESULT")
        return result
    }

    /**
     * Gets the binary metadata signature of the type specification represented by the specified token.
     * @param {Integer} typespec 
     * @param {Pointer<Pointer<Integer>>} ppvSig A pointer to the binary metadata signature.
     * @param {Pointer<Integer>} pcbSig The size, in bytes, of the metadata signature.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-gettypespecfromtoken
     */
    GetTypeSpecFromToken(typespec, ppvSig, pcbSig) {
        ppvSigMarshal := ppvSig is VarRef ? "ptr*" : "ptr"
        pcbSigMarshal := pcbSig is VarRef ? "uint*" : "ptr"

        result := ComCall(44, this, "uint", typespec, ppvSigMarshal, ppvSig, pcbSigMarshal, pcbSig, "HRESULT")
        return result
    }

    /**
     * Gets the UTF-8 name of the object referenced by the specified metadata token. This method is obsolete.
     * @param {Integer} tk The token representing the object to return the name for.
     * @param {Pointer<Pointer<Integer>>} pszUtf8NamePtr A pointer to the UTF-8 object name in the heap.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getnamefromtoken
     */
    GetNameFromToken(tk, pszUtf8NamePtr) {
        pszUtf8NamePtrMarshal := pszUtf8NamePtr is VarRef ? "ptr*" : "ptr"

        result := ComCall(45, this, "uint", tk, pszUtf8NamePtrMarshal, pszUtf8NamePtr, "HRESULT")
        return result
    }

    /**
     * Enumerates MemberDef tokens representing the unresolved methods in the current metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rMethods 
     * @param {Integer} cMax The maximum size of the <i>rgMethods</i> array.
     * @param {Pointer<Integer>} pcTokens The number of MemberDef tokens returned in <i>rgMethods</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumUnresolvedMethods</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumunresolvedmethods
     */
    EnumUnresolvedMethods(phEnum, rMethods, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rMethodsMarshal := rMethods is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, phEnumMarshal, phEnum, rMethodsMarshal, rMethods, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Gets the literal string represented by the specified metadata token.
     * @param {Integer} stk 
     * @param {PWSTR} szString A copy of the requested string.
     * @param {Integer} cchString The maximum size in wide characters of the requested <i>szString</i>.
     * @param {Pointer<Integer>} pchString The size in wide characters of the returned <i>szString</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getuserstring
     */
    GetUserString(stk, szString, cchString, pchString) {
        szString := szString is String ? StrPtr(szString) : szString

        pchStringMarshal := pchString is VarRef ? "uint*" : "ptr"

        result := ComCall(47, this, "uint", stk, "ptr", szString, "uint", cchString, pchStringMarshal, pchString, "HRESULT")
        return result
    }

    /**
     * Gets a ModuleRef token to represent the target assembly of a PInvoke call.
     * @param {Integer} tk A FieldDef or MethodDef token to get the PInvoke mapping metadata for.
     * @param {Pointer<Integer>} pdwMappingFlags A pointer to flags used for mapping. This value is a bitmask from the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corpinvokemap-enumeration">CorPinvokeMap</a> enumeration.
     * @param {PWSTR} szImportName The name of the unmanaged target DLL.
     * @param {Integer} cchImportName The size in wide characters of <i>szImportName</i>.
     * @param {Pointer<Integer>} pchImportName The number of wide characters returned in <i>szImportName</i>.
     * @param {Pointer<Integer>} pmrImportDLL 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getpinvokemap
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
     * Enumerates Signature tokens representing stand-alone signatures in the current scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rSignatures 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcSignatures The number of Signature tokens returned in <i>rgSignatures</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumSignatures</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcSignatures</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumsignatures
     */
    EnumSignatures(phEnum, rSignatures, cmax, pcSignatures) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rSignaturesMarshal := rSignatures is VarRef ? "uint*" : "ptr"
        pcSignaturesMarshal := pcSignatures is VarRef ? "uint*" : "ptr"

        result := ComCall(49, this, phEnumMarshal, phEnum, rSignaturesMarshal, rSignatures, "uint", cmax, pcSignaturesMarshal, pcSignatures, "HRESULT")
        return result
    }

    /**
     * Enumerates TypeSpec tokens defined in the current metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This value must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rTypeSpecs 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcTypeSpecs The number of TypeSpec tokens returned in <i>rgTypeSpecs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumTypeSpecs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTypeSpecs</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumtypespecs
     */
    EnumTypeSpecs(phEnum, rTypeSpecs, cmax, pcTypeSpecs) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rTypeSpecsMarshal := rTypeSpecs is VarRef ? "uint*" : "ptr"
        pcTypeSpecsMarshal := pcTypeSpecs is VarRef ? "uint*" : "ptr"

        result := ComCall(50, this, phEnumMarshal, phEnum, rTypeSpecsMarshal, rTypeSpecs, "uint", cmax, pcTypeSpecsMarshal, pcTypeSpecs, "HRESULT")
        return result
    }

    /**
     * Enumerates String tokens representing hard-coded strings in the current metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be NULL for the first call of this method.
     * @param {Pointer<Integer>} rStrings 
     * @param {Integer} cmax 
     * @param {Pointer<Integer>} pcStrings The number of String tokens returned in <i>rgStrings</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumUserStrings</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcStrings</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumuserstrings
     */
    EnumUserStrings(phEnum, rStrings, cmax, pcStrings) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rStringsMarshal := rStrings is VarRef ? "uint*" : "ptr"
        pcStringsMarshal := pcStrings is VarRef ? "uint*" : "ptr"

        result := ComCall(51, this, phEnumMarshal, phEnum, rStringsMarshal, rStrings, "uint", cmax, pcStringsMarshal, pcStrings, "HRESULT")
        return result
    }

    /**
     * Gets the token that represents a specified parameter of the method represented by the specified MethodDef token.
     * @param {Integer} md 
     * @param {Integer} ulParamSeq The ordinal position in the parameter list where the requested parameter occurs. Parameters are numbered starting from one, with the method's return value in position zero.
     * @param {Pointer<Integer>} ppd 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getparamformethodindex
     */
    GetParamForMethodIndex(md, ulParamSeq, ppd) {
        ppdMarshal := ppd is VarRef ? "uint*" : "ptr"

        result := ComCall(52, this, "uint", md, "uint", ulParamSeq, ppdMarshal, ppd, "HRESULT")
        return result
    }

    /**
     * Enumerates custom attribute-definition tokens associated with the specified type or member.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the returned enumerator.
     * @param {Integer} tk A token for the scope of the enumeration, or zero for all custom attributes.
     * @param {Integer} tkType A token for the type of the attributes to be enumerated, or zero for all types.
     * @param {Pointer<Integer>} rCustomAttributes 
     * @param {Integer} cMax The maximum size of the <i>rgCustomAttributes</i> array.
     * @param {Pointer<Integer>} pcCustomAttributes The actual number of token values returned in <i>rgCustomAttributes</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumCustomAttributes</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no custom attributes to enumerate. In this case, <i>pcCustomAttributes</i> is 0 (zero).
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-enumcustomattributes
     */
    EnumCustomAttributes(phEnum, tk, tkType, rCustomAttributes, cMax, pcCustomAttributes) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rCustomAttributesMarshal := rCustomAttributes is VarRef ? "uint*" : "ptr"
        pcCustomAttributesMarshal := pcCustomAttributes is VarRef ? "uint*" : "ptr"

        result := ComCall(53, this, phEnumMarshal, phEnum, "uint", tk, "uint", tkType, rCustomAttributesMarshal, rCustomAttributes, "uint", cMax, pcCustomAttributesMarshal, pcCustomAttributes, "HRESULT")
        return result
    }

    /**
     * Gets the value of the custom attribute, given its metadata token.
     * @param {Integer} cv A metadata token that represents the custom attribute to be retrieved.
     * @param {Pointer<Integer>} ptkObj A metadata token representing the object that the custom attribute modifies. This value can be any type of metadata token except <b>mdCustomAttribute</b>. See <a href="https://docs.microsoft.com/previous-versions/dotnet/netframework-4.0/ms404456(v=vs.100)">Metadata Tokens</a> for more information about the token types.
     * @param {Pointer<Integer>} ptkType An <b>mdMethodDef</b> or <b>mdMemberRef</b> metadata token representing the Type of the returned custom attribute.
     * @param {Pointer<Pointer<Void>>} ppBlob A pointer to an array of data that is the value of the custom attribute.
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getcustomattributeprops
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
     * Gets a pointer to the TypeRef token for the Type reference that is in the specified scope and that has the specified name.
     * @param {Integer} tkResolutionScope A ModuleRef, AssemblyRef, or TypeRef token that specifies the module, assembly, or type, respectively, in which the type reference is defined.
     * @param {PWSTR} szName The name of the type reference to search for.
     * @param {Pointer<Integer>} ptr 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-findtyperef
     */
    FindTypeRef(tkResolutionScope, szName, ptr) {
        szName := szName is String ? StrPtr(szName) : szName

        ptrMarshal := ptr is VarRef ? "uint*" : "ptr"

        result := ComCall(55, this, "uint", tkResolutionScope, "ptr", szName, ptrMarshal, ptr, "HRESULT")
        return result
    }

    /**
     * Gets metadata information, including the name, binary signature, and relative virtual address, of the Type member referenced by the specified metadata token.
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szMember The name of the member.
     * @param {Integer} cchMember The size in wide characters of the szMember buffer.
     * @param {Pointer<Integer>} pchMember The size in wide characters of the returned name.
     * @param {Pointer<Integer>} pdwAttr Any flag values applied to the member.
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob A pointer to the binary metadata signature of the member.
     * @param {Pointer<Integer>} pcbSigBlob The size in bytes of <i>ppvSigBlob</i>.
     * @param {Pointer<Integer>} pulCodeRVA A pointer to the relative virtual address of the member.
     * @param {Pointer<Integer>} pdwImplFlags Any method implementation flags associated with the member.
     * @param {Pointer<Integer>} pdwCPlusTypeFlag A flag that marks a ValueType.
     * @param {Pointer<Pointer<Void>>} ppValue A constant string value returned by this member.
     * @param {Pointer<Integer>} pcchValue The size in characters of <i>ppValue</i>, or zero if <i>ppValue</i> does not hold a string.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getmemberprops
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
     * Gets metadata associated with the field referenced by the specified FieldDef token.
     * @param {Integer} mb 
     * @param {Pointer<Integer>} pClass 
     * @param {PWSTR} szField The name of the field.
     * @param {Integer} cchField The size in wide characters of the buffer for <i>szField</i>.
     * @param {Pointer<Integer>} pchField The actual size of the returned buffer.
     * @param {Pointer<Integer>} pdwAttr Flags associated with the field's metadata.
     * @param {Pointer<Pointer<Integer>>} ppvSigBlob A pointer to the binary metadata value that describes the field.
     * @param {Pointer<Integer>} pcbSigBlob The size in bytes of <i>ppvSigBlob</i>.
     * @param {Pointer<Integer>} pdwCPlusTypeFlag A flag that specifies the value type of the field.
     * @param {Pointer<Pointer<Void>>} ppValue A constant value for the field.
     * @param {Pointer<Integer>} pcchValue The size in chars of <i>ppValue</i>, or zero if no string exists.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getfieldprops
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
     * Gets metadata values for the parameter referenced by the specified ParamDef token.
     * @param {Integer} tk 
     * @param {Pointer<Integer>} pmd 
     * @param {Pointer<Integer>} pulSequence The ordinal position of the parameter in the method argument list.
     * @param {PWSTR} szName A buffer to hold the name of the parameter.
     * @param {Integer} cchName The requested size in wide characters of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The returned size in wide characters of <i>szName</i>.
     * @param {Pointer<Integer>} pdwAttr A pointer to any attribute flags associated with the parameter.
     * @param {Pointer<Integer>} pdwCPlusTypeFlag A pointer to a flag specifying that the parameter is a ValueType.
     * @param {Pointer<Pointer<Void>>} ppValue A pointer to a constant string returned by the parameter.
     * @param {Pointer<Integer>} pcchValue The size of <i>ppValue</i> in wide characters, or zero if <i>ppValue</i> does not hold a string.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getparamprops
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
     * Gets the custom attribute, given its name and owner.
     * @param {Integer} tkObj A metadata token representing the object that owns the custom attribute.
     * @param {PWSTR} szName The name of the custom attribute.
     * @param {Pointer<Pointer<Void>>} ppData A pointer to an array of data that is the value of the custom attribute.
     * @param {Pointer<Integer>} pcbData The size in bytes of the data returned in <i>const</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getcustomattributebyname
     */
    GetCustomAttributeByName(tkObj, szName, ppData, pcbData) {
        szName := szName is String ? StrPtr(szName) : szName

        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, "uint", tkObj, "ptr", szName, ppDataMarshal, ppData, pcbDataMarshal, pcbData, "HRESULT")
        return result
    }

    /**
     * Gets a value indicating whether the specified token holds a valid reference to a code object.
     * @param {Integer} tk The token to check the reference validity for.
     * @returns {BOOL} <b>true</b> if <i>tk</i> is a valid metadata token within the current scope. Otherwise, <b>false</b>.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-isvalidtoken
     */
    IsValidToken(tk) {
        result := ComCall(61, this, "uint", tk, "int")
        return result
    }

    /**
     * Gets the TypeDef token for the parent Type of the specified nested type.
     * @param {Integer} tdNestedClass A TypeDef token representing the Type to return the parent class token for.
     * @param {Pointer<Integer>} ptdEnclosingClass A pointer to the TypeDef token for the Type that <i>tdNestedClass</i> is nested in.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getnestedclassprops
     */
    GetNestedClassProps(tdNestedClass, ptdEnclosingClass) {
        ptdEnclosingClassMarshal := ptdEnclosingClass is VarRef ? "uint*" : "ptr"

        result := ComCall(62, this, "uint", tdNestedClass, ptdEnclosingClassMarshal, ptdEnclosingClass, "HRESULT")
        return result
    }

    /**
     * Gets the native calling convention for the method that is represented by the specified signature pointer.
     * @param {Pointer<Void>} pvSig A pointer to the metadata signature of the method to return the calling convention for.
     * @param {Integer} cbSig The size in bytes of <i>const</i>.
     * @param {Pointer<Integer>} pCallConv A pointer to the native calling convention.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-getnativecallconvfromsig
     */
    GetNativeCallConvFromSig(pvSig, cbSig, pCallConv) {
        pvSigMarshal := pvSig is VarRef ? "ptr" : "ptr"
        pCallConvMarshal := pCallConv is VarRef ? "uint*" : "ptr"

        result := ComCall(63, this, pvSigMarshal, pvSig, "uint", cbSig, pCallConvMarshal, pCallConv, "HRESULT")
        return result
    }

    /**
     * Gets a value indicating whether the field, method, or type represented by the specified metadata token has global scope.
     * @param {Integer} pd 
     * @param {Pointer<Integer>} pbGlobal 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataimport-isglobal
     */
    IsGlobal(pd, pbGlobal) {
        pbGlobalMarshal := pbGlobal is VarRef ? "int*" : "ptr"

        result := ComCall(64, this, "uint", pd, pbGlobalMarshal, pbGlobal, "HRESULT")
        return result
    }
}
