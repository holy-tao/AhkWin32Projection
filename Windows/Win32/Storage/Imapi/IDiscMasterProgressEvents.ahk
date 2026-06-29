#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDiscMasterProgressEvents interface provides a single interface for all callbacks that can be made from IMAPI to an application.
 * @see https://learn.microsoft.com/windows/win32/api/imapi/nn-imapi-idiscmasterprogressevents
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscMasterProgressEvents extends IUnknown {
    /**
     * The interface identifier for IDiscMasterProgressEvents
     * @type {Guid}
     */
    static IID := Guid("{ec9e51c1-4e5d-11d3-9144-00104ba11c5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscMasterProgressEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryCancel         : IntPtr
        NotifyPnPActivity   : IntPtr
        NotifyAddProgress   : IntPtr
        NotifyBlockProgress : IntPtr
        NotifyTrackProgress : IntPtr
        NotifyPreparingBurn : IntPtr
        NotifyClosingDisc   : IntPtr
        NotifyBurnComplete  : IntPtr
        NotifyEraseComplete : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscMasterProgressEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Checks whether an AddData, AddAudioTrackBlocks, or RecordDisc operation should be canceled.
     * @returns {Integer} If this parameter is <b>TRUE</b>, cancel the burn. If this parameter is <b>FALSE</b>, continue the burn.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-querycancel
     */
    QueryCancel() {
        result := ComCall(3, this, "char*", &pbCancel := 0, "HRESULT")
        return pbCancel
    }

    /**
     * Notifies the application that there is a change to the list of valid disc recorders. (For example, a USB CD-R driver is removed from the system.).
     * @remarks
     * An application should respond by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-enumdiscrecorders">IDiscMaster::EnumDiscRecorders</a> to update its list of valid recorders. If the current active recorder has been invalidated, then a new recorder should be chosen.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifypnpactivity
     */
    NotifyPnPActivity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Notifies an application of its progress in response to calls to IRedbookDiscMaster::AddAudioTrackBlocks or IJolietDiscMaster::AddData. Notifications are sent for the first and last steps, and at points in between.
     * @param {Integer} nCompletedSteps Number of arbitrary steps that have been completed in adding audio or data to a staged image.
     * @param {Integer} nTotalSteps Total number of arbitrary steps that must be taken to add a full set of audio or data to the staged image.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyaddprogress
     */
    NotifyAddProgress(nCompletedSteps, nTotalSteps) {
        result := ComCall(5, this, "int", nCompletedSteps, "int", nTotalSteps, "HRESULT")
        return result
    }

    /**
     * Notifies an application of its progress in burning a disc on the active recorder. Notifications are sent for the first and last blocks, and at points in between.
     * @param {Integer} nCompleted Number of blocks that have been burned onto a disc or track so far.
     * @param {Integer} nTotal Total number of blocks to be burned to finish a disc or track.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyblockprogress
     */
    NotifyBlockProgress(nCompleted, nTotal) {
        result := ComCall(6, this, "int", nCompleted, "int", nTotal, "HRESULT")
        return result
    }

    /**
     * Notifies an application that a track has started or finished during the burn of an audio disc.
     * @remarks
     * The notification for zero out of <i>nTotalTracks</i> indicates the start of track 1. The notification for track N out of <i>nTotalTracks</i> indicates that track N is complete and track N+1 is beginning. Finally, the notification for <i>nTotalTracks</i> out of <i>nTotalTracks</i> indicates the last track has been written.
     * @param {Integer} nCurrentTrack Number of tracks that have been completely burned.
     * @param {Integer} nTotalTracks Total number of tracks that must be burned.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifytrackprogress
     */
    NotifyTrackProgress(nCurrentTrack, nTotalTracks) {
        result := ComCall(7, this, "int", nCurrentTrack, "int", nTotalTracks, "HRESULT")
        return result
    }

    /**
     * Notifies the application that it is preparing to burn a disc. No further notifications are sent until the burn starts.
     * @param {Integer} nEstimatedSeconds Number of seconds from notification that IMAPI estimates it will take to prepare to burn the disc.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifypreparingburn
     */
    NotifyPreparingBurn(nEstimatedSeconds) {
        result := ComCall(8, this, "int", nEstimatedSeconds, "HRESULT")
        return result
    }

    /**
     * Notifies the application that it is has started closing the disc. No further notifications are sent until the burn is finished.
     * @param {Integer} nEstimatedSeconds Number of seconds from notification that IMAPI estimates it will take to close the disc.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyclosingdisc
     */
    NotifyClosingDisc(nEstimatedSeconds) {
        result := ComCall(9, this, "int", nEstimatedSeconds, "HRESULT")
        return result
    }

    /**
     * Notifies an application that a call to IDiscMaster::RecordDisc has finished.
     * @param {HRESULT} _status Status code to be returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-recorddisc">IDiscMaster::RecordDisc</a>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyburncomplete
     */
    NotifyBurnComplete(_status) {
        result := ComCall(10, this, "int", _status, "HRESULT")
        return result
    }

    /**
     * Notifies an application that a call to IDiscRecorder::Erase has finished.
     * @param {HRESULT} _status Status code to be returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscrecorder-erase">IDiscRecorder::Erase</a>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscmasterprogressevents-notifyerasecomplete
     */
    NotifyEraseComplete(_status) {
        result := ComCall(11, this, "int", _status, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDiscMasterProgressEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryCancel := CallbackCreate(GetMethod(implObj, "QueryCancel"), flags, 2)
        this.vtbl.NotifyPnPActivity := CallbackCreate(GetMethod(implObj, "NotifyPnPActivity"), flags, 1)
        this.vtbl.NotifyAddProgress := CallbackCreate(GetMethod(implObj, "NotifyAddProgress"), flags, 3)
        this.vtbl.NotifyBlockProgress := CallbackCreate(GetMethod(implObj, "NotifyBlockProgress"), flags, 3)
        this.vtbl.NotifyTrackProgress := CallbackCreate(GetMethod(implObj, "NotifyTrackProgress"), flags, 3)
        this.vtbl.NotifyPreparingBurn := CallbackCreate(GetMethod(implObj, "NotifyPreparingBurn"), flags, 2)
        this.vtbl.NotifyClosingDisc := CallbackCreate(GetMethod(implObj, "NotifyClosingDisc"), flags, 2)
        this.vtbl.NotifyBurnComplete := CallbackCreate(GetMethod(implObj, "NotifyBurnComplete"), flags, 2)
        this.vtbl.NotifyEraseComplete := CallbackCreate(GetMethod(implObj, "NotifyEraseComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryCancel)
        CallbackFree(this.vtbl.NotifyPnPActivity)
        CallbackFree(this.vtbl.NotifyAddProgress)
        CallbackFree(this.vtbl.NotifyBlockProgress)
        CallbackFree(this.vtbl.NotifyTrackProgress)
        CallbackFree(this.vtbl.NotifyPreparingBurn)
        CallbackFree(this.vtbl.NotifyClosingDisc)
        CallbackFree(this.vtbl.NotifyBurnComplete)
        CallbackFree(this.vtbl.NotifyEraseComplete)
    }
}
