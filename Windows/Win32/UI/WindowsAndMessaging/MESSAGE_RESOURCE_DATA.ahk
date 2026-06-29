#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MESSAGE_RESOURCE_BLOCK.ahk" { MESSAGE_RESOURCE_BLOCK }

/**
 * Contains information about formatted text for display as an error message or in a message box in a message table resource.
 * @remarks
 * A <b>MESSAGE_RESOURCE_DATA</b> structure can contain one or more 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a> structures, which can each contain one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_entry">MESSAGE_RESOURCE_ENTRY</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-message_resource_data
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct MESSAGE_RESOURCE_DATA {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a> structures.
     */
    NumberOfBlocks : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a>[1]</b>
     * 
     * An array of structures. The array is the size indicated by the 
     * 					<b>NumberOfBlocks</b>  member.
     */
    Blocks : MESSAGE_RESOURCE_BLOCK[1]

}
