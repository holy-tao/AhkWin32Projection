#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Extra parameters for notifications.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_notification_parameters
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_NOTIFICATION_PARAMETERS extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NotificationMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    FileDeletedOnHandleClose {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
