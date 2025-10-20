#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertEncodeStringArray.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeStringArray2 extends ICertEncodeStringArray{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeStringArray2
     * @type {Guid}
     */
    static IID => Guid("{9c680d93-9b7d-4e95-9018-4ffe10ba5ada}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DecodeBlob", "EncodeBlob"]

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
     * @param {Pointer<BSTR>} pstrEncodedData 
     * @returns {HRESULT} 
     */
    EncodeBlob(Encoding, pstrEncodedData) {
        result := ComCall(15, this, "int", Encoding, "ptr", pstrEncodedData, "HRESULT")
        return result
    }
}
