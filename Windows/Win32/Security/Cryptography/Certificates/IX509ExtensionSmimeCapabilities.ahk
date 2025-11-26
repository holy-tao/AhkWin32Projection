#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISmimeCapabilities.ahk
#Include .\IX509Extension.ahk

/**
 * Can be used to report the decryption capabilities of an email recipient to an email sender so that the sender can choose the most secure algorithm supported by both parties.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509extensionsmimecapabilities
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509ExtensionSmimeCapabilities extends IX509Extension{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509ExtensionSmimeCapabilities
     * @type {Guid}
     */
    static IID => Guid("{728ab31b-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeEncode", "InitializeDecode", "get_SmimeCapabilities"]

    /**
     * @type {ISmimeCapabilities} 
     */
    SmimeCapabilities {
        get => this.get_SmimeCapabilities()
    }

    /**
     * 
     * @param {ISmimeCapabilities} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializeencode
     */
    InitializeEncode(pValue) {
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} strEncodedData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-initializedecode
     */
    InitializeDecode(Encoding, strEncodedData) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(13, this, "int", Encoding, "ptr", strEncodedData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISmimeCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509extensionsmimecapabilities-get_smimecapabilities
     */
    get_SmimeCapabilities() {
        result := ComCall(14, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISmimeCapabilities(ppValue)
    }
}
