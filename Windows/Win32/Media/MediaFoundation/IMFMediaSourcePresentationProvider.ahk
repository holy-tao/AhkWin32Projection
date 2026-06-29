#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFPresentationDescriptor.ahk" { IMFPresentationDescriptor }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides notifications to the sequencer source.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfmediasourcepresentationprovider
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSourcePresentationProvider extends IUnknown {
    /**
     * The interface identifier for IMFMediaSourcePresentationProvider
     * @type {Guid}
     */
    static IID := Guid("{0e1d600a-c9f3-442d-8c51-a42d2d49452f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSourcePresentationProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ForceEndOfPresentation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSourcePresentationProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies the source when playback has reached the end of a segment. For timelines, this corresponds to reaching a mark-out point.
     * @param {IMFPresentationDescriptor} pPresentationDescriptor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationdescriptor">IMFPresentationDescriptor</a> interface of the presentation descriptor for the segment that has ended.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmediasourcepresentationprovider-forceendofpresentation
     */
    ForceEndOfPresentation(pPresentationDescriptor) {
        result := ComCall(3, this, "ptr", pPresentationDescriptor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaSourcePresentationProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ForceEndOfPresentation := CallbackCreate(GetMethod(implObj, "ForceEndOfPresentation"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ForceEndOfPresentation)
    }
}
