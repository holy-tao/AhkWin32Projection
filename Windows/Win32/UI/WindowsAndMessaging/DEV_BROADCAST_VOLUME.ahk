#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a logical volume.
 * @remarks
 * Although the <b>dbcv_unitmask</b> member may specify more than one volume in any message, 
  *     this does not guarantee that only one message is generated for a specified event. Multiple system features may 
  *     independently generate messages for logical volumes at the same time.
  * 
  * Messages for media arrival and removal are sent only for media in devices that support a soft-eject mechanism. 
  *     For example, applications will not see media-related volume messages for floppy disks.
  * 
  * Messages for network drive arrival and removal are not sent whenever network commands are issued, but rather 
  *     when network connections will disappear as the result of a hardware event.
 * @see https://learn.microsoft.com/windows/win32/api/dbt/ns-dbt-dev_broadcast_volume
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DEV_BROADCAST_VOLUME extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    dbcv_size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Set to <b>DBT_DEVTYP_VOLUME</b> (2).
     * @type {Integer}
     */
    dbcv_devicetype {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    dbcv_reserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The logical unit mask identifying one or more logical units. Each bit in the mask corresponds to one 
     *       logical drive. Bit 0 represents drive A, bit 1 represents drive B, and so on.
     * @type {Integer}
     */
    dbcv_unitmask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    dbcv_flags {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }
}
