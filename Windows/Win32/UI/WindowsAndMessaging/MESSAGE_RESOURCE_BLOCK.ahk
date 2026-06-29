#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about message strings with identifiers in the range indicated by the LowId and HighId members.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-message_resource_block
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MESSAGE_RESOURCE_BLOCK {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The lowest message identifier contained within this structure.
     */
    LowId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The highest message identifier contained within this structure.
     */
    HighId : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset, in bytes, from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_data">MESSAGE_RESOURCE_DATA</a> structure to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_entry">MESSAGE_RESOURCE_ENTRY</a> structures in this <b>MESSAGE_RESOURCE_BLOCK</b>. The <b>MESSAGE_RESOURCE_ENTRY</b> structures contain the message strings.
     */
    OffsetToEntries : UInt32

}
