#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRStrongName
     * @type {Guid}
     */
    static IID => Guid("{9fd93ccf-3280-4391-b3a9-96e1cde77c8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHashFromAssemblyFile", "GetHashFromAssemblyFileW", "GetHashFromBlob", "GetHashFromFile", "GetHashFromFileW", "GetHashFromHandle", "StrongNameCompareAssemblies", "StrongNameFreeBuffer", "StrongNameGetBlob", "StrongNameGetBlobFromImage", "StrongNameGetPublicKey", "StrongNameHashSize", "StrongNameKeyDelete", "StrongNameKeyGen", "StrongNameKeyGenEx", "StrongNameKeyInstall", "StrongNameSignatureGeneration", "StrongNameSignatureGenerationEx", "StrongNameSignatureSize", "StrongNameSignatureVerification", "StrongNameSignatureVerificationEx", "StrongNameSignatureVerificationFromImage", "StrongNameTokenFromAssembly", "StrongNameTokenFromAssemblyEx", "StrongNameTokenFromPublicKey"]

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
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        piHashAlgMarshal := piHashAlg is VarRef ? "uint*" : "ptr"
        pbHashMarshal := pbHash is VarRef ? "char*" : "ptr"
        pchHashMarshal := pchHash is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", hFile, piHashAlgMarshal, piHashAlg, pbHashMarshal, pbHash, "uint", cchHash, pchHashMarshal, pchHash, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAssembly1 
     * @param {PWSTR} pwzAssembly2 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    StrongNameCompareAssemblies(pwzAssembly1, pwzAssembly2, pdwResult) {
        pwzAssembly1 := pwzAssembly1 is String ? StrPtr(pwzAssembly1) : pwzAssembly1
        pwzAssembly2 := pwzAssembly2 is String ? StrPtr(pwzAssembly2) : pwzAssembly2

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pwzAssembly1, "ptr", pwzAssembly2, pdwResultMarshal, pdwResult, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pbBlob 
     * @param {Pointer<Integer>} pcbBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetBlobFromImage(pbBase, dwLength, pbBlob, pcbBlob) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"
        pbBlobMarshal := pbBlob is VarRef ? "char*" : "ptr"
        pcbBlobMarshal := pcbBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pbBaseMarshal, pbBase, "uint", dwLength, pbBlobMarshal, pbBlob, pcbBlobMarshal, pcbBlob, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    StrongNameHashSize(ulHashAlg, pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", ulHashAlg, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerification(pwzFilePath, dwInFlags, pdwOutFlags) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "ptr", pwzFilePath, "uint", dwInFlags, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {BOOLEAN} fForceVerification 
     * @param {Pointer<Integer>} pfWasVerified 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerificationEx(pwzFilePath, fForceVerification, pfWasVerified) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        pfWasVerifiedMarshal := pfWasVerified is VarRef ? "char*" : "ptr"

        result := ComCall(23, this, "ptr", pwzFilePath, "char", fForceVerification, pfWasVerifiedMarshal, pfWasVerified, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbBase 
     * @param {Integer} dwLength 
     * @param {Integer} dwInFlags 
     * @param {Pointer<Integer>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerificationFromImage(pbBase, dwLength, dwInFlags, pdwOutFlags) {
        pbBaseMarshal := pbBase is VarRef ? "char*" : "ptr"
        pdwOutFlagsMarshal := pdwOutFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, pbBaseMarshal, pbBase, "uint", dwLength, "uint", dwInFlags, pdwOutFlagsMarshal, pdwOutFlags, "HRESULT")
        return result
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
}
