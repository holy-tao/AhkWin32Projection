#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedFolderEvents extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedFolderEvents
     * @type {Guid}
     */
    static IID => Guid("{20a59fa6-a844-4630-9e98-175f70b4d55b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Error", "FolderAdded", "FolderDeleted", "FolderRenamed", "FolderMovedFrom", "FolderMovedTo", "FolderItemCountChanged", "FeedAdded", "FeedDeleted", "FeedRenamed", "FeedUrlChanged", "FeedMovedFrom", "FeedMovedTo", "FeedDownloading", "FeedDownloadCompleted", "FeedItemCountChanged"]

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
    FolderAdded(path_) {
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
     * @returns {HRESULT} 
     */
    FolderDeleted(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(9, this, "ptr", path_, "int")
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
    FolderRenamed(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(10, this, "ptr", path_, "ptr", oldPath, "int")
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
    FolderMovedFrom(path_, oldPath) {
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
     * @param {BSTR} oldPath 
     * @returns {HRESULT} 
     */
    FolderMovedTo(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(12, this, "ptr", path_, "ptr", oldPath, "int")
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
    FolderItemCountChanged(path_, itemCountType) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(13, this, "ptr", path_, "int", itemCountType, "int")
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
    FeedAdded(path_) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }

        result := ComCall(14, this, "ptr", path_, "int")
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

        result := ComCall(15, this, "ptr", path_, "int")
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

        result := ComCall(16, this, "ptr", path_, "ptr", oldPath, "int")
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

        result := ComCall(17, this, "ptr", path_, "int")
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
    FeedMovedFrom(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(18, this, "ptr", path_, "ptr", oldPath, "int")
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
    FeedMovedTo(path_, oldPath) {
        if(path_ is String) {
            pin := BSTR.Alloc(path_)
            path_ := pin.Value
        }
        if(oldPath is String) {
            pin := BSTR.Alloc(oldPath)
            oldPath := pin.Value
        }

        result := ComCall(19, this, "ptr", path_, "ptr", oldPath, "int")
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

        result := ComCall(20, this, "ptr", path_, "int")
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

        result := ComCall(21, this, "ptr", path_, "int", error, "int")
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

        result := ComCall(22, this, "ptr", path_, "int", itemCountType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
