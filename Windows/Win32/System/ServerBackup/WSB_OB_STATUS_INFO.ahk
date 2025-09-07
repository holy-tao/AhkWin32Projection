#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information to update the cloud backup provider status in the Windows Server Backup MMC snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_info
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class WSB_OB_STATUS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The snap-in identifier of the cloud backup provider registered with Windows Server Backup.
     * @type {Pointer<Guid>}
     */
    m_guidSnapinId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of status entries contained in the <b>m_rgStatusEntry</b> member. The maximum number of entries allowed is five.
     * @type {Integer}
     */
    m_cStatusEntry {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsbonline/ns-wsbonline-wsb_ob_status_entry">WSB_OB_STATUS_ENTRY</a> structures, each  containing cloud backup provider status information  for one entry to be shown in the Windows Server Backup MMC snap-in.
     * @type {Pointer<WSB_OB_STATUS_ENTRY>}
     */
    m_rgStatusEntry {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
