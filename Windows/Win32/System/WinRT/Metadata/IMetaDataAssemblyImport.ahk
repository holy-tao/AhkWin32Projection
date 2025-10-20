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
     * 
     * @param {Integer} mda 
     * @param {Pointer<Void>} ppbPublicKey 
     * @param {Pointer<UInt32>} pcbPublicKey 
     * @param {Pointer<UInt32>} pulHashAlgId 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<UInt32>} pdwAssemblyFlags 
     * @returns {HRESULT} 
     */
    GetAssemblyProps(mda, ppbPublicKey, pcbPublicKey, pulHashAlgId, szName, cchName, pchName, pMetaData, pdwAssemblyFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(3, this, "uint", mda, "ptr", ppbPublicKey, "uint*", pcbPublicKey, "uint*", pulHashAlgId, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pMetaData, "uint*", pdwAssemblyFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mdar 
     * @param {Pointer<Void>} ppbPublicKeyOrToken 
     * @param {Pointer<UInt32>} pcbPublicKeyOrToken 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<Void>} ppbHashValue 
     * @param {Pointer<UInt32>} pcbHashValue 
     * @param {Pointer<UInt32>} pdwAssemblyRefFlags 
     * @returns {HRESULT} 
     */
    GetAssemblyRefProps(mdar, ppbPublicKeyOrToken, pcbPublicKeyOrToken, szName, cchName, pchName, pMetaData, ppbHashValue, pcbHashValue, pdwAssemblyRefFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(4, this, "uint", mdar, "ptr", ppbPublicKeyOrToken, "uint*", pcbPublicKeyOrToken, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", pMetaData, "ptr", ppbHashValue, "uint*", pcbHashValue, "uint*", pdwAssemblyRefFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mdf 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<Void>} ppbHashValue 
     * @param {Pointer<UInt32>} pcbHashValue 
     * @param {Pointer<UInt32>} pdwFileFlags 
     * @returns {HRESULT} 
     */
    GetFileProps(mdf, szName, cchName, pchName, ppbHashValue, pcbHashValue, pdwFileFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(5, this, "uint", mdf, "ptr", szName, "uint", cchName, "uint*", pchName, "ptr", ppbHashValue, "uint*", pcbHashValue, "uint*", pdwFileFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mdct 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<UInt32>} ptkImplementation 
     * @param {Pointer<UInt32>} ptkTypeDef 
     * @param {Pointer<UInt32>} pdwExportedTypeFlags 
     * @returns {HRESULT} 
     */
    GetExportedTypeProps(mdct, szName, cchName, pchName, ptkImplementation, ptkTypeDef, pdwExportedTypeFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(6, this, "uint", mdct, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", ptkImplementation, "uint*", ptkTypeDef, "uint*", pdwExportedTypeFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} mdmr 
     * @param {PWSTR} szName 
     * @param {Integer} cchName 
     * @param {Pointer<UInt32>} pchName 
     * @param {Pointer<UInt32>} ptkImplementation 
     * @param {Pointer<UInt32>} pdwOffset 
     * @param {Pointer<UInt32>} pdwResourceFlags 
     * @returns {HRESULT} 
     */
    GetManifestResourceProps(mdmr, szName, cchName, pchName, ptkImplementation, pdwOffset, pdwResourceFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(7, this, "uint", mdmr, "ptr", szName, "uint", cchName, "uint*", pchName, "uint*", ptkImplementation, "uint*", pdwOffset, "uint*", pdwResourceFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rAssemblyRefs 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumAssemblyRefs(phEnum, rAssemblyRefs, cMax, pcTokens) {
        result := ComCall(8, this, "ptr", phEnum, "uint*", rAssemblyRefs, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rFiles 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumFiles(phEnum, rFiles, cMax, pcTokens) {
        result := ComCall(9, this, "ptr", phEnum, "uint*", rFiles, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rExportedTypes 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumExportedTypes(phEnum, rExportedTypes, cMax, pcTokens) {
        result := ComCall(10, this, "ptr", phEnum, "uint*", rExportedTypes, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} phEnum 
     * @param {Pointer<UInt32>} rManifestResources 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcTokens 
     * @returns {HRESULT} 
     */
    EnumManifestResources(phEnum, rManifestResources, cMax, pcTokens) {
        result := ComCall(11, this, "ptr", phEnum, "uint*", rManifestResources, "uint", cMax, "uint*", pcTokens, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} ptkAssembly 
     * @returns {HRESULT} 
     */
    GetAssemblyFromScope(ptkAssembly) {
        result := ComCall(12, this, "uint*", ptkAssembly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} mdtExportedType 
     * @param {Pointer<UInt32>} ptkExportedType 
     * @returns {HRESULT} 
     */
    FindExportedTypeByName(szName, mdtExportedType, ptkExportedType) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(13, this, "ptr", szName, "uint", mdtExportedType, "uint*", ptkExportedType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<UInt32>} ptkManifestResource 
     * @returns {HRESULT} 
     */
    FindManifestResourceByName(szName, ptkManifestResource) {
        szName := szName is String ? StrPtr(szName) : szName

        result := ComCall(14, this, "ptr", szName, "uint*", ptkManifestResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hEnum 
     * @returns {String} Nothing - always returns an empty string
     */
    CloseEnum(hEnum) {
        ComCall(15, this, "ptr", hEnum)
        return result
    }

    /**
     * 
     * @param {PWSTR} szAppBase 
     * @param {PWSTR} szPrivateBin 
     * @param {PWSTR} szAssemblyName 
     * @param {Pointer<IUnknown>} ppIUnk 
     * @param {Integer} cMax 
     * @param {Pointer<UInt32>} pcAssemblies 
     * @returns {HRESULT} 
     */
    FindAssembliesByName(szAppBase, szPrivateBin, szAssemblyName, ppIUnk, cMax, pcAssemblies) {
        szAppBase := szAppBase is String ? StrPtr(szAppBase) : szAppBase
        szPrivateBin := szPrivateBin is String ? StrPtr(szPrivateBin) : szPrivateBin
        szAssemblyName := szAssemblyName is String ? StrPtr(szAssemblyName) : szAssemblyName

        result := ComCall(16, this, "ptr", szAppBase, "ptr", szPrivateBin, "ptr", szAssemblyName, "ptr", ppIUnk, "uint", cMax, "uint*", pcAssemblies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
