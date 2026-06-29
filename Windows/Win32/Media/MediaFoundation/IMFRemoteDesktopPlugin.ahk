#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFTopology.ahk" { IMFTopology }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Modifies a topology for use in a Terminal Services environment. (IMFRemoteDesktopPlugin)
 * @remarks
 * To use this interface, do the following:
 * 
 * <ol>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> with the <b>SM_REMOTESESSION</b> flag. The function returns <b>TRUE</b> if the calling process is associated with a Terminal Services client session.
 *           </li>
 * <li>If <b>GetSystemMetrics</b> returns <b>TRUE</b>, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreateremotedesktopplugin">MFCreateRemoteDesktopPlugin</a>. This function returns a pointer to the <b>IMFRemoteDesktopPlugin</b> interface.
 *           </li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology">UpdateTopology</a> with a pointer to the topology.
 *           </li>
 * </ol>
 * The application must call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology">UpdateTopology</a> before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-settopology">IMFMediaSession::SetTopology</a> on the Media Session.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfremotedesktopplugin
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFRemoteDesktopPlugin extends IUnknown {
    /**
     * The interface identifier for IMFRemoteDesktopPlugin
     * @type {Guid}
     */
    static IID := Guid("{1cde6309-cae0-4940-907e-c1ec9c3d1d4a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFRemoteDesktopPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        UpdateTopology : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFRemoteDesktopPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Modifies a topology for use in a Terminal Services environment. (IMFRemoteDesktopPlugin.UpdateTopology)
     * @remarks
     * If the application is running in a Terminal Services client session, call this method before calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasession-settopology">IMFMediaSession::SetTopology</a> on the Media Session.
     * @param {IMFTopology} pTopology Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imftopology">IMFTopology</a> interface of the topology.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfremotedesktopplugin-updatetopology
     */
    UpdateTopology(pTopology) {
        result := ComCall(3, this, "ptr", pTopology, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFRemoteDesktopPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.UpdateTopology := CallbackCreate(GetMethod(implObj, "UpdateTopology"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.UpdateTopology)
    }
}
