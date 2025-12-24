#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to subscriber information.
 * @remarks
 * 
 * This interface is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation">GetSubscriberInformation</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsubscriberinformation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSubscriberInformation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSubscriberInformation
     * @type {Guid}
     */
    static IID => Guid("{459ecc43-bcf5-11dc-a8a8-001321f1405f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubscriberID", "get_SimIccID", "get_TelephoneNumbers"]

    /**
     * @type {BSTR} 
     */
    SubscriberID {
        get => this.get_SubscriberID()
    }

    /**
     * @type {BSTR} 
     */
    SimIccID {
        get => this.get_SimIccID()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    TelephoneNumbers {
        get => this.get_TelephoneNumbers()
    }

    /**
     * The subscriber ID of the device.
     * @remarks
     * 
     * This is a null terminated string of digits. For GSM device this represents the International Mobile Equipment Identity (IMSI) string (up to 15 digits). For CDMA device this represents the Mobile Identification Number (MIN) string or the International Roaming MIN (IRM) string (10 digits). 
     * 
     * Normally, this value is available only when the ready state of the device is <b>MBN_READY_STATE_INITIALIZED</b> In some cases, it may be populated in other states such as <b>MBN_READY_STATE_DEVICE_LOCKED</b>, <b>MBN_READY_STATE_BAD_SIM</b>,  and <b>MBN_READY_STATE_FAILURE</b>. When this information is not available it is returned as an empty string "".
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsubscriberinformation-get_subscriberid
     */
    get_SubscriberID() {
        SubscriberID := BSTR()
        result := ComCall(3, this, "ptr", SubscriberID, "HRESULT")
        return SubscriberID
    }

    /**
     * The SIM International circuit card number (SimICCID) for the device.
     * @remarks
     * 
     * The International Circuit Card Id of the SIM varies between 15 to 20 digits in length and is represented in characters. This value is available only when the ready state of the device is <b>MBN_READY_STATE_INITIALIZED</b>. In some cases, it may also be populated in states such as <b>MBN_READY_STATE_DEVICE_LOCKED</b>, <b>MBN_READY_STATE_BAD_SIM</b>,  and <b>MBN_READY_STATE_FAILURE</b>. When this information is not available it is returned as an empty string.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsubscriberinformation-get_simiccid
     */
    get_SimIccID() {
        SimIccID := BSTR()
        result := ComCall(4, this, "ptr", SimIccID, "HRESULT")
        return SimIccID
    }

    /**
     * The telephone numbers associated with the device.
     * @remarks
     * 
     * This property provides the list of telephone numbers (TNs) assigned to the subscriber. In GSM the numbers are called Mobile Station ISDN Numbers (MSISDNs).  In CDMA they are called Mobile Directory Numbers (MDNs).
     * 
     * This value is not populated until the ready state reaches <b>MBN_READY_STATE_INITIALIZED</b>.
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsubscriberinformation-get_telephonenumbers
     */
    get_TelephoneNumbers() {
        result := ComCall(5, this, "ptr*", &TelephoneNumbers := 0, "HRESULT")
        return TelephoneNumbers
    }
}
