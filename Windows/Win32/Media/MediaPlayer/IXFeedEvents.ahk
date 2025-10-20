#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedEvents
     * @type {Guid}
     */
    static IID => Guid("{1630852e-1263-465b-98e5-fe60ffec4ac2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Error", "FeedDeleted", "FeedRenamed", "FeedUrlChanged", "FeedMoved", "FeedDownloading", "FeedDownloadCompleted", "FeedItemCountChanged"]

    /**
     * Indicates a significant problem.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//timeprov/nc-timeprov-logtimeproveventfunc
     */
    Error() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedDeleted(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(4, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedRenamed(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(5, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedUrlChanged(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(6, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {PWSTR} pszOldPath 
     * @returns {HRESULT} 
     */
    FeedMoved(pszPath, pszOldPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath
        pszOldPath := pszOldPath is String ? StrPtr(pszOldPath) : pszOldPath

        result := ComCall(7, this, "ptr", pszPath, "ptr", pszOldPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    FeedDownloading(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(8, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} fde 
     * @returns {HRESULT} 
     */
    FeedDownloadCompleted(pszPath, fde) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(9, this, "ptr", pszPath, "int", fde, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @param {Integer} feicfFlags 
     * @returns {HRESULT} 
     */
    FeedItemCountChanged(pszPath, feicfFlags) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int", feicfFlags, "HRESULT")
        return result
    }
}
