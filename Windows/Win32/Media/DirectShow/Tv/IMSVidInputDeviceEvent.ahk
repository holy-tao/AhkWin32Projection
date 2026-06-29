#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }

/**
 * This topic applies to Windows XP or later. The IMSVidInputDeviceEvent interface is the base interface for input device events. Do not implement this interface directly. Other event interfaces derive from this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidInputDeviceEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidinputdeviceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidInputDeviceEvent extends IDispatch {
    /**
     * The interface identifier for IMSVidInputDeviceEvent
     * @type {Guid}
     */
    static IID := Guid("{37b0353e-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidInputDeviceEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidInputDeviceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidInputDeviceEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
