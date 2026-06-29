#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MBN_SMS_FORMAT.ahk" { MBN_SMS_FORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to the SMS configuration of a device.
 * @remarks
 * This interface is acquired by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration">GetSmsConfiguration</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsmsconfiguration
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSmsConfiguration extends IUnknown {
    /**
     * The interface identifier for IMbnSmsConfiguration
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2012-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSmsConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ServiceCenterAddress : IntPtr
        put_ServiceCenterAddress : IntPtr
        get_MaxMessageIndex      : IntPtr
        get_CdmaShortMsgSize     : IntPtr
        get_SmsFormat            : IntPtr
        put_SmsFormat            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSmsConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ServiceCenterAddress {
        get => this.get_ServiceCenterAddress()
        set => this.put_ServiceCenterAddress(value)
    }

    /**
     * @type {Integer} 
     */
    MaxMessageIndex {
        get => this.get_MaxMessageIndex()
    }

    /**
     * @type {Integer} 
     */
    CdmaShortMsgSize {
        get => this.get_CdmaShortMsgSize()
    }

    /**
     * @type {MBN_SMS_FORMAT} 
     */
    SmsFormat {
        get => this.get_SmsFormat()
        set => this.put_SmsFormat(value)
    }

    /**
     * SMS default Service Center address. (Get)
     * @remarks
     * When setting <i>scAddress</i>, the calling application must use either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_servicecenteraddress
     */
    get_ServiceCenterAddress() {
        scAddress := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, scAddress, "HRESULT")
        return scAddress
    }

    /**
     * SMS default Service Center address. (Put)
     * @remarks
     * When setting <i>scAddress</i>, the calling application must use either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * @param {PWSTR} scAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-put_servicecenteraddress
     */
    put_ServiceCenterAddress(scAddress) {
        scAddress := scAddress is String ? StrPtr(scAddress) : scAddress

        result := ComCall(4, this, "ptr", scAddress, "HRESULT")
        return result
    }

    /**
     * SMS message memory capacity.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_maxmessageindex
     */
    get_MaxMessageIndex() {
        result := ComCall(5, this, "uint*", &index := 0, "HRESULT")
        return index
    }

    /**
     * Maximum CDMA short message character length.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize
     */
    get_CdmaShortMsgSize() {
        result := ComCall(6, this, "uint*", &shortMsgSize := 0, "HRESULT")
        return shortMsgSize
    }

    /**
     * Format in which newly received SMS should be reported by the device. (Get)
     * @returns {MBN_SMS_FORMAT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-get_smsformat
     */
    get_SmsFormat() {
        result := ComCall(7, this, "int*", &smsFormat := 0, "HRESULT")
        return smsFormat
    }

    /**
     * Format in which newly received SMS should be reported by the device. (Put)
     * @param {MBN_SMS_FORMAT} smsFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsmsconfiguration-put_smsformat
     */
    put_SmsFormat(smsFormat) {
        result := ComCall(8, this, MBN_SMS_FORMAT, smsFormat, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMbnSmsConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ServiceCenterAddress := CallbackCreate(GetMethod(implObj, "get_ServiceCenterAddress"), flags, 2)
        this.vtbl.put_ServiceCenterAddress := CallbackCreate(GetMethod(implObj, "put_ServiceCenterAddress"), flags, 2)
        this.vtbl.get_MaxMessageIndex := CallbackCreate(GetMethod(implObj, "get_MaxMessageIndex"), flags, 2)
        this.vtbl.get_CdmaShortMsgSize := CallbackCreate(GetMethod(implObj, "get_CdmaShortMsgSize"), flags, 2)
        this.vtbl.get_SmsFormat := CallbackCreate(GetMethod(implObj, "get_SmsFormat"), flags, 2)
        this.vtbl.put_SmsFormat := CallbackCreate(GetMethod(implObj, "put_SmsFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ServiceCenterAddress)
        CallbackFree(this.vtbl.put_ServiceCenterAddress)
        CallbackFree(this.vtbl.get_MaxMessageIndex)
        CallbackFree(this.vtbl.get_CdmaShortMsgSize)
        CallbackFree(this.vtbl.get_SmsFormat)
        CallbackFree(this.vtbl.put_SmsFormat)
    }
}
