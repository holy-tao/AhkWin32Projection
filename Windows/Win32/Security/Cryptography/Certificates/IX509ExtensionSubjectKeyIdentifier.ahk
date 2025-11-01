#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509Extension.ahk

/**
 * Enables you to specify a SubjectKeyIdentifier extension.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensionsubjectkeyidentifier
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionSubjectKeyIdentifier extends IX509Extension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509ExtensionSubjectKeyIdentifier
     * @type {Guid}
     */
    static IID => Guid("{728ab317-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_SubjectKeyIdentifier"]

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strKeyIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsubjectkeyidentifier-initializeencode
     */
    InitializeEncode(Encoding, strKeyIdentifier) {
        strKeyIdentifier := strKeyIdentifier is String ? BSTR.Alloc(strKeyIdentifier).Value : strKeyIdentifier

        result := ComCall(12, this, "int", Encoding, "ptr", strKeyIdentifier, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsubjectkeyidentifier-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsubjectkeyidentifier-get_subjectkeyidentifier
     */
    get_SubjectKeyIdentifier(Encoding, pValue) {
        result := ComCall(14, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return result
    }
}
