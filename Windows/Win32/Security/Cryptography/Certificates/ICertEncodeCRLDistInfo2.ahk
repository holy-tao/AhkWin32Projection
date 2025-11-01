#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertEncodeCRLDistInfo.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertEncodeCRLDistInfo2 extends ICertEncodeCRLDistInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertEncodeCRLDistInfo2
     * @type {Guid}
     */
    static IID => Guid("{b4275d4b-3e30-446f-ad36-09d03120b078}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

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

        result := ComCall(16, this, "ptr", strEncodedData, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pstrEncodedData 
     * @returns {HRESULT} 
     */
    EncodeBlob(Encoding, pstrEncodedData) {
        result := ComCall(17, this, "int", Encoding, "ptr", pstrEncodedData, "HRESULT")
        return result
    }
}
