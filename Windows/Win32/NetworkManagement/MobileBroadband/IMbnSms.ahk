#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMbnSmsConfiguration.ahk
#Include .\MBN_SMS_STATUS_INFO.ahk
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
     * @returns {IMbnSmsConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration
     */
    GetSmsConfiguration() {
        result := ComCall(3, this, "ptr*", &smsConfiguration := 0, "HRESULT")
        return IMbnSmsConfiguration(smsConfiguration)
    }

    /**
     * 
     * @param {IMbnSmsConfiguration} smsConfiguration 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-setsmsconfiguration
     */
    SetSmsConfiguration(smsConfiguration) {
        result := ComCall(4, this, "ptr", smsConfiguration, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {PWSTR} pduData 
     * @param {Integer} size 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendpdu
     */
    SmsSendPdu(pduData, size) {
        pduData := pduData is String ? StrPtr(pduData) : pduData

        result := ComCall(5, this, "ptr", pduData, "char", size, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {PWSTR} address 
     * @param {Integer} encoding 
     * @param {Integer} language 
     * @param {Integer} sizeInCharacters 
     * @param {Pointer<SAFEARRAY>} message 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdma
     */
    SmsSendCdma(address, encoding, language, sizeInCharacters, message) {
        address := address is String ? StrPtr(address) : address

        result := ComCall(6, this, "ptr", address, "int", encoding, "int", language, "uint", sizeInCharacters, "ptr", message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} message 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdmapdu
     */
    SmsSendCdmaPdu(message) {
        result := ComCall(7, this, "ptr", message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @param {Integer} smsFormat 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsread
     */
    SmsRead(smsFilter, smsFormat) {
        result := ComCall(8, this, "ptr", smsFilter, "int", smsFormat, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsdelete
     */
    SmsDelete(smsFilter) {
        result := ComCall(9, this, "ptr", smsFilter, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * 
     * @returns {MBN_SMS_STATUS_INFO} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsstatus
     */
    GetSmsStatus() {
        smsStatusInfo := MBN_SMS_STATUS_INFO()
        result := ComCall(10, this, "ptr", smsStatusInfo, "HRESULT")
        return smsStatusInfo
    }
}
