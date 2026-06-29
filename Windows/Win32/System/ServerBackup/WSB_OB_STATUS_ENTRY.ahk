#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR.ahk" { WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR }

/**
 * Contains status information for one entry to be shown in the Windows Server Backup MMC snap-in.
 * @remarks
 * The resources indicated by the resource IDs contained in the <b>m_dwIcon</b>, 
 *       <b>m_dwStatusEntryName</b> and <b>m_dwStatusEntryValue</b> members will 
 *       be loaded from the same DLL provided by the cloud backup provider during its registration with Windows Server 
 *       Backup. For example, an entry name resource ID could point to the string "Total Backups:" or an 
 *       entry value resource ID could point to the string "%0 copies".
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_entry
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct WSB_OB_STATUS_ENTRY {
    #StructPack 8

    /**
     * The resource identifier of the icon to be shown with the status entry. A value of zero indicates no icon is 
     *       to be shown.
     */
    m_dwIcon : UInt32

    /**
     * The resource identifier of the name of the status entry.
     */
    m_dwStatusEntryName : UInt32

    /**
     * The resource identifier of the value of the status entry.
     */
    m_dwStatusEntryValue : UInt32

    /**
     * The number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_entry_value_type_pair">WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR</a> 
     *       structures pointed to by the <b>m_rgValueTypePair</b> member.
     */
    m_cValueTypePair : UInt32

    /**
     * The list of parameters used to expand the value string contained in the 
     *       <b>m_dwStatusEntryValue</b> member.
     */
    m_rgValueTypePair : WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR.Ptr

}
