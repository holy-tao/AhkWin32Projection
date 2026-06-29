#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ASSEMBLYMETADATA.ahk" { ASSEMBLYMETADATA }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct IMetaDataAssemblyEmit extends IUnknown {
    /**
     * The interface identifier for IMetaDataAssemblyEmit
     * @type {Guid}
     */
    static IID := Guid("{211ef15b-5317-4438-b196-dec87b887693}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMetaDataAssemblyEmit interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DefineAssembly           : IntPtr
        DefineAssemblyRef        : IntPtr
        DefineFile               : IntPtr
        DefineExportedType       : IntPtr
        DefineManifestResource   : IntPtr
        SetAssemblyProps         : IntPtr
        SetAssemblyRefProps      : IntPtr
        SetFileProps             : IntPtr
        SetExportedTypeProps     : IntPtr
        SetManifestResourceProps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMetaDataAssemblyEmit.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(3, this, pbPublicKeyMarshal, pbPublicKey, "uint", cbPublicKey, "uint", ulHashAlgId, "ptr", szName, ASSEMBLYMETADATA.Ptr, pMetaData, "uint", dwAssemblyFlags, pmaMarshal, pma, "HRESULT")
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

        result := ComCall(4, this, pbPublicKeyOrTokenMarshal, pbPublicKeyOrToken, "uint", cbPublicKeyOrToken, "ptr", szName, ASSEMBLYMETADATA.Ptr, pMetaData, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwAssemblyRefFlags, pmdarMarshal, pmdar, "HRESULT")
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

        result := ComCall(8, this, "uint", pma, pbPublicKeyMarshal, pbPublicKey, "uint", cbPublicKey, "uint", ulHashAlgId, "ptr", szName, ASSEMBLYMETADATA.Ptr, pMetaData, "uint", dwAssemblyFlags, "HRESULT")
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

        result := ComCall(9, this, "uint", ar, pbPublicKeyOrTokenMarshal, pbPublicKeyOrToken, "uint", cbPublicKeyOrToken, "ptr", szName, ASSEMBLYMETADATA.Ptr, pMetaData, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwAssemblyRefFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _file 
     * @param {Pointer<Void>} pbHashValue 
     * @param {Integer} cbHashValue 
     * @param {Integer} dwFileFlags 
     * @returns {HRESULT} 
     */
    SetFileProps(_file, pbHashValue, cbHashValue, dwFileFlags) {
        pbHashValueMarshal := pbHashValue is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", _file, pbHashValueMarshal, pbHashValue, "uint", cbHashValue, "uint", dwFileFlags, "HRESULT")
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

    Query(iid) {
        if (IMetaDataAssemblyEmit.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DefineAssembly := CallbackCreate(GetMethod(implObj, "DefineAssembly"), flags, 8)
        this.vtbl.DefineAssemblyRef := CallbackCreate(GetMethod(implObj, "DefineAssemblyRef"), flags, 9)
        this.vtbl.DefineFile := CallbackCreate(GetMethod(implObj, "DefineFile"), flags, 6)
        this.vtbl.DefineExportedType := CallbackCreate(GetMethod(implObj, "DefineExportedType"), flags, 6)
        this.vtbl.DefineManifestResource := CallbackCreate(GetMethod(implObj, "DefineManifestResource"), flags, 6)
        this.vtbl.SetAssemblyProps := CallbackCreate(GetMethod(implObj, "SetAssemblyProps"), flags, 8)
        this.vtbl.SetAssemblyRefProps := CallbackCreate(GetMethod(implObj, "SetAssemblyRefProps"), flags, 9)
        this.vtbl.SetFileProps := CallbackCreate(GetMethod(implObj, "SetFileProps"), flags, 5)
        this.vtbl.SetExportedTypeProps := CallbackCreate(GetMethod(implObj, "SetExportedTypeProps"), flags, 5)
        this.vtbl.SetManifestResourceProps := CallbackCreate(GetMethod(implObj, "SetManifestResourceProps"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DefineAssembly)
        CallbackFree(this.vtbl.DefineAssemblyRef)
        CallbackFree(this.vtbl.DefineFile)
        CallbackFree(this.vtbl.DefineExportedType)
        CallbackFree(this.vtbl.DefineManifestResource)
        CallbackFree(this.vtbl.SetAssemblyProps)
        CallbackFree(this.vtbl.SetAssemblyRefProps)
        CallbackFree(this.vtbl.SetFileProps)
        CallbackFree(this.vtbl.SetExportedTypeProps)
        CallbackFree(this.vtbl.SetManifestResourceProps)
    }
}
