#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes the overall possible effect of an Admin or I/O command, including any optional features of the command.
 * @remarks
 * Host software may take command effects into account when determining how to submit commands and actions to take after the command is complete. If a command changes a particular capability. the host software should re-enumerate and/or re-initialize the associated capability after the command is complete.
  * 
  * For example, if a namespace capability change may occur, then the host software should pause the use of the associated namespace, submit the command that may cause a namespace capability change and wait for its completion, and then re-issue the Identify command.
 * @see https://learn.microsoft.com/windows/win32/api/nvme/ns-nvme-nvme_command_effects_data
 * @namespace Windows.Win32.Storage.Nvme
 * @version v4.0.30319
 */
class NVME_COMMAND_EFFECTS_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AsUlong {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
