#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Types of notifications describing a change to the file or folder.
 * @remarks
 * ProjFS can send notifications of file system activity to a provider. When the provider starts a virtualization instance it specifies which notifications it wishes to receive. It may also specify a new set of notifications for a file when it is created or renamed. The provider must register a PRJ_NOTIFICATION_CB notification callback routine in the callbacks parameter of PrjStartVirtualizing in order to receive notifications. 
 * 
 * ProjFS sends notifications for files and directories within an active virtualization root. That is, ProjFS will send notifications for the virtualization root and its descendants. Symbolic links and junctions within the virtualization root are not traversed when determining what constitutes a descendant of the virtualization root. 
 * 
 * ProjFS sends notifications only for the primary data stream of a file. ProjFS does not send notifications for operations on alternate data streams. 
 * 
 * ProjFS does not send notifications for an inactive virtualization instance. A virtualization instance is inactive if any one of the following is true: 
 * 
 * - The provider has not yet started it by calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>.
 * - The provider has stopped the instance by calling <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstopvirtualizing">PrjStopVirtualizing</a>.
 * - The provider process has exited
 *  
 * The provider may specify which notifications it wishes to receive when starting a virtualization instance, or in response to a notification that allows a new notification mask to be set. 
 * 
 * The provider specifies a default set of notifications that it wants ProjFS to send for the virtualization instance when it starts the instance. This set of notifications is provided in the NotificationMappings member of the options parameter of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>, which may specify different notification masks for different subtrees of the virtualization instance. 
 * 
 * The provider may choose to supply a different notification mask in response to a notification of file open, create, supersede/overwrite, or rename. ProjFS will continue to send these notifications for the given file until all handles to the file are closed. After that it will revert to the default set of notifications. Naturally if the default set of notifications does not specify that ProjFS should notify for open, create, etc., the provider will not get the opportunity to specify a different mask for those operations.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ne-projectedfslib-prj_notify_types
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
class PRJ_NOTIFY_TYPES extends Win32BitflagEnum {

    /**
     * No notification.
     * Native name: PRJ_NOTIFY_NONE
     * @type {Integer (UInt32)}
     */
    static NONE => 0

    /**
     * If specified on virtualization instance start:
     * 
     * - This indicates that notifications should not be sent for the virtualization instance, or a specified subtree of the instance.
     * 
     * If specified in response to a notification:
     * 
     * - This indicates that notifications should not be sent for the specified file or folder until all handles to it are closed.
     * 
     * <div class="alert"><b>Note</b>  If this bit appears in a notification mask, it overrides all other bits in the mask. For example, a valid mask with this bit is treated as containing only PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS.</div>
     * <div> </div>
     * Native name: PRJ_NOTIFY_SUPPRESS_NOTIFICATIONS
     * @type {Integer (UInt32)}
     */
    static SUPPRESS_NOTIFICATIONS => 1

    /**
     * If specified on virtualization instance start:
     * 
     * - This indicates that the provider should be notified when a handle is created to an existing file or folder.
     * 
     * If specified in response to a notification:
     * 
     * - This indicates that the provider should be notified if any further handles are created to the file or folder.
     * Native name: PRJ_NOTIFY_FILE_OPENED
     * @type {Integer (UInt32)}
     */
    static FILE_OPENED => 2

    /**
     * If specified on virtualization instance start:
     * 
     * - The provider should be notified when a new file or folder is created.
     * 
     * If specified in response to a notification:
     * 
     * - No effect.
     * Native name: PRJ_NOTIFY_NEW_FILE_CREATED
     * @type {Integer (UInt32)}
     */
    static NEW_FILE_CREATED => 4

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified when an existing when an existing file is overwritten or superceded.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified when the file or folder is overwritten or superceded.
     * Native name: PRJ_NOTIFY_FILE_OVERWRITTEN
     * @type {Integer (UInt32)}
     */
    static FILE_OVERWRITTEN => 8

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified when a file or folder is about to be deleted.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified when a file or folder is about to be deleted.
     * Native name: PRJ_NOTIFY_PRE_DELETE
     * @type {Integer (UInt32)}
     */
    static PRE_DELETE => 16

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified when a file or folder is about to be renamed.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified when a file or folder is about to be renamed.
     * Native name: PRJ_NOTIFY_PRE_RENAME
     * @type {Integer (UInt32)}
     */
    static PRE_RENAME => 32

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified when a hard link is about to be created for a file.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified when a hard link is about to be created for a file.
     * Native name: PRJ_NOTIFY_PRE_SET_HARDLINK
     * @type {Integer (UInt32)}
     */
    static PRE_SET_HARDLINK => 64

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified that a file or folder has been renamed.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified when a file or folder has been renamed.
     * Native name: PRJ_NOTIFY_FILE_RENAMED
     * @type {Integer (UInt32)}
     */
    static FILE_RENAMED => 128

    /**
     * If specified on virtualization instance start:
     * 
     * - Indicates that the provider should be notified that a hard link has been created for a file.
     * 
     * If specified in response to a notification:
     * 
     * - Indicates that the provider should be notified that a hard link has been created for the file.
     * Native name: PRJ_NOTIFY_HARDLINK_CREATED
     * @type {Integer (UInt32)}
     */
    static HARDLINK_CREATED => 256

    /**
     * If specified on virtualization instance start:
     * 
     * - The provider should be notified when a handle is closed on a file/folder and the closing handle neither modified nor deleted it.
     * 
     * If specified in response to a notification:
     * 
     * - The provider should be notified when handles are closed for the file/folder and there were no modifications or deletions associated with the closing handle.
     * Native name: PRJ_NOTIFY_FILE_HANDLE_CLOSED_NO_MODIFICATION
     * @type {Integer (UInt32)}
     */
    static FILE_HANDLE_CLOSED_NO_MODIFICATION => 512

    /**
     * If specified on virtualization instance start:
     * 
     * - The provider should be notified when a handle is closed on a file/folder and the closing handle was used to modify it.
     * 
     * If specified in response to a notification:
     * 
     * - The provider should be notified when a handle is closed on the file/folder and the closing handle was used to modify it.
     * Native name: PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_MODIFIED
     * @type {Integer (UInt32)}
     */
    static FILE_HANDLE_CLOSED_FILE_MODIFIED => 1024

    /**
     * If specified on virtualization instance start:
     * 
     * - The provider should be notified when a handle is closed on a file/folder and it is deleted as part of closing the handle.
     * 
     * If specified in response to a notification:
     * 
     * - The provider should be notified when a handle is closed on the file/folder and it is deleted as part of closing the handle.
     * Native name: PRJ_NOTIFY_FILE_HANDLE_CLOSED_FILE_DELETED
     * @type {Integer (UInt32)}
     */
    static FILE_HANDLE_CLOSED_FILE_DELETED => 2048

    /**
     * If specified on virtualization instance start:
     * 
     * - The provider should be notified when it is about to convert a placeholder to a full file.
     * 
     * If specified in response to a notification:
     * 
     * - The provider should be notified when it is about to convert the placeholder to a full file, assuming it is a placeholder and not already a full file.
     * Native name: PRJ_NOTIFY_FILE_PRE_CONVERT_TO_FULL
     * @type {Integer (UInt32)}
     */
    static FILE_PRE_CONVERT_TO_FULL => 4096

    /**
     * If specified on virtualization instance start:
     * 
     * - This value is not valid on virtualization instance start.
     * 
     * If specified in response to a notification:
     * 
     * -  Continue to use the existing set of notifications for this file/folder.
     * Native name: PRJ_NOTIFY_USE_EXISTING_MASK
     * @type {Integer (UInt32)}
     */
    static USE_EXISTING_MASK => 4294967295
}
