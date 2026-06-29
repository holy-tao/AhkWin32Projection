#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidFeature.ahk" { IMSVidFeature }

/**
 * The IMSVidDataServices interface represents the data services feature. The MSVidDataServices feature object exposes this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDataServices)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsviddataservices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidDataServices extends IMSVidFeature {
    /**
     * The interface identifier for IMSVidDataServices
     * @type {Guid}
     */
    static IID := Guid("{334125c1-77e5-11d3-b653-00c04f79498e}")

    /**
     * The class identifier for MSVidDataServices
     * @type {Guid}
     */
    static CLSID := Guid("{334125c0-77e5-11d3-b653-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidDataServices interfaces
    */
    struct Vtbl extends IMSVidFeature.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidDataServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidDataServices.IID.Equals(iid)) {
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
