#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_MEDIA_ENGINE_OPM_STATUS.ahk" { MF_MEDIA_ENGINE_OPM_STATUS }

/**
 * Provides methods for getting information about the Output Protection Manager (OPM).
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the Media Engine.
 * 
 * The <b>MF_MEDIA_ENGINE_EVENT_OPMINFO</b> <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> event is raised when there is a change in the OPM status.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineopminfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineOPMInfo extends IUnknown {
    /**
     * The interface identifier for IMFMediaEngineOPMInfo
     * @type {Guid}
     */
    static IID := Guid("{765763e6-6c01-4b01-bb0f-b829f60ed28c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineOPMInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOPMInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineOPMInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets status information about the Output Protection Manager (OPM).
     * @param {Pointer<MF_MEDIA_ENGINE_OPM_STATUS>} pStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-media-engine-opm-status">MF_MEDIA_ENGINE_OPM_STATUS</a> enum type that indicates the OPM status.
     * @param {Pointer<BOOL>} pConstricted A pointer to a <b>BOOL</b> type that indicates the constriction status.
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If any of the parameters are <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineopminfo-getopminfo
     */
    GetOPMInfo(pStatus, pConstricted) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pConstrictedMarshal := pConstricted is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pConstrictedMarshal, pConstricted, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaEngineOPMInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOPMInfo := CallbackCreate(GetMethod(implObj, "GetOPMInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOPMInfo)
    }
}
