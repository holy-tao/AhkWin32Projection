#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFPMPHost.ahk" { IMFPMPHost }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables a media source to receive a pointer to the IMFPMPHost interface.
 * @remarks
 * If a media source exposes this interface, the Protected Media Path (PMP) Media Session calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpmpclient-setpmphost">SetPMPHost</a> with a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmphost">IMFPMPHost</a> interface. The media source can use the <b>IMFPMPHost</b> interface to create objects in the PMP process.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfpmpclient
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFPMPClient extends IUnknown {
    /**
     * The interface identifier for IMFPMPClient
     * @type {Guid}
     */
    static IID := Guid("{6c4e655d-ead8-4421-b6b9-54dcdbbdf820}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFPMPClient interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPMPHost : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFPMPClient.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a pointer to the IMFPMPHost interface.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmphost">IMFPMPHost</a> pointer is apartment threaded. The media source must add the pointer to the global interface table (GIT) before using it.
     * @param {IMFPMPHost} pPMPHost A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpmphost">IMFPMPHost</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfpmpclient-setpmphost
     */
    SetPMPHost(pPMPHost) {
        result := ComCall(3, this, "ptr", pPMPHost, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFPMPClient.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPMPHost := CallbackCreate(GetMethod(implObj, "SetPMPHost"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPMPHost)
    }
}
