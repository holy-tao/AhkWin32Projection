#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEV_BROADCAST_VOLUME_FLAGS.ahk" { DEV_BROADCAST_VOLUME_FLAGS }

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
 */
export default struct DEV_BROADCAST_VOLUME {
    #StructPack 4

    /**
     * The size of this structure, in bytes.
     */
    dbcv_size : UInt32

    /**
     * Set to <b>DBT_DEVTYP_VOLUME</b> (2).
     */
    dbcv_devicetype : UInt32

    /**
     * Reserved; do not use.
     */
    dbcv_reserved : UInt32

    /**
     * The logical unit mask identifying one or more logical units. Each bit in the mask corresponds to one 
     *       logical drive. Bit 0 represents drive A, bit 1 represents drive B, and so on.
     */
    dbcv_unitmask : UInt32

    dbcv_flags : DEV_BROADCAST_VOLUME_FLAGS

}
