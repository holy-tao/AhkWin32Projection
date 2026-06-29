#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DEVICE_RADIO_STATE.ahk" { DEVICE_RADIO_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IRadioInstance.ahk" { IRadioInstance }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IMediaRadioManagerNotifySink extends IUnknown {
    /**
     * The interface identifier for IMediaRadioManagerNotifySink
     * @type {Guid}
     */
    static IID := Guid("{89d81f5f-c147-49ed-a11c-77b20c31e7c9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaRadioManagerNotifySink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnInstanceAdd         : IntPtr
        OnInstanceRemove      : IntPtr
        OnInstanceRadioChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaRadioManagerNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IRadioInstance} pRadioInstance 
     * @returns {HRESULT} 
     */
    OnInstanceAdd(pRadioInstance) {
        result := ComCall(3, this, "ptr", pRadioInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRadioInstanceId 
     * @returns {HRESULT} 
     */
    OnInstanceRemove(bstrRadioInstanceId) {
        bstrRadioInstanceId := bstrRadioInstanceId is String ? BSTR.Alloc(bstrRadioInstanceId).Value : bstrRadioInstanceId

        result := ComCall(4, this, BSTR, bstrRadioInstanceId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRadioInstanceId 
     * @param {DEVICE_RADIO_STATE} radioState 
     * @returns {HRESULT} 
     */
    OnInstanceRadioChange(bstrRadioInstanceId, radioState) {
        bstrRadioInstanceId := bstrRadioInstanceId is String ? BSTR.Alloc(bstrRadioInstanceId).Value : bstrRadioInstanceId

        result := ComCall(5, this, BSTR, bstrRadioInstanceId, DEVICE_RADIO_STATE, radioState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaRadioManagerNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnInstanceAdd := CallbackCreate(GetMethod(implObj, "OnInstanceAdd"), flags, 2)
        this.vtbl.OnInstanceRemove := CallbackCreate(GetMethod(implObj, "OnInstanceRemove"), flags, 2)
        this.vtbl.OnInstanceRadioChange := CallbackCreate(GetMethod(implObj, "OnInstanceRadioChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnInstanceAdd)
        CallbackFree(this.vtbl.OnInstanceRemove)
        CallbackFree(this.vtbl.OnInstanceRadioChange)
    }
}
