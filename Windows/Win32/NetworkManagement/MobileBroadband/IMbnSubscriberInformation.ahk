#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides access to subscriber information.
 * @remarks
 * This interface is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbninterface-getsubscriberinformation">GetSubscriberInformation</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsubscriberinformation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSubscriberInformation extends IUnknown {
    /**
     * The interface identifier for IMbnSubscriberInformation
     * @type {Guid}
     */
    static IID := Guid("{459ecc43-bcf5-11dc-a8a8-001321f1405f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSubscriberInformation interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SubscriberID     : IntPtr
        get_SimIccID         : IntPtr
        get_TelephoneNumbers : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSubscriberInformation.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * This is a null terminated string of digits. For GSM device this represents the International Mobile Equipment Identity (IMSI) string (up to 15 digits). For CDMA device this represents the Mobile Identification Number (MIN) string or the International Roaming MIN (IRM) string (10 digits). 
     * 
     * Normally, this value is available only when the ready state of the device is <b>MBN_READY_STATE_INITIALIZED</b> In some cases, it may be populated in other states such as <b>MBN_READY_STATE_DEVICE_LOCKED</b>, <b>MBN_READY_STATE_BAD_SIM</b>,  and <b>MBN_READY_STATE_FAILURE</b>. When this information is not available it is returned as an empty string "".
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsubscriberinformation-get_subscriberid
     */
    get_SubscriberID() {
        SubscriberID := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, SubscriberID, "HRESULT")
        return SubscriberID
    }

    /**
     * The SIM International circuit card number (SimICCID) for the device.
     * @remarks
     * The International Circuit Card Id of the SIM varies between 15 to 20 digits in length and is represented in characters. This value is available only when the ready state of the device is <b>MBN_READY_STATE_INITIALIZED</b>. In some cases, it may also be populated in states such as <b>MBN_READY_STATE_DEVICE_LOCKED</b>, <b>MBN_READY_STATE_BAD_SIM</b>,  and <b>MBN_READY_STATE_FAILURE</b>. When this information is not available it is returned as an empty string.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsubscriberinformation-get_simiccid
     */
    get_SimIccID() {
        SimIccID := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, SimIccID, "HRESULT")
        return SimIccID
    }

    /**
     * The telephone numbers associated with the device.
     * @remarks
     * This property provides the list of telephone numbers (TNs) assigned to the subscriber. In GSM the numbers are called Mobile Station ISDN Numbers (MSISDNs).  In CDMA they are called Mobile Directory Numbers (MDNs).
     * 
     * This value is not populated until the ready state reaches <b>MBN_READY_STATE_INITIALIZED</b>.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsubscriberinformation-get_telephonenumbers
     */
    get_TelephoneNumbers() {
        result := ComCall(5, this, "ptr*", &TelephoneNumbers := 0, "HRESULT")
        return TelephoneNumbers
    }

    Query(iid) {
        if (IMbnSubscriberInformation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SubscriberID := CallbackCreate(GetMethod(implObj, "get_SubscriberID"), flags, 2)
        this.vtbl.get_SimIccID := CallbackCreate(GetMethod(implObj, "get_SimIccID"), flags, 2)
        this.vtbl.get_TelephoneNumbers := CallbackCreate(GetMethod(implObj, "get_TelephoneNumbers"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SubscriberID)
        CallbackFree(this.vtbl.get_SimIccID)
        CallbackFree(this.vtbl.get_TelephoneNumbers)
    }
}
