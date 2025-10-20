#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName2 extends IUnknown{
    /**
     * The interface identifier for ICLRStrongName2
     * @type {Guid}
     */
    static IID => Guid("{c22ed5c5-4b59-4975-90eb-85ea55c0069b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Byte>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Byte>} ppbPublicKeyBlob 
     * @param {Pointer<UInt32>} pcbPublicKeyBlob 
     * @param {Integer} uHashAlgId 
     * @param {Integer} uReserved 
     * @returns {HRESULT} 
     */
    StrongNameGetPublicKeyEx(pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob, uHashAlgId, uReserved) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        result := ComCall(3, this, "ptr", pwzKeyContainer, "char*", pbKeyBlob, "uint", cbKeyBlob, "char*", ppbPublicKeyBlob, "uint*", pcbPublicKeyBlob, "uint", uHashAlgId, "uint", uReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {BOOLEAN} fForceVerification 
     * @param {Pointer<Byte>} pbEcmaPublicKey 
     * @param {Integer} cbEcmaPublicKey 
     * @param {Pointer<Byte>} pfWasVerified 
     * @returns {HRESULT} 
     */
    StrongNameSignatureVerificationEx2(wszFilePath, fForceVerification, pbEcmaPublicKey, cbEcmaPublicKey, pfWasVerified) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        result := ComCall(4, this, "ptr", wszFilePath, "char", fForceVerification, "char*", pbEcmaPublicKey, "uint", cbEcmaPublicKey, "char*", pfWasVerified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
