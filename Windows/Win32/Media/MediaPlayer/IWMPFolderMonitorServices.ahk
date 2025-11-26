#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPFolderMonitorServices interface is deprecated.The IWMPFolderMonitorServices interface provides methods to enumerate, scan, and modify file folders that Windows Media Player monitors for digital media content.To use this interface, you must create a remoted instance of the Windows Media Player 11 control. For more information about remoting, see Remoting the Windows Media Player Control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpfoldermonitorservices
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
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_count
     */
    get_count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-item
     */
    item(lIndex, pbstrFolder) {
        result := ComCall(4, this, "int", lIndex, "ptr", pbstrFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-add
     */
    add(bstrFolder) {
        bstrFolder := bstrFolder is String ? BSTR.Alloc(bstrFolder).Value : bstrFolder

        result := ComCall(5, this, "ptr", bstrFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-remove
     */
    remove(lIndex) {
        result := ComCall(6, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpfss 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_scanstate
     */
    get_scanState(pwmpfss) {
        pwmpfssMarshal := pwmpfss is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pwmpfssMarshal, pwmpfss, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFolder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_currentfolder
     */
    get_currentFolder(pbstrFolder) {
        result := ComCall(8, this, "ptr", pbstrFolder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_scannedfilescount
     */
    get_scannedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_addedfilescount
     */
    get_addedFilesCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-get_updateprogress
     */
    get_updateProgress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-startscan
     */
    startScan() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpfoldermonitorservices-stopscan
     */
    stopScan() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
