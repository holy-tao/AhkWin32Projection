#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ICertEncodeAltName.ahk" { ICertEncodeAltName }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeAltName2 extends ICertEncodeAltName {
    /**
     * The interface identifier for ICertEncodeAltName2
     * @type {Guid}
     */
    static IID := Guid("{f67fe177-5ef1-4535-b4ce-29df15e2e0c3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeAltName2 interfaces
    */
    struct Vtbl extends ICertEncodeAltName.Vtbl {
        DecodeBlob       : IntPtr
        EncodeBlob       : IntPtr
        GetNameBlob      : IntPtr
        SetNameEntryBlob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeAltName2.Vtbl()
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

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    GetNameBlob(NameIndex, Encoding) {
        pstrName := BSTR.Owned()
        result := ComCall(16, this, "int", NameIndex, EncodingType, Encoding, BSTR.Ptr, pstrName, "HRESULT")
        return pstrName
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @param {EncodingType} Encoding 
     * @returns {HRESULT} 
     */
    SetNameEntryBlob(NameIndex, NameChoice, strName, Encoding) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(17, this, "int", NameIndex, "int", NameChoice, BSTR, strName, EncodingType, Encoding, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICertEncodeAltName2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DecodeBlob := CallbackCreate(GetMethod(implObj, "DecodeBlob"), flags, 3)
        this.vtbl.EncodeBlob := CallbackCreate(GetMethod(implObj, "EncodeBlob"), flags, 3)
        this.vtbl.GetNameBlob := CallbackCreate(GetMethod(implObj, "GetNameBlob"), flags, 4)
        this.vtbl.SetNameEntryBlob := CallbackCreate(GetMethod(implObj, "SetNameEntryBlob"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DecodeBlob)
        CallbackFree(this.vtbl.EncodeBlob)
        CallbackFree(this.vtbl.GetNameBlob)
        CallbackFree(this.vtbl.SetNameEntryBlob)
    }
}
