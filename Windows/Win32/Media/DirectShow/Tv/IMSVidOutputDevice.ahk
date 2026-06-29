#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDevice.ahk" { IMSVidDevice }

/**
 * The IMSVidOutputDevice interface represents an output device. This interface derives from the IMSVidDevice interface but adds no methods to it. It exists to support polymorphism.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidOutputDevice)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidoutputdevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidOutputDevice extends IMSVidDevice {
    /**
     * The interface identifier for IMSVidOutputDevice
     * @type {Guid}
     */
    static IID := Guid("{37b03546-a4c8-11d2-b634-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidOutputDevice interfaces
    */
    struct Vtbl extends IMSVidDevice.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidOutputDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidOutputDevice.IID.Equals(iid)) {
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
