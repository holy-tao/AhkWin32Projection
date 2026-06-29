#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMPSyncDevice2.ahk" { IWMPSyncDevice2 }

/**
 * The IWMPSyncDevice3 interface provides methods for estimating the size required to synchronize a playlist to a device.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpsyncdevice3
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPSyncDevice3 extends IWMPSyncDevice2 {
    /**
     * The interface identifier for IWMPSyncDevice3
     * @type {Guid}
     */
    static IID := Guid("{b22c85f9-263c-4372-a0da-b518db9b4098}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPSyncDevice3 interfaces
    */
    struct Vtbl extends IWMPSyncDevice2.Vtbl {
        estimateSyncSize : IntPtr
        cancelEstimation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPSyncDevice3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The estimateSyncSize method initiates the estimation of the size required on the device to synchronize a specified playlist.
     * @remarks
     * The estimation of required size is done asynchronously. That is, this method initiates the estimation and then returns immediately. When the estimation is complete, Windows Media Player raises the <a href="https://docs.microsoft.com/windows/desktop/WMP/iwmpevents4-syncestimationcomplete">IWMPEvents4::SyncEstimationComplete</a> event.
     * 
     * The estimation cannot occur if a synchronization session is currently in progress for the device.
     * 
     * If you call this method and then call it again before the first estimation is complete, the first estimation is canceled and a new estimation is initiated.
     * @param {IWMPPlaylist} pNonRulePlaylist A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nn-wmp-iwmpplaylist">IWMPPlaylist</a> interface that represents the playlist for which the size will be estimated. This parameter can be set to <b>NULL</b>. If this argument is specified the estimation will return the size of <i>pNonRulePlaylist</i> and the current sync rules, if any.
     * @param {IWMPPlaylist} pRulesPlaylist A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nn-wmp-iwmpplaylist">IWMPPlaylist</a> interface that represents the playlist for which the size will be estimated. This parameter can be set to <b>NULL</b>. If this argument is specified then the current sync rules will be excluded from the estimation so that the estimation will return the size of <i>pNonRulePlaylist</i> and <i>pRulesPlaylist</i>.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is shutting down, or <i>pNonRulePlaylist</i> and <i>pRulesPlaylist</i>  are both <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A synchronization session is already in progress for the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice3-estimatesyncsize
     */
    estimateSyncSize(pNonRulePlaylist, pRulesPlaylist) {
        result := ComCall(20, this, "ptr", pNonRulePlaylist, "ptr", pRulesPlaylist, "HRESULT")
        return result
    }

    /**
     * The cancelEstimation method cancels an estimation that was previously initiated by estimateSyncSize.
     * @remarks
     * When you call this method, Windows Media Player raises the<a href="https://docs.microsoft.com/windows/desktop/WMP/iwmpevents4-syncestimationcomplete"> IWMPEvents4::SyncEstimationComplete</a> event with an <b>HRESULT</b> of E_ABORT.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice3-cancelestimation
     */
    cancelEstimation() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPSyncDevice3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.estimateSyncSize := CallbackCreate(GetMethod(implObj, "estimateSyncSize"), flags, 3)
        this.vtbl.cancelEstimation := CallbackCreate(GetMethod(implObj, "cancelEstimation"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.estimateSyncSize)
        CallbackFree(this.vtbl.cancelEstimation)
    }
}
