#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PSAPI_WORKING_SET_EX_BLOCK.ahk

/**
 * Contains extended working set information for a process.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_working_set_ex_information
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WORKING_SET_EX_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The virtual address.
     * @type {Pointer<Void>}
     */
    VirtualAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_ex_block">PSAPI_WORKING_SET_EX_BLOCK</a> union that indicates the attributes of the page at <b>VirtualAddress</b>.
     * @type {PSAPI_WORKING_SET_EX_BLOCK}
     */
    VirtualAttributes{
        get {
            if(!this.HasProp("__VirtualAttributes"))
                this.__VirtualAttributes := PSAPI_WORKING_SET_EX_BLOCK(this.ptr + 8)
            return this.__VirtualAttributes
        }
    }
}
