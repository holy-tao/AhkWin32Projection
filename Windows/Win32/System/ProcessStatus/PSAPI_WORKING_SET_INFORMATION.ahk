#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PSAPI_WORKING_SET_BLOCK.ahk

/**
 * Contains working set information for a process.
 * @see https://docs.microsoft.com/windows/win32/api//psapi/ns-psapi-psapi_working_set_information
 * @namespace Windows.Win32.System.ProcessStatus
 * @version v4.0.30319
 */
class PSAPI_WORKING_SET_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the <b>WorkingSetInfo</b> array.
     * @type {Pointer}
     */
    NumberOfEntries {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/psapi/ns-psapi-psapi_working_set_block">PSAPI_WORKING_SET_BLOCK</a> elements, one for each page in the process working set.
     * @type {Array<PSAPI_WORKING_SET_BLOCK>}
     */
    WorkingSetInfo{
        get {
            if(!this.HasProp("__WorkingSetInfoProxyArray"))
                this.__WorkingSetInfoProxyArray := Win32FixedArray(this.ptr + 8, 1, PSAPI_WORKING_SET_BLOCK, "")
            return this.__WorkingSetInfoProxyArray
        }
    }
}
