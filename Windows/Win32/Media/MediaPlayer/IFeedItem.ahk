#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedItem extends IDispatch{
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
     * 
     * @param {Integer} includeFlags 
     * @param {Pointer<BSTR>} xml 
     * @returns {HRESULT} 
     */
    Xml(includeFlags, xml) {
        result := ComCall(7, this, "int", includeFlags, "ptr", xml, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} title 
     * @returns {HRESULT} 
     */
    get_Title(title) {
        result := ComCall(8, this, "ptr", title, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} linkUrl 
     * @returns {HRESULT} 
     */
    get_Link(linkUrl) {
        result := ComCall(9, this, "ptr", linkUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} itemGuid 
     * @returns {HRESULT} 
     */
    get_Guid(itemGuid) {
        result := ComCall(10, this, "ptr", itemGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} description 
     * @returns {HRESULT} 
     */
    get_Description(description) {
        result := ComCall(11, this, "ptr", description, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pubDate 
     * @returns {HRESULT} 
     */
    get_PubDate(pubDate) {
        result := ComCall(12, this, "double*", pubDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} comments 
     * @returns {HRESULT} 
     */
    get_Comments(comments) {
        result := ComCall(13, this, "ptr", comments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} author 
     * @returns {HRESULT} 
     */
    get_Author(author) {
        result := ComCall(14, this, "ptr", author, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Enclosure(disp) {
        result := ComCall(15, this, "ptr", disp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} isRead 
     * @returns {HRESULT} 
     */
    get_IsRead(isRead) {
        result := ComCall(16, this, "ptr", isRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} isRead 
     * @returns {HRESULT} 
     */
    put_IsRead(isRead) {
        result := ComCall(17, this, "short", isRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} itemId 
     * @returns {HRESULT} 
     */
    get_LocalId(itemId) {
        result := ComCall(18, this, "int*", itemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    get_Parent(disp) {
        result := ComCall(19, this, "ptr", disp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} itemUrl 
     * @returns {HRESULT} 
     */
    get_DownloadUrl(itemUrl) {
        result := ComCall(21, this, "ptr", itemUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} lastDownload 
     * @returns {HRESULT} 
     */
    get_LastDownloadTime(lastDownload) {
        result := ComCall(22, this, "double*", lastDownload, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} modified 
     * @returns {HRESULT} 
     */
    get_Modified(modified) {
        result := ComCall(23, this, "double*", modified, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
