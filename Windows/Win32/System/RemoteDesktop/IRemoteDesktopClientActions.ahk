#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\SnapshotFormatType.ahk" { SnapshotFormatType }
#Import ".\SnapshotEncodingType.ahk" { SnapshotEncodingType }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RemoteActionType.ahk" { RemoteActionType }

/**
 * Provides the methods used to interact with the Remote Desktop Protocol (RDP) app container client control.
 * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nn-rdpappcontainerclient-iremotedesktopclientactions
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IRemoteDesktopClientActions extends IDispatch {
    /**
     * The interface identifier for IRemoteDesktopClientActions
     * @type {Guid}
     */
    static IID := Guid("{7d54bc4e-1028-45d4-8b0a-b9b6bffba176}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRemoteDesktopClientActions interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SuspendScreenUpdates : IntPtr
        ResumeScreenUpdates  : IntPtr
        ExecuteRemoteAction  : IntPtr
        GetSnapshot          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRemoteDesktopClientActions.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Suspends screen updates being sent to the client.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-suspendscreenupdates
     */
    SuspendScreenUpdates() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Resumes screen updates being sent to the client.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-resumescreenupdates
     */
    ResumeScreenUpdates() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Causes an action to be performed in the remote session.
     * @param {RemoteActionType} remoteAction 
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-executeremoteaction
     */
    ExecuteRemoteAction(remoteAction) {
        result := ComCall(9, this, RemoteActionType, remoteAction, "HRESULT")
        return result
    }

    /**
     * Causes a snapshot of the Remote Desktop Protocol (RDP) app container client's in-session desktop to be taken.
     * @param {SnapshotEncodingType} snapshotEncoding Specifies the encoding type for the snapshot.
     * @param {SnapshotFormatType} snapshotFormat Specifies the data format type for the snapshot
     * @param {Integer} snapshotWidth The width, in pixels, of the snapshot.
     * @param {Integer} snapshotHeight The height, in pixels, of the snapshot.
     * @returns {BSTR} On return points to the snapshot.
     * @see https://learn.microsoft.com/windows/win32/api/rdpappcontainerclient/nf-rdpappcontainerclient-iremotedesktopclientactions-getsnapshot
     */
    GetSnapshot(snapshotEncoding, snapshotFormat, snapshotWidth, snapshotHeight) {
        snapshotData := BSTR.Owned()
        result := ComCall(10, this, SnapshotEncodingType, snapshotEncoding, SnapshotFormatType, snapshotFormat, "uint", snapshotWidth, "uint", snapshotHeight, BSTR.Ptr, snapshotData, "HRESULT")
        return snapshotData
    }

    Query(iid) {
        if (IRemoteDesktopClientActions.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SuspendScreenUpdates := CallbackCreate(GetMethod(implObj, "SuspendScreenUpdates"), flags, 1)
        this.vtbl.ResumeScreenUpdates := CallbackCreate(GetMethod(implObj, "ResumeScreenUpdates"), flags, 1)
        this.vtbl.ExecuteRemoteAction := CallbackCreate(GetMethod(implObj, "ExecuteRemoteAction"), flags, 2)
        this.vtbl.GetSnapshot := CallbackCreate(GetMethod(implObj, "GetSnapshot"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SuspendScreenUpdates)
        CallbackFree(this.vtbl.ResumeScreenUpdates)
        CallbackFree(this.vtbl.ExecuteRemoteAction)
        CallbackFree(this.vtbl.GetSnapshot)
    }
}
