#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PRJ_NOTIFY_TYPES.ahk" { PRJ_NOTIFY_TYPES }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Describes a notification mapping, which is a pairing between a directory (referred to as a &quot;notification root&quot;) and a set of notifications, expressed as a bit mask.
 * @remarks
 * PRJ_NOTIFICATION_MAPPING describes a "notification mapping", which is a pairing between a directory (referred to as a "notification root") and a set of notifications, expressed as a bit mask, which ProjFS should send for that directory and its descendants. A notification mapping can also be established for a single file. 
 * 
 * 
 * The provider puts an array of zero or more PRJ_NOTIFICATION_MAPPING structures in the NotificationMappings member of the options parameter of PrjStartVirtualizing to configure notifications for the virtualization root. 
 * 
 * 
 * If the provider does not specify any notification mappings, ProjFS will default to sending the notifications PRJ_NOTIFICATION_FILE_OPENED, PRJ_NOTIFICATION_NEW_FILE_CREATED, and PRJ_NOTIFICATION_FILE_OVERWRITTEN for all files and directories in the virtualization instance. 
 * 
 * 
 * The directory or file is specified relative to the virtualization root, with an empty string representing the virtualization root itself. 
 * 
 * 
 * If the provider specifies multiple notification mappings, and some are descendants of others, the mappings must be specified in descending depth. Notification mappings at deeper levels override higher-level ones for their descendants.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_notification_mapping
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_NOTIFICATION_MAPPING {
    #StructPack 8

    /**
     * A bit mask representing a set of notifications.
     */
    NotificationBitMask : PRJ_NOTIFY_TYPES

    /**
     * The directory that the notification mapping is paired to.
     */
    NotificationRoot : PWSTR

}
