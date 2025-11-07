#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains status information for one entry to be shown in the Windows Server Backup MMC snap-in.
 * @remarks
 * 
 * The resources indicated by the resource IDs contained in the <b>m_dwIcon</b>, 
 *       <b>m_dwStatusEntryName</b> and <b>m_dwStatusEntryValue</b> members will 
 *       be loaded from the same DLL provided by the cloud backup provider during its registration with Windows Server 
 *       Backup. For example, an entry name resource ID could point to the string "Total Backups:" or an 
 *       entry value resource ID could point to the string "%0 copies".
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wsbonline/ns-wsbonline-wsb_ob_status_entry
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class WSB_OB_STATUS_ENTRY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The resource identifier of the icon to be shown with the status entry. A value of zero indicates no icon is 
     *       to be shown.
     * @type {Integer}
     */
    m_dwIcon {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The resource identifier of the name of the status entry.
     * @type {Integer}
     */
    m_dwStatusEntryName {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The resource identifier of the value of the status entry.
     * @type {Integer}
     */
    m_dwStatusEntryValue {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_entry_value_type_pair">WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR</a> 
     *       structures pointed to by the <b>m_rgValueTypePair</b> member.
     * @type {Integer}
     */
    m_cValueTypePair {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The list of parameters used to expand the value string contained in the 
     *       <b>m_dwStatusEntryValue</b> member.
     * @type {Pointer<WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR>}
     */
    m_rgValueTypePair {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
