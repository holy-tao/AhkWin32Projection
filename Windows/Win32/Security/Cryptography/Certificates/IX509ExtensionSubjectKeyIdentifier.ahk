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
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strKeyIdentifier 
     * @returns {HRESULT} 
     */
    InitializeEncode(Encoding, strKeyIdentifier) {
        strKeyIdentifier := strKeyIdentifier is String ? BSTR.Alloc(strKeyIdentifier).Value : strKeyIdentifier

        result := ComCall(12, this, "int", Encoding, "ptr", strKeyIdentifier, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_SubjectKeyIdentifier(Encoding, pValue) {
        result := ComCall(14, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
