#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains fields that specify the information in a Reservation Notification Log page.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_reservation_notification_log
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_RESERVATION_NOTIFICATION_LOG extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A 64-bit incrementing Reservation Notification log page count, indicating a unique identifier for this notification.
     * 
     * The count starts at `0h` following a controller reset, is incremented with each unique log entry, and rolls over to zero when the maximum count is reached and a log page is created. A value of `0h` indicates an empty log entry.
     * @type {Integer}
     */
    LogPageCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A [NVME_RESERVATION_NOTIFICATION_TYPES](ne-nvme-nvme_reservation_notification_types.md) value that indicates the Reservation Notification type described by this log page.
     * @type {Integer}
     */
    LogPageType {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * Indicates the number of additional available Reservation Notification log pages (for example, the number of unread log pages not counting this one).
     * 
     * If there are more than 255 additional available log pages, a value of `255` is returned. A value of zero indicates that there are no additional available log pages.
     * @type {Integer}
     */
    AvailableLogPageCount {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved0{
        get {
            if(!this.HasProp("__Reserved0ProxyArray"))
                this.__Reserved0ProxyArray := Win32FixedArray(this.ptr + 10, 1, Primitive, "char")
            return this.__Reserved0ProxyArray
        }
    }

    /**
     * Indicates the namespace ID of the namespace associated with the Reservation Notification described by this log page.
     * @type {Integer}
     */
    NameSpaceId {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A reserved field.
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }
}
