#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDeviceEvent.ahk" { IMSVidDeviceEvent }

/**
 * The IMSVidFeatureEvent interface is the base interface for events from Video Control feature objects.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFeatureEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidfeatureevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidFeatureEvent extends IMSVidDeviceEvent {
    /**
     * The interface identifier for IMSVidFeatureEvent
     * @type {Guid}
     */
    static IID := Guid("{3dd2903c-e0aa-11d2-b63a-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidFeatureEvent interfaces
    */
    struct Vtbl extends IMSVidDeviceEvent.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidFeatureEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidFeatureEvent.IID.Equals(iid)) {
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
