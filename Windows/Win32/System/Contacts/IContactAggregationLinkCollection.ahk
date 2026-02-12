#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationLink.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationLinkCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationLinkCollection
     * @type {Guid}
     */
    static IID => Guid("{f8bc0e93-fb55-4f28-b9fa-b1c274153292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByRemoteId", "FindNext", "get_Count"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * Creates a change notification handle and sets up initial change notification filter conditions. (Unicode)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a> can monitor the specified directory or subtree by using the handle returned by the 
     * <b>FindFirstChangeNotification</b> function. A wait is satisfied when one of the filter conditions occurs in the monitored directory or subtree.
     * 
     * After the wait has been satisfied, the application can respond to this condition and continue monitoring the directory by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findnextchangenotification">FindNextChangeNotification</a> function and the appropriate wait function. When the handle is no longer needed, it can be closed by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findclosechangenotification">FindCloseChangeNotification</a> function.
     * 
     * Notifications may not be returned when calling <b>FindFirstChangeNotification</b> for a remote file system. 
     * 
     * Symbolic link behavior—If the path points to a symbolic link, the notification handle is created for the target.
     * 
     * If an application has registered to receive change notifications for a directory that contains symbolic links, the application is only notified when the symbolic links have been changed, not the target files.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * See remark
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Application might experience false positives on CsvFs pause/resume.
     * @returns {IContactAggregationLink} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-findfirstchangenotificationw
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppServerContactLink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteId 
     * @returns {IContactAggregationLink} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteId) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(4, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteId, "ptr*", &ppServerContactLink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * Requests that the operating system signal a change notification handle the next time it detects an appropriate change.
     * @remarks
     * After the 
     * <b>FindNextChangeNotification</b> function returns successfully, the application can wait for notification that a change has occurred by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/wait-functions">wait functions</a>.
     * 
     * If a change occurs after a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findfirstchangenotificationa">FindFirstChangeNotification</a> but before a call to 
     * <b>FindNextChangeNotification</b>, the operating system records the change. When 
     * <b>FindNextChangeNotification</b> is executed, the recorded change immediately satisfies a wait for the change notification.
     * 
     * Each successful call to **FindNextChangeNotification** must be followed by a call to one of the wait functions. If the wait function returns for any reason other than the change notification handle being signaled (for example, if the wait times out), the application must retry the wait. Failing to follow this rule can cause the system to eventually run out of resources. It can also cause the application to miss some change notifications.
     * 
     * When <i>hChangeHandle</i> is no longer needed, close it by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-findclosechangenotification">FindCloseChangeNotification</a> function.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * See remark
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Application might experience false positives on CsvFs pause/resume.
     * @returns {IContactAggregationLink} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-findnextchangenotification
     */
    FindNext() {
        result := ComCall(5, this, "ptr*", &ppServerContactLink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(6, this, "uint*", &pCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pCount
    }
}
