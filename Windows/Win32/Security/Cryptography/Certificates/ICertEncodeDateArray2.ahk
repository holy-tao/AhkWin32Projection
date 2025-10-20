#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertEncodeDateArray.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeDateArray2 extends ICertEncodeDateArray{
    /**
     * The interface identifier for ICertEncodeDateArray2
     * @type {Guid}
     */
    static IID => Guid("{99a4edb5-2b8e-448d-bf95-bba8d7789dc8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     */
    DecodeBlob(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "ptr", strEncodedData, "int", Encoding, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrEncodedData 
     * @returns {HRESULT} 
     */
    EncodeBlob(Encoding, pstrEncodedData) {
        result := ComCall(14, this, "int", Encoding, "ptr", pstrEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
