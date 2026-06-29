#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVPNotify.ahk" { IVPNotify }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IVPNotify2 interface inherits from IVPNotify and is implemented by the Overlay Mixer filter.
 * @remarks
 * Include Vptype.h before Vpnotify.h.
 * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nn-vpnotify-ivpnotify2
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVPNotify2 extends IVPNotify {
    /**
     * The interface identifier for IVPNotify2
     * @type {Guid}
     */
    static IID := Guid("{ebf47183-8764-11d1-9e69-00c04fd7c15b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVPNotify2 interfaces
    */
    struct Vtbl extends IVPNotify.Vtbl {
        SetVPSyncMaster : IntPtr
        GetVPSyncMaster : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVPNotify2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetVPSyncMaster method sets whether the video port controls vertical synchronization of the VGA.
     * @remarks
     * Include Vptype.h before Vpnotify.h.
     * @param {BOOL} bVPSyncMaster Value specifying whether the video port controls the vertical synchronization of the VGA monitor. <b>TRUE</b> if the port controls the monitor's synchronization; <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify2-setvpsyncmaster
     */
    SetVPSyncMaster(bVPSyncMaster) {
        result := ComCall(6, this, BOOL, bVPSyncMaster, "HRESULT")
        return result
    }

    /**
     * The GetVPSyncMaster method checks whether the video port controls the synchronization of the VGA.
     * @remarks
     * Include Vptype.h before Vpnotify.h.
     * @param {Pointer<BOOL>} pbVPSyncMaster Pointer to a value indicating whether the video port controls the vertical synchronization of the VGA monitor. <b>TRUE</b> if the port controls the monitor's synchronization; <b>FALSE</b> otherwise.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify2-getvpsyncmaster
     */
    GetVPSyncMaster(pbVPSyncMaster) {
        pbVPSyncMasterMarshal := pbVPSyncMaster is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pbVPSyncMasterMarshal, pbVPSyncMaster, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVPNotify2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetVPSyncMaster := CallbackCreate(GetMethod(implObj, "SetVPSyncMaster"), flags, 2)
        this.vtbl.GetVPSyncMaster := CallbackCreate(GetMethod(implObj, "GetVPSyncMaster"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetVPSyncMaster)
        CallbackFree(this.vtbl.GetVPSyncMaster)
    }
}
