#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_SERVICE_LOOKUP_TYPE.ahk" { MF_SERVICE_LOOKUP_TYPE }

/**
 * Enables a custom video mixer or video presenter to get interface pointers from the Enhanced Video Renderer (EVR).
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imftopologyservicelookup
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTopologyServiceLookup extends IUnknown {
    /**
     * The interface identifier for IMFTopologyServiceLookup
     * @type {Guid}
     */
    static IID := Guid("{fa993889-4383-415a-a930-dd472a8cf6f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTopologyServiceLookup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        LookupService : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTopologyServiceLookup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an interface from the enhanced video renderer (EVR), or from the video mixer or video presenter.
     * @remarks
     * This method can be called only from inside the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers">IMFTopologyServiceLookupClient::InitServicePointers</a> method. At any other time, the method returns MF_E_NOTACCEPTING.
     * 
     * The presenter can use this method to query the EVR and the mixer. The mixer can use it to query the EVR and the presenter. Which objects are queried depends on the caller and the service GUID, as shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Caller</th>
     * <th>Service GUID</th>
     * <th>Objects queried</th>
     * </tr>
     * <tr>
     * <td>Presenter</td>
     * <td>MR_VIDEO_RENDER_SERVICE</td>
     * <td>EVR</td>
     * </tr>
     * <tr>
     * <td>Presenter</td>
     * <td>MR_VIDEO_MIXER_SERVICE</td>
     * <td>Mixer</td>
     * </tr>
     * <tr>
     * <td>Mixer</td>
     * <td>MR_VIDEO_RENDER_SERVICE</td>
     * <td>Presenter and EVR</td>
     * </tr>
     * </table>
     *  
     * 
     * The following interfaces are available from the EVR:
     * 
     * <ul>
     * <li>
     * <b>IMediaEventSink</b>. This interface is documented in the DirectShow SDK documentation.
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfclock">IMFClock</a> interface. This interface is available if the EVR has access to a clock (reference clock in DirectShow or presentation clock in Media Foundation). This interface might not be available. Presenter and mixers must be able to process data without a clock. If the <b>IMFClock</b> interface is available, you can also get these related interfaces:
     * 
     * <ul>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftimer">IMFTimer</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> (Media Foundation EVR only)
     * 
     * </li>
     * </ul>
     * </li>
     * </ul>
     * The following interfaces are available from the mixer:
     * 
     * <ul>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nn-mftransform-imftransform">IMFTransform</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideodeviceid">IMFVideoDeviceID</a>
     * 
     * 
     * </li>
     * </ul>
     * @param {MF_SERVICE_LOOKUP_TYPE} Type Specifies the scope of the search. Currently this parameter is ignored. Use the value MF_SERVICE_LOOKUP_GLOBAL.
     * @param {Integer} dwIndex Reserved, must be zero.
     * @param {Pointer<Guid>} guidService Service GUID of the requested interface.
     * @param {Pointer<Guid>} riid Interface identifier of the requested interface.
     * @param {Pointer<Integer>} pnObjects Pointer to a value that specifies the size of the <i>ppvObjects</i> array. The value must be at least 1. In the current implementation, there is no reason to specify an array size larger than one element. The value is not changed on output.
     * @returns {Pointer<Void>} Array of interface pointers. If the method succeeds, each member of the array contains either a valid interface pointer or <b>NULL</b>. The caller must release the interface pointers when the EVR calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-releaseservicepointers">IMFTopologyServiceLookupClient::ReleaseServicePointers</a> (or earlier). If the method fails, every member of the array is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imftopologyservicelookup-lookupservice
     */
    LookupService(Type, dwIndex, guidService, riid, pnObjects) {
        pnObjectsMarshal := pnObjects is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, MF_SERVICE_LOOKUP_TYPE, Type, "uint", dwIndex, Guid.Ptr, guidService, Guid.Ptr, riid, "ptr*", &ppvObjects := 0, pnObjectsMarshal, pnObjects, "HRESULT")
        return ppvObjects
    }

    Query(iid) {
        if (IMFTopologyServiceLookup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LookupService := CallbackCreate(GetMethod(implObj, "LookupService"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LookupService)
    }
}
