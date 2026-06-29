#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICertEncodeCRLDistInfo.ahk" { ICertEncodeCRLDistInfo }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeCRLDistInfo2 extends ICertEncodeCRLDistInfo {
    /**
     * The interface identifier for ICertEncodeCRLDistInfo2
     * @type {Guid}
     */
    static IID := Guid("{b4275d4b-3e30-446f-ad36-09d03120b078}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeCRLDistInfo2 interfaces
    */
    struct Vtbl extends ICertEncodeCRLDistInfo.Vtbl {
        DecodeBlob : IntPtr
        EncodeBlob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeCRLDistInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {EncodingType} Encoding 
     * @returns {HRESULT} 
     */
    DecodeBlob(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(16, this, BSTR, strEncodedData, EncodingType, Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    EncodeBlob(Encoding) {
        pstrEncodedData := BSTR.Owned()
        result := ComCall(17, this, EncodingType, Encoding, BSTR.Ptr, pstrEncodedData, "HRESULT")
        return pstrEncodedData
    }

    Query(iid) {
        if (ICertEncodeCRLDistInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DecodeBlob := CallbackCreate(GetMethod(implObj, "DecodeBlob"), flags, 3)
        this.vtbl.EncodeBlob := CallbackCreate(GetMethod(implObj, "EncodeBlob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DecodeBlob)
        CallbackFree(this.vtbl.EncodeBlob)
    }
}
