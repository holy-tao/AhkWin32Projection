#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPSyncDevice.ahk" { IWMPSyncDevice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPEvents3.ahk" { IWMPEvents3 }

/**
 * The IWMPEvents4 interface provides access to an event originating from the Windows Media Player 12 control so that an application that has this control embedded in it can respond to the event.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpevents4
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPEvents4 extends IWMPEvents3 {
    /**
     * The interface identifier for IWMPEvents4
     * @type {Guid}
     */
    static IID := Guid("{26dabcfa-306b-404d-9a6f-630a8405048d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPEvents4 interfaces
    */
    struct Vtbl extends IWMPEvents3.Vtbl {
        DeviceEstimation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPEvents4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IWMPSyncDevice} pDevice 
     * @param {HRESULT} hrResult 
     * @param {Integer} qwEstimatedUsedSpace 
     * @param {Integer} qwEstimatedSpace 
     * @returns {String} Nothing - always returns an empty string
     */
    DeviceEstimation(pDevice, hrResult, qwEstimatedUsedSpace, qwEstimatedSpace) {
        ComCall(65, this, "ptr", pDevice, "int", hrResult, "int64", qwEstimatedUsedSpace, "int64", qwEstimatedSpace)
    }

    Query(iid) {
        if (IWMPEvents4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeviceEstimation := CallbackCreate(GetMethod(implObj, "DeviceEstimation"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeviceEstimation)
    }
}
