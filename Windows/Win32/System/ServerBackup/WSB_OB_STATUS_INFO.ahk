#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSB_OB_STATUS_ENTRY.ahk" { WSB_OB_STATUS_ENTRY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information to update the cloud backup provider status in the Windows Server Backup MMC snap-in.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_info
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct WSB_OB_STATUS_INFO {
    #StructPack 8

    /**
     * The snap-in identifier of the cloud backup provider registered with Windows Server Backup.
     */
    m_guidSnapinId : Guid

    /**
     * The number of status entries contained in the <b>m_rgStatusEntry</b> member. The maximum number of entries allowed is five.
     */
    m_cStatusEntry : UInt32

    /**
     * A pointer to one or more <a href="https://docs.microsoft.com/windows/desktop/api/wsbonline/ns-wsbonline-wsb_ob_status_entry">WSB_OB_STATUS_ENTRY</a> structures, each  containing cloud backup provider status information  for one entry to be shown in the Windows Server Backup MMC snap-in.
     */
    m_rgStatusEntry : WSB_OB_STATUS_ENTRY.Ptr

}
