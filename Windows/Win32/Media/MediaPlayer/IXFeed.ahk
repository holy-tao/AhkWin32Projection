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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/direct3dtools/xml-resource-ids
     */
    Xml(uiItemCount, sortProperty, sortOrder, filterFlags, includeFlags) {
        result := ComCall(3, this, "uint", uiItemCount, "int", sortProperty, "int", sortOrder, "int", filterFlags, "int", includeFlags, "ptr*", &pps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IStream(pps)
    }

    /**
     * Name Property (SecurityCertificate Class)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/securitycertificate-class/name-property-securitycertificate-class
     */
    Name() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszName
    }

    /**
     * Learn more about: RenameColumnGrbit enumeration
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/renamecolumngrbit-enumeration
     */
    Rename(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/shlwapi/nf-shlwapi-urlapplyschemew
     */
    Url() {
        result := ComCall(6, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wininet/nf-wininet-seturlcacheentrygroup
     */
    SetUrl(pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(7, this, "ptr", pszUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    LocalId() {
        pguid := Guid()
        result := ComCall(8, this, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguid
    }

    /**
     * The path to the image used for the background of a Journal note.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/path-element
     */
    Path() {
        result := ComCall(9, this, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * Move Method Example (VC++)
     * @param {PWSTR} pszPath 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/move-method-example-vc
     */
    Move(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := ComCall(10, this, "ptr", pszPath, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Parent Property (ADO MD)
     * @remarks
     * A member that is at the top level of a hierarchy (the root) has no parent. This property is supported only on **Member** objects belonging to a [Level](./level-object-ado-md.md) object. An error occurs when this property is referenced from **Member** objects belonging to a [Position](./position-object-ado-md.md) object.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-md-api/parent-property-ado-md
     */
    Parent(riid) {
        result := ComCall(11, this, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastWriteTime() {
        pstLastWriteTime := SYSTEMTIME()
        result := ComCall(12, this, "ptr", pstLastWriteTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstLastWriteTime
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
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Clear method removes all items from a download collection.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/downloadcollection-clear
     */
    Download() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AsyncDownload() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelAsyncDownload() {
        result := ComCall(16, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    SyncSetting() {
        result := ComCall(17, this, "int*", &pfss := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfss
    }

    /**
     * 
     * @param {Integer} fss 
     * @returns {HRESULT} 
     */
    SetSyncSetting(fss) {
        result := ComCall(18, this, "int", fss, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Interval Literals
     * @returns {Integer} 
     * @see https://learn.microsoft.com/sql/ocs/docs/odbc/reference/appendixes/interval-literals
     */
    Interval() {
        result := ComCall(19, this, "uint*", &puiInterval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiInterval
    }

    /**
     * 
     * @param {Integer} uiInterval 
     * @returns {HRESULT} 
     */
    SetInterval(uiInterval) {
        result := ComCall(20, this, "uint", uiInterval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastDownloadTime() {
        pstLastDownloadTime := SYSTEMTIME()
        result := ComCall(21, this, "ptr", pstLastDownloadTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstLastDownloadTime
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    LocalEnclosurePath() {
        result := ComCall(22, this, "ptr*", &ppszPath := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszPath
    }

    /**
     * Initializes a new instance of the [ItemsControl](itemscontrol.md) class.
     * @returns {IXFeedsEnum} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.itemscontrol.#ctor
     */
    Items() {
        result := ComCall(23, this, "ptr*", &ppfe := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IXFeedsEnum(ppfe)
    }

    /**
     * 
     * @param {Integer} uiId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetItem(uiId, riid) {
        result := ComCall(24, this, "uint", uiId, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MarkAllItemsRead() {
        result := ComCall(25, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    MaxItemCount() {
        result := ComCall(26, this, "uint*", &puiMaxItemCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiMaxItemCount
    }

    /**
     * 
     * @param {Integer} uiMaxItemCount 
     * @returns {HRESULT} 
     */
    SetMaxItemCount(uiMaxItemCount) {
        result := ComCall(27, this, "uint", uiMaxItemCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    DownloadEnclosuresAutomatically() {
        result := ComCall(28, this, "int*", &pbDownloadEnclosuresAutomatically := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbDownloadEnclosuresAutomatically
    }

    /**
     * 
     * @param {BOOL} bDownloadEnclosuresAutomatically 
     * @returns {HRESULT} 
     */
    SetDownloadEnclosuresAutomatically(bDownloadEnclosuresAutomatically) {
        result := ComCall(29, this, "int", bDownloadEnclosuresAutomatically, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Note This section describes functionality designed for use by online stores. | DownloadStatus Element (Msfeeds.h)
     * @remarks
     * Windows Media Player displays a message to users when a download is in progress. If the current active services defines a download status URL, the user can click the message text. When the user clicks the message, the Player navigates to the URL specified by the **DownloadStatus** element so the current active store can provide details about downloads in progress.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/downloadstatus-element
     */
    DownloadStatus() {
        result := ComCall(30, this, "int*", &pfds := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfds
    }

    /**
     * 
     * @returns {Integer} 
     */
    LastDownloadError() {
        result := ComCall(31, this, "int*", &pfde := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfde
    }

    /**
     * The CloseDatabase method of the Merge object closes the currently open Windows Installer database.
     * @remarks
     * Closing a database clears all dependency information but does not affect any errors that have not been retrieved.
     * @param {IStream} pStream 
     * @param {PWSTR} pszUrl 
     * @returns {HRESULT} This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Msi/merge-closedatabase
     */
    Merge(pStream, pszUrl) {
        pszUrl := pszUrl is String ? StrPtr(pszUrl) : pszUrl

        result := ComCall(32, this, "ptr", pStream, "ptr", pszUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    DownloadUrl() {
        result := ComCall(33, this, "ptr*", &ppszUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszUrl
    }

    /**
     * The Title attribute contains the title of the content in the file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/title
     */
    Title() {
        result := ComCall(34, this, "ptr*", &ppszTitle := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszTitle
    }

    /**
     * Description (Mobile Broadband) - Description
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/mbn/element-description
     */
    Description() {
        result := ComCall(35, this, "ptr*", &ppszDescription := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszDescription
    }

    /**
     * These methods add linked items to a database, get the name of an item for a linked item, get items linked to an item, and set a catalog item for a linked item.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/reporting-services/report-server-web-service/methods/linked-reports-methods
     */
    Link() {
        result := ComCall(36, this, "ptr*", &ppszHomePage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszHomePage
    }

    /**
     * This class is the parent class for image events. The following syntax is simplified from MOF code.
     * @remarks
     * The **Image** class does not define any members.
     * 
     * 
     * To enable image events in an NT Kernel logging session, specify the **EVENT\_TRACE\_FLAG\_IMAGE\_LOAD** flag in the **EnableFlags** member of the [**EVENT\_TRACE\_PROPERTIES**](/windows/win32/api/evntrace/ns-evntrace-event_trace_properties) structure when calling the [**StartTrace**](/windows/win32/api/evntrace/nf-evntrace-starttracea) function.
     * 
     * Event trace consumers can implement special processing for image load events by calling the [**SetTraceCallback**](/windows/win32/api/evntrace/nf-evntrace-settracecallback) function and specifying [**ImageLoadGuid**](nt-kernel-logger-constants.md) as the *pGuid* parameter. Use the following event types to identify image load events when consuming events.
     * 
     * 
     * 
     * | Event type                                                          | Description                                                                                                                                                                                                                                      |
     * |---------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | **EVENT\_TRACE\_TYPE\_LOAD**(Event type value is 10)<br/>     | Image load event. Generated when a DLL or executable file is loaded. The provider generates only one event for the first time a given DLL is loaded. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.      |
     * | **EVENT\_TRACE\_TYPE\_END**(Event type value is 2)<br/>       | Image unload event. Generated when a DLL or executable file is unloaded. The provider generates only one event for the last time a given DLL is unloaded. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event. |
     * | **EVENT\_TRACE\_TYPE\_DC\_START**(Event type value is 3)<br/> | Data collection start event. Enumerates all loaded images at the beginning of the trace. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.                                                                  |
     * | **EVENT\_TRACE\_TYPE\_DC\_END**(Event type value is 4)<br/>   | Data collection end event. Enumerates all loaded images at the end of the trace. The [**Image\_Load**](image-load.md) MOF class defines the event data for this event.                                                                          |
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/ETW/image
     */
    Image() {
        result := ComCall(37, this, "ptr*", &ppszImageUrl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszImageUrl
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastBuildDate() {
        pstLastBuildDate := SYSTEMTIME()
        result := ComCall(38, this, "ptr", pstLastBuildDate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstLastBuildDate
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    PubDate() {
        pstPubDate := SYSTEMTIME()
        result := ComCall(39, this, "ptr", pstPubDate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstPubDate
    }

    /**
     * 
     * @returns {Integer} 
     */
    Ttl() {
        result := ComCall(40, this, "uint*", &puiTtl := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiTtl
    }

    /**
     * Language Elements (Transact-SQL)
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/language-elements/language-elements-transact-sql
     */
    Language() {
        result := ComCall(41, this, "ptr*", &ppszLanguage := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszLanguage
    }

    /**
     * The Copyright attribute contains a copyright message for the content.
     * @remarks
     * The text of a copyright message does not conform to any standard. Individual companies can use whatever format is appropriate.
     * 
     * This attribute applies to the entire file.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/copyright
     */
    Copyright() {
        result := ComCall(42, this, "ptr*", &ppszCopyright := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszCopyright
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsList() {
        result := ComCall(43, this, "int*", &pbIsList := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbIsList
    }

    /**
     * 
     * @param {Integer} scope 
     * @param {Integer} mask 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    GetWatcher(scope, mask, riid) {
        result := ComCall(44, this, "int", scope, "int", mask, "ptr", riid, "ptr*", &ppv := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppv
    }

    /**
     * 
     * @returns {Integer} 
     */
    UnreadItemCount() {
        result := ComCall(45, this, "uint*", &puiUnreadItemCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiUnreadItemCount
    }

    /**
     * 
     * @returns {Integer} 
     */
    ItemCount() {
        result := ComCall(46, this, "uint*", &puiItemCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return puiItemCount
    }
}
