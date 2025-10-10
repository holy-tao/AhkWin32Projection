#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about message strings with identifiers in the range indicated by the LowId and HighId members.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-message_resource_block
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MESSAGE_RESOURCE_BLOCK extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The lowest message identifier contained within this structure.
     * @type {Integer}
     */
    LowId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The highest message identifier contained within this structure.
     * @type {Integer}
     */
    HighId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset, in bytes, from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_data">MESSAGE_RESOURCE_DATA</a> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_entry">MESSAGE_RESOURCE_ENTRY</a> structures in this <b>MESSAGE_RESOURCE_BLOCK</b>. The <b>MESSAGE_RESOURCE_ENTRY</b> structures contain the message strings.
     * @type {Integer}
     */
    OffsetToEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
