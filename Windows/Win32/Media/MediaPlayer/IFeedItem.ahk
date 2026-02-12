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
     * @type {BSTR} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {BSTR} 
     */
    Link {
        get => this.get_Link()
    }

    /**
     * @type {BSTR} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Float} 
     */
    PubDate {
        get => this.get_PubDate()
    }

    /**
     * @type {BSTR} 
     */
    Comments {
        get => this.get_Comments()
    }

    /**
     * @type {BSTR} 
     */
    Author {
        get => this.get_Author()
    }

    /**
     * @type {IDispatch} 
     */
    Enclosure {
        get => this.get_Enclosure()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsRead {
        get => this.get_IsRead()
        set => this.put_IsRead(value)
    }

    /**
     * @type {Integer} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * @type {Float} 
     */
    LastDownloadTime {
        get => this.get_LastDownloadTime()
    }

    /**
     * @type {Float} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * Resource string ids set by caller to be returned in xml data for visualizing objects.
     * @param {Integer} includeFlags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dtools/xml-resource-ids
     */
    Xml(includeFlags) {
        xml := BSTR()
        result := ComCall(7, this, "int", includeFlags, "ptr", xml, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR()
        result := ComCall(8, this, "ptr", title, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        linkUrl := BSTR()
        result := ComCall(9, this, "ptr", linkUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return linkUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Guid() {
        itemGuid := BSTR()
        result := ComCall(10, this, "ptr", itemGuid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return itemGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR()
        result := ComCall(11, this, "ptr", description, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return description
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PubDate() {
        result := ComCall(12, this, "double*", &pubDate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pubDate
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Comments() {
        comments := BSTR()
        result := ComCall(13, this, "ptr", comments, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return comments
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Author() {
        author := BSTR()
        result := ComCall(14, this, "ptr", author, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return author
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Enclosure() {
        result := ComCall(15, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsRead() {
        result := ComCall(16, this, "short*", &isRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isRead
    }

    /**
     * 
     * @param {VARIANT_BOOL} isRead 
     * @returns {HRESULT} 
     */
    put_IsRead(isRead) {
        result := ComCall(17, this, "short", isRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocalId() {
        result := ComCall(18, this, "int*", &itemId := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return itemId
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(19, this, "ptr*", &disp := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(disp)
    }

    /**
     * Delete Method (ADOX Collections)
     * @remarks
     * An error will occur if the *Name* does not exist in the collection.  
     *   
     *  For [Tables](./tables-collection-adox.md) and [Users](./users-collection-adox.md) collections, an error will occur if the provider does not support deleting tables or users, respectively. For [Procedures](./procedures-collection-adox.md) and [Views](./views-collection-adox.md) collections, **Delete** will fail if the provider does not support persisting commands.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/adox-api/delete-method-adox-collections
     */
    Delete() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        itemUrl := BSTR()
        result := ComCall(21, this, "ptr", itemUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return itemUrl
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastDownloadTime() {
        result := ComCall(22, this, "double*", &lastDownload := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return lastDownload
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Modified() {
        result := ComCall(23, this, "double*", &modified := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return modified
    }
}
