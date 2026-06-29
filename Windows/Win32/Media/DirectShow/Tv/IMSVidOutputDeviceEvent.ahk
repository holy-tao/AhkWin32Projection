#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDeviceEvent.ahk" { IMSVidDeviceEvent }

/**
 * Note  This topic applies to Windows XP or later. The IMSVidOutputDeviceEvent interface is the base interface for output device events.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidOutputDeviceEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidoutputdeviceevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidOutputDeviceEvent extends IMSVidDeviceEvent {
    /**
     * The interface identifier for IMSVidOutputDeviceEvent
     * @type {Guid}
     */
    static IID := Guid("{2e6a14e2-571c-11d3-b652-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidOutputDeviceEvent interfaces
    */
    struct Vtbl extends IMSVidDeviceEvent.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidOutputDeviceEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidOutputDeviceEvent.IID.Equals(iid)) {
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
