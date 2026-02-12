#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedEvents
     * @type {Guid}
     */
    static IID => Guid("{abf35c99-0681-47ea-9a8c-1436a375a99e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Error", "FeedDeleted", "FeedRenamed", "FeedUrlChanged", "FeedMoved", "FeedDownloading", "FeedDownloadCompleted", "FeedItemCountChanged"]

    /**
     * The Error event occurs when the Windows Media Player control has an error condition.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/axwmplib-axwindowsmediaplayer-error
     */
    Error() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @returns {HRESULT} 
     */
    FeedDeleted(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(8, this, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedRenamed(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(9, this, "ptr", path_, "ptr", oldPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(10, this, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FeedMoved(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(11, this, "ptr", path_, "ptr", oldPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @returns {HRESULT} 
     */
    FeedDownloading(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(12, this, "ptr", path_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(path_, error) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(13, this, "ptr", path_, "int", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} path_ 
     * @param {Integer} itemCountType 
     * @returns {HRESULT} 
     */
    FeedItemCountChanged(path_, itemCountType) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(14, this, "ptr", path_, "int", itemCountType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
