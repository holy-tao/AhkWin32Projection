#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataAssemblyEmit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataAssemblyEmit
     * @type {Guid}
     */
    static IID => Guid("{211ef15b-5317-4438-b196-dec87b887693}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DefineAssembly", "DefineAssemblyRef", "DefineFile", "DefineExportedType", "DefineManifestResource", "SetAssemblyProps", "SetAssemblyRefProps", "SetFileProps", "SetExportedTypeProps", "SetManifestResourceProps"]

    /**
     * 
     * @param {Pointer<Void>} pbPublicKey 
     * @param {Integer} cbPublicKey 
     * @param {Integer} ulHashAlgId 
     * @param {PWSTR} szName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Integer} dwAssemblyFlags 
     * @param {Pointer<Integer>} pma 
     * @returns {HRESULT} 
     */
    DefineAssembly(pbPublicKey, cbPublicKey, ulHashAlgId, szName, pMetaData, dwAssemblyFlags, pma) {
        szName := szName is String ? StrPtr(szName) : szName

        pbPublicKeyMarshal := pbPublicKey is VarRef ? "ptr" : "ptr"
        pmaMarshal := pma is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbPublicKeyMarshal, pbPublicKey, "uint", cbPublicKey, "uint", ulHashAlgId, "ptr", szName, "ptr", pMetaData, "uint", dwAssemblyFlags, pmaMarshal, pma, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pbPublicKeyOrToken 
     * @param {Integer} cbPublicKeyOrToken 
     * @param {PWSTR} szName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} dwAssemblyRefFlags 
     * @param {Pointer<Integer>} pmdar 
     * @returns {HRESULT} 
     */
    DefineAssemblyRef(pbPublicKeyOrToken, cbPublicKeyOrToken, szName, pMetaData, pbHashValue, cbHashValue, dwAssemblyRefFlags, pmdar) {
        szName := szName is String ? StrPtr(szName) : szName

        pbPublicKeyOrTokenMarshal := pbPublicKeyOrToken is VarRef ? "ptr" : "ptr"
        pbHashValueMarshal := pbHashValue is VarRef ? "ptr" : "ptr"
        pmdarMarshal := pmdar is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbPublicKeyOrTokenMarshal, pbPublicKeyOrToken, "uint", cbPublicKeyOrToken, "ptr", szName, "ptr", pMetaData, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwAssemblyRefFlags, pmdarMarshal, pmdar, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} dwFileFlags 
     * @param {Pointer<Integer>} pmdf 
     * @returns {HRESULT} 
     */
    DefineFile(szName, pbHashValue, cbHashValue, dwFileFlags, pmdf) {
        szName := szName is String ? StrPtr(szName) : szName

        pbHashValueMarshal := pbHashValue is VarRef ? "ptr" : "ptr"
        pmdfMarshal := pmdf is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", szName, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwFileFlags, pmdfMarshal, pmdf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} tkImplementation 
     * @param {Integer} tkTypeDef 
     * @param {Integer} dwExportedTypeFlags 
     * @param {Pointer<Integer>} pmdct 
     * @returns {HRESULT} 
     */
    DefineExportedType(szName, tkImplementation, tkTypeDef, dwExportedTypeFlags, pmdct) {
        szName := szName is String ? StrPtr(szName) : szName

        pmdctMarshal := pmdct is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", szName, "uint", tkImplementation, "uint", tkTypeDef, "uint", dwExportedTypeFlags, pmdctMarshal, pmdct, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szName 
     * @param {Integer} tkImplementation 
     * @param {Integer} dwOffset 
     * @param {Integer} dwResourceFlags 
     * @param {Pointer<Integer>} pmdmr 
     * @returns {HRESULT} 
     */
    DefineManifestResource(szName, tkImplementation, dwOffset, dwResourceFlags, pmdmr) {
        szName := szName is String ? StrPtr(szName) : szName

        pmdmrMarshal := pmdmr is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", szName, "uint", tkImplementation, "uint", dwOffset, "uint", dwResourceFlags, pmdmrMarshal, pmdmr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pma 
     * @param {Pointer<Void>} pbPublicKey 
     * @param {Integer} cbPublicKey 
     * @param {Integer} ulHashAlgId 
     * @param {PWSTR} szName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Integer} dwAssemblyFlags 
     * @returns {HRESULT} 
     */
    SetAssemblyProps(pma, pbPublicKey, cbPublicKey, ulHashAlgId, szName, pMetaData, dwAssemblyFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        pbPublicKeyMarshal := pbPublicKey is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", pma, pbPublicKeyMarshal, pbPublicKey, "uint", cbPublicKey, "uint", ulHashAlgId, "ptr", szName, "ptr", pMetaData, "uint", dwAssemblyFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ar 
     * @param {Pointer<Void>} pbPublicKeyOrToken 
     * @param {Integer} cbPublicKeyOrToken 
     * @param {PWSTR} szName 
     * @param {Pointer<ASSEMBLYMETADATA>} pMetaData 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} dwAssemblyRefFlags 
     * @returns {HRESULT} 
     */
    SetAssemblyRefProps(ar, pbPublicKeyOrToken, cbPublicKeyOrToken, szName, pMetaData, pbHashValue, cbHashValue, dwAssemblyRefFlags) {
        szName := szName is String ? StrPtr(szName) : szName

        pbPublicKeyOrTokenMarshal := pbPublicKeyOrToken is VarRef ? "ptr" : "ptr"
        pbHashValueMarshal := pbHashValue is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", ar, pbPublicKeyOrTokenMarshal, pbPublicKeyOrToken, "uint", cbPublicKeyOrToken, "ptr", szName, "ptr", pMetaData, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwAssemblyRefFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} file 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} dwFileFlags 
     * @returns {HRESULT} 
     */
    SetFileProps(file, pbHashValue, cbHashValue, dwFileFlags) {
        pbHashValueMarshal := pbHashValue is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", file, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwFileFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ct 
     * @param {Integer} tkImplementation 
     * @param {Integer} tkTypeDef 
     * @param {Integer} dwExportedTypeFlags 
     * @returns {HRESULT} 
     */
    SetExportedTypeProps(ct, tkImplementation, tkTypeDef, dwExportedTypeFlags) {
        result := ComCall(11, this, "uint", ct, "uint", tkImplementation, "uint", tkTypeDef, "uint", dwExportedTypeFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} mr 
     * @param {Integer} tkImplementation 
     * @param {Integer} dwOffset 
     * @param {Integer} dwResourceFlags 
     * @returns {HRESULT} 
     */
    SetManifestResourceProps(mr, tkImplementation, dwOffset, dwResourceFlags) {
        result := ComCall(12, this, "uint", mr, "uint", tkImplementation, "uint", dwOffset, "uint", dwResourceFlags, "HRESULT")
        return result
    }
}
