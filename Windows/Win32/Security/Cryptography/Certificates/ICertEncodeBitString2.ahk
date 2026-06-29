#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\ICertEncodeBitString.ahk" { ICertEncodeBitString }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct ICertEncodeBitString2 extends ICertEncodeBitString {
    /**
     * The interface identifier for ICertEncodeBitString2
     * @type {Guid}
     */
    static IID := Guid("{e070d6e7-23ef-4dd2-8242-ebd9c928cb30}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICertEncodeBitString2 interfaces
    */
    struct Vtbl extends ICertEncodeBitString.Vtbl {
        DecodeBlob       : IntPtr
        EncodeBlob       : IntPtr
        GetBitStringBlob : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICertEncodeBitString2.Vtbl()
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

        result := ComCall(11, this, BSTR, strEncodedData, EncodingType, Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BitCount 
     * @param {BSTR} strBitString 
     * @param {EncodingType} EncodingIn 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    EncodeBlob(BitCount, strBitString, EncodingIn, Encoding) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        pstrEncodedData := BSTR.Owned()
        result := ComCall(12, this, "int", BitCount, BSTR, strBitString, EncodingType, EncodingIn, EncodingType, Encoding, BSTR.Ptr, pstrEncodedData, "HRESULT")
        return pstrEncodedData
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    GetBitStringBlob(Encoding) {
        pstrBitString := BSTR.Owned()
        result := ComCall(13, this, EncodingType, Encoding, BSTR.Ptr, pstrBitString, "HRESULT")
        return pstrBitString
    }

    Query(iid) {
        if (ICertEncodeBitString2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DecodeBlob := CallbackCreate(GetMethod(implObj, "DecodeBlob"), flags, 3)
        this.vtbl.EncodeBlob := CallbackCreate(GetMethod(implObj, "EncodeBlob"), flags, 6)
        this.vtbl.GetBitStringBlob := CallbackCreate(GetMethod(implObj, "GetBitStringBlob"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DecodeBlob)
        CallbackFree(this.vtbl.EncodeBlob)
        CallbackFree(this.vtbl.GetBitStringBlob)
    }
}
