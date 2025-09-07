#Requires AutoHotkey v2.0.0 64-bit

/**
 * A notification value specified when sending the notification in a callback.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_notification
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_NOTIFICATION{

    /**
     * - Indicates that a handle has been created to an existing file or folder.
 * - The provider can specify a new notification mask for this file or folder when responding to the notification.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_OPENED => 2

    /**
     * - A new file or folder has been created.
 * - The provider can specify a new notification mask for this file or folder when responding to the notification.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_NEW_FILE_CREATED => 4

    /**
     * - An existing file has been overwritten or superceded.
 * - The provider can specify a new notification mask for this file or folder when responding to the notification.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_OVERWRITTEN => 8

    /**
     * - A file or folder is about to be deleted.
 * - If the provider returns an error HRESULT code from the callback, the delete will not take effect.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_PRE_DELETE => 16

    /**
     * - A file or folder is about to be renamed.
 * - If the provider returns an error HRESULT code from the callback, the rename will not take effect.
 * - If the callbackData-&gt;FilePathName parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> is an empty string, this indicates that the rename is moving the file/directory from outside the virtualization instance. In that case, this notification will always be sent if the provider has registered a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> callback, even if the provider did not specify this bit when registering the subtree containing the destination path. However if the provider specified PRJ_NOTIFICATION_SUPPRESS_NOTIFICATIONS when registering the subtree containing the destination path, the notification will be suppressed. 
 * - If the destinationFileName parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> is an empty string, this indicates that the rename is moving the file/folder out of the virtualization instance. 
 * - If both the callbackData-&gt;FilePathName and destinationFileName parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> are non-empty strings, this indicates that the rename is within the virtualization instance. If the provider specified different notification masks for the source and destination paths in the NotificationMappings member of the options parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>, then this notification will be sent if the provider specified this bit when registering either the source or destination paths.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_PRE_RENAME => 32

    /**
     * - A hard link is about to be created for the file.
 * - If the provider returns an error HRESULT code from the callback, the hard link operation will not take effect. 
 * - If the callbackData-&gt;FilePathName parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> is an empty string, this indicates that the hard link name will be created inside the virtualization instance, i.e. a new hard link is being created inside the virtualization instance to a file that exists outside the virtualization instance. In that case, this notification will always be sent if the provider has registered a <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> callback, even if the provider did not specify this bit when registering the subtree where the new hard link name will be. However if the provider specified PRJ_NOTIFICATION_SUPPRESS_NOTIFICATIONS when registering the subtree containing the destination path, the notification will be suppressed.
 * - If the destinationFileName parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> is an empty string, this indicates that the hard link name will be created outside the virtualization instance, i.e. a new hard link is being created outside the virtualization instance for a file that exists inside the virtualization instance. 
 * - If both the callbackData-&gt;FilePathName and destinationFileName parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> are non-empty strings, this indicates that the new hard link will be created within the virtualization instance for a file that exists within the virtualization instance. If the provider specified different notification masks for the source and destination paths in the NotificationMappings member of the options parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>, then this notification will be sent if the provider specified this bit when registering either the source or destination paths.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_PRE_SET_HARDLINK => 64

    /**
     * - Indicates that a file/folder has been renamed. The file/folder may have been moved into the virtualization instance.
 * - If the callbackData-&gt;FilePathName parameter of PRJ_NOTIFICATION_CB is an empty string, this indicates that the rename moved the file/directory from outside the virtualization instance. In that case ProjFS will always send this notification if the provider has registered a PRJ_NOTIFICATION_CB callback, even if the provider did not specify this bit when registering the subtree containing the destination path. 
 * - If the destinationFileName parameter of PRJ_NOTIFICATION_CB is an empty string, this indicates that the rename moved the file/directory out of the virtualization instance. 
 * - If both the callbackData-&gt;FilePathName and destinationFileName parameters of PRJ_NOTIFICATION_CB are non-empty strings, this indicates that the rename was within the virtualization instance. If the provider specified different notification masks for the source and destination paths in the NotificationMappings member of the options parameter of PrjStartVirtualizing, then ProjFS will send this notification if the provider specified this bit when registering either the source or destination paths.
 * - The provider can specify a new notification mask for this file/directory when responding to the notification.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_RENAMED => 128

    /**
     * - Indicates that a hard link has been created for the file. 
 * - If the callbackData-&gt;FilePathName parameter of PRJ_NOTIFICATION_CB is an empty string, this indicates that the hard link name was created inside the virtualization instance, i.e. a new hard link was created inside the virtualization instance to a file that exists outside the virtualization instance. In that case ProjFS will always send this notification if the provider has registered a PRJ_NOTIFICATION_CB callback, even if the provider did not specify this bit when registering the subtree where the new hard link name will be. 
 * - If the destinationFileName parameter of PRJ_NOTIFICATION_CB is an empty string, this indicates that the hard link name was created outside the virtualization instance, i.e. a new hard link was created outside the virtualization instance for a file that exists inside the virtualization instance. 
 * - If both the callbackData-&gt;FilePathName and destinationFileName parameters of PRJ_NOTIFICATION_CB are non-empty strings, this indicates that the a new hard link was created within the virtualization instance for a file that exists within the virtualization instance. If the provider specified different notification masks for the source and destination paths in the NotificationMappings member of the options parameter of PrjStartVirtualizing, then ProjFS will send this notification if the provider specified this bit when registering either the source or destination paths.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_HARDLINK_CREATED => 256

    /**
     * - A handle has been closed on the file/folder, and the file's content was not modified while the handle was open, and the file/folder was not deleted
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_NO_MODIFICATION => 512

    /**
     * - A handle has been closed on the file, and that the file's content was modified while the handle was open.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED => 1024

    /**
     * - A handle has been closed on the file/folder, and that it was deleted as part of closing the handle. 
 * - If the provider also registered to receive PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_MODIFIED notifications, and the file was modified using the handle whose close resulted in deleting the file, then the operationParameters-&gt;FileDeletedOnHandleClose.IsFileModified parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_notification_cb">PRJ_NOTIFICATION_CB</a> will be TRUE. This applies only to files, not directories
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_HANDLE_CLOSED_FILE_DELETED => 2048

    /**
     * - The file is about to be expanded from a placeholder to a full file, i.e. its contents are likely to be modified.
 * - If the provider returns an error HRESULT code from the callback, the file will not be expanded to a full file, and the I/O that triggered the conversion will fail.
 * - If there are multiple racing I/Os that would expand the same file, the provider will receive this notification value only once for the file.
     * @type {Integer (Int32)}
     */
    static PRJ_NOTIFICATION_FILE_PRE_CONVERT_TO_FULL => 4096
}
