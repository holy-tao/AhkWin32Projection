#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Attribute.ahk

/**
 * Defines methods and properties that initialize and retrieve certificate extensions in a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509attributeextensions
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509AttributeExtensions extends IX509Attribute{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509AttributeExtensions
     * @type {Guid}
     */
    static IID => Guid("{728ab324-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_X509Extensions"]

    /**
     * 
     * @param {IX509Extensions} pExtensions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeextensions-initializeencode
     */
    InitializeEncode(pExtensions) {
        result := ComCall(10, this, "ptr", pExtensions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeextensions-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(11, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IX509Extensions>} ppValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509attributeextensions-get_x509extensions
     */
    get_X509Extensions(ppValue) {
        result := ComCall(12, this, "ptr*", ppValue, "HRESULT")
        return result
    }
}
