#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MESSAGE_RESOURCE_BLOCK.ahk

/**
 * Contains information about formatted text for display as an error message or in a message box in a message table resource.
 * @remarks
 * 
 * A <b>MESSAGE_RESOURCE_DATA</b> structure can contain one or more 
 * 				<a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a> structures, which can each contain one or more <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_entry">MESSAGE_RESOURCE_ENTRY</a> structures.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-message_resource_data
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MESSAGE_RESOURCE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a> structures.
     * @type {Integer}
     */
    NumberOfBlocks {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-message_resource_block">MESSAGE_RESOURCE_BLOCK</a>[1]</b>
     * 
     * An array of structures. The array is the size indicated by the 
     * 					<b>NumberOfBlocks</b>  member.
     * @type {Array<MESSAGE_RESOURCE_BLOCK>}
     */
    Blocks{
        get {
            if(!this.HasProp("__BlocksProxyArray"))
                this.__BlocksProxyArray := Win32FixedArray(this.ptr + 8, 1, MESSAGE_RESOURCE_BLOCK, "")
            return this.__BlocksProxyArray
        }
    }
}
