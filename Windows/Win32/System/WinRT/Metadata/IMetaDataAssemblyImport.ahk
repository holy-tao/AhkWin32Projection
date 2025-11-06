#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides methods to access and examine the contents of an assembly manifest.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadataassemblyimport
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataAssemblyImport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataAssemblyImport
     * @type {Guid}
     */
    static IID => Guid("{ee62470b-e94b-424e-9b7c-2f00c9249f93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAssemblyProps", "GetAssemblyRefProps", "GetFileProps", "GetExportedTypeProps", "GetManifestResourceProps", "EnumAssemblyRefs", "EnumFiles", "EnumExportedTypes", "EnumManifestResources", "GetAssemblyFromScope", "FindExportedTypeByName", "FindManifestResourceByName", "CloseEnum", "FindAssembliesByName"]

    /**
     * 
     * @param {Integer} mda 
     * @param {Pointer<Pointer<Void>>} ppbPublicKey 
     * @param {Pointer<Integer>} pcbPublicKey 
     * @param {Pointer<Integer>} pulHashAlgId 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<Integer>} pdwAssemblyFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyprops
     */
    GetAssemblyProps(mda, ppbPublicKey, pcbPublicKey, pulHashAlgId, szName, cchName, pchName, pMetaData, pdwAssemblyFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        ppbPublicKeyMarshal := ppbPublicKey is VarRef ? "ptr*" : "ptr"
        pcbPublicKeyMarshal := pcbPublicKey is VarRef ? "uint*" : "ptr"
        pulHashAlgIdMarshal := pulHashAlgId is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        pdwAssemblyFlagsMarshal := pdwAssemblyFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", mda, ppbPublicKeyMarshal, ppbPublicKey, pcbPublicKeyMarshal, pcbPublicKey, pulHashAlgIdMarshal, pulHashAlgId, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "ptr", pMetaData, pdwAssemblyFlagsMarshal, pdwAssemblyFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mdar 
     * @param {Pointer<Pointer<Void>>} ppbPublicKeyOrToken 
     * @param {Pointer<Integer>} pcbPublicKeyOrToken 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<Pointer<Void>>} ppbHashValue 
     * @param {Pointer<Integer>} pcbHashValue 
     * @param {Pointer<Integer>} pdwAssemblyRefFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyrefprops
     */
    GetAssemblyRefProps(mdar, ppbPublicKeyOrToken, pcbPublicKeyOrToken, szName, cchName, pchName, pMetaData, ppbHashValue, pcbHashValue, pdwAssemblyRefFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        ppbPublicKeyOrTokenMarshal := ppbPublicKeyOrToken is VarRef ? "ptr*" : "ptr"
        pcbPublicKeyOrTokenMarshal := pcbPublicKeyOrToken is VarRef ? "uint*" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        ppbHashValueMarshal := ppbHashValue is VarRef ? "ptr*" : "ptr"
        pcbHashValueMarshal := pcbHashValue is VarRef ? "uint*" : "ptr"
        pdwAssemblyRefFlagsMarshal := pdwAssemblyRefFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", mdar, ppbPublicKeyOrTokenMarshal, ppbPublicKeyOrToken, pcbPublicKeyOrTokenMarshal, pcbPublicKeyOrToken, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, "ptr", pMetaData, ppbHashValueMarshal, ppbHashValue, pcbHashValueMarshal, pcbHashValue, pdwAssemblyRefFlagsMarshal, pdwAssemblyRefFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mdf 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<Pointer<Void>>} ppbHashValue 
     * @param {Pointer<Integer>} pcbHashValue 
     * @param {Pointer<Integer>} pdwFileFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getfileprops
     */
    GetFileProps(mdf, szName, cchName, pchName, ppbHashValue, pcbHashValue, pdwFileFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        ppbHashValueMarshal := ppbHashValue is VarRef ? "ptr*" : "ptr"
        pcbHashValueMarshal := pcbHashValue is VarRef ? "uint*" : "ptr"
        pdwFileFlagsMarshal := pdwFileFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", mdf, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, ppbHashValueMarshal, ppbHashValue, pcbHashValueMarshal, pcbHashValue, pdwFileFlagsMarshal, pdwFileFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mdct 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<Integer>} ptkImplementation 
     * @param {Pointer<Integer>} ptkTypeDef 
     * @param {Pointer<Integer>} pdwExportedTypeFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getexportedtypeprops
     */
    GetExportedTypeProps(mdct, szName, cchName, pchName, ptkImplementation, ptkTypeDef, pdwExportedTypeFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        ptkImplementationMarshal := ptkImplementation is VarRef ? "uint*" : "ptr"
        ptkTypeDefMarshal := ptkTypeDef is VarRef ? "uint*" : "ptr"
        pdwExportedTypeFlagsMarshal := pdwExportedTypeFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", mdct, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, ptkImplementationMarshal, ptkImplementation, ptkTypeDefMarshal, ptkTypeDef, pdwExportedTypeFlagsMarshal, pdwExportedTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mdmr 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<Integer>} pchName 
     * @param {Pointer<Integer>} ptkImplementation 
     * @param {Pointer<Integer>} pdwOffset 
     * @param {Pointer<Integer>} pdwResourceFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getmanifestresourceprops
     */
    GetManifestResourceProps(mdmr, szName, cchName, pchName, ptkImplementation, pdwOffset, pdwResourceFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        ptkImplementationMarshal := ptkImplementation is VarRef ? "uint*" : "ptr"
        pdwOffsetMarshal := pdwOffset is VarRef ? "uint*" : "ptr"
        pdwResourceFlagsMarshal := pdwResourceFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", mdmr, "ptr", szName, "uint", cchName, pchNameMarshal, pchName, ptkImplementationMarshal, ptkImplementation, pdwOffsetMarshal, pdwOffset, pdwResourceFlagsMarshal, pdwResourceFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rAssemblyRefs 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumassemblyrefs
     */
    EnumAssemblyRefs(phEnum, rAssemblyRefs, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rAssemblyRefsMarshal := rAssemblyRefs is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, phEnumMarshal, phEnum, rAssemblyRefsMarshal, rAssemblyRefs, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rFiles 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumfiles
     */
    EnumFiles(phEnum, rFiles, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rFilesMarshal := rFiles is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, phEnumMarshal, phEnum, rFilesMarshal, rFiles, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rExportedTypes 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumexportedtypes
     */
    EnumExportedTypes(phEnum, rExportedTypes, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rExportedTypesMarshal := rExportedTypes is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, phEnumMarshal, phEnum, rExportedTypesMarshal, rExportedTypes, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} phEnum 
     * @param {Pointer<Integer>} rManifestResources 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcTokens 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-enummanifestresources
     */
    EnumManifestResources(phEnum, rManifestResources, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rManifestResourcesMarshal := rManifestResources is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, phEnumMarshal, phEnum, rManifestResourcesMarshal, rManifestResources, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ptkAssembly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyfromscope
     */
    GetAssemblyFromScope(ptkAssembly) {
        ptkAssemblyMarshal := ptkAssembly is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, ptkAssemblyMarshal, ptkAssembly, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} mdtExportedType 
     * @param {Pointer<Integer>} ptkExportedType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-findexportedtypebyname
     */
    FindExportedTypeByName(szName, mdtExportedType, ptkExportedType) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkExportedTypeMarshal := ptkExportedType is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", szName, "uint", mdtExportedType, ptkExportedTypeMarshal, ptkExportedType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<Integer>} ptkManifestResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-findmanifestresourcebyname
     */
    FindManifestResourceByName(szName, ptkManifestResource) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkManifestResourceMarshal := ptkManifestResource is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", szName, ptkManifestResourceMarshal, ptkManifestResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-closeenum
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        ComCall(15, this, hEnumMarshal, hEnum)
    }

    /**
     * 
     * @param {PWSTR} szAppBase 
     * @param {PWSTR} szPrivateBin 
     * @param {PWSTR} szAssemblyName 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcAssemblies 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-findassembliesbyname
     */
    FindAssembliesByName(szAppBase, szPrivateBin, szAssemblyName, cMax, pcAssemblies) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName

        pcAssembliesMarshal := pcAssemblies is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szAssemblyName, "ptr*", &ppIUnk := 0, "uint", cMax, pcAssembliesMarshal, pcAssemblies, "HRESULT")
        return IUnknown(ppIUnk)
    }
}
