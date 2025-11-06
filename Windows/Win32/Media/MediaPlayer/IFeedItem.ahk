#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     */
    Xml(includeFlags) {
        xml := BSTR()
        result := ComCall(7, this, "int", includeFlags, "ptr", xml, "HRESULT")
        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR()
        result := ComCall(8, this, "ptr", title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        linkUrl := BSTR()
        result := ComCall(9, this, "ptr", linkUrl, "HRESULT")
        return linkUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Guid() {
        itemGuid := BSTR()
        result := ComCall(10, this, "ptr", itemGuid, "HRESULT")
        return itemGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR()
        result := ComCall(11, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PubDate() {
        result := ComCall(12, this, "double*", &pubDate := 0, "HRESULT")
        return pubDate
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Comments() {
        comments := BSTR()
        result := ComCall(13, this, "ptr", comments, "HRESULT")
        return comments
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Author() {
        author := BSTR()
        result := ComCall(14, this, "ptr", author, "HRESULT")
        return author
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Enclosure() {
        result := ComCall(15, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRead() {
        result := ComCall(16, this, "short*", &isRead := 0, "HRESULT")
        return isRead
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
     * @returns {Integer} 
     */
    get_LocalId() {
        result := ComCall(18, this, "int*", &itemId := 0, "HRESULT")
        return itemId
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(19, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
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
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        itemUrl := BSTR()
        result := ComCall(21, this, "ptr", itemUrl, "HRESULT")
        return itemUrl
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastDownloadTime() {
        result := ComCall(22, this, "double*", &lastDownload := 0, "HRESULT")
        return lastDownload
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Modified() {
        result := ComCall(23, this, "double*", &modified := 0, "HRESULT")
        return modified
    }
}
