#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a notification mapping, which is a pairing between a directory (referred to as a &quot;notification root&quot;) and a set of notifications, expressed as a bit mask.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//projectedfslib/ns-projectedfslib-prj_notification_mapping
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_NOTIFICATION_MAPPING extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A bit mask representing a set of notifications.
     * @type {Integer}
     */
    NotificationBitMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The directory that the notification mapping is paired to.
     * @type {PWSTR}
     */
    NotificationRoot {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
