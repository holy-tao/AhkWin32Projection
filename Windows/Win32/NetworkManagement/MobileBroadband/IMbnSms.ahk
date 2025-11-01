#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * SMS interface for sending and receiving messages as well as controlling the messaging configuration.
 * @remarks
 * 
  * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsms
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSms extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSms
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2015-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSmsConfiguration", "SetSmsConfiguration", "SmsSendPdu", "SmsSendCdma", "SmsSendCdmaPdu", "SmsRead", "SmsDelete", "GetSmsStatus"]

    /**
     * 
     * @param {Pointer<IMbnSmsConfiguration>} smsConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration
     */
    GetSmsConfiguration(smsConfiguration) {
        result := ComCall(3, this, "ptr*", smsConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMbnSmsConfiguration} smsConfiguration 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-setsmsconfiguration
     */
    SetSmsConfiguration(smsConfiguration, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", smsConfiguration, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pduData 
     * @param {Integer} size 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendpdu
     */
    SmsSendPdu(pduData, size, requestID) {
        pduData := pduData is String ? StrPtr(pduData) : pduData

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pduData, "char", size, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} address 
     * @param {Integer} encoding 
     * @param {Integer} language 
     * @param {Integer} sizeInCharacters 
     * @param {Pointer<SAFEARRAY>} message 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdma
     */
    SmsSendCdma(address, encoding, language, sizeInCharacters, message, requestID) {
        address := address is String ? StrPtr(address) : address

        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", address, "int", encoding, "int", language, "uint", sizeInCharacters, "ptr", message, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} message 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdmapdu
     */
    SmsSendCdmaPdu(message, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", message, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @param {Integer} smsFormat 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsread
     */
    SmsRead(smsFilter, smsFormat, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", smsFilter, "int", smsFormat, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @param {Pointer<Integer>} requestID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsdelete
     */
    SmsDelete(smsFilter, requestID) {
        requestIDMarshal := requestID is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", smsFilter, requestIDMarshal, requestID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_STATUS_INFO>} smsStatusInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsstatus
     */
    GetSmsStatus(smsStatusInfo) {
        result := ComCall(10, this, "ptr", smsStatusInfo, "HRESULT")
        return result
    }
}
