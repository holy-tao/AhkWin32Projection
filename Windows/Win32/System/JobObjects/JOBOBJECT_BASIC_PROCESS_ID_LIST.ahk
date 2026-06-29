#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the process identifier list for a job object.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-jobobject_basic_process_id_list
 * @namespace Windows.Win32.System.JobObjects
 */
export default struct JOBOBJECT_BASIC_PROCESS_ID_LIST {
    #StructPack 8

    /**
     * The number of process identifiers to be stored in <b>ProcessIdList</b>.
     */
    NumberOfAssignedProcesses : UInt32

    /**
     * The number of process identifiers returned in the <b>ProcessIdList</b> buffer. If this number is less than <b>NumberOfAssignedProcesses</b>, increase the size of the buffer to accommodate the complete list.
     */
    NumberOfProcessIdsInList : UInt32

    /**
     * A variable-length array of process identifiers returned by this call. Array elements 0 through <b>NumberOfProcessIdsInList</b>– 1 contain valid process identifiers.
     */
    ProcessIdList : IntPtr[1]

}
