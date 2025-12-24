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
     * Gets the SMS configuration of a device.
     * @returns {IMbnSmsConfiguration} An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a> interface representing the SMS configuration of the device.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration
     */
    GetSmsConfiguration() {
        result := ComCall(3, this, "ptr*", &smsConfiguration := 0, "HRESULT")
        return IMbnSmsConfiguration(smsConfiguration)
    }

    /**
     * Updates the SMS configuration for a device.
     * @param {IMbnSmsConfiguration} smsConfiguration An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a> interface representing the new SMS configuration to update the device with.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-setsmsconfiguration
     */
    SetSmsConfiguration(smsConfiguration) {
        result := ComCall(4, this, "ptr", smsConfiguration, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in PDU format.
     * @param {PWSTR} pduData A string representing the PDU message in hexadecimal format.
     * @param {Integer} size The size of PDU message in number of bytes before converting to hexadecimal string format and excluding the service center address length.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-smssendpdu
     */
    SmsSendPdu(pduData, size) {
        pduData := pduData is String ? StrPtr(pduData) : pduData

        result := ComCall(5, this, "ptr", pduData, "char", size, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in CDMA format.
     * @param {PWSTR} address A null terminated string that contains the receiver's phone number.  The maximum size of the string is 15 digits.
     * @param {Integer} encoding A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_cdma_encoding">MBN_SMS_CDMA_ENCODING</a> value that specifies the data encoding.
     * @param {Integer} language An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_cdma_lang">MBN_SMS_CDMA_LANG</a> value that specifies the language.
     * @param {Integer} sizeInCharacters The number of encoded characters in the message. This can be different from the size of the message array.
     * @param {Pointer<SAFEARRAY>} message An array of bytes containing the encoded CDMA message.  
     * 
     * The maximum size of this array is the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize">CdmaShortMsgSize</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>, however this can be no larger than <b>MBN_CDMA_SHORT_MSG_SIZE_MAX</b> (160).
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-smssendcdma
     */
    SmsSendCdma(address, encoding, language, sizeInCharacters, message) {
        address := address is String ? StrPtr(address) : address

        result := ComCall(6, this, "ptr", address, "int", encoding, "int", language, "uint", sizeInCharacters, "ptr", message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in CDMA binary format.
     * @param {Pointer<SAFEARRAY>} message Byte array representing the encoded CMDA message as per section 3.4.2.1 "SMS Point-to-Point Message” in 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”. SMS will only support the Wireless Messaging Teleservice (WMT) format.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-smssendcdmapdu
     */
    SmsSendCdmaPdu(message) {
        result := ComCall(7, this, "ptr", message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Reads a set of SMS messages from a device.
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_filter">MBN_SMS_FILTER</a> structure that defines the set of messages to read.
     * @param {Integer} smsFormat An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_format">MBN_SMS_FORMAT</a> value that specifies the format in which an SMS message should be read.  
     * 
     * For GSM devices, it should always be <b>MBN_SMS_FORMAT_PDU</b>.
     * 
     * For CDMA devices, if this is   specified as MBN_SMS_FORMAT_PDU, then the device will read a binary mode CDMA message. If it is specified as MBN_SMS_FORMAT_TEXT, then the device will read a text mode CDMA message. If the device doesn’t support the specified format then it can return an error code.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-smsread
     */
    SmsRead(smsFilter, smsFormat) {
        result := ComCall(8, this, "ptr", smsFilter, "int", smsFormat, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Deletes a set of SMS messages from a device.
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_filter">MBN_SMS_FILTER</a> structure that defines the set of messages to delete.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-smsdelete
     */
    SmsDelete(smsFilter) {
        result := ComCall(9, this, "ptr", smsFilter, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the SMS status for a device.
     * @returns {MBN_SMS_STATUS_INFO} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_status_info">MBN_SMS_STATUS_INFO</a> structure, containing the status information for the device.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsms-getsmsstatus
     */
    GetSmsStatus() {
        smsStatusInfo := MBN_SMS_STATUS_INFO()
        result := ComCall(10, this, "ptr", smsStatusInfo, "HRESULT")
        return smsStatusInfo
    }
}
