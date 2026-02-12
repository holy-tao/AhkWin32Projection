#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPFolderMonitorServices interface is deprecated.The IWMPFolderMonitorServices interface provides methods to enumerate, scan, and modify file folders that Windows Media Player monitors for digital media content.To use this interface, you must create a remoted instance of the Windows Media Player 11 control. For more information about remoting, see Remoting the Windows Media Player Control.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpfoldermonitorservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPFolderMonitorServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPFolderMonitorServices
     * @type {Guid}
     */
    static IID => Guid("{788c8743-e57f-439d-a468-5bc77f2e59c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_count", "item", "add", "remove", "get_scanState", "get_currentFolder", "get_scannedFilesCount", "get_addedFilesCount", "get_updateProgress", "startScan", "stopScan"]

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-item
     */
    item(lIndex, pbstrFolder) {
        result := ComCall(4, this, "int", lIndex, "ptr", pbstrFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-add
     */
    add(bstrFolder) {
        if(bstrFolder is String) {
            pin := BSTR.Alloc(bstrFolder)
            bstrFolder := pin.Value
        }

        result := ComCall(5, this, "ptr", bstrFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-remove
     */
    remove(lIndex) {
        result := ComCall(6, this, "int", lIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method and all other methods of the IWMPFolderMonitorServices interface are deprecated.The get_scanState method retrieves the scan state for the current scanning operation.
     * @remarks
     * A scanning operation consists of two phases: scanning and updating. During the first phase, Windows Media Player determines which digital media files to add to the library. During the second phase, the Player adds the files. You can handle the <b>FolderScanStateChange</b> event to receive notifications when the scan state changes.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Pointer<Integer>} pwmpfss Pointer to a variable that receives a value from the <b>WMPFolderScanState</b> enumeration that indicates the scan state.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_scanstate
     */
    get_scanState(pwmpfss) {
        pwmpfssMarshal := pwmpfss is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpfssMarshal, pwmpfss, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_currentfolder
     */
    get_currentFolder(pbstrFolder) {
        result := ComCall(8, this, "ptr", pbstrFolder, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_scannedfilescount
     */
    get_scannedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_addedfilescount
     */
    get_addedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-get_updateprogress
     */
    get_updateProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plProgressMarshal, plProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-startscan
     */
    startScan() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpfoldermonitorservices-stopscan
     */
    stopScan() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
