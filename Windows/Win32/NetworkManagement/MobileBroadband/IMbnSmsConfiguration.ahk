#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the SMS configuration of a device.
 * @remarks
 * 
 * This interface is acquired by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration">GetSmsConfiguration</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsmsconfiguration
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSmsConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSmsConfiguration
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2012-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServiceCenterAddress", "put_ServiceCenterAddress", "get_MaxMessageIndex", "get_CdmaShortMsgSize", "get_SmsFormat", "put_SmsFormat"]

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
     * @type {Integer} 
     */
    SmsFormat {
        get => this.get_SmsFormat()
        set => this.put_SmsFormat(value)
    }

    /**
     * SMS default Service Center address.
     * @remarks
     * 
     * When setting <i>scAddress</i>, the calling application must use either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-get_servicecenteraddress
     */
    get_ServiceCenterAddress() {
        scAddress := BSTR()
        result := ComCall(3, this, "ptr", scAddress, "HRESULT")
        return scAddress
    }

    /**
     * SMS default Service Center address.
     * @remarks
     * 
     * When setting <i>scAddress</i>, the calling application must use either of these formats.
     * 
     * <ul>
     * <li>"+ &lt;International Country Code&gt; &lt;SMS Service Center Number&gt;\0"</li>
     * <li>"&lt;SMS Service Center Number&gt;\0"</li>
     * </ul>
     * 
     * 
     * @param {PWSTR} scAddress 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-put_servicecenteraddress
     */
    put_ServiceCenterAddress(scAddress) {
        scAddress := scAddress is String ? StrPtr(scAddress) : scAddress

        result := ComCall(4, this, "ptr", scAddress, "HRESULT")
        return result
    }

    /**
     * SMS message memory capacity.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-get_maxmessageindex
     */
    get_MaxMessageIndex() {
        result := ComCall(5, this, "uint*", &index := 0, "HRESULT")
        return index
    }

    /**
     * Maximum CDMA short message character length.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-get_cdmashortmsgsize
     */
    get_CdmaShortMsgSize() {
        result := ComCall(6, this, "uint*", &shortMsgSize := 0, "HRESULT")
        return shortMsgSize
    }

    /**
     * Format in which newly received SMS should be reported by the device.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-get_smsformat
     */
    get_SmsFormat() {
        result := ComCall(7, this, "int*", &smsFormat := 0, "HRESULT")
        return smsFormat
    }

    /**
     * Format in which newly received SMS should be reported by the device.
     * @param {Integer} smsFormat 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsmsconfiguration-put_smsformat
     */
    put_SmsFormat(smsFormat) {
        result := ComCall(8, this, "int", smsFormat, "HRESULT")
        return result
    }
}
