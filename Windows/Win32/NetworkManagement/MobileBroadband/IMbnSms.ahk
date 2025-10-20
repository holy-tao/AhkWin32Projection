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
     * 
     * @param {Pointer<IMbnSmsConfiguration>} smsConfiguration 
     * @returns {HRESULT} 
     */
    GetSmsConfiguration(smsConfiguration) {
        result := ComCall(3, this, "ptr", smsConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMbnSmsConfiguration>} smsConfiguration 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetSmsConfiguration(smsConfiguration, requestID) {
        result := ComCall(4, this, "ptr", smsConfiguration, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pduData 
     * @param {Integer} size 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SmsSendPdu(pduData, size, requestID) {
        pduData := pduData is String ? StrPtr(pduData) : pduData

        result := ComCall(5, this, "ptr", pduData, "char", size, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} address 
     * @param {Integer} encoding 
     * @param {Integer} language 
     * @param {Integer} sizeInCharacters 
     * @param {Pointer<SAFEARRAY>} message 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SmsSendCdma(address, encoding, language, sizeInCharacters, message, requestID) {
        address := address is String ? StrPtr(address) : address

        result := ComCall(6, this, "ptr", address, "int", encoding, "int", language, "uint", sizeInCharacters, "ptr", message, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} message 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SmsSendCdmaPdu(message, requestID) {
        result := ComCall(7, this, "ptr", message, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @param {Integer} smsFormat 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SmsRead(smsFilter, smsFormat, requestID) {
        result := ComCall(8, this, "ptr", smsFilter, "int", smsFormat, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SmsDelete(smsFilter, requestID) {
        result := ComCall(9, this, "ptr", smsFilter, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MBN_SMS_STATUS_INFO>} smsStatusInfo 
     * @returns {HRESULT} 
     */
    GetSmsStatus(smsStatusInfo) {
        result := ComCall(10, this, "ptr", smsStatusInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
