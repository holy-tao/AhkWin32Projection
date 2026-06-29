#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITPhone.ahk" { ITPhone }

/**
 * The ITPhoneDeviceSpecificEvent exposes methods that allow an application to retrieve information about a phone device-specific event.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itphonedevicespecificevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITPhoneDeviceSpecificEvent extends IDispatch {
    /**
     * The interface identifier for ITPhoneDeviceSpecificEvent
     * @type {Guid}
     */
    static IID := Guid("{63ffb2a6-872b-4cd3-a501-326e8fb40af7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITPhoneDeviceSpecificEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Phone   : IntPtr
        get_lParam1 : IntPtr
        get_lParam2 : IntPtr
        get_lParam3 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITPhoneDeviceSpecificEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ITPhone} 
     */
    Phone {
        get => this.get_Phone()
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
     * The get_Phone method retrieves the ITPhone interface pointer for a phone device event.
     * @returns {ITPhone} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface for the phone object involved in the event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_phone
     */
    get_Phone() {
        result := ComCall(7, this, "ptr*", &ppPhone := 0, "HRESULT")
        return ITPhone(ppPhone)
    }

    /**
     * The get_lParam1 method retrieves the first of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the phone device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam1
     */
    get_lParam1() {
        result := ComCall(8, this, "int*", &pParam1 := 0, "HRESULT")
        return pParam1
    }

    /**
     * The get_lParam2 method retrieves the second of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a <b>long</b> concerning information on the phone device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam2
     */
    get_lParam2() {
        result := ComCall(9, this, "int*", &pParam2 := 0, "HRESULT")
        return pParam2
    }

    /**
     * The get_lParam3 method retrieves the third of three buffers specific to a given phone device. The precise content and meaning of these buffers is defined by the provider.
     * @returns {Integer} Pointer to a variable that receives information on the phone device event.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphonedevicespecificevent-get_lparam3
     */
    get_lParam3() {
        result := ComCall(10, this, "int*", &pParam3 := 0, "HRESULT")
        return pParam3
    }

    Query(iid) {
        if (ITPhoneDeviceSpecificEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Phone := CallbackCreate(GetMethod(implObj, "get_Phone"), flags, 2)
        this.vtbl.get_lParam1 := CallbackCreate(GetMethod(implObj, "get_lParam1"), flags, 2)
        this.vtbl.get_lParam2 := CallbackCreate(GetMethod(implObj, "get_lParam2"), flags, 2)
        this.vtbl.get_lParam3 := CallbackCreate(GetMethod(implObj, "get_lParam3"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Phone)
        CallbackFree(this.vtbl.get_lParam1)
        CallbackFree(this.vtbl.get_lParam2)
        CallbackFree(this.vtbl.get_lParam3)
    }
}
