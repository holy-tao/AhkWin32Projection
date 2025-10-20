#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName extends IUnknown{
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
     * 
     * @param {PSTR} pszFilePath 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromAssemblyFile(pszFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        result := ComCall(3, this, "ptr", pszFilePath, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromAssemblyFileW(pwzFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(4, this, "ptr", pwzFilePath, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBlob 
     * @param {Integer} cchBlob 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromBlob(pbBlob, cchBlob, piHashAlg, pbHash, cchHash, pchHash) {
        result := ComCall(5, this, "char*", pbBlob, "uint", cchBlob, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PSTR} pszFilePath 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromFile(pszFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        result := ComCall(6, this, "ptr", pszFilePath, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromFileW(pwzFilePath, piHashAlg, pbHash, cchHash, pchHash) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(7, this, "ptr", pwzFilePath, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hFile 
     * @param {Pointer<UInt32>} piHashAlg 
     * @param {Pointer<Byte>} pbHash 
     * @param {Integer} cchHash 
     * @param {Pointer<UInt32>} pchHash 
     * @returns {HRESULT} 
     */
    GetHashFromHandle(hFile, piHashAlg, pbHash, cchHash, pchHash) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        result := ComCall(8, this, "ptr", hFile, "uint*", piHashAlg, "char*", pbHash, "uint", cchHash, "uint*", pchHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAssembly1 
     * @param {PWSTR} pwzAssembly2 
     * @param {Pointer<UInt32>} pdwResult 
     * @returns {HRESULT} 
     */
    StrongNameCompareAssemblies(pwzAssembly1, pwzAssembly2, pdwResult) {
        pwzAssembly1 := pwzAssembly1 is String ? StrPtr(pwzAssembly1) : pwzAssembly1
        pwzAssembly2 := pwzAssembly2 is String ? StrPtr(pwzAssembly2) : pwzAssembly2

        result := ComCall(9, this, "ptr", pwzAssembly1, "ptr", pwzAssembly2, "uint*", pdwResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbMemory 
     * @returns {HRESULT} 
     */
    StrongNameFreeBuffer(pbMemory) {
        result := ComCall(10, this, "char*", pbMemory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Byte>} pbBlob 
     * @param {Pointer<UInt32>} pcbBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetBlob(pwzFilePath, pbBlob, pcbBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(11, this, "ptr", pwzFilePath, "char*", pbBlob, "uint*", pcbBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBase 
     * @param {Integer} dwLength 
     * @param {Pointer<Byte>} pbBlob 
     * @param {Pointer<UInt32>} pcbBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetBlobFromImage(pbBase, dwLength, pbBlob, pcbBlob) {
        result := ComCall(12, this, "char*", pbBase, "uint", dwLength, "char*", pbBlob, "uint*", pcbBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Byte>} ppbPublicKeyBlob 
     * @param {Pointer<UInt32>} pcbPublicKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameGetPublicKey(pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(13, this, "ptr", pwzKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", ppbPublicKeyBlob, "uint*", pcbPublicKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulHashAlg 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    StrongNameHashSize(ulHashAlg, pcbSize) {
        result := ComCall(14, this, "uint", ulHashAlg, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @returns {HRESULT} 
     */
    StrongNameKeyDelete(pwzKeyContainer) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(15, this, "ptr", pwzKeyContainer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Integer} dwFlags 
     * @param {Pointer<Byte>} ppbKeyBlob 
     * @param {Pointer<UInt32>} pcbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyGen(pwzKeyContainer, dwFlags, ppbKeyBlob, pcbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(16, this, "ptr", pwzKeyContainer, "uint", dwFlags, "char*", ppbKeyBlob, "uint*", pcbKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Integer} dwFlags 
     * @param {Integer} dwKeySize 
     * @param {Pointer<Byte>} ppbKeyBlob 
     * @param {Pointer<UInt32>} pcbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyGenEx(pwzKeyContainer, dwFlags, dwKeySize, ppbKeyBlob, pcbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(17, this, "ptr", pwzKeyContainer, "uint", dwFlags, "uint", dwKeySize, "char*", ppbKeyBlob, "uint*", pcbKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameKeyInstall(pwzKeyContainer, pbKeyBlob, cbKeyBlob) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(18, this, "ptr", pwzKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Byte>} ppbSignatureBlob 
     * @param {Pointer<UInt32>} pcbSignatureBlob 
     * @returns {HRESULT} 
     */
    StrongNameSignatureGeneration(pwzFilePath, pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(19, this, "ptr", pwzFilePath, "ptr", pwzKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", ppbSignatureBlob, "uint*", pcbSignatureBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {PWSTR} wszKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Byte>} ppbSignatureBlob 
     * @param {Pointer<UInt32>} pcbSignatureBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureGenerationEx(wszFilePath, wszKeyContainer, pbKeyBlob, cbKeyBlob, ppbSignatureBlob, pcbSignatureBlob, dwFlags) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath
        wszKeyContainer := wszKeyContainer is String ? StrPtr(wszKeyContainer) : wszKeyContainer

        result := ComCall(20, this, "ptr", wszFilePath, "ptr", wszKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", ppbSignatureBlob, "uint*", pcbSignatureBlob, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbPublicKeyBlob 
     * @param {Integer} cbPublicKeyBlob 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    StrongNameSignatureSize(pbPublicKeyBlob, cbPublicKeyBlob, pcbSize) {
        result := ComCall(21, this, "char*", pbPublicKeyBlob, "uint", cbPublicKeyBlob, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Integer} dwInFlags 
     * @param {Pointer<UInt32>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerification(pwzFilePath, dwInFlags, pdwOutFlags) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(22, this, "ptr", pwzFilePath, "uint", dwInFlags, "uint*", pdwOutFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {BOOLEAN} fForceVerification 
     * @param {Pointer<Byte>} pfWasVerified 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerificationEx(pwzFilePath, fForceVerification, pfWasVerified) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(23, this, "ptr", pwzFilePath, "char", fForceVerification, "char*", pfWasVerified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbBase 
     * @param {Integer} dwLength 
     * @param {Integer} dwInFlags 
     * @param {Pointer<UInt32>} pdwOutFlags 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerificationFromImage(pbBase, dwLength, dwInFlags, pdwOutFlags) {
        result := ComCall(24, this, "char*", pbBase, "uint", dwLength, "uint", dwInFlags, "uint*", pdwOutFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Byte>} ppbStrongNameToken 
     * @param {Pointer<UInt32>} pcbStrongNameToken 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromAssembly(pwzFilePath, ppbStrongNameToken, pcbStrongNameToken) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(25, this, "ptr", pwzFilePath, "char*", ppbStrongNameToken, "uint*", pcbStrongNameToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFilePath 
     * @param {Pointer<Byte>} ppbStrongNameToken 
     * @param {Pointer<UInt32>} pcbStrongNameToken 
     * @param {Pointer<Byte>} ppbPublicKeyBlob 
     * @param {Pointer<UInt32>} pcbPublicKeyBlob 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromAssemblyEx(pwzFilePath, ppbStrongNameToken, pcbStrongNameToken, ppbPublicKeyBlob, pcbPublicKeyBlob) {
        pwzFilePath := pwzFilePath is String ? StrPtr(pwzFilePath) : pwzFilePath

        result := ComCall(26, this, "ptr", pwzFilePath, "char*", ppbStrongNameToken, "uint*", pcbStrongNameToken, "char*", ppbPublicKeyBlob, "uint*", pcbPublicKeyBlob, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbPublicKeyBlob 
     * @param {Integer} cbPublicKeyBlob 
     * @param {Pointer<Byte>} ppbStrongNameToken 
     * @param {Pointer<UInt32>} pcbStrongNameToken 
     * @returns {HRESULT} 
     */
    StrongNameTokenFromPublicKey(pbPublicKeyBlob, cbPublicKeyBlob, ppbStrongNameToken, pcbStrongNameToken) {
        result := ComCall(27, this, "char*", pbPublicKeyBlob, "uint", cbPublicKeyBlob, "char*", ppbStrongNameToken, "uint*", pcbStrongNameToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
