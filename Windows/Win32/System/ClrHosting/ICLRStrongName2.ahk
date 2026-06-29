#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRStrongName2 extends IUnknown {
    /**
     * The interface identifier for ICLRStrongName2
     * @type {Guid}
     */
    static IID := Guid("{c22ed5c5-4b59-4975-90eb-85ea55c0069b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRStrongName2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StrongNameGetPublicKeyEx           : IntPtr
        StrongNameSignatureVerificationEx2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRStrongName2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(4, this, "ptr", wszFilePath, BOOLEAN, fForceVerification, pbEcmaPublicKeyMarshal, pbEcmaPublicKey, "uint", cbEcmaPublicKey, "char*", &pfWasVerified := 0, "HRESULT")
        return pfWasVerified
    }

    Query(iid) {
        if (ICLRStrongName2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StrongNameGetPublicKeyEx := CallbackCreate(GetMethod(implObj, "StrongNameGetPublicKeyEx"), flags, 8)
        this.vtbl.StrongNameSignatureVerificationEx2 := CallbackCreate(GetMethod(implObj, "StrongNameSignatureVerificationEx2"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StrongNameGetPublicKeyEx)
        CallbackFree(this.vtbl.StrongNameSignatureVerificationEx2)
    }
}
