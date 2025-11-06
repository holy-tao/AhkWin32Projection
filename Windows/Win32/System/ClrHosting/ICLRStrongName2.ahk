#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRStrongName2 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StrongNameGetPublicKeyEx", "StrongNameSignatureVerificationEx2"]

    /**
     * 
     * @param {PWSTR} pwzKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Pointer<Integer>>} ppbPublicKeyBlob 
     * @param {Pointer<Integer>} pcbPublicKeyBlob 
     * @param {Integer} uHashAlgId 
     * @param {Integer} uReserved 
     * @returns {HRESULT} 
     */
    StrongNameGetPublicKeyEx(pwzKeyContainer, pbKeyBlob, cbKeyBlob, ppbPublicKeyBlob, pcbPublicKeyBlob, uHashAlgId, uReserved) {
        pwzKeyContainer := pwzKeyContainer is String ? StrPtr(pwzKeyContainer) : pwzKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"
        ppbPublicKeyBlobMarshal := ppbPublicKeyBlob is VarRef ? "ptr*" : "ptr"
        pcbPublicKeyBlobMarshal := pcbPublicKeyBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pwzKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, ppbPublicKeyBlobMarshal, ppbPublicKeyBlob, pcbPublicKeyBlobMarshal, pcbPublicKeyBlob, "uint", uHashAlgId, "uint", uReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {BOOLEAN} fForceVerification 
     * @param {Pointer<Integer>} pbEcmaPublicKey 
     * @param {Integer} cbEcmaPublicKey 
     * @returns {Integer} 
     */
    StrongNameSignatureVerificationEx2(wszFilePath, fForceVerification, pbEcmaPublicKey, cbEcmaPublicKey) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        pbEcmaPublicKeyMarshal := pbEcmaPublicKey is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", wszFilePath, "char", fForceVerification, pbEcmaPublicKeyMarshal, pbEcmaPublicKey, "uint", cbEcmaPublicKey, "char*", &pfWasVerified := 0, "HRESULT")
        return pfWasVerified
    }
}
