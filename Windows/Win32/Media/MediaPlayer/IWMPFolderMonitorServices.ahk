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
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_count(plCount) {
        result := ComCall(3, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<BSTR>} pbstrFolder 
     * @returns {HRESULT} 
     */
    item(lIndex, pbstrFolder) {
        result := ComCall(4, this, "int", lIndex, "ptr", pbstrFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFolder 
     * @returns {HRESULT} 
     */
    add(bstrFolder) {
        bstrFolder := bstrFolder is String ? BSTR.Alloc(bstrFolder).Value : bstrFolder

        result := ComCall(5, this, "ptr", bstrFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {HRESULT} 
     */
    remove(lIndex) {
        result := ComCall(6, this, "int", lIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpfss 
     * @returns {HRESULT} 
     */
    get_scanState(pwmpfss) {
        result := ComCall(7, this, "int*", pwmpfss, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFolder 
     * @returns {HRESULT} 
     */
    get_currentFolder(pbstrFolder) {
        result := ComCall(8, this, "ptr", pbstrFolder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_scannedFilesCount(plCount) {
        result := ComCall(9, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_addedFilesCount(plCount) {
        result := ComCall(10, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProgress 
     * @returns {HRESULT} 
     */
    get_updateProgress(plProgress) {
        result := ComCall(11, this, "int*", plProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startScan() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    stopScan() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
