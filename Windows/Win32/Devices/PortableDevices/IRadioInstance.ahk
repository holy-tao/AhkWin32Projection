#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\DEVICE_RADIO_STATE.ahk" { DEVICE_RADIO_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IRadioInstance extends IUnknown {
    /**
     * The interface identifier for IRadioInstance
     * @type {Guid}
     */
    static IID := Guid("{70aa1c9e-f2b4-4c61-86d3-6b9fb75fd1a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRadioInstance interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRadioManagerSignature : IntPtr
        GetInstanceSignature     : IntPtr
        GetFriendlyName          : IntPtr
        GetRadioState            : IntPtr
        SetRadioState            : IntPtr
        IsMultiComm              : IntPtr
        IsAssociatingDevice      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRadioInstance.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetRadioManagerSignature() {
        pguidSignature := Guid()
        result := ComCall(3, this, Guid.Ptr, pguidSignature, "HRESULT")
        return pguidSignature
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetInstanceSignature() {
        pbstrId := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrId, "HRESULT")
        return pbstrId
    }

    /**
     * 
     * @param {Integer} lcid 
     * @returns {BSTR} 
     */
    GetFriendlyName(lcid) {
        pbstrName := BSTR.Owned()
        result := ComCall(5, this, "uint", lcid, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {DEVICE_RADIO_STATE} 
     */
    GetRadioState() {
        result := ComCall(6, this, "int*", &pRadioState := 0, "HRESULT")
        return pRadioState
    }

    /**
     * 
     * @param {DEVICE_RADIO_STATE} radioState 
     * @param {Integer} uTimeoutSec 
     * @returns {HRESULT} 
     */
    SetRadioState(radioState, uTimeoutSec) {
        result := ComCall(7, this, DEVICE_RADIO_STATE, radioState, "uint", uTimeoutSec, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsMultiComm() {
        result := ComCall(8, this, BOOL)
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsAssociatingDevice() {
        result := ComCall(9, this, BOOL)
        return result
    }

    Query(iid) {
        if (IRadioInstance.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRadioManagerSignature := CallbackCreate(GetMethod(implObj, "GetRadioManagerSignature"), flags, 2)
        this.vtbl.GetInstanceSignature := CallbackCreate(GetMethod(implObj, "GetInstanceSignature"), flags, 2)
        this.vtbl.GetFriendlyName := CallbackCreate(GetMethod(implObj, "GetFriendlyName"), flags, 3)
        this.vtbl.GetRadioState := CallbackCreate(GetMethod(implObj, "GetRadioState"), flags, 2)
        this.vtbl.SetRadioState := CallbackCreate(GetMethod(implObj, "SetRadioState"), flags, 3)
        this.vtbl.IsMultiComm := CallbackCreate(GetMethod(implObj, "IsMultiComm"), flags, 1)
        this.vtbl.IsAssociatingDevice := CallbackCreate(GetMethod(implObj, "IsAssociatingDevice"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRadioManagerSignature)
        CallbackFree(this.vtbl.GetInstanceSignature)
        CallbackFree(this.vtbl.GetFriendlyName)
        CallbackFree(this.vtbl.GetRadioState)
        CallbackFree(this.vtbl.SetRadioState)
        CallbackFree(this.vtbl.IsMultiComm)
        CallbackFree(this.vtbl.IsAssociatingDevice)
    }
}
