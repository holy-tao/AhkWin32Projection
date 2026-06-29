#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\ICertEncodeStringArray.ahk" { ICertEncodeStringArray }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeStringArray2 extends ICertEncodeStringArray {
    /**
     * The interface identifier for ICertEncodeStringArray2
     * @type {Guid}
     */
    static IID := Guid("{9c680d93-9b7d-4e95-9018-4ffe10ba5ada}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeStringArray2 interfaces
    */
    struct Vtbl extends ICertEncodeStringArray.Vtbl {
        DecodeBlob : IntPtr
        EncodeBlob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeStringArray2.Vtbl()
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

        result := ComCall(14, this, BSTR, strEncodedData, EncodingType, Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    EncodeBlob(Encoding) {
        pstrEncodedData := BSTR.Owned()
        result := ComCall(15, this, EncodingType, Encoding, BSTR.Ptr, pstrEncodedData, "HRESULT")
        return pstrEncodedData
    }

    Query(iid) {
        if (ICertEncodeStringArray2.IID.Equals(iid)) {
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
