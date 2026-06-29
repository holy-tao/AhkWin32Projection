#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WMPBurnState.ahk" { WMPBurnState }
#Import ".\IWMPPlaylist.ahk" { IWMPPlaylist }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMPBurnFormat.ahk" { WMPBurnFormat }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPCdromBurn interface provides methods to manage creating audio CDs.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpcdromburn
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPCdromBurn extends IUnknown {
    /**
     * The interface identifier for IWMPCdromBurn
     * @type {Guid}
     */
    static IID := Guid("{bd94dbeb-417f-4928-aa06-087d56ed9b59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPCdromBurn interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        isAvailable      : IntPtr
        getItemInfo      : IntPtr
        get_label        : IntPtr
        put_label        : IntPtr
        get_burnFormat   : IntPtr
        put_burnFormat   : IntPtr
        get_burnPlaylist : IntPtr
        put_burnPlaylist : IntPtr
        refreshStatus    : IntPtr
        get_burnState    : IntPtr
        get_burnProgress : IntPtr
        startBurn        : IntPtr
        stopBurn         : IntPtr
        erase            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPCdromBurn.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    label {
        get => this.get_label()
        set => this.put_label(value)
    }

    /**
     * @type {WMPBurnFormat} 
     */
    burnFormat {
        get => this.get_burnFormat()
        set => this.put_burnFormat(value)
    }

    /**
     * @type {IWMPPlaylist} 
     */
    burnPlaylist {
        get => this.get_burnPlaylist()
        set => this.put_burnPlaylist(value)
    }

    /**
     */
    burnState {
        get => this.get_burnState()
    }

    /**
     */
    burnProgress {
        get => this.get_burnProgress()
    }

    /**
     * The isAvailable method provides information about the CD drive and media.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable Pointer to a <b>VARIANT_BOOL</b> that indicates the result.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-isavailable
     */
    isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, BSTR, bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves the value of the specified attribute for the CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrItem 
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> that receives the returned value.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-getiteminfo
     */
    getItemInfo(bstrItem, pbstrVal) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(4, this, BSTR, bstrItem, BSTR.Ptr, pbstrVal, "HRESULT")
        return result
    }

    /**
     * The get_label method retrieves the CD volume label string.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<BSTR>} pbstrLabel Pointer to a <b>BSTR</b> that contains the volume label string.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_label
     */
    get_label(pbstrLabel) {
        result := ComCall(5, this, BSTR.Ptr, pbstrLabel, "HRESULT")
        return result
    }

    /**
     * The put_label method specifies the label string for the CD volume.
     * @remarks
     * Due to the way CD labels are stored, the label of the CD may be shorter than the length of <i>bstrLabel</i>. If <i>bstrLabel</i> is longer than the maximum length of a CD label, the text will be truncated.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrLabel <b>BSTR</b> that contains the label string for the CD volume.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_label
     */
    put_label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(6, this, BSTR, bstrLabel, "HRESULT")
        return result
    }

    /**
     * The get_burnFormat method retrieves a value that indicates the type of CD to burn.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<WMPBurnFormat>} pwmpbf Pointer to a variable that receives a value from the <b>WMPBurnFormat</b> enumeration that indicates the type of CD to burn.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnformat
     */
    get_burnFormat(pwmpbf) {
        pwmpbfMarshal := pwmpbf is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpbfMarshal, pwmpbf, "HRESULT")
        return result
    }

    /**
     * The put_burnFormat method specifies the type of CD to burn.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {WMPBurnFormat} wmpbf A value from the <b>WMPBurnFormat</b> enumeration that specifies the type of CD to burn.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_burnformat
     */
    put_burnFormat(wmpbf) {
        result := ComCall(8, this, WMPBurnFormat, wmpbf, "HRESULT")
        return result
    }

    /**
     * The get_burnPlaylist method retrieves the current playlist to burn to the CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {IWMPPlaylist} Address of a variable that receives the <b>IWMPPlaylist</b> pointer of the playlist to burn.
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnplaylist
     */
    get_burnPlaylist() {
        result := ComCall(9, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The put_burnPlaylist method specifies the playlist to burn to CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {IWMPPlaylist} pPlaylist Pointer to an <b>IWMPPlaylist</b> interface for the playlist to burn.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-put_burnplaylist
     */
    put_burnPlaylist(pPlaylist) {
        result := ComCall(10, this, "ptr", pPlaylist, "HRESULT")
        return result
    }

    /**
     * The refreshStatus method updates the status information for the current burn playlist.
     * @remarks
     * You should call this method after you create or change a burn playlist before reading status information or burning the CD. You can test whether a refresh is required by calling <b>get_burnState</b> and checking for wmpbsRefreshStatusPending.
     * 
     * Refreshing the status is a synchronous operation. This means that a lengthy period of time might elapse before this method returns if the current burn playlist is large and contains many changes.
     * 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-refreshstatus
     */
    refreshStatus() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The get_burnState method retrieves an enumeration value that indicates the current burn state.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<WMPBurnState>} pwmpbs Pointer to a variable that receives a value from the <b>WMPBurnState</b> enumeration that indicates the current state.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnstate
     */
    get_burnState(pwmpbs) {
        pwmpbsMarshal := pwmpbs is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pwmpbsMarshal, pwmpbs, "HRESULT")
        return result
    }

    /**
     * The get_burnProgress method retrieves the CD burning progress as percent complete.
     * @remarks
     * The progress value represents the completed percentage of the entire burning process, including any staging operations.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-get_burnprogress
     */
    get_burnProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * The startBurn method burns the CD.
     * @remarks
     * The burn state should be wmpbsReady or wmpbsStopped before calling this method.
     * 
     * This method will not work if the CD drive is not a burner, or if the disc in the drive is not writable. Use <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcdromburn-isavailable">IWMPCdromBurn::isAvailable</a> to determine whether a CD can be burned.
     * 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-startburn
     */
    startBurn() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The stopBurn method stops the CD burning process.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-stopburn
     */
    stopBurn() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The erase method erases the current CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * 
     * This method will not work if the disc in the drive is not rewritable. Use <a href="https://docs.microsoft.com/windows/desktop/api/wmp/nf-wmp-iwmpcdromburn-isavailable">IWMPCdromBurn::isAvailable</a> to determine whether a CD can be erased.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpcdromburn-erase
     */
    erase() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPCdromBurn.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.isAvailable := CallbackCreate(GetMethod(implObj, "isAvailable"), flags, 3)
        this.vtbl.getItemInfo := CallbackCreate(GetMethod(implObj, "getItemInfo"), flags, 3)
        this.vtbl.get_label := CallbackCreate(GetMethod(implObj, "get_label"), flags, 2)
        this.vtbl.put_label := CallbackCreate(GetMethod(implObj, "put_label"), flags, 2)
        this.vtbl.get_burnFormat := CallbackCreate(GetMethod(implObj, "get_burnFormat"), flags, 2)
        this.vtbl.put_burnFormat := CallbackCreate(GetMethod(implObj, "put_burnFormat"), flags, 2)
        this.vtbl.get_burnPlaylist := CallbackCreate(GetMethod(implObj, "get_burnPlaylist"), flags, 2)
        this.vtbl.put_burnPlaylist := CallbackCreate(GetMethod(implObj, "put_burnPlaylist"), flags, 2)
        this.vtbl.refreshStatus := CallbackCreate(GetMethod(implObj, "refreshStatus"), flags, 1)
        this.vtbl.get_burnState := CallbackCreate(GetMethod(implObj, "get_burnState"), flags, 2)
        this.vtbl.get_burnProgress := CallbackCreate(GetMethod(implObj, "get_burnProgress"), flags, 2)
        this.vtbl.startBurn := CallbackCreate(GetMethod(implObj, "startBurn"), flags, 1)
        this.vtbl.stopBurn := CallbackCreate(GetMethod(implObj, "stopBurn"), flags, 1)
        this.vtbl.erase := CallbackCreate(GetMethod(implObj, "erase"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.isAvailable)
        CallbackFree(this.vtbl.getItemInfo)
        CallbackFree(this.vtbl.get_label)
        CallbackFree(this.vtbl.put_label)
        CallbackFree(this.vtbl.get_burnFormat)
        CallbackFree(this.vtbl.put_burnFormat)
        CallbackFree(this.vtbl.get_burnPlaylist)
        CallbackFree(this.vtbl.put_burnPlaylist)
        CallbackFree(this.vtbl.refreshStatus)
        CallbackFree(this.vtbl.get_burnState)
        CallbackFree(this.vtbl.get_burnProgress)
        CallbackFree(this.vtbl.startBurn)
        CallbackFree(this.vtbl.stopBurn)
        CallbackFree(this.vtbl.erase)
    }
}
