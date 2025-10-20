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
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} RequestId 
     * @param {BSTR} strSerialNumber 
     * @param {Pointer<UInt32>} pDisposition 
     * @returns {HRESULT} 
     */
    GetIssuedCertificate(strConfig, RequestId, strSerialNumber, pDisposition) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig
        strSerialNumber := strSerialNumber is String ? BSTR.Alloc(strSerialNumber).Value : strSerialNumber

        result := ComCall(14, this, "ptr", strConfig, "int", RequestId, "ptr", strSerialNumber, "uint*", pDisposition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hrMessage 
     * @param {Integer} Flags 
     * @param {Pointer<BSTR>} pstrErrorMessageText 
     * @returns {HRESULT} 
     */
    GetErrorMessageText(hrMessage, Flags, pstrErrorMessageText) {
        result := ComCall(15, this, "int", hrMessage, "int", Flags, "ptr", pstrErrorMessageText, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetCAProperty(strConfig, PropId, PropIndex, PropType, Flags, pvarPropertyValue) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(16, this, "ptr", strConfig, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<Int32>} pPropFlags 
     * @returns {HRESULT} 
     */
    GetCAPropertyFlags(strConfig, PropId, pPropFlags) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(17, this, "ptr", strConfig, "int", PropId, "int*", pPropFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strConfig 
     * @param {Integer} PropId 
     * @param {Pointer<BSTR>} pstrDisplayName 
     * @returns {HRESULT} 
     */
    GetCAPropertyDisplayName(strConfig, PropId, pstrDisplayName) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(18, this, "ptr", strConfig, "int", PropId, "ptr", pstrDisplayName, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    GetFullResponseProperty(PropId, PropIndex, PropType, Flags, pvarPropertyValue) {
        result := ComCall(19, this, "int", PropId, "int", PropIndex, "int", PropType, "int", Flags, "ptr", pvarPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
