#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITAddress.ahk" { ITAddress }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITCallInfo.ahk" { ITCallInfo }

/**
 * The ITAddressDeviceSpecificEvent exposes methods that allow an application to retrieve information about a device-specific event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itaddressdevicespecificevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITAddressDeviceSpecificEvent extends IDispatch {
    /**
     * The interface identifier for ITAddressDeviceSpecificEvent
     * @type {Guid}
     */
    static IID := Guid("{3acb216b-40bd-487a-8672-5ce77bd7e3a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITAddressDeviceSpecificEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Address : IntPtr
        get_Call    : IntPtr
        get_lParam1 : IntPtr
        get_lParam2 : IntPtr
        get_lParam3 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITAddressDeviceSpecificEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITAddress} 
     */
    Address {
        get => this.get_Address()
    }

    /**
     * @type {ITCallInfo} 
     */
    Call {
        get => this.get_Call()
    }

    /**
     * @type {Integer} 
     */
    lParam1 {
        get => this.get_lParam1()
    }

    /**
     * @type {Integer} 
     */
    lParam2 {
        get => this.get_lParam2()
    }

    /**
     * @type {Integer} 
     */
    lParam3 {
        get => this.get_lParam3()
    }

    /**
     * The get_Address method gets a pointer to the ITAddress interface of the Address object involved in the event.
     * @returns {ITAddress} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_address
     */
    get_Address() {
        result := ComCall(7, this, "ptr*", &ppAddress := 0, "HRESULT")
        return ITAddress(ppAddress)
    }

    /**
     * The get_Call method gets a pointer to the ITCallInfo interface pointer for the call object involved in the event.
     * @returns {ITCallInfo} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_call
     */
    get_Call() {
        result := ComCall(8, this, "ptr*", &ppCall := 0, "HRESULT")
        return ITCallInfo(ppCall)
    }

    /**
     * The get_lParam1 method retrieves the first of three buffers specific to a given address device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the address device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam1
     */
    get_lParam1() {
        result := ComCall(9, this, "int*", &pParam1 := 0, "HRESULT")
        return pParam1
    }

    /**
     * The get_lParam2 method retrieves the second of three buffers specific to a given address device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the address device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam2
     */
    get_lParam2() {
        result := ComCall(10, this, "int*", &pParam2 := 0, "HRESULT")
        return pParam2
    }

    /**
     * The get_lParam3 method retrieves the third of three buffers specific to a given address device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the address device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itaddressdevicespecificevent-get_lparam3
     */
    get_lParam3() {
        result := ComCall(11, this, "int*", &pParam3 := 0, "HRESULT")
        return pParam3
    }

    Query(iid) {
        if (ITAddressDeviceSpecificEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Address := CallbackCreate(GetMethod(implObj, "get_Address"), flags, 2)
        this.vtbl.get_Call := CallbackCreate(GetMethod(implObj, "get_Call"), flags, 2)
        this.vtbl.get_lParam1 := CallbackCreate(GetMethod(implObj, "get_lParam1"), flags, 2)
        this.vtbl.get_lParam2 := CallbackCreate(GetMethod(implObj, "get_lParam2"), flags, 2)
        this.vtbl.get_lParam3 := CallbackCreate(GetMethod(implObj, "get_lParam3"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Address)
        CallbackFree(this.vtbl.get_Call)
        CallbackFree(this.vtbl.get_lParam1)
        CallbackFree(this.vtbl.get_lParam2)
        CallbackFree(this.vtbl.get_lParam3)
    }
}
