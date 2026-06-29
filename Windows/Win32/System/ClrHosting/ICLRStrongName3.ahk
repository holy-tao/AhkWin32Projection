#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRStrongName3 extends IUnknown {
    /**
     * The interface identifier for ICLRStrongName3
     * @type {Guid}
     */
    static IID := Guid("{22c7089b-bbd3-414a-b698-210f263f1fed}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRStrongName3 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StrongNameDigestGenerate : IntPtr
        StrongNameDigestSign     : IntPtr
        StrongNameDigestEmbed    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRStrongName3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Pointer<Integer>>} ppbDigestBlob 
     * @param {Pointer<Integer>} pcbDigestBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestGenerate(wszFilePath, ppbDigestBlob, pcbDigestBlob, dwFlags) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        ppbDigestBlobMarshal := ppbDigestBlob is VarRef ? "ptr*" : "ptr"
        pcbDigestBlobMarshal := pcbDigestBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wszFilePath, ppbDigestBlobMarshal, ppbDigestBlob, pcbDigestBlobMarshal, pcbDigestBlob, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszKeyContainer 
     * @param {Pointer<Integer>} pbKeyBlob 
     * @param {Integer} cbKeyBlob 
     * @param {Pointer<Integer>} pbDigestBlob 
     * @param {Integer} cbDigestBlob 
     * @param {Integer} hashAlgId 
     * @param {Pointer<Pointer<Integer>>} ppbSignatureBlob 
     * @param {Pointer<Integer>} pcbSignatureBlob 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    StrongNameDigestSign(wszKeyContainer, pbKeyBlob, cbKeyBlob, pbDigestBlob, cbDigestBlob, hashAlgId, ppbSignatureBlob, pcbSignatureBlob, dwFlags) {
        wszKeyContainer := wszKeyContainer is String ? StrPtr(wszKeyContainer) : wszKeyContainer

        pbKeyBlobMarshal := pbKeyBlob is VarRef ? "char*" : "ptr"
        pbDigestBlobMarshal := pbDigestBlob is VarRef ? "char*" : "ptr"
        ppbSignatureBlobMarshal := ppbSignatureBlob is VarRef ? "ptr*" : "ptr"
        pcbSignatureBlobMarshal := pcbSignatureBlob is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", wszKeyContainer, pbKeyBlobMarshal, pbKeyBlob, "uint", cbKeyBlob, pbDigestBlobMarshal, pbDigestBlob, "uint", cbDigestBlob, "uint", hashAlgId, ppbSignatureBlobMarshal, ppbSignatureBlob, pcbSignatureBlobMarshal, pcbSignatureBlob, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wszFilePath 
     * @param {Pointer<Integer>} pbSignatureBlob 
     * @param {Integer} cbSignatureBlob 
     * @returns {HRESULT} 
     */
    StrongNameDigestEmbed(wszFilePath, pbSignatureBlob, cbSignatureBlob) {
        wszFilePath := wszFilePath is String ? StrPtr(wszFilePath) : wszFilePath

        pbSignatureBlobMarshal := pbSignatureBlob is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", wszFilePath, pbSignatureBlobMarshal, pbSignatureBlob, "uint", cbSignatureBlob, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRStrongName3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StrongNameDigestGenerate := CallbackCreate(GetMethod(implObj, "StrongNameDigestGenerate"), flags, 5)
        this.vtbl.StrongNameDigestSign := CallbackCreate(GetMethod(implObj, "StrongNameDigestSign"), flags, 10)
        this.vtbl.StrongNameDigestEmbed := CallbackCreate(GetMethod(implObj, "StrongNameDigestEmbed"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StrongNameDigestGenerate)
        CallbackFree(this.vtbl.StrongNameDigestSign)
        CallbackFree(this.vtbl.StrongNameDigestEmbed)
    }
}
