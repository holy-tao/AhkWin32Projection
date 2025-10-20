#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertEncodeBitString.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeBitString2 extends ICertEncodeBitString{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeBitString2
     * @type {Guid}
     */
    static IID => Guid("{e070d6e7-23ef-4dd2-8242-ebd9c928cb30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecodeBlob", "EncodeBlob", "GetBitStringBlob"]

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    DecodeBlob(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} BitCount 
     * @param {BSTR} strBitString 
     * @param {Integer} EncodingIn 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrEncodedData 
     * @returns {HRESULT} 
     */
    EncodeBlob(BitCount, strBitString, EncodingIn, Encoding, pstrEncodedData) {
        strBitString := strBitString is String ? BSTR.Alloc(strBitString).Value : strBitString

        result := ComCall(12, this, "int", BitCount, "ptr", strBitString, "int", EncodingIn, "int", Encoding, "ptr", pstrEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrBitString 
     * @returns {HRESULT} 
     */
    GetBitStringBlob(Encoding, pstrBitString) {
        result := ComCall(13, this, "int", Encoding, "ptr", pstrBitString, "HRESULT")
        return result
    }
}
