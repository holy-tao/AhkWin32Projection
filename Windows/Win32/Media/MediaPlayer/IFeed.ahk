#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * IFeedbackHubAppInfo interface - This API is not available to all apps. Unless your app is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @see https://learn.microsoft.com/windows/win32/DevNotes/ifeebackhubappinfo
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeed extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeed
     * @type {Guid}
     */
    static IID => Guid("{f7f915d8-2ede-42bc-98e7-a5d05063a757}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "get_Name", "Rename", "get_Url", "put_Url", "get_LocalId", "get_Path", "Move", "get_Parent", "get_LastWriteTime", "Delete", "Download", "AsyncDownload", "CancelAsyncDownload", "get_SyncSetting", "put_SyncSetting", "get_Interval", "put_Interval", "get_LastDownloadTime", "get_LocalEnclosurePath", "get_Items", "GetItem", "get_Title", "get_Description", "get_Link", "get_Image", "get_LastBuildDate", "get_PubDate", "get_Ttl", "get_Language", "get_Copyright", "get_MaxItemCount", "put_MaxItemCount", "get_DownloadEnclosuresAutomatically", "put_DownloadEnclosuresAutomatically", "get_DownloadStatus", "get_LastDownloadError", "Merge", "get_DownloadUrl", "get_IsList", "MarkAllItemsRead", "GetWatcher", "get_UnreadItemCount", "get_ItemCount"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Url {
        get => this.get_Url()
        set => this.put_Url(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalId {
        get => this.get_LocalId()
    }

    /**
     * @type {BSTR} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IDispatch} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * @type {Float} 
     */
    LastWriteTime {
        get => this.get_LastWriteTime()
    }

    /**
     * @type {Integer} 
     */
    SyncSetting {
        get => this.get_SyncSetting()
        set => this.put_SyncSetting(value)
    }

    /**
     * @type {Integer} 
     */
    Interval {
        get => this.get_Interval()
        set => this.put_Interval(value)
    }

    /**
     * @type {Float} 
     */
    LastDownloadTime {
        get => this.get_LastDownloadTime()
    }

    /**
     * @type {BSTR} 
     */
    LocalEnclosurePath {
        get => this.get_LocalEnclosurePath()
    }

    /**
     * @type {IDispatch} 
     */
    Items {
        get => this.get_Items()
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
    Description {
        get => this.get_Description()
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
    Image {
        get => this.get_Image()
    }

    /**
     * @type {Float} 
     */
    LastBuildDate {
        get => this.get_LastBuildDate()
    }

    /**
     * @type {Float} 
     */
    PubDate {
        get => this.get_PubDate()
    }

    /**
     * @type {Integer} 
     */
    Ttl {
        get => this.get_Ttl()
    }

    /**
     * @type {BSTR} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * @type {BSTR} 
     */
    Copyright {
        get => this.get_Copyright()
    }

    /**
     * @type {Integer} 
     */
    MaxItemCount {
        get => this.get_MaxItemCount()
        set => this.put_MaxItemCount(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    DownloadEnclosuresAutomatically {
        get => this.get_DownloadEnclosuresAutomatically()
        set => this.put_DownloadEnclosuresAutomatically(value)
    }

    /**
     * @type {Integer} 
     */
    DownloadStatus {
        get => this.get_DownloadStatus()
    }

    /**
     * @type {Integer} 
     */
    LastDownloadError {
        get => this.get_LastDownloadError()
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsList {
        get => this.get_IsList()
    }

    /**
     * @type {Integer} 
     */
    UnreadItemCount {
        get => this.get_UnreadItemCount()
    }

    /**
     * @type {Integer} 
     */
    ItemCount {
        get => this.get_ItemCount()
    }

    /**
     * Resource string ids set by caller to be returned in xml data for visualizing objects.
     * @param {Integer} count 
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/direct3dtools/xml-resource-ids
     */
    Xml(count, sortProperty, sortOrder, filterFlags, includeFlags) {
        xml := BSTR()
        result := ComCall(7, this, "int", count, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr", xml, "HRESULT")
        return xml
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        name := BSTR()
        result := ComCall(8, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Url() {
        feedUrl := BSTR()
        result := ComCall(10, this, "ptr", feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} 
     */
    put_Url(feedUrl) {
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(11, this, "ptr", feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalId() {
        feedGuid := BSTR()
        result := ComCall(12, this, "ptr", feedGuid, "HRESULT")
        return feedGuid
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Path() {
        path := BSTR()
        result := ComCall(13, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * Moves a group and all of its resources from one node to another.
     * @remarks
     * The return value from the  <b>MoveClusterGroup</b> function does not imply anything about the state of the group or any of its resources. The return value only indicates whether the change of ownership was successful. After returning from  <b>MoveClusterGroup</b>, the cluster always attempts to return the group to the state it was before the move.
     * 
     * If you want your application to ensure a particular state for a resource or a group after a move:
     * 
     * <ol>
     * <li>Check the state prior to the move. The cluster will attempt to restore that state after the move.</li>
     * <li>Poll for the state after the move and adjust as necessary. Or create a notification port (see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/receiving-cluster-events">Receiving Cluster Events</a>) and wait for a <b>CLUSTER_CHANGE_GROUP_STATE</b> event.</li>
     * </ol>
     * When <i>hDestinationNode</i> is set to <b>NULL</b>,  <b>MoveClusterGroup</b> attempts to move the group to the best possible node. If there is no node available that can accept the group, the function fails.  <b>MoveClusterGroup</b> also fails if  <b>MoveClusterGroup</b> determines that the group cannot be brought online on the node identified by the <i>hDestinationNode</i> parameter.
     * 
     * Do not call  <b>MoveClusterGroup</b> from a resource DLL. For more information, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/function-calls-to-avoid-in-resource-dlls">Function Calls to Avoid in Resource DLLs</a>.
     * 
     * Do not pass LPC and RPC handles to the same function call. Otherwise, the call will raise an RPC exception and can have additional destructive effects. For information on how LPC and RPC handles are created, see  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/using-object-handles">Using Object Handles</a> and  <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-opencluster">OpenCluster</a>.
     * @param {BSTR} newParentPath 
     * @returns {HRESULT} If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, 
     * the function returns a <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>. The following is one of the possible error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_IO_PENDING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reassignment of ownership of the group is in progress.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/clusapi/nf-clusapi-moveclustergroup
     */
    Move(newParentPath) {
        newParentPath := newParentPath is String ? BSTR.Alloc(newParentPath).Value : newParentPath

        result := ComCall(14, this, "ptr", newParentPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Parent() {
        result := ComCall(15, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastWriteTime() {
        result := ComCall(16, this, "double*", &lastWrite := 0, "HRESULT")
        return lastWrite
    }

    /**
     * Deletes an access control entry (ACE) from an access control list (ACL).
     * @remarks
     * An application can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-acl_size_information">ACL_SIZE_INFORMATION</a> structure retrieved by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getaclinformation">GetAclInformation</a> function to discover the size of the ACL and the number of ACEs it contains. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-getace">GetAce</a> function retrieves information about an individual ACE.
     * @returns {HRESULT} If the function succeeds, the function returns nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace
     */
    Delete() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Clear method removes all items from a download collection.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/WMP/downloadcollection-clear
     */
    Download() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SyncSetting() {
        result := ComCall(21, this, "int*", &syncSetting := 0, "HRESULT")
        return syncSetting
    }

    /**
     * 
     * @param {Integer} syncSetting 
     * @returns {HRESULT} 
     */
    put_SyncSetting(syncSetting) {
        result := ComCall(22, this, "int", syncSetting, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Interval() {
        result := ComCall(23, this, "int*", &minutes := 0, "HRESULT")
        return minutes
    }

    /**
     * 
     * @param {Integer} minutes 
     * @returns {HRESULT} 
     */
    put_Interval(minutes) {
        result := ComCall(24, this, "int", minutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastDownloadTime() {
        result := ComCall(25, this, "double*", &lastDownload := 0, "HRESULT")
        return lastDownload
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalEnclosurePath() {
        path := BSTR()
        result := ComCall(26, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Items() {
        result := ComCall(27, this, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @param {Integer} itemId 
     * @returns {IDispatch} 
     */
    GetItem(itemId) {
        result := ComCall(28, this, "int", itemId, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Title() {
        title := BSTR()
        result := ComCall(29, this, "ptr", title, "HRESULT")
        return title
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        description := BSTR()
        result := ComCall(30, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Link() {
        homePage := BSTR()
        result := ComCall(31, this, "ptr", homePage, "HRESULT")
        return homePage
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Image() {
        imageUrl := BSTR()
        result := ComCall(32, this, "ptr", imageUrl, "HRESULT")
        return imageUrl
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastBuildDate() {
        result := ComCall(33, this, "double*", &lastBuildDate := 0, "HRESULT")
        return lastBuildDate
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PubDate() {
        result := ComCall(34, this, "double*", &lastPopulateDate := 0, "HRESULT")
        return lastPopulateDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Ttl() {
        result := ComCall(35, this, "int*", &ttl := 0, "HRESULT")
        return ttl
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Language() {
        language := BSTR()
        result := ComCall(36, this, "ptr", language, "HRESULT")
        return language
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Copyright() {
        copyright := BSTR()
        result := ComCall(37, this, "ptr", copyright, "HRESULT")
        return copyright
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxItemCount() {
        result := ComCall(38, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    put_MaxItemCount(count) {
        result := ComCall(39, this, "int", count, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_DownloadEnclosuresAutomatically() {
        result := ComCall(40, this, "short*", &downloadEnclosuresAutomatically := 0, "HRESULT")
        return downloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {VARIANT_BOOL} downloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    put_DownloadEnclosuresAutomatically(downloadEnclosuresAutomatically) {
        result := ComCall(41, this, "short", downloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadStatus() {
        result := ComCall(42, this, "int*", &status := 0, "HRESULT")
        return status
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LastDownloadError() {
        result := ComCall(43, this, "int*", &error := 0, "HRESULT")
        return error
    }

    /**
     * The CloseDatabase method of the Merge object closes the currently open Windows Installer database.
     * @remarks
     * Closing a database clears all dependency information but does not affect any errors that have not been retrieved.
     * @param {BSTR} feedXml 
     * @param {BSTR} feedUrl 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/Msi/merge-closedatabase
     */
    Merge(feedXml, feedUrl) {
        feedXml := feedXml is String ? BSTR.Alloc(feedXml).Value : feedXml
        feedUrl := feedUrl is String ? BSTR.Alloc(feedUrl).Value : feedUrl

        result := ComCall(44, this, "ptr", feedXml, "ptr", feedUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DownloadUrl() {
        feedUrl := BSTR()
        result := ComCall(45, this, "ptr", feedUrl, "HRESULT")
        return feedUrl
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsList() {
        result := ComCall(46, this, "short*", &isList := 0, "HRESULT")
        return isList
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @returns {IDispatch} 
     */
    GetWatcher(scope, mask) {
        result := ComCall(48, this, "int", scope, "int", mask, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UnreadItemCount() {
        result := ComCall(49, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ItemCount() {
        result := ComCall(50, this, "int*", &count := 0, "HRESULT")
        return count
    }
}
