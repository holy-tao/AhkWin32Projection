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

        result := ComCall(3, this, "uint", mda, "ptr*", ppbPublicKey, "uint*", pcbPublicKey, "uint*", pulHashAlgId, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pMetaData, "uint*", pdwAssemblyFlags, "HRESULT")
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

        result := ComCall(4, this, "uint", mdar, "ptr*", ppbPublicKeyOrToken, "uint*", pcbPublicKeyOrToken, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pMetaData, "ptr*", ppbHashValue, "uint*", pcbHashValue, "uint*", pdwAssemblyRefFlags, "HRESULT")
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

        result := ComCall(5, this, "uint", mdf, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr*", ppbHashValue, "uint*", pcbHashValue, "uint*", pdwFileFlags, "HRESULT")
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

        result := ComCall(6, this, "uint", mdct, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", ptkImplementation, "uint*", ptkTypeDef, "uint*", pdwExportedTypeFlags, "HRESULT")
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

        result := ComCall(7, this, "uint", mdmr, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", ptkImplementation, "uint*", pdwOffset, "uint*", pdwResourceFlags, "HRESULT")
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
        result := ComCall(8, this, "ptr*", phEnum, "uint*", rAssemblyRefs, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(9, this, "ptr*", phEnum, "uint*", rFiles, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(10, this, "ptr*", phEnum, "uint*", rExportedTypes, "uint", cMax, "uint*", pcTokens, "HRESULT")
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
        result := ComCall(11, this, "ptr*", phEnum, "uint*", rManifestResources, "uint", cMax, "uint*", pcTokens, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ptkAssembly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyfromscope
     */
    GetAssemblyFromScope(ptkAssembly) {
        result := ComCall(12, this, "uint*", ptkAssembly, "HRESULT")
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

        result := ComCall(13, this, "ptr", szName, "uint", mdtExportedType, "uint*", ptkExportedType, "HRESULT")
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

        result := ComCall(14, this, "ptr", szName, "uint*", ptkManifestResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-closeenum
     */
    CloseEnum(hEnum) {
        ComCall(15, this, "ptr", hEnum)
    }

    /**
     * 
     * @param {PWSTR} szAppBase 
     * @param {PWSTR} szPrivateBin 
     * @param {PWSTR} szAssemblyName 
     * @param {Pointer<IUnknown>} ppIUnk 
     * @param {Integer} cMax 
     * @param {Pointer<Integer>} pcAssemblies 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadataassemblyimport-findassembliesbyname
     */
    FindAssembliesByName(szAppBase, szPrivateBin, szAssemblyName, ppIUnk, cMax, pcAssemblies) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName

        result := ComCall(16, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szAssemblyName, "ptr*", ppIUnk, "uint", cMax, "uint*", pcAssemblies, "HRESULT")
        return result
    }
}
