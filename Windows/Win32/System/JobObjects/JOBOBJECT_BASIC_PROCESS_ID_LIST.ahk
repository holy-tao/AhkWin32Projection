#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the process identifier list for a job object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_process_id_list
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_BASIC_PROCESS_ID_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of process identifiers to be stored in <b>ProcessIdList</b>.
     * @type {Integer}
     */
    NumberOfAssignedProcesses {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of process identifiers returned in the <b>ProcessIdList</b> buffer. If this number is less than <b>NumberOfAssignedProcesses</b>, increase the size of the buffer to accommodate the complete list.
     * @type {Integer}
     */
    NumberOfProcessIdsInList {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A variable-length array of process identifiers returned by this call. Array elements 0 through <b>NumberOfProcessIdsInList</b>– 1 contain valid process identifiers.
     * @type {Array<UIntPtr>}
     */
    ProcessIdList{
        get {
            if(!this.HasProp("__ProcessIdListProxyArray"))
                this.__ProcessIdListProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__ProcessIdListProxyArray
        }
    }
}
