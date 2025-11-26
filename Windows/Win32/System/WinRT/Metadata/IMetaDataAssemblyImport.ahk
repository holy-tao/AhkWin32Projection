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
     * Gets the set of properties for the assembly with the specified metadata signature.
     * @param {Integer} mda The <b>mdAssembly</b> metadata token that represents the assembly for which to get the properties.
     * @param {Pointer<Pointer<Void>>} ppbPublicKey A pointer to the public key or the metadata token.
     * @param {Pointer<Integer>} pcbPublicKey The number of bytes in the returned public key.
     * @param {Pointer<Integer>} pulHashAlgId A pointer to the algorithm used to hash the files in the assembly.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in wide chars, of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The number of wide chars actually returned in <i>szName</i>.
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData A pointer to an <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/assemblymetadata-structure">ASSEMBLYMETADATA</a> structure that contains the assembly metadata.
     * @param {Pointer<Integer>} pdwAssemblyFlags Flags that describe the metadata applied to an assembly. This value is a combination of one or more <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corassemblyflags-enumeration">CorAssemblyFlags</a> values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyprops
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
     * Gets the set of properties for the assembly reference with the specified metadata signature.
     * @param {Integer} mdar The <b>mdAssemblyRef</b> metadata token that represents the assembly reference for which to get the properties.
     * @param {Pointer<Pointer<Void>>} ppbPublicKeyOrToken A pointer to the public key or the metadata token.
     * @param {Pointer<Integer>} pcbPublicKeyOrToken The number of bytes in the returned public key or token.
     * @param {PWSTR} szName The simple name of the assembly.
     * @param {Integer} cchName The size, in wide chars, of <i>szName</i>.
     * @param {Pointer<Integer>} pchName A  pointer to the number of wide chars actually returned in <i>szName</i>.
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData A pointer to an <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/assemblymetadata-structure">ASSEMBLYMETADATA</a> structure that contains the assembly metadata.
     * @param {Pointer<Pointer<Void>>} ppbHashValue A pointer to the hash value. This is the hash, using the SHA-1 algorithm, of the PublicKey property of the assembly being referenced, unless the arfFullOriginator flag of the <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/assemblyrefflags-enumeration">AssemblyRefFlags</a> enumeration is set.
     * @param {Pointer<Integer>} pcbHashValue The number of wide chars in the returned hash value.
     * @param {Pointer<Integer>} pdwAssemblyRefFlags A pointer to flags that describe the metadata applied to an assembly. The flags value is a combination of one or more <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corassemblyflags-enumeration">CorAssemblyFlags</a> values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyrefprops
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
     * Gets the properties of the file with the specified metadata signature.
     * @param {Integer} mdf The <b>mdFile</b> metadata token that represents the file for which to get the properties.
     * @param {PWSTR} szName The simple name of the file.
     * @param {Integer} cchName The size, in wide chars, of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The number of wide chars actually returned in <i>szName</i>.
     * @param {Pointer<Pointer<Void>>} ppbHashValue A pointer to the hash value. This is the hash, using the SHA-1 algorithm, of the file.
     * @param {Pointer<Integer>} pcbHashValue The number of wide chars in the returned hash value.
     * @param {Pointer<Integer>} pdwFileFlags A pointer to the flags that describe the metadata applied to a file. The flags value is a combination of one or more <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/corfileflags-enumeration">CorFileFlags</a> values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getfileprops
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
     * Gets the set of properties of the exported type with the specified metadata signature.
     * @param {Integer} mdct An <b>mdExportedType</b> metadata token that represents the exported type.
     * @param {PWSTR} szName The name of the exported type.
     * @param {Integer} cchName The size, in wide characters, of <i>szName</i>.
     * @param {Pointer<Integer>} pchName The number of wide characters actually returned in <i>szName</i>.
     * @param {Pointer<Integer>} ptkImplementation An <b>mdFile</b>, <b>mdAssemblyRef</b>, or <b>mdExportedType</b> metadata token that contains or allows access to the properties of the exported type.
     * @param {Pointer<Integer>} ptkTypeDef A pointer to an <b>mdTypeDef</b> token that represents a type in the file.
     * @param {Pointer<Integer>} pdwExportedTypeFlags A pointer to the flags that describe the metadata applied to the exported type. The flags value can be one or more <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/cortypeattr-enumeration">CorTypeAttr</a> values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getexportedtypeprops
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
     * Gets the set of properties of the manifest resource with the specified metadata signature.
     * @param {Integer} mdmr An <b>mdManifestResource</b> token that represents the resource for which to get the properties.
     * @param {PWSTR} szName The name of the resource.
     * @param {Integer} cchName The size, in wide chars, of <i>szName</i>.
     * @param {Pointer<Integer>} pchName A pointer to the number of wide chars actually returned in <i>szName</i>.
     * @param {Pointer<Integer>} ptkImplementation A pointer to an <b>mdFile</b> token or an <b>mdAssemblyRef</b> token that represents the file or assembly, respectively, that contains the resource.
     * @param {Pointer<Integer>} pdwOffset A pointer to a value that specifies the offset to the beginning of the resource within the file.
     * @param {Pointer<Integer>} pdwResourceFlags A pointer to flags that describe the metadata applied to a resource. The flags value is a combination of one or more <a href="https://docs.microsoft.com/dotnet/framework/unmanaged-api/metadata/cormanifestresourceflags-enumeration">CorManifestResourceFlags</a> values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getmanifestresourceprops
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
     * Enumerates the mdAssemblyRef instances that are defined in the assembly manifest.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be a null value when the <b>EnumAssemblyRefs</b> method is called for the first time.
     * @param {Pointer<Integer>} rAssemblyRefs The enumeration of <b>mdAssemblyRef</b> metadata tokens.
     * @param {Integer} cMax The maximum number of tokens that can be placed in the rAssemblyRefs array.
     * @param {Pointer<Integer>} pcTokens The number of tokens actually placed in <i>rAssemblyRefs</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumAssemblyRefs</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is set to zero.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumassemblyrefs
     */
    EnumAssemblyRefs(phEnum, rAssemblyRefs, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rAssemblyRefsMarshal := rAssemblyRefs is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, phEnumMarshal, phEnum, rAssemblyRefsMarshal, rAssemblyRefs, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates the files referenced in the current assembly manifest.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be a null value for the first call of this method.
     * @param {Pointer<Integer>} rFiles The array used to store the <b>mdFile</b> metadata tokens.
     * @param {Integer} cMax The maximum number of <b>mdFile</b> tokens that can be placed in <i>rFiles</i>.
     * @param {Pointer<Integer>} pcTokens The number of <b>mdFile</b> tokens actually placed in <i>rFiles</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumFiles</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is set to zero.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumfiles
     */
    EnumFiles(phEnum, rFiles, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rFilesMarshal := rFiles is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, phEnumMarshal, phEnum, rFilesMarshal, rFiles, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Enumerates the exported types referenced in the assembly manifest in the current metadata scope.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be a null value when the <b>EnumExportedTypes</b> method is called for the first time.
     * @param {Pointer<Integer>} rExportedTypes The enumeration of <b>mdExportedType</b> metadata tokens.
     * @param {Integer} cMax The maximum number of <b>mdExportedType</b> tokens that can be placed in the <i>rExportedTypes</i> array.
     * @param {Pointer<Integer>} pcTokens The number of <b>mdExportedType</b> tokens actually placed in <i>rExportedTypes</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumExportedTypes</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is set to zero.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-enumexportedtypes
     */
    EnumExportedTypes(phEnum, rExportedTypes, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rExportedTypesMarshal := rExportedTypes is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, phEnumMarshal, phEnum, rExportedTypesMarshal, rExportedTypes, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to an enumerator for the resources referenced in the current assembly manifest.
     * @param {Pointer<Pointer<Void>>} phEnum A pointer to the enumerator. This must be a null value when the <b>EnumManifestResources</b> method is called for the first time.
     * @param {Pointer<Integer>} rManifestResources The array used to store the <b>mdManifestResource</b> metadata tokens.
     * @param {Integer} cMax The maximum number of <b>mdManifestResource</b> tokens that can be placed in <i>rManifestResources</i>.
     * @param {Pointer<Integer>} pcTokens The number of <b>mdManifestResource</b> tokens actually placed in <i>rManifestResources</i>.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>S_OK</b></td>
     * <td><b>EnumManifestResources</b> returned successfully.</td>
     * </tr>
     * <tr>
     * <td><b>S_FALSE</b></td>
     * <td>There are no tokens to enumerate. In this case, <i>pcTokens</i> is set to zero.
     *  
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-enummanifestresources
     */
    EnumManifestResources(phEnum, rManifestResources, cMax, pcTokens) {
        phEnumMarshal := phEnum is VarRef ? "ptr*" : "ptr"
        rManifestResourcesMarshal := rManifestResources is VarRef ? "uint*" : "ptr"
        pcTokensMarshal := pcTokens is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, phEnumMarshal, phEnum, rManifestResourcesMarshal, rManifestResources, "uint", cMax, pcTokensMarshal, pcTokens, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the assembly in the current scope.
     * @param {Pointer<Integer>} ptkAssembly A pointer to the retrieved <b>mdAssembly</b> token that identifies the assembly.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-getassemblyfromscope
     */
    GetAssemblyFromScope(ptkAssembly) {
        ptkAssemblyMarshal := ptkAssembly is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, ptkAssemblyMarshal, ptkAssembly, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to an exported type, given its name and enclosing type.
     * @param {PWSTR} szName The name of the exported type.
     * @param {Integer} mdtExportedType The metadata token for the enclosing class of the exported type. This value is <b>mdExportedTypeNil</b> if the requested exported type is not a nested type.
     * @param {Pointer<Integer>} ptkExportedType A pointer to the <b>mdExportedType</b> token that represents the exported type.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-findexportedtypebyname
     */
    FindExportedTypeByName(szName, mdtExportedType, ptkExportedType) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkExportedTypeMarshal := ptkExportedType is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", szName, "uint", mdtExportedType, ptkExportedTypeMarshal, ptkExportedType, "HRESULT")
        return result
    }

    /**
     * Gets a pointer to the manifest resource with the specified name.
     * @param {PWSTR} szName The name of the resource.
     * @param {Pointer<Integer>} ptkManifestResource The array used to store the <b>mdManifestResource</b> metadata tokens, each of which represents a manifest resource.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-findmanifestresourcebyname
     */
    FindManifestResourceByName(szName, ptkManifestResource) {
        szName := szName is String ? StrPtr(szName) : szName

        ptkManifestResourceMarshal := ptkManifestResource is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", szName, ptkManifestResourceMarshal, ptkManifestResource, "HRESULT")
        return result
    }

    /**
     * Releases a reference to the specified enumeration instance.
     * @param {Pointer<Void>} hEnum The enumeration instance to be closed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-closeenum
     */
    CloseEnum(hEnum) {
        hEnumMarshal := hEnum is VarRef ? "ptr" : "ptr"

        ComCall(15, this, hEnumMarshal, hEnum)
    }

    /**
     * Gets an array of assemblies with the specified name, using the standard rules employed by the common language runtime (CLR) for resolving references.
     * @param {PWSTR} szAppBase The root directory in which to search for the given assembly. If this value is set to null, <b>FindAssembliesByName</b> will look only in the global assembly cache for the assembly.
     * @param {PWSTR} szPrivateBin A list of semicolon-delimited subdirectories (for example, "bin;bin2"), under the root directory, in which to search for the assembly. These directories are probed in addition to those specified in the default probing rules.
     * @param {PWSTR} szAssemblyName The name of the assembly to find. The format of this string is defined in the class reference page for <a href="https://docs.microsoft.com/dotnet/api/system.reflection.assemblyname">AssemblyName</a>.
     * @param {Integer} cMax The maximum number of interface pointers that can be placed in <i>ppIUnk</i>.
     * @param {Pointer<Integer>} pcAssemblies The number of interface pointers returned. That is, the number of interface pointers actually placed in <i>ppIUnk</i>.
     * @returns {IUnknown} An array of type IUnknown in which to put the <a href="https://docs.microsoft.com/windows/desktop/api/rometadataapi/nn-rometadataapi-imetadataassemblyimport">IMetadataAssemblyImport</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadataassemblyimport-findassembliesbyname
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
