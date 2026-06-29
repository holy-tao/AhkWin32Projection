#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRStrongName extends IUnknown {
    /**
     * The interface identifier for ICLRStrongName
     * @type {Guid}
     */
    static IID := Guid("{9fd93ccf-3280-4391-b3a9-96e1cde77c8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRStrongName interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetHashFromAssemblyFile                  : IntPtr
        GetHashFromAssemblyFileW                 : IntPtr
        GetHashFromBlob                          : IntPtr
        GetHashFromFile                          : IntPtr
        GetHashFromFileW                         : IntPtr
        GetHashFromHandle                        : IntPtr
        StrongNameCompareAssemblies              : IntPtr
        StrongNameFreeBuffer                     : IntPtr
        StrongNameGetBlob                        : IntPtr
        StrongNameGetBlobFromImage               : IntPtr
        StrongNameGetPublicKey                   : IntPtr
        StrongNameHashSize                       : IntPtr
        StrongNameKeyDelete                      : IntPtr
        StrongNameKeyGen                         : IntPtr
        StrongNameKeyGenEx                       : IntPtr
        StrongNameKeyInstall                     : IntPtr
        StrongNameSignatureGeneration            : IntPtr
        StrongNameSignatureGenerationEx          : IntPtr
        StrongNameSignatureSize                  : IntPtr
        StrongNameSignatureVerification          : IntPtr
        StrongNameSignatureVerificationEx        : IntPtr
        StrongNameSignatureVerificationFromImage : IntPtr
        StrongNameTokenFromAssembly              : IntPtr
        StrongNameTokenFromAssemblyEx            : IntPtr
        StrongNameTokenFromPublicKey             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRStrongName.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PSTR} pszFilePath 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromAssemblyFile(pszFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pszFilePath := pszFilePath is String ? StrPtr(pszFilePath) : pszFilePath

        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pszFilePath, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromAssemblyFileW(pwzFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwzFilePath, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBlob 
     * @param {Integer} cchBlob 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromBlob(pbBlob, cchBlob, piHashAlg, pbHash, cchHash, pchHash) {
        pbBlobMarshal := pbBlob is VarRef ? "char*" : "ptr"
        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pbBlobMarshal, pbBlob, "uint", cchBlob, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszFilePath 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromFile(pszFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pszFilePath := pszFilePath is String ? StrPtr(pszFilePath) : pszFilePath

        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszFilePath, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromFileW(pwzFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pwzFilePath, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hFile 
     * @param {Pointer<Integer>} piHashAlg 
     * @param {Pointer<Integer>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<Integer>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromHandle(hFile, piHashAlg, pbHash, cchHash, pchHash) {
        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, HANDLE, hFile, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAssembly1 
     * @param {PWSTR} pwzAssembly2 
     * @returns {Integer} 
     */
    StrongNameCompareAssemblies(pwzAssembly1, pwzAssembly2) {
        pwzAssembly1 := pwzAssembly1 is String ? StrPtr(pwzAssembly1) : pwzAssembly1
        pwzAssembly2 := pwzAssembly2 is String ? StrPtr(pwzAssembly2) : pwzAssembly2

        result := ComCall(9, this, "ptr", pwzAssembly1, "ptr", pwzAssembly2, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @param {Pointer<Integer>} pbMemory 
     * @returns {HRESULT} 
     */
    StrongNameFreeBuffer(pbMemory) {
        pbMemoryMarshal := pbMemory is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pbMemoryMarshal, pbMemory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Integer>} pbBlob 
     * @param {Pointer<Integer>} pcbBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetBlob(pwzFilePath, pbBlob, pcbBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        pbBlobMarshal := pbBlob is VarRef ? "char*" : "ptr"
        pcbBlobMarshal := pcbBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "ptr", pwzFilePath, pbBlobMarshal, pbBlob, pcbBlobMarshal, pcbBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBase 
     * @param {Integer} dwLength 
     * @param {Pointer<Integer>} pcbBlob 
     * @returns {Integer} 
     */
    StrongNameGetBlobFromImage(pbBase, dwLength, pcbBlob) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"
        pcbBlobMarshal := pcbBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pbBaseMarshal, pbBase, "uint", dwLength, "char*", &pbBlob := 0, pcbBlobMarshal, pcbBlob, "HRESULT")
        return pbBlob
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Pointer<Integer>>} ppbPublicKeyBlob 
     * @param {Pointer<Integer>} pcbPublicKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetPublicKey(pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"
        ppbPublicKeyBlobMarshal := ppbPublicKeyBlob is VarRef ? "ptr*" : "ptr"
        pcbPublicKeyBlobMarshal := pcbPublicKeyBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pwzKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, ppbPublicKeyBlobMarshal, ppbPublicKeyBlob, pcbPublicKeyBlobMarshal, pcbPublicKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulHashAlg 
     * @returns {Integer} 
     */
    StrongNameHashSize(ulHashAlg) {
        result := ComCall(14, this, "uint", ulHashAlg, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @returns {HRESULT} 
     */
    StrongNameKeyDelete(pwzKeyContainer) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(15, this, "ptr", pwzKeyContainer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Integer} dwFlags 
     * @param {Pointer<Pointer<Integer>>} ppbKeyBlob 
     * @param {Pointer<Integer>} pcbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyGen(pwzKeyContainer, dwFlags, ppbKeyBlob, pcbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        ppbKeyBlobMarshal := ppbKeyBlob is VarRef ? "ptr*" : "ptr"
        pcbKeyBlobMarshal := pcbKeyBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", pwzKeyContainer, "uint", dwFlags, ppbKeyBlobMarshal, ppbKeyBlob, pcbKeyBlobMarshal, pcbKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Integer} dwFlags 
     * @param {Integer} dwKeySize 
     * @param {Pointer<Pointer<Integer>>} ppbKeyBlob 
     * @param {Pointer<Integer>} pcbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyGenEx(pwzKeyContainer, dwFlags, dwKeySize, ppbKeyBlob, pcbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        ppbKeyBlobMarshal := ppbKeyBlob is VarRef ? "ptr*" : "ptr"
        pcbKeyBlobMarshal := pcbKeyBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "ptr", pwzKeyContainer, "uint", dwFlags, "uint", dwKeySize, ppbKeyBlobMarshal, ppbKeyBlob, pcbKeyBlobMarshal, pcbKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyInstall(pwzKeyContainer, pbKeyBlob, cbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"

        result := ComCall(18, this, "ptr", pwzKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Pointer<Integer>>} ppbSignatureBlob 
     * @param {Pointer<Integer>} pcbSignatureBlob 
     * @returns {HRESULT} 
     */
    StrongNameSignatureGeneration(pwzFilePath, pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"
        ppbSignatureBlobMarshal := ppbSignatureBlob is VarRef ? "ptr*" : "ptr"
        pcbSignatureBlobMarshal := pcbSignatureBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", pwzFilePath, "ptr", pwzKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, ppbSignatureBlobMarshal, ppbSignatureBlob, pcbSignatureBlobMarshal, pcbSignatureBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {PWSTR} wszKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Pointer<Integer>>} ppbSignatureBlob 
     * @param {Pointer<Integer>} pcbSignatureBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureGenerationEx(wszFilePath, wszKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob, dwFlags) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath
        wszKeyContainer := wszKeyContainer is String ? StrPtr(wszKeyContainer) : wszKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"
        ppbSignatureBlobMarshal := ppbSignatureBlob is VarRef ? "ptr*" : "ptr"
        pcbSignatureBlobMarshal := pcbSignatureBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", wszFilePath, "ptr", wszKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, ppbSignatureBlobMarshal, ppbSignatureBlob, pcbSignatureBlobMarshal, pcbSignatureBlob, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbPublicKeyBlob 
     * @param {Integer} cbPublicKeyBlob 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    StrongNameSignatureSize(pbPublicKeyBlob, cbPublicKeyBlob, pcbSize) {
        pbPublicKeyBlobMarshal := pbPublicKeyBlob is VarRef ? "char*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, pbPublicKeyBlobMarshal, pbPublicKeyBlob, "uint", cbPublicKeyBlob, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwInFlags 
     * @returns {Integer} 
     */
    StrongNameSignatureVerification(pwzFilePath, dwInFlags) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(22, this, "ptr", pwzFilePath, "uint", dwInFlags, "uint*", &pdwOutFlags := 0, "HRESULT")
        return pdwOutFlags
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {BOOLEAN} fForceVerification 
     * @returns {Integer} 
     */
    StrongNameSignatureVerificationEx(pwzFilePath, fForceVerification) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(23, this, "ptr", pwzFilePath, BOOLEAN, fForceVerification, "char*", &pfWasVerified := 0, "HRESULT")
        return pfWasVerified
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBase 
     * @param {Integer} dwLength 
     * @param {Integer} dwInFlags 
     * @returns {Integer} 
     */
    StrongNameSignatureVerificationFromImage(pbBase, dwLength, dwInFlags) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"

        result := ComCall(24, this, pbBaseMarshal, pbBase, "uint", dwLength, "uint", dwInFlags, "uint*", &pdwOutFlags := 0, "HRESULT")
        return pdwOutFlags
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Pointer<Integer>>} ppbStrongNameToken 
     * @param {Pointer<Integer>} pcbStrongNameToken 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromAssembly(pwzFilePath, ppbStrongNameToken, pcbStrongNameToken) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        ppbStrongNameTokenMarshal := ppbStrongNameToken is VarRef ? "ptr*" : "ptr"
        pcbStrongNameTokenMarshal := pcbStrongNameToken is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr", pwzFilePath, ppbStrongNameTokenMarshal, ppbStrongNameToken, pcbStrongNameTokenMarshal, pcbStrongNameToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Pointer<Integer>>} ppbStrongNameToken 
     * @param {Pointer<Integer>} pcbStrongNameToken 
     * @param {Pointer<Pointer<Integer>>} ppbPublicKeyBlob 
     * @param {Pointer<Integer>} pcbPublicKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromAssemblyEx(pwzFilePath, ppbStrongNameToken, pcbStrongNameToken, ppbPublicKeyBlob, pcbPublicKeyBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        ppbStrongNameTokenMarshal := ppbStrongNameToken is VarRef ? "ptr*" : "ptr"
        pcbStrongNameTokenMarshal := pcbStrongNameToken is VarRef ? "uint*" : "ptr"
        ppbPublicKeyBlobMarshal := ppbPublicKeyBlob is VarRef ? "ptr*" : "ptr"
        pcbPublicKeyBlobMarshal := pcbPublicKeyBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(26, this, "ptr", pwzFilePath, ppbStrongNameTokenMarshal, ppbStrongNameToken, pcbStrongNameTokenMarshal, pcbStrongNameToken, ppbPublicKeyBlobMarshal, ppbPublicKeyBlob, pcbPublicKeyBlobMarshal, pcbPublicKeyBlob, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbPublicKeyBlob 
     * @param {Integer} cbPublicKeyBlob 
     * @param {Pointer<Pointer<Integer>>} ppbStrongNameToken 
     * @param {Pointer<Integer>} pcbStrongNameToken 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromPublicKey(pbPublicKeyBlob, cbPublicKeyBlob, ppbStrongNameToken, pcbStrongNameToken) {
        pbPublicKeyBlobMarshal := pbPublicKeyBlob is VarRef ? "char*" : "ptr"
        ppbStrongNameTokenMarshal := ppbStrongNameToken is VarRef ? "ptr*" : "ptr"
        pcbStrongNameTokenMarshal := pcbStrongNameToken is VarRef ? "uint*" : "ptr"

        result := ComCall(27, this, pbPublicKeyBlobMarshal, pbPublicKeyBlob, "uint", cbPublicKeyBlob, ppbStrongNameTokenMarshal, ppbStrongNameToken, pcbStrongNameTokenMarshal, pcbStrongNameToken, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRStrongName.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetHashFromAssemblyFile := CallbackCreate(GetMethod(implObj, "GetHashFromAssemblyFile"), flags, 6)
        this.vtbl.GetHashFromAssemblyFileW := CallbackCreate(GetMethod(implObj, "GetHashFromAssemblyFileW"), flags, 6)
        this.vtbl.GetHashFromBlob := CallbackCreate(GetMethod(implObj, "GetHashFromBlob"), flags, 7)
        this.vtbl.GetHashFromFile := CallbackCreate(GetMethod(implObj, "GetHashFromFile"), flags, 6)
        this.vtbl.GetHashFromFileW := CallbackCreate(GetMethod(implObj, "GetHashFromFileW"), flags, 6)
        this.vtbl.GetHashFromHandle := CallbackCreate(GetMethod(implObj, "GetHashFromHandle"), flags, 6)
        this.vtbl.StrongNameCompareAssemblies := CallbackCreate(GetMethod(implObj, "StrongNameCompareAssemblies"), flags, 4)
        this.vtbl.StrongNameFreeBuffer := CallbackCreate(GetMethod(implObj, "StrongNameFreeBuffer"), flags, 2)
        this.vtbl.StrongNameGetBlob := CallbackCreate(GetMethod(implObj, "StrongNameGetBlob"), flags, 4)
        this.vtbl.StrongNameGetBlobFromImage := CallbackCreate(GetMethod(implObj, "StrongNameGetBlobFromImage"), flags, 5)
        this.vtbl.StrongNameGetPublicKey := CallbackCreate(GetMethod(implObj, "StrongNameGetPublicKey"), flags, 6)
        this.vtbl.StrongNameHashSize := CallbackCreate(GetMethod(implObj, "StrongNameHashSize"), flags, 3)
        this.vtbl.StrongNameKeyDelete := CallbackCreate(GetMethod(implObj, "StrongNameKeyDelete"), flags, 2)
        this.vtbl.StrongNameKeyGen := CallbackCreate(GetMethod(implObj, "StrongNameKeyGen"), flags, 5)
        this.vtbl.StrongNameKeyGenEx := CallbackCreate(GetMethod(implObj, "StrongNameKeyGenEx"), flags, 6)
        this.vtbl.StrongNameKeyInstall := CallbackCreate(GetMethod(implObj, "StrongNameKeyInstall"), flags, 4)
        this.vtbl.StrongNameSignatureGeneration := CallbackCreate(GetMethod(implObj, "StrongNameSignatureGeneration"), flags, 7)
        this.vtbl.StrongNameSignatureGenerationEx := CallbackCreate(GetMethod(implObj, "StrongNameSignatureGenerationEx"), flags, 8)
        this.vtbl.StrongNameSignatureSize := CallbackCreate(GetMethod(implObj, "StrongNameSignatureSize"), flags, 4)
        this.vtbl.StrongNameSignatureVerification := CallbackCreate(GetMethod(implObj, "StrongNameSignatureVerification"), flags, 4)
        this.vtbl.StrongNameSignatureVerificationEx := CallbackCreate(GetMethod(implObj, "StrongNameSignatureVerificationEx"), flags, 4)
        this.vtbl.StrongNameSignatureVerificationFromImage := CallbackCreate(GetMethod(implObj, "StrongNameSignatureVerificationFromImage"), flags, 5)
        this.vtbl.StrongNameTokenFromAssembly := CallbackCreate(GetMethod(implObj, "StrongNameTokenFromAssembly"), flags, 4)
        this.vtbl.StrongNameTokenFromAssemblyEx := CallbackCreate(GetMethod(implObj, "StrongNameTokenFromAssemblyEx"), flags, 6)
        this.vtbl.StrongNameTokenFromPublicKey := CallbackCreate(GetMethod(implObj, "StrongNameTokenFromPublicKey"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetHashFromAssemblyFile)
        CallbackFree(this.vtbl.GetHashFromAssemblyFileW)
        CallbackFree(this.vtbl.GetHashFromBlob)
        CallbackFree(this.vtbl.GetHashFromFile)
        CallbackFree(this.vtbl.GetHashFromFileW)
        CallbackFree(this.vtbl.GetHashFromHandle)
        CallbackFree(this.vtbl.StrongNameCompareAssemblies)
        CallbackFree(this.vtbl.StrongNameFreeBuffer)
        CallbackFree(this.vtbl.StrongNameGetBlob)
        CallbackFree(this.vtbl.StrongNameGetBlobFromImage)
        CallbackFree(this.vtbl.StrongNameGetPublicKey)
        CallbackFree(this.vtbl.StrongNameHashSize)
        CallbackFree(this.vtbl.StrongNameKeyDelete)
        CallbackFree(this.vtbl.StrongNameKeyGen)
        CallbackFree(this.vtbl.StrongNameKeyGenEx)
        CallbackFree(this.vtbl.StrongNameKeyInstall)
        CallbackFree(this.vtbl.StrongNameSignatureGeneration)
        CallbackFree(this.vtbl.StrongNameSignatureGenerationEx)
        CallbackFree(this.vtbl.StrongNameSignatureSize)
        CallbackFree(this.vtbl.StrongNameSignatureVerification)
        CallbackFree(this.vtbl.StrongNameSignatureVerificationEx)
        CallbackFree(this.vtbl.StrongNameSignatureVerificationFromImage)
        CallbackFree(this.vtbl.StrongNameTokenFromAssembly)
        CallbackFree(this.vtbl.StrongNameTokenFromAssemblyEx)
        CallbackFree(this.vtbl.StrongNameTokenFromPublicKey)
    }
}
