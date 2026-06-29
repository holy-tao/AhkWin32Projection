#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFTopology.ahk" { IMFTopology }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPresentationDescriptor.ahk" { IMFPresentationDescriptor }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables an application to get a topology from the sequencer source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmediasourcetopologyprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourceTopologyProvider extends IUnknown {
    /**
     * The interface identifier for IMFMediaSourceTopologyProvider
     * @type {Guid}
     */
    static IID := Guid("{0e1d6009-c9f3-442d-8c51-a42d2d49452f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourceTopologyProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMediaSourceTopology : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourceTopologyProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns a topology for a media source that builds an internal topology.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the media source's presentation descriptor. To get this pointer, either call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasource-createpresentationdescriptor">IMFMediaSource::CreatePresentationDescriptor</a> on the media source, or get the pointer from the <a href="https://docs.microsoft.com/windows/desktop/medfound/menewpresentation">MENewPresentation</a> event.
     * @returns {IMFTopology} Receives a pointer to the topology's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourcetopologyprovider-getmediasourcetopology
     */
    GetMediaSourceTopology(pPresentationDescriptor) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "ptr*", &ppTopology := 0, "HRESULT")
        return IMFTopology(ppTopology)
    }

    Query(iid) {
        if (IMFMediaSourceTopologyProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMediaSourceTopology := CallbackCreate(GetMethod(implObj, "GetMediaSourceTopology"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMediaSourceTopology)
    }
}
