#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FEEDS_XML_INCLUDE_FLAGS.ahk" { FEEDS_XML_INCLUDE_FLAGS }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedItem extends IDispatch {
    /**
     * The interface identifier for IFeedItem
     * @type {Guid}
     */
    static IID := Guid("{0a1e6cad-0a47-4da2-a13d-5baaa5c8bd4f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedItem interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Xml                  : IntPtr
        get_Title            : IntPtr
        get_Link             : IntPtr
        get_Guid             : IntPtr
        get_Description      : IntPtr
        get_PubDate          : IntPtr
        get_Comments         : IntPtr
        get_Author           : IntPtr
        get_Enclosure        : IntPtr
        get_IsRead           : IntPtr
        put_IsRead           : IntPtr
        get_LocalId          : IntPtr
        get_Parent           : IntPtr
        Delete               : IntPtr
        get_DownloadUrl      : IntPtr
        get_LastDownloadTime : IntPtr
        get_Modified         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * 
     * @param {FEEDS_XML_INCLUDE_FLAGS} includeFlags 
     * @returns {BSTR} 
     */
    Xml(includeFlags) {
        xml := BSTR.Owned()
        result := ComCall(7, this, FEEDS_XML_INCLUDE_FLAGS, includeFlags, BSTR.Ptr, xml, "HRESULT")
        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        linkUrl := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, linkUrl, "HRESULT")
        return linkUrl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Guid() {
        itemGuid := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, itemGuid, "HRESULT")
        return itemGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, description, "HRESULT")
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
        comments := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, comments, "HRESULT")
        return comments
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Author() {
        author := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, author, "HRESULT")
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
        result := ComCall(16, this, VARIANT_BOOL.Ptr, &isRead := 0, "HRESULT")
        return isRead
    }

    /**
     * 
     * @param {VARIANT_BOOL} isRead 
     * @returns {HRESULT} 
     */
    put_IsRead(isRead) {
        result := ComCall(17, this, VARIANT_BOOL, isRead, "HRESULT")
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
        itemUrl := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, itemUrl, "HRESULT")
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

    Query(iid) {
        if (IFeedItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Xml := CallbackCreate(GetMethod(implObj, "Xml"), flags, 3)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Link := CallbackCreate(GetMethod(implObj, "get_Link"), flags, 2)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_PubDate := CallbackCreate(GetMethod(implObj, "get_PubDate"), flags, 2)
        this.vtbl.get_Comments := CallbackCreate(GetMethod(implObj, "get_Comments"), flags, 2)
        this.vtbl.get_Author := CallbackCreate(GetMethod(implObj, "get_Author"), flags, 2)
        this.vtbl.get_Enclosure := CallbackCreate(GetMethod(implObj, "get_Enclosure"), flags, 2)
        this.vtbl.get_IsRead := CallbackCreate(GetMethod(implObj, "get_IsRead"), flags, 2)
        this.vtbl.put_IsRead := CallbackCreate(GetMethod(implObj, "put_IsRead"), flags, 2)
        this.vtbl.get_LocalId := CallbackCreate(GetMethod(implObj, "get_LocalId"), flags, 2)
        this.vtbl.get_Parent := CallbackCreate(GetMethod(implObj, "get_Parent"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.get_DownloadUrl := CallbackCreate(GetMethod(implObj, "get_DownloadUrl"), flags, 2)
        this.vtbl.get_LastDownloadTime := CallbackCreate(GetMethod(implObj, "get_LastDownloadTime"), flags, 2)
        this.vtbl.get_Modified := CallbackCreate(GetMethod(implObj, "get_Modified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Xml)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Link)
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_PubDate)
        CallbackFree(this.vtbl.get_Comments)
        CallbackFree(this.vtbl.get_Author)
        CallbackFree(this.vtbl.get_Enclosure)
        CallbackFree(this.vtbl.get_IsRead)
        CallbackFree(this.vtbl.put_IsRead)
        CallbackFree(this.vtbl.get_LocalId)
        CallbackFree(this.vtbl.get_Parent)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.get_DownloadUrl)
        CallbackFree(this.vtbl.get_LastDownloadTime)
        CallbackFree(this.vtbl.get_Modified)
    }
}
