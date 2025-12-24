#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlaylist.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPCdromBurn interface provides methods to manage creating audio CDs.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcdromburn
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-isavailable
     */
    isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves the value of the specified attribute for the CD.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-getiteminfo
     */
    getItemInfo(bstrItem, pbstrVal) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(4, this, "ptr", bstrItem, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * The get_label method retrieves the CD volume label string.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-get_label
     */
    get_label(pbstrLabel) {
        result := ComCall(5, this, "ptr", pbstrLabel, "HRESULT")
        return result
    }

    /**
     * The put_label method specifies the label string for the CD volume.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-put_label
     */
    put_label(bstrLabel) {
        bstrLabel := bstrLabel is String ? BSTR.Alloc(bstrLabel).Value : bstrLabel

        result := ComCall(6, this, "ptr", bstrLabel, "HRESULT")
        return result
    }

    /**
     * The get_burnFormat method retrieves a value that indicates the type of CD to burn.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-get_burnformat
     */
    get_burnFormat(pwmpbf) {
        pwmpbfMarshal := pwmpbf is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpbfMarshal, pwmpbf, "HRESULT")
        return result
    }

    /**
     * The put_burnFormat method specifies the type of CD to burn.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-put_burnformat
     */
    put_burnFormat(wmpbf) {
        result := ComCall(8, this, "int", wmpbf, "HRESULT")
        return result
    }

    /**
     * The get_burnPlaylist method retrieves the current playlist to burn to the CD.
     * @returns {IWMPPlaylist} Address of a variable that receives the <b>IWMPPlaylist</b> pointer of the playlist to burn.
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-get_burnplaylist
     */
    get_burnPlaylist() {
        result := ComCall(9, this, "ptr*", &ppPlaylist := 0, "HRESULT")
        return IWMPPlaylist(ppPlaylist)
    }

    /**
     * The put_burnPlaylist method specifies the playlist to burn to CD.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-put_burnplaylist
     */
    put_burnPlaylist(pPlaylist) {
        result := ComCall(10, this, "ptr", pPlaylist, "HRESULT")
        return result
    }

    /**
     * The refreshStatus method updates the status information for the current burn playlist.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-refreshstatus
     */
    refreshStatus() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The get_burnState method retrieves an enumeration value that indicates the current burn state.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-get_burnstate
     */
    get_burnState(pwmpbs) {
        pwmpbsMarshal := pwmpbs is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pwmpbsMarshal, pwmpbs, "HRESULT")
        return result
    }

    /**
     * The get_burnProgress method retrieves the CD burning progress as percent complete.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-get_burnprogress
     */
    get_burnProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * The startBurn method burns the CD.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-startburn
     */
    startBurn() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The stopBurn method stops the CD burning process.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-stopburn
     */
    stopBurn() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The erase method erases the current CD.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcdromburn-erase
     */
    erase() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
