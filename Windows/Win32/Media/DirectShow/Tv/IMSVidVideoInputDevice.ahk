#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidInputDevice.ahk" { IMSVidInputDevice }

/**
 * The IMSVidVideoInputDevice interface represents a video input device. This interface inherits from the IMSVidInputDevice interface but adds no methods to it. It exists to support polymorphism.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoInputDevice)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidvideoinputdevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidVideoInputDevice extends IMSVidInputDevice {
    /**
     * The interface identifier for IMSVidVideoInputDevice
     * @type {Guid}
     */
    static IID := Guid("{1c15d47f-911d-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoInputDevice
     * @type {Guid}
     */
    static CLSID := Guid("{95f4820b-bb3a-4e2d-bc64-5b817bc2c30e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidVideoInputDevice interfaces
    */
    struct Vtbl extends IMSVidInputDevice.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidVideoInputDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidVideoInputDevice.IID.Equals(iid)) {
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
