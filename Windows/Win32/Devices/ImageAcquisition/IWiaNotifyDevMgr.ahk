#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is not implemented.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nn-wia_xp-iwianotifydevmgr
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaNotifyDevMgr extends IUnknown {
    /**
     * The interface identifier for IWiaNotifyDevMgr
     * @type {Guid}
     */
    static IID := Guid("{70681ea0-e7bf-4291-9fb1-4e8813a3f78e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaNotifyDevMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        NewDeviceArrival : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaNotifyDevMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not implemented. (IWiaNotifyDevMgr.NewDeviceArrival)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwianotifydevmgr-newdevicearrival
     */
    NewDeviceArrival() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaNotifyDevMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NewDeviceArrival := CallbackCreate(GetMethod(implObj, "NewDeviceArrival"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NewDeviceArrival)
    }
}
