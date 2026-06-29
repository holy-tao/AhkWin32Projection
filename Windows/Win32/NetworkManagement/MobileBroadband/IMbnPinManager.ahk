#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMbnPin.ahk" { IMbnPin }
#Import ".\MBN_PIN_TYPE.ahk" { MBN_PIN_TYPE }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Provides important details about the device PIN.
 * @remarks
 * An application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnpinmanager
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnPinManager extends IUnknown {
    /**
     * The interface identifier for IMbnPinManager
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2005-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnPinManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetPinList  : IntPtr
        GetPin      : IntPtr
        GetPinState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnPinManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets a list of different PIN types supported by the device.
     * @remarks
     * On the recoverable errors <b>E_MBN_PIN_REQUIRED</b>, <b>E_MBN_SIM_NOT_INSERTED</b>, and <b>E_MBN_BAD_SIM</b>, the Mobile Broadband service will attempt to retrieve this information from the device when the error condition is over. While it is retrieving this information <b>GetPinList</b> call will return <b>E_PENDING</b>. Once the retrieval operation is complete, the Mobile Broadband service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanagerevents-onpinlistavailable">OnPinListAvailable</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanagerevents">IMbnPinManagerEvents</a>.
     * @returns {Pointer<SAFEARRAY>} A pointer to a list of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> values that represent the PIN types supported by the device.  When <b>GetPinList</b> returns anything other than <b>S_OK</b>, <i>pinList</i> is <b>NULL</b>, otherwise the calling application must free the allocated memory by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinlist
     */
    GetPinList() {
        result := ComCall(3, this, "ptr*", &pinList := 0, "HRESULT")
        return pinList
    }

    /**
     * Gets a specific type of PIN.
     * @param {MBN_PIN_TYPE} pinType An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_pin_type">MBN_PIN_TYPE</a> value that represents the requested PIN type.
     * @returns {IMbnPin} Pointer to the address of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpin">IMbnPin</a> for the requested PIN type.  If this method returns any value other than <b>S_OK</b>, this parameter is <b>NULL</b>.  Otherwise, the calling application must release this interface when it is done using it.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpin
     */
    GetPin(pinType) {
        result := ComCall(4, this, MBN_PIN_TYPE, pinType, "ptr*", &pin := 0, "HRESULT")
        return IMbnPin(pin)
    }

    /**
     * Gets the current PIN state of the device.
     * @remarks
     * The <b>GetPinState</b> method initiates an asynchronous request for the PIN state of the device. The PIN state indicates if a PIN needs to be entered for a requested operation to complete. It also contains information about which type of PIN is expected by a device and optionally it provides the number of attempts remaining for entering a valid PIN.
     * 
     * This method always returns the current PIN state of the device. It does not cache the PIN state at the time when this object is created.  Instead it always contacts the device and returns the current PIN state of the device.
     * 
     * Since this is an asynchronous operation, <b>GetPinState</b> will return immediately. On completion of the operation, the Mobile Broadband service will call the   <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanagerevents-ongetpinstatecomplete">OnGetPinStateComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanagerevents">IMbnPinManagerEvents</a>.
     * 
     * Whenever an operation returns <b>E_MBN_PIN_REQUIRED</b> or the ready state reported by the device is <b>MBN_READY_STATE_DEVICE_LOCKED</b>, an application should use this method to query the type of PIN required to unlock the device or SIM.
     * 
     * While this operation is in progress,  if the Mobile Broadband device gets removed from the system then a call to the   <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnpinmanagerevents-ongetpinstatecomplete">OnGetPinStateComplete</a> method of  <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnpinmanagerevents">IMbnPinManagerEvents</a> is not guaranteed.
     * @returns {Integer} A pointer to the  request ID set by the Mobile Broadband service for this asynchronous request.  The response will contain the same request ID.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnpinmanager-getpinstate
     */
    GetPinState() {
        result := ComCall(5, this, "uint*", &requestID := 0, "HRESULT")
        return requestID
    }

    Query(iid) {
        if (IMbnPinManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPinList := CallbackCreate(GetMethod(implObj, "GetPinList"), flags, 2)
        this.vtbl.GetPin := CallbackCreate(GetMethod(implObj, "GetPin"), flags, 3)
        this.vtbl.GetPinState := CallbackCreate(GetMethod(implObj, "GetPinState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPinList)
        CallbackFree(this.vtbl.GetPin)
        CallbackFree(this.vtbl.GetPinState)
    }
}
