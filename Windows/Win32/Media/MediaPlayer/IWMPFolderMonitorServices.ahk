#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WMPFolderScanState.ahk" { WMPFolderScanState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPFolderMonitorServices interface is deprecated.The IWMPFolderMonitorServices interface provides methods to enumerate, scan, and modify file folders that Windows Media Player monitors for digital media content.To use this interface, you must create a remoted instance of the Windows Media Player 11 control. For more information about remoting, see Remoting the Windows Media Player Control.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpfoldermonitorservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPFolderMonitorServices extends IUnknown {
    /**
     * The interface identifier for IWMPFolderMonitorServices
     * @type {Guid}
     */
    static IID := Guid("{788c8743-e57f-439d-a468-5bc77f2e59c6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPFolderMonitorServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_count             : IntPtr
        item                  : IntPtr
        add                   : IntPtr
        remove                : IntPtr
        get_scanState         : IntPtr
        get_currentFolder     : IntPtr
        get_scannedFilesCount : IntPtr
        get_addedFilesCount   : IntPtr
        get_updateProgress    : IntPtr
        startScan             : IntPtr
        stopScan              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPFolderMonitorServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    count {
        get => this.get_count()
    }

    /**
     */
    scanState {
        get => this.get_scanState()
    }

    /**
     */
    currentFolder {
        get => this.get_currentFolder()
    }

    /**
     */
    scannedFilesCount {
        get => this.get_scannedFilesCount()
    }

    /**
     */
    addedFilesCount {
        get => this.get_addedFilesCount()
    }

    /**
     */
    updateProgress {
        get => this.get_updateProgress()
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_count method retrieves the count of monitored folders.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the count.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The item method retrieves the path to the folder corresponding to the specified index.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lIndex A <b>long</b> specifying the index of the folder to retrieve.
     * @param {Pointer<BSTR>} pbstrFolder Pointer to a <b>BSTR</b> that receives the folder path string.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-item
     */
    item(lIndex, pbstrFolder) {
        result := ComCall(4, this, "int", lIndex, BSTR.Ptr, pbstrFolder, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The add method adds a folder to the list of monitored folders.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {BSTR} bstrFolder <b>BSTR</b> containing the path to the folder.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-add
     */
    add(bstrFolder) {
        bstrFolder := bstrFolder is String ? BSTR.Alloc(bstrFolder).Value : bstrFolder

        result := ComCall(5, this, BSTR, bstrFolder, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The remove method removes a folder from the list of monitored folders.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lIndex A <b>long</b> specifying the index of the folder to remove from the list.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-remove
     */
    remove(lIndex) {
        result := ComCall(6, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_scanState method retrieves the scan state for the current scanning operation.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. During the first phase, Windows Media Player determines which digital media files to add to the library. During the second phase, the Player adds the files. You can handle the <b>FolderScanStateChange</b> event to receive notifications when the scan state changes.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<WMPFolderScanState>} pwmpfss Pointer to a variable that receives a value from the <b>WMPFolderScanState</b> enumeration that indicates the scan state.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_scanstate
     */
    get_scanState(pwmpfss) {
        pwmpfssMarshal := pwmpfss is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpfssMarshal, pwmpfss, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_currentFolder method retrieves the path of the folder currently being scanned.
     * @remarks
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<BSTR>} pbstrFolder Pointer to a <b>BSTR</b> that receives the folder path string.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_currentfolder
     */
    get_currentFolder(pbstrFolder) {
        result := ComCall(8, this, BSTR.Ptr, pbstrFolder, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_scannedFilesCount method retrieves the count of files inspected during the current scanning operation.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. The count of files inspected changes during the scanning phase. You can determine the current scan state by calling <b>get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the count.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_scannedfilescount
     */
    get_scannedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_addedFilesCount method retrieves the count of files added to the library during the current scanning operation.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. The count of files added changes during the updating phase. You can determine the current scan state by calling <b>get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method is not supported.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> that receives the file count.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_addedfilescount
     */
    get_addedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_updateProgress method retrieves the update progress as percent complete.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. This method indicates progress of the second phase. You can determine the current scan state by calling <b>get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} plProgress Pointer to a <b>long</b> that indicates the progress as percent complete. Values range from 0 to 100.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_updateprogress
     */
    get_updateProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The startScan method starts a scanning operation.
     * @remarks
     * The <b>startScan</b> method should always be paired with a call to the <b>stopScan</b> method. You should never call the <b>startScan</b> method twice in a row. A scanning operation consists of two phases: scanning and updating. You can determine the current scan state by calling <b>get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-startscan
     */
    startScan() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The stopScan method stops the scanning operation.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. You can determine the current scan state by calling <b>get_scanState</b> or by handling the <b>FolderScanStateChange</b> event.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-stopscan
     */
    stopScan() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPFolderMonitorServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_count := CallbackCreate(GetMethod(implObj, "get_count"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 3)
        this.vtbl.add := CallbackCreate(GetMethod(implObj, "add"), flags, 2)
        this.vtbl.remove := CallbackCreate(GetMethod(implObj, "remove"), flags, 2)
        this.vtbl.get_scanState := CallbackCreate(GetMethod(implObj, "get_scanState"), flags, 2)
        this.vtbl.get_currentFolder := CallbackCreate(GetMethod(implObj, "get_currentFolder"), flags, 2)
        this.vtbl.get_scannedFilesCount := CallbackCreate(GetMethod(implObj, "get_scannedFilesCount"), flags, 2)
        this.vtbl.get_addedFilesCount := CallbackCreate(GetMethod(implObj, "get_addedFilesCount"), flags, 2)
        this.vtbl.get_updateProgress := CallbackCreate(GetMethod(implObj, "get_updateProgress"), flags, 2)
        this.vtbl.startScan := CallbackCreate(GetMethod(implObj, "startScan"), flags, 1)
        this.vtbl.stopScan := CallbackCreate(GetMethod(implObj, "stopScan"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_count)
        CallbackFree(this.vtbl.item)
        CallbackFree(this.vtbl.add)
        CallbackFree(this.vtbl.remove)
        CallbackFree(this.vtbl.get_scanState)
        CallbackFree(this.vtbl.get_currentFolder)
        CallbackFree(this.vtbl.get_scannedFilesCount)
        CallbackFree(this.vtbl.get_addedFilesCount)
        CallbackFree(this.vtbl.get_updateProgress)
        CallbackFree(this.vtbl.startScan)
        CallbackFree(this.vtbl.stopScan)
    }
}
