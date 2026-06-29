#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSVidDevice.ahk" { IMSVidDevice }

/**
 * The IMSVidFeature interface represents a feature that is available through the Video Control, such as data services or closed captioning.
 * @remarks
 * To obtain a collection of the features that are available, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable">IMSVidCtl::get_FeaturesAvailable</a> method on the Video Control. To activate a feature, create a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd695126(v=vs.85)">MSVidFeatures</a> collection object and assign it to the Video Control by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-put_featuresactive">IMSVidCtl::put_FeaturesActive</a> method.
 *       
 * 
 * Feature objects do not implement the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get_power">IMSVidDevice::get_Power</a> or <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get_status">IMSVidDevice::get_Status</a> method.
 *       
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidFeature)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidfeature
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidFeature extends IMSVidDevice {
    /**
     * The interface identifier for IMSVidFeature
     * @type {Guid}
     */
    static IID := Guid("{37b03547-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The class identifier for MSVidFeature
     * @type {Guid}
     */
    static CLSID := Guid("{7748530b-c08a-47ea-b24c-be8695ff405f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidFeature interfaces
    */
    struct Vtbl extends IMSVidDevice.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidFeature.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IMSVidFeature.IID.Equals(iid)) {
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
