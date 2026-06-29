#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SYSTEM_RADIO_STATE.ahk" { SYSTEM_RADIO_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRadioInstanceCollection.ahk" { IRadioInstanceCollection }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IMediaRadioManager extends IUnknown {
    /**
     * The interface identifier for IMediaRadioManager
     * @type {Guid}
     */
    static IID := Guid("{6cfdcab5-fc47-42a5-9241-074b58830e73}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaRadioManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRadioInstances        : IntPtr
        OnSystemRadioStateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaRadioManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IRadioInstanceCollection} 
     */
    GetRadioInstances() {
        result := ComCall(3, this, "ptr*", &ppCollection := 0, "HRESULT")
        return IRadioInstanceCollection(ppCollection)
    }

    /**
     * 
     * @param {SYSTEM_RADIO_STATE} sysRadioState 
     * @param {Integer} uTimeoutSec 
     * @returns {HRESULT} 
     */
    OnSystemRadioStateChange(sysRadioState, uTimeoutSec) {
        result := ComCall(4, this, SYSTEM_RADIO_STATE, sysRadioState, "uint", uTimeoutSec, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaRadioManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRadioInstances := CallbackCreate(GetMethod(implObj, "GetRadioInstances"), flags, 2)
        this.vtbl.OnSystemRadioStateChange := CallbackCreate(GetMethod(implObj, "OnSystemRadioStateChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRadioInstances)
        CallbackFree(this.vtbl.OnSystemRadioStateChange)
    }
}
