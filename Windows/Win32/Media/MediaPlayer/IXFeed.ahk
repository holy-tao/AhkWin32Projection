#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\IXFeedsEnum.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeed
     * @type {Guid}
     */
    static IID => Guid("{a44179a4-e0f6-403b-af8d-d080f425a451}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Xml", "Name", "Rename", "Url", "SetUrl", "LocalId", "Path", "Move", "Parent", "LastWriteTime", "Delete", "Download", "AsyncDownload", "CancelAsyncDownload", "SyncSetting", "SetSyncSetting", "Interval", "SetInterval", "LastDownloadTime", "LocalEnclosurePath", "Items", "GetItem", "MarkAllItemsRead", "MaxItemCount", "SetMaxItemCount", "DownloadEnclosuresAutomatically", "SetDownloadEnclosuresAutomatically", "DownloadStatus", "LastDownloadError", "Merge", "DownloadUrl", "Title", "Description", "Link", "Image", "LastBuildDate", "PubDate", "Ttl", "Language", "Copyright", "IsList", "GetWatcher", "UnreadItemCount", "ItemCount"]

    /**
     * Resource string ids set by caller to be returned in xml data for visualizing objects.
     * @param {Integer} uiItemCount 
     * @param {Integer} sortProperty 
     * @param {Integer} sortOrder 
     * @param {Integer} filterFlags 
     * @param {Integer} includeFlags 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/direct3dtools/xml-resource-ids
     */
    Xml(uiItemCount, sortProperty, sortOrder, filterFlags, includeFlags) {
        result := ComCall(3, this, "uint", uiItemCount, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr*", &pps := 0, "HRESULT")
        return IStream(pps)
    }

    /**
     * Contains the name of a header field in an email message.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-name-headerfieldtype-element
     */
    Name() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "HRESULT")
        return result
    }

    /**
     * Determines a scheme for a specified URL string, and returns a string with an appropriate prefix. (Unicode)
     * @remarks
     * If the URL has a valid scheme, the string will not be modified. However, almost any combination of two or more characters followed by a colon will be parsed as a scheme. Valid characters include some common punctuation marks, such as ".". If your input string fits this description, <b>UrlApplyScheme</b> may treat it as valid and not apply a scheme. To force the function to apply a scheme to a URL, set the <b>URL_APPLY_FORCEAPPLY</b> and <b>URL_APPLY_DEFAULT</b> flags in <i>dwFlags</i>. This combination of flags forces the function to apply a scheme to the URL. Typically, the function will not be able to determine a valid scheme. The second flag guarantees that, if no valid scheme can be determined, the function will apply the default scheme to the URL.
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The shlwapi.h header defines UrlApplyScheme as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlapplyschemew
     */
    Url() {
        result := ComCall(6, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The SetUrlCacheEntryGroup function (wininet.h) adds entries to or removes entries from a cache group.
     * @remarks
     * A cache entry can belong to more than one cache group.
     * 
     * Like all other aspects of the WinINet API, this function cannot be safely called from within DllMain or the constructors and destructors of global objects.
     * 
     * <div class="alert"><b>Note</b>  WinINet does not support server implementations. In addition, it should not be used from a service.  For server implementations or services use <a href="https://docs.microsoft.com/windows/desktop/WinHttp/winhttp-start-page">Microsoft Windows HTTP Services (WinHTTP)</a>.</div>
     * <div> </div>
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} Returns <b>TRUE</b> if successful, or <b>FALSE</b> otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wininet/nf-wininet-seturlcacheentrygroup
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
        result := ComCall(8, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * The path to the image used for the background of a Journal note.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/tablet/path-element
     */
    Path() {
        result := ComCall(9, this, "ptr*", &ppszPath := 0, "HRESULT")
        return ppszPath
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
     * @param {PWSTR} pszPath 
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
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "HRESULT")
        return result
    }

    /**
     * Associates a parent object with a child object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-parentchildrelation
     */
    Parent(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastWriteTime() {
        pstLastWriteTime := SYSTEMTIME()
        result := ComCall(12, this, "ptr", pstLastWriteTime, "HRESULT")
        return pstLastWriteTime
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
        result := ComCall(13, this, "HRESULT")
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
     * @returns {Integer} 
     */
    SyncSetting() {
        result := ComCall(17, this, "int*", &pfss := 0, "HRESULT")
        return pfss
    }

    /**
     * 
     * @param {Integer} fss 
     * @returns {HRESULT} 
     */
    SetSyncSetting(fss) {
        result := ComCall(18, this, "int", fss, "HRESULT")
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
        result := ComCall(21, this, "ptr", pstLastDownloadTime, "HRESULT")
        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalEnclosurePath() {
        result := ComCall(22, this, "ptr*", &ppszPath := 0, "HRESULT")
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
        result := ComCall(24, this, "uint", uiId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
        result := ComCall(28, this, "int*", &pbDownloadEnclosuresAutomatically := 0, "HRESULT")
        return pbDownloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {BOOL} bDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    SetDownloadEnclosuresAutomatically(bDownloadEnclosuresAutomatically) {
        result := ComCall(29, this, "int", bDownloadEnclosuresAutomatically, "HRESULT")
        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. | DownloadStatus Element (Msfeeds.h)
     * @remarks
     * Windows Media Player displays a message to users when a download is in progress. If the current active services defines a download status URL, the user can click the message text. When the user clicks the message, the Player navigates to the URL specified by the **DownloadStatus** element so the current active store can provide details about downloads in progress.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/WMP/downloadstatus-element
     */
    DownloadStatus() {
        result := ComCall(30, this, "int*", &pfds := 0, "HRESULT")
        return pfds
    }

    /**
     * 
     * @returns {Integer} 
     */
    LastDownloadError() {
        result := ComCall(31, this, "int*", &pfde := 0, "HRESULT")
        return pfde
    }

    /**
     * The CloseDatabase method of the Merge object closes the currently open Windows Installer database.
     * @remarks
     * Closing a database clears all dependency information but does not affect any errors that have not been retrieved.
     * @param {IStream} pStream 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/Msi/merge-closedatabase
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
        result := ComCall(33, this, "ptr*", &ppszUrl := 0, "HRESULT")
        return ppszUrl
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/title
     */
    Title() {
        result := ComCall(34, this, "ptr*", &ppszTitle := 0, "HRESULT")
        return ppszTitle
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/mbn/element-description
     */
    Description() {
        result := ComCall(35, this, "ptr*", &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Registers a window class that allows for the SysLink common control to be used in a window.
     * @remarks
     * This function does not have an associated header or library file so it must be called by ordinal value. Call [**LoadLibrary**](/windows/win32/api/libloaderapi/nf-libloaderapi-loadlibrarya) with the DLL name Shell32.dll to obtain a module handle. Then call [**GetProcAddress**](/windows/win32/api/libloaderapi/nf-libloaderapi-getprocaddress) with that module handle and the ordinal number 258 to use this function.
     * 
     * Use [**LinkWindow\_UnregisterClass**](linkwindow-unregisterclass.md) to unregister the class after use.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/shell/linkwindow-registerclass
     */
    Link() {
        result := ComCall(36, this, "ptr*", &ppszHomePage := 0, "HRESULT")
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
        result := ComCall(37, this, "ptr*", &ppszImageUrl := 0, "HRESULT")
        return ppszImageUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastBuildDate() {
        pstLastBuildDate := SYSTEMTIME()
        result := ComCall(38, this, "ptr", pstLastBuildDate, "HRESULT")
        return pstLastBuildDate
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(39, this, "ptr", pstPubDate, "HRESULT")
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
        result := ComCall(41, this, "ptr*", &ppszLanguage := 0, "HRESULT")
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
        result := ComCall(42, this, "ptr*", &ppszCopyright := 0, "HRESULT")
        return ppszCopyright
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsList() {
        result := ComCall(43, this, "int*", &pbIsList := 0, "HRESULT")
        return pbIsList
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(44, this, "int", scope, "int", mask, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
}
