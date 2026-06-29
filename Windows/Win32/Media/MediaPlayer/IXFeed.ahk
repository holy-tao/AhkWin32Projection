#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\FEEDS_EVENTS_MASK.ahk" { FEEDS_EVENTS_MASK }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FEEDS_XML_FILTER_FLAGS.ahk" { FEEDS_XML_FILTER_FLAGS }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\FEEDS_EVENTS_SCOPE.ahk" { FEEDS_EVENTS_SCOPE }
#Import ".\FEEDS_DOWNLOAD_ERROR.ahk" { FEEDS_DOWNLOAD_ERROR }
#Import ".\FEEDS_XML_INCLUDE_FLAGS.ahk" { FEEDS_XML_INCLUDE_FLAGS }
#Import ".\FEEDS_XML_SORT_PROPERTY.ahk" { FEEDS_XML_SORT_PROPERTY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\FEEDS_XML_SORT_ORDER.ahk" { FEEDS_XML_SORT_ORDER }
#Import ".\IXFeedsEnum.ahk" { IXFeedsEnum }
#Import ".\FEEDS_DOWNLOAD_STATUS.ahk" { FEEDS_DOWNLOAD_STATUS }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FEEDS_SYNC_SETTING.ahk" { FEEDS_SYNC_SETTING }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeed extends IUnknown {
    /**
     * The interface identifier for IXFeed
     * @type {Guid}
     */
    static IID := Guid("{a44179a4-e0f6-403b-af8d-d080f425a451}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeed interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Xml                                : IntPtr
        Name                               : IntPtr
        Rename                             : IntPtr
        Url                                : IntPtr
        SetUrl                             : IntPtr
        LocalId                            : IntPtr
        Path                               : IntPtr
        Move                               : IntPtr
        Parent                             : IntPtr
        LastWriteTime                      : IntPtr
        Delete                             : IntPtr
        Download                           : IntPtr
        AsyncDownload                      : IntPtr
        CancelAsyncDownload                : IntPtr
        SyncSetting                        : IntPtr
        SetSyncSetting                     : IntPtr
        Interval                           : IntPtr
        SetInterval                        : IntPtr
        LastDownloadTime                   : IntPtr
        LocalEnclosurePath                 : IntPtr
        Items                              : IntPtr
        GetItem                            : IntPtr
        MarkAllItemsRead                   : IntPtr
        MaxItemCount                       : IntPtr
        SetMaxItemCount                    : IntPtr
        DownloadEnclosuresAutomatically    : IntPtr
        SetDownloadEnclosuresAutomatically : IntPtr
        DownloadStatus                     : IntPtr
        LastDownloadError                  : IntPtr
        Merge                              : IntPtr
        DownloadUrl                        : IntPtr
        Title                              : IntPtr
        Description                        : IntPtr
        Link                               : IntPtr
        Image                              : IntPtr
        LastBuildDate                      : IntPtr
        PubDate                            : IntPtr
        Ttl                                : IntPtr
        Language                           : IntPtr
        Copyright                          : IntPtr
        IsList                             : IntPtr
        GetWatcher                         : IntPtr
        UnreadItemCount                    : IntPtr
        ItemCount                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeed.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} uiItemCount 
     * @param {FEEDS_XML_SORT_PROPERTY} sortProperty 
     * @param {FEEDS_XML_SORT_ORDER} sortOrder 
     * @param {FEEDS_XML_FILTER_FLAGS} filterFlags 
     * @param {FEEDS_XML_INCLUDE_FLAGS} includeFlags 
     * @returns {IStream} 
     */
    Xml(uiItemCount, sortProperty, sortOrder, filterFlags, includeFlags) {
        result := ComCall(3, this, "uint", uiItemCount, FEEDS_XML_SORT_PROPERTY, sortProperty, FEEDS_XML_SORT_ORDER, sortOrder, FEEDS_XML_FILTER_FLAGS, filterFlags, FEEDS_XML_INCLUDE_FLAGS, includeFlags, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * Contains the name of a header field in an email message.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-name-headerfieldtype-element
     */
    Name() {
        result := ComCall(4, this, PWSTR.Ptr, &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Url() {
        result := ComCall(6, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    SetUrl(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    LocalId() {
        pguid := Guid()
        result := ComCall(8, this, Guid.Ptr, pguid, "HRESULT")
        return pguid
    }

    /**
     * The path to the image used for the background of a Journal note.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/tablet/path-element
     */
    Path() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    Parent(riid) {
        result := ComCall(11, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastWriteTime() {
        pstLastWriteTime := SYSTEMTIME()
        result := ComCall(12, this, SYSTEMTIME.Ptr, pstLastWriteTime, "HRESULT")
        return pstLastWriteTime
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Download() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {FEEDS_SYNC_SETTING} 
     */
    SyncSetting() {
        result := ComCall(17, this, "int*", &pfss := 0, "HRESULT")
        return pfss
    }

    /**
     * 
     * @param {FEEDS_SYNC_SETTING} fss 
     * @returns {HRESULT} 
     */
    SetSyncSetting(fss) {
        result := ComCall(18, this, FEEDS_SYNC_SETTING, fss, "HRESULT")
        return result
    }

    /**
     * Specifies how long the Task Scheduler will attempt to restart the task.
     * @remarks
     * If this element is specified, the [**Count**](taskschedulerschema-count-restarttype-element.md) element must also be specified to tell the Task Scheduler how many times it should try to restart the task.
     * 
     * For C++ development, see [**RestartInterval Property of ITaskSettings**](/windows/desktop/api/taskschd/nf-taskschd-itasksettings-get_restartinterval).
     * 
     * For script development, see [**TaskSettings.RestartInterval**](tasksettings-restartinterval.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-interval-restarttype-element
     */
    Interval() {
        result := ComCall(19, this, "uint*", &puiInterval := 0, "HRESULT")
        return puiInterval
    }

    /**
     * 
     * @param {Integer} uiInterval 
     * @returns {HRESULT} 
     */
    SetInterval(uiInterval) {
        result := ComCall(20, this, "uint", uiInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(21, this, SYSTEMTIME.Ptr, pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalEnclosurePath() {
        result := ComCall(22, this, PWSTR.Ptr, &ppszPath := 0, "HRESULT")
        return ppszPath
    }

    /**
     * 
     * @returns {IXFeedsEnum} 
     */
    Items() {
        result := ComCall(23, this, "ptr*", &ppfe := 0, "HRESULT")
        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @param {Integer} uiId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetItem(uiId, riid) {
        result := ComCall(24, this, "uint", uiId, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    MaxItemCount() {
        result := ComCall(26, this, "uint*", &puiMaxItemCount := 0, "HRESULT")
        return puiMaxItemCount
    }

    /**
     * 
     * @param {Integer} uiMaxItemCount 
     * @returns {HRESULT} 
     */
    SetMaxItemCount(uiMaxItemCount) {
        result := ComCall(27, this, "uint", uiMaxItemCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    DownloadEnclosuresAutomatically() {
        result := ComCall(28, this, BOOL.Ptr, &pbDownloadEnclosuresAutomatically := 0, "HRESULT")
        return pbDownloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {BOOL} bDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    SetDownloadEnclosuresAutomatically(bDownloadEnclosuresAutomatically) {
        result := ComCall(29, this, BOOL, bDownloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. | DownloadStatus Element (Msfeeds.h)
     * @remarks
     * Windows Media Player displays a message to users when a download is in progress. If the current active services defines a download status URL, the user can click the message text. When the user clicks the message, the Player navigates to the URL specified by the **DownloadStatus** element so the current active store can provide details about downloads in progress.
     * @returns {FEEDS_DOWNLOAD_STATUS} 
     * @see https://learn.microsoft.com/windows/win32/WMP/downloadstatus-element
     */
    DownloadStatus() {
        result := ComCall(30, this, "int*", &pfds := 0, "HRESULT")
        return pfds
    }

    /**
     * 
     * @returns {FEEDS_DOWNLOAD_ERROR} 
     */
    LastDownloadError() {
        result := ComCall(31, this, "int*", &pfde := 0, "HRESULT")
        return pfde
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} 
     */
    Merge(pStream, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(32, this, "ptr", pStream, "ptr", pszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(33, this, PWSTR.Ptr, &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/title
     */
    Title() {
        result := ComCall(34, this, PWSTR.Ptr, &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-description
     */
    Description() {
        result := ComCall(35, this, PWSTR.Ptr, &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Link() {
        result := ComCall(36, this, PWSTR.Ptr, &ppszHomePage := 0, "HRESULT")
        return ppszHomePage
    }

    /**
     * Represents an image.
     * @remarks
     * Optional.
     * 
     * May occur one or more times for each [**Command.SmallImages**](windowsribbon-element-command-smallimages.md), [**Command.SmallHighContrastImages**](windowsribbon-element-command-smallhighcontrastimages.md), [**Command.LargeImages**](windowsribbon-element-command-largeimages.md), or [**Command.LargeHighContrastImages**](windowsribbon-element-command-largehighcontrastimages.md) element.
     * 
     * When a collection of image resources that are designed to support specific screen dots per inch (dpi) settings is supplied to the Ribbon framework through a set of **Image** elements, the framework uses the **Image** with a *MinDPI* attribute value that matches the current screen dpi setting.
     * 
     * If no **Image** element is declared with a *MinDPI* value that matches the current screen dpi setting, the framework picks the **Image** that has the nearest *MinDPI* value less than the current screen dpi setting and scales the image resource up. Otherwise, if no **Image** element is declared with a *MinDPI* attribute value less than the current screen dpi setting, the framework picks the nearest *MinDPI* value greater than the current screen dpi setting and scales the image resource down.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/windowsribbon/windowsribbon-element-image
     */
    Image() {
        result := ComCall(37, this, PWSTR.Ptr, &ppszImageUrl := 0, "HRESULT")
        return ppszImageUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastBuildDate() {
        pstLastBuildDate := SYSTEMTIME()
        result := ComCall(38, this, SYSTEMTIME.Ptr, pstLastBuildDate, "HRESULT")
        return pstLastBuildDate
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(39, this, SYSTEMTIME.Ptr, pstPubDate, "HRESULT")
        return pstPubDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    Ttl() {
        result := ComCall(40, this, "uint*", &puiTtl := 0, "HRESULT")
        return puiTtl
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Language() {
        result := ComCall(41, this, PWSTR.Ptr, &ppszLanguage := 0, "HRESULT")
        return ppszLanguage
    }

    /**
     * The Copyright attribute contains a copyright message for the content.
     * @remarks
     * The text of a copyright message does not conform to any standard. Individual companies can use whatever format is appropriate.
     * 
     * This attribute applies to the entire file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/copyright
     */
    Copyright() {
        result := ComCall(42, this, PWSTR.Ptr, &ppszCopyright := 0, "HRESULT")
        return ppszCopyright
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsList() {
        result := ComCall(43, this, BOOL.Ptr, &pbIsList := 0, "HRESULT")
        return pbIsList
    }

    /**
     * 
     * @param {FEEDS_EVENTS_SCOPE} scope 
     * @param {FEEDS_EVENTS_MASK} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(44, this, FEEDS_EVENTS_SCOPE, scope, FEEDS_EVENTS_MASK, mask, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     */
    UnreadItemCount() {
        result := ComCall(45, this, "uint*", &puiUnreadItemCount := 0, "HRESULT")
        return puiUnreadItemCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    ItemCount() {
        result := ComCall(46, this, "uint*", &puiItemCount := 0, "HRESULT")
        return puiItemCount
    }

    Query(iid) {
        if (IXFeed.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Xml := CallbackCreate(GetMethod(implObj, "Xml"), flags, 7)
        this.vtbl.Name := CallbackCreate(GetMethod(implObj, "Name"), flags, 2)
        this.vtbl.Rename := CallbackCreate(GetMethod(implObj, "Rename"), flags, 2)
        this.vtbl.Url := CallbackCreate(GetMethod(implObj, "Url"), flags, 2)
        this.vtbl.SetUrl := CallbackCreate(GetMethod(implObj, "SetUrl"), flags, 2)
        this.vtbl.LocalId := CallbackCreate(GetMethod(implObj, "LocalId"), flags, 2)
        this.vtbl.Path := CallbackCreate(GetMethod(implObj, "Path"), flags, 2)
        this.vtbl.Move := CallbackCreate(GetMethod(implObj, "Move"), flags, 2)
        this.vtbl.Parent := CallbackCreate(GetMethod(implObj, "Parent"), flags, 3)
        this.vtbl.LastWriteTime := CallbackCreate(GetMethod(implObj, "LastWriteTime"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 1)
        this.vtbl.AsyncDownload := CallbackCreate(GetMethod(implObj, "AsyncDownload"), flags, 1)
        this.vtbl.CancelAsyncDownload := CallbackCreate(GetMethod(implObj, "CancelAsyncDownload"), flags, 1)
        this.vtbl.SyncSetting := CallbackCreate(GetMethod(implObj, "SyncSetting"), flags, 2)
        this.vtbl.SetSyncSetting := CallbackCreate(GetMethod(implObj, "SetSyncSetting"), flags, 2)
        this.vtbl.Interval := CallbackCreate(GetMethod(implObj, "Interval"), flags, 2)
        this.vtbl.SetInterval := CallbackCreate(GetMethod(implObj, "SetInterval"), flags, 2)
        this.vtbl.LastDownloadTime := CallbackCreate(GetMethod(implObj, "LastDownloadTime"), flags, 2)
        this.vtbl.LocalEnclosurePath := CallbackCreate(GetMethod(implObj, "LocalEnclosurePath"), flags, 2)
        this.vtbl.Items := CallbackCreate(GetMethod(implObj, "Items"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 4)
        this.vtbl.MarkAllItemsRead := CallbackCreate(GetMethod(implObj, "MarkAllItemsRead"), flags, 1)
        this.vtbl.MaxItemCount := CallbackCreate(GetMethod(implObj, "MaxItemCount"), flags, 2)
        this.vtbl.SetMaxItemCount := CallbackCreate(GetMethod(implObj, "SetMaxItemCount"), flags, 2)
        this.vtbl.DownloadEnclosuresAutomatically := CallbackCreate(GetMethod(implObj, "DownloadEnclosuresAutomatically"), flags, 2)
        this.vtbl.SetDownloadEnclosuresAutomatically := CallbackCreate(GetMethod(implObj, "SetDownloadEnclosuresAutomatically"), flags, 2)
        this.vtbl.DownloadStatus := CallbackCreate(GetMethod(implObj, "DownloadStatus"), flags, 2)
        this.vtbl.LastDownloadError := CallbackCreate(GetMethod(implObj, "LastDownloadError"), flags, 2)
        this.vtbl.Merge := CallbackCreate(GetMethod(implObj, "Merge"), flags, 3)
        this.vtbl.DownloadUrl := CallbackCreate(GetMethod(implObj, "DownloadUrl"), flags, 2)
        this.vtbl.Title := CallbackCreate(GetMethod(implObj, "Title"), flags, 2)
        this.vtbl.Description := CallbackCreate(GetMethod(implObj, "Description"), flags, 2)
        this.vtbl.Link := CallbackCreate(GetMethod(implObj, "Link"), flags, 2)
        this.vtbl.Image := CallbackCreate(GetMethod(implObj, "Image"), flags, 2)
        this.vtbl.LastBuildDate := CallbackCreate(GetMethod(implObj, "LastBuildDate"), flags, 2)
        this.vtbl.PubDate := CallbackCreate(GetMethod(implObj, "PubDate"), flags, 2)
        this.vtbl.Ttl := CallbackCreate(GetMethod(implObj, "Ttl"), flags, 2)
        this.vtbl.Language := CallbackCreate(GetMethod(implObj, "Language"), flags, 2)
        this.vtbl.Copyright := CallbackCreate(GetMethod(implObj, "Copyright"), flags, 2)
        this.vtbl.IsList := CallbackCreate(GetMethod(implObj, "IsList"), flags, 2)
        this.vtbl.GetWatcher := CallbackCreate(GetMethod(implObj, "GetWatcher"), flags, 5)
        this.vtbl.UnreadItemCount := CallbackCreate(GetMethod(implObj, "UnreadItemCount"), flags, 2)
        this.vtbl.ItemCount := CallbackCreate(GetMethod(implObj, "ItemCount"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Xml)
        CallbackFree(this.vtbl.Name)
        CallbackFree(this.vtbl.Rename)
        CallbackFree(this.vtbl.Url)
        CallbackFree(this.vtbl.SetUrl)
        CallbackFree(this.vtbl.LocalId)
        CallbackFree(this.vtbl.Path)
        CallbackFree(this.vtbl.Move)
        CallbackFree(this.vtbl.Parent)
        CallbackFree(this.vtbl.LastWriteTime)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Download)
        CallbackFree(this.vtbl.AsyncDownload)
        CallbackFree(this.vtbl.CancelAsyncDownload)
        CallbackFree(this.vtbl.SyncSetting)
        CallbackFree(this.vtbl.SetSyncSetting)
        CallbackFree(this.vtbl.Interval)
        CallbackFree(this.vtbl.SetInterval)
        CallbackFree(this.vtbl.LastDownloadTime)
        CallbackFree(this.vtbl.LocalEnclosurePath)
        CallbackFree(this.vtbl.Items)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.MarkAllItemsRead)
        CallbackFree(this.vtbl.MaxItemCount)
        CallbackFree(this.vtbl.SetMaxItemCount)
        CallbackFree(this.vtbl.DownloadEnclosuresAutomatically)
        CallbackFree(this.vtbl.SetDownloadEnclosuresAutomatically)
        CallbackFree(this.vtbl.DownloadStatus)
        CallbackFree(this.vtbl.LastDownloadError)
        CallbackFree(this.vtbl.Merge)
        CallbackFree(this.vtbl.DownloadUrl)
        CallbackFree(this.vtbl.Title)
        CallbackFree(this.vtbl.Description)
        CallbackFree(this.vtbl.Link)
        CallbackFree(this.vtbl.Image)
        CallbackFree(this.vtbl.LastBuildDate)
        CallbackFree(this.vtbl.PubDate)
        CallbackFree(this.vtbl.Ttl)
        CallbackFree(this.vtbl.Language)
        CallbackFree(this.vtbl.Copyright)
        CallbackFree(this.vtbl.IsList)
        CallbackFree(this.vtbl.GetWatcher)
        CallbackFree(this.vtbl.UnreadItemCount)
        CallbackFree(this.vtbl.ItemCount)
    }
}
