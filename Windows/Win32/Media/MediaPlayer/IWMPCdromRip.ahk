#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WMPRipState.ahk" { WMPRipState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPCdromRip interface provides methods to manage copying, or ripping, tracks from an audio CD.Ripping a CD by using the IWMPCdromRip interface has the same effect as ripping music by using the Windows Media Player user interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcdromrip
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCdromRip extends IUnknown {
    /**
     * The interface identifier for IWMPCdromRip
     * @type {Guid}
     */
    static IID := Guid("{56e2294f-69ed-4629-a869-aea72c0dcc2c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCdromRip interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_ripState    : IntPtr
        get_ripProgress : IntPtr
        startRip        : IntPtr
        stopRip         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCdromRip.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    ripState {
        get => this.get_ripState()
    }

    /**
     */
    ripProgress {
        get => this.get_ripProgress()
    }

    /**
     * The get_ripState method retrieves an enumeration value that indicates the current state of the ripping process.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<WMPRipState>} pwmprs Pointer to a variable that receives a value from the <b>WMPRipState</b> enumeration that indicates the current state.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-get_ripstate
     */
    get_ripState(pwmprs) {
        pwmprsMarshal := pwmprs is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pwmprsMarshal, pwmprs, "HRESULT")
        return result
    }

    /**
     * The get_ripProgress method retrieves the CD ripping progress as percent complete.
     * @remarks
     * The progress value represents the completed percentage of the entire ripping process. To determine the progress of a specific track, use <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpmedia-getiteminfo">IWMPMedia::getItemInfo</a> with <b>RipProgress</b> as the attribute name. To determine the index of the track currently being ripped, call <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpplaylist-getiteminfo">IWMPPlaylist::getItemInfo</a> with <b>CurrentRipTrackIndex</b> as the attribute name.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} plProgress Pointer to a <b>long</b> that receives the progress value. Progress values range from 0 to 100.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-get_ripprogress
     */
    get_ripProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * The startRip method rips the CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * 
     * Ripping a CD by using the <b>IWMPCdromRip</b> interface has the same effect as ripping music by using the Windows Media Player user interface. Ripped content is automatically added to the library according to the user's preferences. For more information about user preferences for CD ripping, see "Ripping music from CDs" in Windows Media Player Help.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-startrip
     */
    startRip() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The stopRip method stops the CD ripping process.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromrip-stoprip
     */
    stopRip() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPCdromRip.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ripState := CallbackCreate(GetMethod(implObj, "get_ripState"), flags, 2)
        this.vtbl.get_ripProgress := CallbackCreate(GetMethod(implObj, "get_ripProgress"), flags, 2)
        this.vtbl.startRip := CallbackCreate(GetMethod(implObj, "startRip"), flags, 1)
        this.vtbl.stopRip := CallbackCreate(GetMethod(implObj, "stopRip"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ripState)
        CallbackFree(this.vtbl.get_ripProgress)
        CallbackFree(this.vtbl.startRip)
        CallbackFree(this.vtbl.stopRip)
    }
}
