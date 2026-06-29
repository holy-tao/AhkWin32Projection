#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MBN_SMS_FILTER.ahk" { MBN_SMS_FILTER }
#Import ".\MBN_SMS_CDMA_ENCODING.ahk" { MBN_SMS_CDMA_ENCODING }
#Import ".\MBN_SMS_CDMA_LANG.ahk" { MBN_SMS_CDMA_LANG }
#Import ".\MBN_SMS_FORMAT.ahk" { MBN_SMS_FORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMbnSmsConfiguration.ahk" { IMbnSmsConfiguration }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MBN_SMS_STATUS_INFO.ahk" { MBN_SMS_STATUS_INFO }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * SMS interface for sending and receiving messages as well as controlling the messaging configuration.
 * @remarks
 * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsms
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSms extends IUnknown {
    /**
     * The interface identifier for IMbnSms
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2015-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSms interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSmsConfiguration : IntPtr
        SetSmsConfiguration : IntPtr
        SmsSendPdu          : IntPtr
        SmsSendCdma         : IntPtr
        SmsSendCdmaPdu      : IntPtr
        SmsRead             : IntPtr
        SmsDelete           : IntPtr
        GetSmsStatus        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSms.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the SMS configuration of a device.
     * @remarks
     * For recoverable errors such as <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for this information when error condition is over. For example, if the device required a PIN to be entered to retrieve this information then it will return <b>E_MBN_PIN_REQUIRED</b>. When an application enters the PIN to unlock the device then the Mobile Broadband service will again try to get this information from the device. The Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsconfigurationchange">OnSmsConfigurationChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface
     * 
     * SMS configuration can be updated by the network or device without any change request by any application. In such a  case,  the Mobile Broadband service will notify all the registered applications by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsconfigurationchange">OnSmsConfigurationChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @returns {IMbnSmsConfiguration} An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a> interface representing the SMS configuration of the device.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration
     */
    GetSmsConfiguration() {
        result := ComCall(3, this, "ptr*", &smsConfiguration := 0, "HRESULT")
        return IMbnSmsConfiguration(smsConfiguration)
    }

    /**
     * Updates the SMS configuration for a device.
     * @remarks
     * An application can use <b>SetSmsConfiguration</b> to modify the default SMS Service Center address in the device.  
     * 
     * An application should perform following steps for setting SMS configuration of the device.
     * 
     * 
     * <ol>
     * <li>Get an <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>  interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration">GetSmsConfiguration</a>.</li>
     * <li>Modify the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a> interface obtained from step 1 with the new values that reflect the desired changes to the configuration..</li>
     * <li>Pass the modified <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>  to <b>SetSmsConfiguration</b>.</li>
     * </ol>
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsetsmsconfigurationcomplete">OnSetSmsConfigurationComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @param {IMbnSmsConfiguration} smsConfiguration An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a> interface representing the new SMS configuration to update the device with.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-setsmsconfiguration
     */
    SetSmsConfiguration(smsConfiguration) {
        result := ComCall(4, this, "ptr", smsConfiguration, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in PDU format.
     * @remarks
     * This data in <i>pduData</i> is compliant to the PDU structure defined in 3GPP TS 27.005 and 3GPP TS 23.040.
     * 
     * The table below shows an example of how a PDU message containing the message "Hello" would be structured.
     * 
     * 
     * <table>
     * <tr>
     * <th>Example</th>
     * <td>07</td>
     * <td>91198994000010</td>
     * <td>11000A9189945086180000AA05C8329BFD06</td>
     * </tr>
     * <tr>
     * <th>Contents</th>
     * <td>Size of Service Center Address</td>
     * <td>Service Center Address</td>
     * <td>PDU in hexadecimal format</td>
     * </tr>
     * <tr>
     * <th>Size</th>
     * <td>1 byte</td>
     * <td>Variable</td>
     * <td>Variable</td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * This function should be called only for GSM devices that support sending SMS in PDU format. A device reports this ability by setting <b>MBN_SMS_CAPS_PDU_SEND</b> in <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * 
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmssendcomplete">OnSmsSendComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @param {PWSTR} pduData A string representing the PDU message in hexadecimal format.
     * @param {Integer} _size The size of PDU message in number of bytes before converting to hexadecimal string format and excluding the service center address length.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendpdu
     */
    SmsSendPdu(pduData, _size) {
        pduData := pduData is String ? StrPtr(pduData) : pduData

        result := ComCall(5, this, "ptr", pduData, "char", _size, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in CDMA format.
     * @remarks
     * This method can be used to send a SMS message for a CDMA device. However, this is only when the CDMA device supports sending SMS. A calling application can learn if the device supports  this format by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getinterfacecapability">GetInterfaceCapability</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.  It can then look for <b>MBN_SMS_CAPS_TEXT_SEND</b> in the <b>smsCaps</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * 
     * 
     * The <i>address</i> parameter can be in either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * 
     * 
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmssendcomplete">OnSmsSendComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @param {PWSTR} _address A null terminated string that contains the receiver's phone number.  The maximum size of the string is 15 digits.
     * @param {MBN_SMS_CDMA_ENCODING} encoding A <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_cdma_encoding">MBN_SMS_CDMA_ENCODING</a> value that specifies the data encoding.
     * @param {MBN_SMS_CDMA_LANG} language An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_cdma_lang">MBN_SMS_CDMA_LANG</a> value that specifies the language.
     * @param {Integer} sizeInCharacters The number of encoded characters in the message. This can be different from the size of the message array.
     * @param {Pointer<SAFEARRAY>} message An array of bytes containing the encoded CDMA message.  
     * 
     * The maximum size of this array is the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize">CdmaShortMsgSize</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsconfiguration">IMbnSmsConfiguration</a>, however this can be no larger than <b>MBN_CDMA_SHORT_MSG_SIZE_MAX</b> (160).
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdma
     */
    SmsSendCdma(_address, encoding, language, sizeInCharacters, message) {
        _address := _address is String ? StrPtr(_address) : _address

        result := ComCall(6, this, "ptr", _address, MBN_SMS_CDMA_ENCODING, encoding, MBN_SMS_CDMA_LANG, language, "uint", sizeInCharacters, SAFEARRAY.Ptr, message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Sends a message in CDMA binary format.
     * @remarks
     * This method is applicable only to CDMA devices.
     * 
     * <b>SmsSendCdmaPdu</b> can be used to send a SMS message in binary format encoded as per section 3.4.2.1 of "SMS Point-to-Point Message” in 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”. SMS will only support Wireless Messaging Teleservice (WMT) format. 
     * 
     * 
     * <b>SmsSendCdmaPdu</b> should be called only when the CDMA device supports sending SMS in binary format. The device reports this format by setting <b>MBN_SMS_PDU_SEND</b> in <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_interface_caps">MBN_INTERFACE_CAPS</a>.
     * 
     * 
     * This is an asynchronous operation and method call will return immediately. If method returns without any error then operation will be performed asynchronously. Windows will notify applications about completion status of operation by calling the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmssendcomplete">OnSmsSendComplete</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a>.
     * @param {Pointer<SAFEARRAY>} message Byte array representing the encoded CMDA message as per section 3.4.2.1 "SMS Point-to-Point Message” in 3GPP2 specification C.S0015-A “Short Message Service (SMS) for Wideband Spread Spectrum Systems”. SMS will only support the Wireless Messaging Teleservice (WMT) format.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smssendcdmapdu
     */
    SmsSendCdmaPdu(message) {
        result := ComCall(7, this, SAFEARRAY.Ptr, message, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Reads a set of SMS messages from a device.
     * @remarks
     * Using <i>smsFilter</i>, an application can specify basic filters such as new messages, draft messages, or a specific message using an index.  A complex filter can be used by integrating a combination of basic filters. All the interfaces support the index based filters and new message type filters.  Support for other filters is optional for some interfaces. If the specified filter is not supported then operation completion callback function will return a status of <b>E_MBN_STATUS_FILTER_NOT_SUPPORTED</b>.
     * 
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsreadcomplete">OnSmsReadComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_filter">MBN_SMS_FILTER</a> structure that defines the set of messages to read.
     * @param {MBN_SMS_FORMAT} smsFormat An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_sms_format">MBN_SMS_FORMAT</a> value that specifies the format in which an SMS message should be read.  
     * 
     * For GSM devices, it should always be <b>MBN_SMS_FORMAT_PDU</b>.
     * 
     * For CDMA devices, if this is   specified as MBN_SMS_FORMAT_PDU, then the device will read a binary mode CDMA message. If it is specified as MBN_SMS_FORMAT_TEXT, then the device will read a text mode CDMA message. If the device doesn’t support the specified format then it can return an error code.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsread
     */
    SmsRead(smsFilter, smsFormat) {
        result := ComCall(8, this, MBN_SMS_FILTER.Ptr, smsFilter, MBN_SMS_FORMAT, smsFormat, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Deletes a set of SMS messages from a device.
     * @remarks
     * This is an asynchronous operation that will return immediately. If the method returns without error,  then the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsdeletecomplete">OnSmsDeleteComplete</a> method of the  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface.
     * @param {Pointer<MBN_SMS_FILTER>} smsFilter A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_filter">MBN_SMS_FILTER</a> structure that defines the set of messages to delete.
     * @returns {Integer} A pointer to a request ID issued by the Mobile Broadband service to identify this request.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-smsdelete
     */
    SmsDelete(smsFilter) {
        result := ComCall(9, this, MBN_SMS_FILTER.Ptr, smsFilter, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    /**
     * Gets the SMS status for a device.
     * @remarks
     * For recoverable errors such as <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will query the device again for this information when error condition is over. For example, if the device required a PIN to be entered to retrieve this information then it will return <b>E_MBN_PIN_REQUIRED</b>. When an application enters the PIN to unlock the device then the Mobile Broadband service will again try to get this information from the device. The Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsstatuschange">OnSmsStatusChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvents</a> interface
     * 
     * The SMS Message store status can change because of new message received by the system. On any change in the message store status, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsmsevents-onsmsstatuschange">OnSmsStatusChange</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsmsevents">IMbnSmsEvent</a> interface.
     * 
     * 
     * Application issued operations such as the  reading or deleting of messages may reset <b>flag</b> in <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_status_info">MBN_SMS_STATUS_INFO</a> structure. A change in the SMS store caused by this reset will not result in the calling of any notification method.
     * @returns {MBN_SMS_STATUS_INFO} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ns-mbnapi-mbn_sms_status_info">MBN_SMS_STATUS_INFO</a> structure, containing the status information for the device.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsms-getsmsstatus
     */
    GetSmsStatus() {
        smsStatusInfo := MBN_SMS_STATUS_INFO()
        result := ComCall(10, this, MBN_SMS_STATUS_INFO.Ptr, smsStatusInfo, "HRESULT")
        return smsStatusInfo
    }

    Query(iid) {
        if (IMbnSms.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSmsConfiguration := CallbackCreate(GetMethod(implObj, "GetSmsConfiguration"), flags, 2)
        this.vtbl.SetSmsConfiguration := CallbackCreate(GetMethod(implObj, "SetSmsConfiguration"), flags, 3)
        this.vtbl.SmsSendPdu := CallbackCreate(GetMethod(implObj, "SmsSendPdu"), flags, 4)
        this.vtbl.SmsSendCdma := CallbackCreate(GetMethod(implObj, "SmsSendCdma"), flags, 7)
        this.vtbl.SmsSendCdmaPdu := CallbackCreate(GetMethod(implObj, "SmsSendCdmaPdu"), flags, 3)
        this.vtbl.SmsRead := CallbackCreate(GetMethod(implObj, "SmsRead"), flags, 4)
        this.vtbl.SmsDelete := CallbackCreate(GetMethod(implObj, "SmsDelete"), flags, 3)
        this.vtbl.GetSmsStatus := CallbackCreate(GetMethod(implObj, "GetSmsStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSmsConfiguration)
        CallbackFree(this.vtbl.SetSmsConfiguration)
        CallbackFree(this.vtbl.SmsSendPdu)
        CallbackFree(this.vtbl.SmsSendCdma)
        CallbackFree(this.vtbl.SmsSendCdmaPdu)
        CallbackFree(this.vtbl.SmsRead)
        CallbackFree(this.vtbl.SmsDelete)
        CallbackFree(this.vtbl.GetSmsStatus)
    }
}
