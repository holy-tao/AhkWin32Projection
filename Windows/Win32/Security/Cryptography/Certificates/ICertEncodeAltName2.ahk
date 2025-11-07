#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertEncodeAltName.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeAltName2 extends ICertEncodeAltName{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeAltName2
     * @type {Guid}
     */
    static IID => Guid("{f67fe177-5ef1-4535-b4ce-29df15e2e0c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecodeBlob", "EncodeBlob", "GetNameBlob", "SetNameEntryBlob"]

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    DecodeBlob(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(14, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    EncodeBlob(Encoding) {
        pstrEncodedData := BSTR()
        result := ComCall(15, this, "int", Encoding, "ptr", pstrEncodedData, "HRESULT")
        return pstrEncodedData
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     */
    GetNameBlob(NameIndex, Encoding) {
        pstrName := BSTR()
        result := ComCall(16, this, "int", NameIndex, "int", Encoding, "ptr", pstrName, "HRESULT")
        return pstrName
    }

    /**
     * 
     * @param {Integer} NameIndex 
     * @param {Integer} NameChoice 
     * @param {BSTR} strName 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    SetNameEntryBlob(NameIndex, NameChoice, strName, Encoding) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(17, this, "int", NameIndex, "int", NameChoice, "ptr", strName, "int", Encoding, "HRESULT")
        return result
    }
}
