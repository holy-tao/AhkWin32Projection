#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ICertRequest.ahk

/**
 * Provide communications between a client or intermediary application and Certificate Services.
 * @see https://docs.microsoft.com/windows/win32/api//certcli/nn-certcli-icertrequest2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertRequest2 extends ICertRequest{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertRequest2
     * @type {Guid}
     */
    static IID => Guid("{a4772988-4a85-4fa9-824e-b5cf5c16405a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIssuedCertificate", "GetErrorMessageText", "GetCAProperty", "GetCAPropertyFlags", "GetCAPropertyDisplayName", "GetFullResponseProperty"]

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strSerialNumber 
     * @param {Pointer<Integer>} pDisposition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-getissuedcertificate
     */
    GetIssuedCertificate(strConfig, RequestId, strSerialNumber, pDisposition) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        pDispositionMarshal := pDisposition is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", strConfig, "int", RequestId, "ptr", strSerialNumber, pDispositionMarshal, pDisposition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hrMessage 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrErrorMessageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-geterrormessagetext
     */
    GetErrorMessageText(hrMessage, Flags, pstrErrorMessageText) {
        result := ComCall(15, this, "int", hrMessage, "int", Flags, "ptr", pstrErrorMessageText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-getcaproperty
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags, pvarPropertyValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(16, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<Integer>} pPropFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-getcapropertyflags
     */
    GetCAPropertyFlags(strConfig, PropId, pPropFlags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        pPropFlagsMarshal := pPropFlags is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, "ptr", strConfig, "int", PropId, pPropFlagsMarshal, pPropFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<BSTR>} pstrDisplayName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-getcapropertydisplayname
     */
    GetCAPropertyDisplayName(strConfig, PropId, pstrDisplayName) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} PropId 
     * @param {Integer} PropIndex 
     * @param {Integer} PropType 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certcli/nf-certcli-icertrequest2-getfullresponseproperty
     */
    GetFullResponseProperty(PropId, PropIndex, PropType, Flags, pvarPropertyValue) {
        result := ComCall(19, this, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }
}
