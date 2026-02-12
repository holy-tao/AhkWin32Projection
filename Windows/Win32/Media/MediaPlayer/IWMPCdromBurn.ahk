#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPCdromBurn interface provides methods to manage creating audio CDs.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpcdromburn
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCdromBurn extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPCdromBurn
     * @type {Guid}
     */
    static IID => Guid("{bd94dbeb-417f-4928-aa06-087d56ed9b59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["isAvailable", "getItemInfo", "get_label", "put_label", "get_burnFormat", "put_burnFormat", "get_burnPlaylist", "put_burnPlaylist", "refreshStatus", "get_burnState", "get_burnProgress", "startBurn", "stopBurn", "erase"]

    /**
     */
    label {
        get => this.get_label()
        set => this.put_label(value)
    }

    /**
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-isavailable
     */
    isAvailable(bstrItem, pIsAvailable) {
        if(bstrItem is String) {
            pin := BSTR.Alloc(bstrItem)
            bstrItem := pin.Value
        }

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-getiteminfo
     */
    getItemInfo(bstrItem, pbstrVal) {
        if(bstrItem is String) {
            pin := BSTR.Alloc(bstrItem)
            bstrItem := pin.Value
        }

        result := ComCall(4, this, "ptr", bstrItem, "ptr", pbstrVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-get_label
     */
    get_label(pbstrLabel) {
        result := ComCall(5, this, "ptr", pbstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-put_label
     */
    put_label(bstrLabel) {
        if(bstrLabel is String) {
            pin := BSTR.Alloc(bstrLabel)
            bstrLabel := pin.Value
        }

        result := ComCall(6, this, "ptr", bstrLabel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_burnFormat method retrieves a value that indicates the type of CD to burn.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} pwmpbf Pointer to a variable that receives a value from the <b>WMPBurnFormat</b> enumeration that indicates the type of CD to burn.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-get_burnformat
     */
    get_burnFormat(pwmpbf) {
        pwmpbfMarshal := pwmpbf is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpbfMarshal, pwmpbf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_burnFormat method specifies the type of CD to burn.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} wmpbf A value from the <b>WMPBurnFormat</b> enumeration that specifies the type of CD to burn.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-put_burnformat
     */
    put_burnFormat(wmpbf) {
        result := ComCall(8, this, "int", wmpbf, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_burnPlaylist method retrieves the current playlist to burn to the CD.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @returns {IWMPPlaylist} Address of a variable that receives the <b>IWMPPlaylist</b> pointer of the playlist to burn.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-get_burnplaylist
     */
    get_burnPlaylist() {
        result := ComCall(9, this, "ptr*", &ppPlaylist := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-put_burnplaylist
     */
    put_burnPlaylist(pPlaylist) {
        result := ComCall(10, this, "ptr", pPlaylist, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-refreshstatus
     */
    refreshStatus() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_burnState method retrieves an enumeration value that indicates the current burn state.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} pwmpbs Pointer to a variable that receives a value from the <b>WMPBurnState</b> enumeration that indicates the current state.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-get_burnstate
     */
    get_burnState(pwmpbs) {
        pwmpbsMarshal := pwmpbs is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pwmpbsMarshal, pwmpbs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-get_burnprogress
     */
    get_burnProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plProgressMarshal, plProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-startburn
     */
    startBurn() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-stopburn
     */
    stopBurn() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcdromburn-erase
     */
    erase() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
