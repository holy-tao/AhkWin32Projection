#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDevice.ahk" { IMSVidDevice }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * This topic applies to Windows XP or later. The IMSVidDeviceEvent interface is the base interface for device events. Do not implement this interface directly. Other event interfaces derive from this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDeviceEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsviddeviceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidDeviceEvent extends IDispatch {
    /**
     * The interface identifier for IMSVidDeviceEvent
     * @type {Guid}
     */
    static IID := Guid("{1c15d480-911d-11d2-b632-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidDeviceEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        StateChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidDeviceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This topic applies to Windows XP or later.
     * @remarks
     * The dispatch identifier (dispid) of this method is <b>eventidStateChange</b>.
     * @param {IMSVidDevice} lpd Pointer to the device object that signaled the change.
     * @param {Integer} oldState Specifies the old state as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/ne-msvidctl-msvidctlstatelist">MSVidCtlStateList</a> value.
     * @param {Integer} newState Specifies the new state as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/ne-msvidctl-msvidctlstatelist">MSVidCtlStateList</a> value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddeviceevent-statechange
     */
    StateChange(lpd, oldState, newState) {
        result := ComCall(7, this, "ptr", lpd, "int", oldState, "int", newState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidDeviceEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StateChange := CallbackCreate(GetMethod(implObj, "StateChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StateChange)
    }
}
