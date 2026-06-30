#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSB_OB_STATUS_ENTRY.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information to update the cloud backup provider status in the Windows Server Backup MMC snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_info
 * @namespace Windows.Win32.System.ServerBackup
 */
class WSB_OB_STATUS_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * The snap-in identifier of the cloud backup provider registered with Windows Server Backup.
     * @type {Guid}
     */
    m_guidSnapinId {
        get {
            if(!this.HasProp("__m_guidSnapinId"))
                this.__m_guidSnapinId := Guid(0, this)
            return this.__m_guidSnapinId
        }
    }

    /**
     * The number of status entries contained in the <b>m_rgStatusEntry</b> member. The maximum number of entries allowed is five.
     * @type {Integer}
     */
    m_cStatusEntry {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsbonline/ns-wsbonline-wsb_ob_status_entry">WSB_OB_STATUS_ENTRY</a> structures, each  containing cloud backup provider status information  for one entry to be shown in the Windows Server Backup MMC snap-in.
     * @type {Pointer<WSB_OB_STATUS_ENTRY>}
     */
    m_rgStatusEntry {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
