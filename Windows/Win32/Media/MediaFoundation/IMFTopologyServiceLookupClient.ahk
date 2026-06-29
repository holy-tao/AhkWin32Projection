#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTopologyServiceLookup.ahk" { IMFTopologyServiceLookup }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Initializes a video mixer or presenter.
 * @remarks
 * When the EVR loads the video mixer and the video presenter, the EVR queries the object for this interface and calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers">InitServicePointers</a>. Inside the <b>InitServicePointers</b> method, the object can query the EVR for interface pointers.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imftopologyservicelookupclient
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTopologyServiceLookupClient extends IUnknown {
    /**
     * The interface identifier for IMFTopologyServiceLookupClient
     * @type {Guid}
     */
    static IID := Guid("{fa99388a-4383-415a-a930-dd472a8cf6f7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTopologyServiceLookupClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitServicePointers    : IntPtr
        ReleaseServicePointers : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTopologyServiceLookupClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Signals the mixer or presenter to query the enhanced video renderer (EVR) for interface pointers.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imftopologyservicelookup">IMFTopologyServiceLookup</a> pointer is guaranteed to be valid only during the call to <b>InitServicePointers</b>. The mixer or presenter should not store a pointer to this interface after the method returns.
     * 
     * When the EVR calls <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-releaseservicepointers">IMFTopologyServiceLookupClient::ReleaseServicePointers</a>, the mixer or presenter should release any pointers it obtained from the EVR.
     * @param {IMFTopologyServiceLookup} pLookup Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imftopologyservicelookup">IMFTopologyServiceLookup</a> interface. To query the EVR for an interface, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookup-lookupservice">IMFTopologyServiceLookup::LookupService</a>.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers
     */
    InitServicePointers(pLookup) {
        result := ComCall(3, this, "ptr", pLookup, "HRESULT")
        return result
    }

    /**
     * Signals the object to release the interface pointers obtained from the enhanced video renderer (EVR).
     * @remarks
     * After this method is called, any interface pointers obtained during the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imftopologyservicelookupclient-initservicepointers">IMFTopologyServiceLookupClient::InitServicePointers</a> are no longer valid. The object must release them.
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
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imftopologyservicelookupclient-releaseservicepointers
     */
    ReleaseServicePointers() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFTopologyServiceLookupClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitServicePointers := CallbackCreate(GetMethod(implObj, "InitServicePointers"), flags, 2)
        this.vtbl.ReleaseServicePointers := CallbackCreate(GetMethod(implObj, "ReleaseServicePointers"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitServicePointers)
        CallbackFree(this.vtbl.ReleaseServicePointers)
    }
}
