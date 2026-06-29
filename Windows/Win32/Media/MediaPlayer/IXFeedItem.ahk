#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FEEDS_XML_INCLUDE_FLAGS.ahk" { FEEDS_XML_INCLUDE_FLAGS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedItem extends IUnknown {
    /**
     * The interface identifier for IXFeedItem
     * @type {Guid}
     */
    static IID := Guid("{e757b2f5-e73e-434e-a1bf-2bd7c3e60fcb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Xml              : IntPtr
        Title            : IntPtr
        Link             : IntPtr
        Guid             : IntPtr
        Description      : IntPtr
        PubDate          : IntPtr
        Comments         : IntPtr
        Author           : IntPtr
        Enclosure        : IntPtr
        IsRead           : IntPtr
        SetIsRead        : IntPtr
        LocalId          : IntPtr
        Parent           : IntPtr
        Delete           : IntPtr
        DownloadUrl      : IntPtr
        LastDownloadTime : IntPtr
        Modified         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {FEEDS_XML_INCLUDE_FLAGS} fxif 
     * @returns {IStream} 
     */
    Xml(fxif) {
        result := ComCall(3, this, FEEDS_XML_INCLUDE_FLAGS, fxif, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/title
     */
    Title() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Link() {
        result := ComCall(5, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * Defines a GUID that can be used in other templates.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/direct3d9/guid
     */
    Guid() {
        result := ComCall(6, this, PWSTR.Ptr, &ppszGuid := 0, "HRESULT")
        return ppszGuid
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-description
     */
    Description() {
        result := ComCall(7, this, PWSTR.Ptr, &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(8, this, SYSTEMTIME.Ptr, pstPubDate, "HRESULT")
        return pstPubDate
    }

    /**
     * Add comments to metafiles by following Extensible Markup Language (XML) syntax. Comments begin with \ 0034; -- \ 0034; and end with \ 0034;-- \ 0034;.
     * @remarks
     * Comments can appear anywhere except within element content (between element open and close tags, < >). They are not part of the document's character data and are ignored when the metafile is parsed.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/WMP/comments
     */
    Comments() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The Author attribute contains the name of a media artist or actor associated with the content.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/author
     */
    Author() {
        result := ComCall(10, this, PWSTR.Ptr, &ppszAuthor := 0, "HRESULT")
        return ppszAuthor
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Enclosure(riid) {
        result := ComCall(11, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsRead() {
        result := ComCall(12, this, BOOL.Ptr, &pbIsRead := 0, "HRESULT")
        return pbIsRead
    }

    /**
     * 
     * @param {BOOL} bIsRead 
     * @returns {HRESULT} 
     */
    SetIsRead(bIsRead) {
        result := ComCall(13, this, BOOL, bIsRead, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    LocalId() {
        result := ComCall(14, this, "uint*", &puiId := 0, "HRESULT")
        return puiId
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(15, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(17, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(18, this, SYSTEMTIME.Ptr, pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    Modified() {
        pstModifiedTime := SYSTEMTIME()
        result := ComCall(19, this, SYSTEMTIME.Ptr, pstModifiedTime, "HRESULT")
        return pstModifiedTime
    }

    Query(iid) {
        if (IXFeedItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Xml := CallbackCreate(GetMethod(implObj, "Xml"), flags, 3)
        this.vtbl.Title := CallbackCreate(GetMethod(implObj, "Title"), flags, 2)
        this.vtbl.Link := CallbackCreate(GetMethod(implObj, "Link"), flags, 2)
        this.vtbl.Guid := CallbackCreate(GetMethod(implObj, "Guid"), flags, 2)
        this.vtbl.Description := CallbackCreate(GetMethod(implObj, "Description"), flags, 2)
        this.vtbl.PubDate := CallbackCreate(GetMethod(implObj, "PubDate"), flags, 2)
        this.vtbl.Comments := CallbackCreate(GetMethod(implObj, "Comments"), flags, 2)
        this.vtbl.Author := CallbackCreate(GetMethod(implObj, "Author"), flags, 2)
        this.vtbl.Enclosure := CallbackCreate(GetMethod(implObj, "Enclosure"), flags, 3)
        this.vtbl.IsRead := CallbackCreate(GetMethod(implObj, "IsRead"), flags, 2)
        this.vtbl.SetIsRead := CallbackCreate(GetMethod(implObj, "SetIsRead"), flags, 2)
        this.vtbl.LocalId := CallbackCreate(GetMethod(implObj, "LocalId"), flags, 2)
        this.vtbl.Parent := CallbackCreate(GetMethod(implObj, "Parent"), flags, 3)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.DownloadUrl := CallbackCreate(GetMethod(implObj, "DownloadUrl"), flags, 2)
        this.vtbl.LastDownloadTime := CallbackCreate(GetMethod(implObj, "LastDownloadTime"), flags, 2)
        this.vtbl.Modified := CallbackCreate(GetMethod(implObj, "Modified"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Xml)
        CallbackFree(this.vtbl.Title)
        CallbackFree(this.vtbl.Link)
        CallbackFree(this.vtbl.Guid)
        CallbackFree(this.vtbl.Description)
        CallbackFree(this.vtbl.PubDate)
        CallbackFree(this.vtbl.Comments)
        CallbackFree(this.vtbl.Author)
        CallbackFree(this.vtbl.Enclosure)
        CallbackFree(this.vtbl.IsRead)
        CallbackFree(this.vtbl.SetIsRead)
        CallbackFree(this.vtbl.LocalId)
        CallbackFree(this.vtbl.Parent)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.DownloadUrl)
        CallbackFree(this.vtbl.LastDownloadTime)
        CallbackFree(this.vtbl.Modified)
    }
}
