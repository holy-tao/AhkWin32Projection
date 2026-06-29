#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower)
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-ilocationpower
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct ILocationPower extends IUnknown {
    /**
     * The interface identifier for ILocationPower
     * @type {Guid}
     */
    static IID := Guid("{193e7729-ab6b-4b12-8617-7596e1bb191c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILocationPower interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Connect    : IntPtr
        Disconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILocationPower.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower.Connect)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationpower-connect
     */
    Connect() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Used by Windows Store app browsers in Windows 8 to notify the location platform that an app has been suspended (disconnect) and restored (connect). (ILocationPower.Disconnect)
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationpower-disconnect
     */
    Disconnect() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ILocationPower.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Connect := CallbackCreate(GetMethod(implObj, "Connect"), flags, 1)
        this.vtbl.Disconnect := CallbackCreate(GetMethod(implObj, "Disconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Connect)
        CallbackFree(this.vtbl.Disconnect)
    }
}
