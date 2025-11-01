#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedItem
     * @type {Guid}
     */
    static IID => Guid("{0a1e6cad-0a47-4da2-a13d-5baaa5c8bd4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "get_Title", "get_Link", "get_Guid", "get_Description", "get_PubDate", "get_Comments", "get_Author", "get_Enclosure", "get_IsRead", "put_IsRead", "get_LocalId", "get_Parent", "Delete", "get_DownloadUrl", "get_LastDownloadTime", "get_Modified"]

    /**
     * 
     * @param {Integer} includeFlags 
     * @param {Pointer<BSTR>} xml 
     * @returns {HRESULT} 
     */
    Xml(includeFlags, xml) {
        result := ComCall(7, this, "int", includeFlags, "ptr", xml, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} title 
     * @returns {HRESULT} 
     */
    get_Title(title) {
        result := ComCall(8, this, "ptr", title, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} linkUrl 
     * @returns {HRESULT} 
     */
    get_Link(linkUrl) {
        result := ComCall(9, this, "ptr", linkUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} itemGuid 
     * @returns {HRESULT} 
     */
    get_Guid(itemGuid) {
        result := ComCall(10, this, "ptr", itemGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_Description(description) {
        result := ComCall(11, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pubDate 
     * @returns {HRESULT} 
     */
    get_PubDate(pubDate) {
        pubDateMarshal := pubDate is VarRef ? "double*" : "ptr"

        result := ComCall(12, this, pubDateMarshal, pubDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} comments 
     * @returns {HRESULT} 
     */
    get_Comments(comments) {
        result := ComCall(13, this, "ptr", comments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} author 
     * @returns {HRESULT} 
     */
    get_Author(author) {
        result := ComCall(14, this, "ptr", author, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Enclosure(disp) {
        result := ComCall(15, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isRead 
     * @returns {HRESULT} 
     */
    get_IsRead(isRead) {
        result := ComCall(16, this, "ptr", isRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isRead 
     * @returns {HRESULT} 
     */
    put_IsRead(isRead) {
        result := ComCall(17, this, "short", isRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} itemId 
     * @returns {HRESULT} 
     */
    get_LocalId(itemId) {
        itemIdMarshal := itemId is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, itemIdMarshal, itemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Parent(disp) {
        result := ComCall(19, this, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} itemUrl 
     * @returns {HRESULT} 
     */
    get_DownloadUrl(itemUrl) {
        result := ComCall(21, this, "ptr", itemUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastDownload 
     * @returns {HRESULT} 
     */
    get_LastDownloadTime(lastDownload) {
        lastDownloadMarshal := lastDownload is VarRef ? "double*" : "ptr"

        result := ComCall(22, this, lastDownloadMarshal, lastDownload, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} modified 
     * @returns {HRESULT} 
     */
    get_Modified(modified) {
        modifiedMarshal := modified is VarRef ? "double*" : "ptr"

        result := ComCall(23, this, modifiedMarshal, modified, "HRESULT")
        return result
    }
}
