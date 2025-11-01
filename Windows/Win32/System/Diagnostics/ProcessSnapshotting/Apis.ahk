#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class ProcessSnapshotting {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static PSS_PERF_RESOLUTION => 1000000
;@endregion Constants

;@region Methods
    /**
     * Captures a snapshot of a target process.
     * @param {HANDLE} ProcessHandle A handle to the target process.
     * @param {Integer} CaptureFlags Flags that specify what to capture. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_capture_flags">PSS_CAPTURE_FLAGS</a>.
     * @param {Integer} ThreadContextFlags The <b>CONTEXT</b> record flags to capture if <i>CaptureFlags</i> specifies thread contexts.
     * @param {Pointer<HPSS>} SnapshotHandle A handle to the snapshot that this function captures.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success.
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psscapturesnapshot
     * @since windows8.1
     */
    static PssCaptureSnapshot(ProcessHandle, CaptureFlags, ThreadContextFlags, SnapshotHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        result := DllCall("KERNEL32.dll\PssCaptureSnapshot", "ptr", ProcessHandle, "uint", CaptureFlags, "uint", ThreadContextFlags, "ptr", SnapshotHandle, "uint")
        return result
    }

    /**
     * Frees a snapshot.
     * @param {HANDLE} ProcessHandle A handle to the process that contains the snapshot. The handle must have <b>PROCESS_VM_READ</b>, <b>PROCESS_VM_OPERATION</b>, and <b>PROCESS_DUP_HANDLE</b> rights. If the snapshot was captured from the current process, or duplicated into the current process, then pass in the result of <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>.
     * @param {HPSS} SnapshotHandle A handle to the snapshot to free.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The remote snapshot was not created with <b>PSS_CREATE_USE_VM_ALLOCATIONS</b>.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-pssfreesnapshot
     * @since windows8.1
     */
    static PssFreeSnapshot(ProcessHandle, SnapshotHandle) {
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle
        SnapshotHandle := SnapshotHandle is Win32Handle ? NumGet(SnapshotHandle, "ptr") : SnapshotHandle

        result := DllCall("KERNEL32.dll\PssFreeSnapshot", "ptr", ProcessHandle, "ptr", SnapshotHandle, "uint")
        return result
    }

    /**
     * Queries the snapshot.
     * @param {HPSS} SnapshotHandle A handle to the snapshot to query.
     * @param {Integer} InformationClass An enumerator member that selects what information to query. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a>.
     * @param {Pointer} Buffer The information that this function provides.
     * @param {Integer} BufferLength The size of <i>Buffer</i>, in bytes.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer length is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified information class is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested information is not in the snapshot.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-pssquerysnapshot
     * @since windows8.1
     */
    static PssQuerySnapshot(SnapshotHandle, InformationClass, Buffer, BufferLength) {
        SnapshotHandle := SnapshotHandle is Win32Handle ? NumGet(SnapshotHandle, "ptr") : SnapshotHandle

        result := DllCall("KERNEL32.dll\PssQuerySnapshot", "ptr", SnapshotHandle, "int", InformationClass, "ptr", Buffer, "uint", BufferLength, "uint")
        return result
    }

    /**
     * Returns information from the current walk position and advanced the walk marker to the next position.
     * @param {HPSS} SnapshotHandle A handle to the snapshot.
     * @param {Integer} InformationClass The type of information to return. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a>.
     * @param {HPSSWALK} WalkMarkerHandle A handle to a walk marker. The walk marker indicates the walk position from which data is to be returned. <b>PssWalkSnapshot</b> advances the walk marker to the next walk position in time order before returning to the caller.
     * @param {Pointer<Void>} Buffer The snapshot information that this function returns.
     * @param {Integer} BufferLength The size of <i>Buffer</i>, in bytes.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_LENGTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified buffer length is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified information class is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>Buffer</i> is <b>NULL</b>, and there is data at the current position to return.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The walk has completed and there are no more items to return.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested information is not in the snapshot.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalksnapshot
     * @since windows8.1
     */
    static PssWalkSnapshot(SnapshotHandle, InformationClass, WalkMarkerHandle, Buffer, BufferLength) {
        SnapshotHandle := SnapshotHandle is Win32Handle ? NumGet(SnapshotHandle, "ptr") : SnapshotHandle
        WalkMarkerHandle := WalkMarkerHandle is Win32Handle ? NumGet(WalkMarkerHandle, "ptr") : WalkMarkerHandle

        BufferMarshal := Buffer is VarRef ? "ptr" : "ptr"

        result := DllCall("KERNEL32.dll\PssWalkSnapshot", "ptr", SnapshotHandle, "int", InformationClass, "ptr", WalkMarkerHandle, BufferMarshal, Buffer, "uint", BufferLength, "uint")
        return result
    }

    /**
     * Duplicates a snapshot handle from one process to another.
     * @param {HANDLE} SourceProcessHandle A handle to the source process from which the original snapshot was captured. The handle must have <b>PROCESS_VM_READ</b> and <b>PROCESS_DUP_HANDLE</b> rights.
     * @param {HPSS} SnapshotHandle A handle to the snapshot to duplicate. This handle must be in the context of the source process.
     * @param {HANDLE} TargetProcessHandle A handle to the target process that receives the duplicate snapshot. The handle must have <b>PROCESS_VM_OPERATION</b>, <b>PROCESS_VM_WRITE</b>, and <b>PROCESS_DUP_HANDLE</b> rights.
     * @param {Pointer<HPSS>} TargetSnapshotHandle A handle to the duplicate snapshot that this function creates, in the context of the target process.
     * @param {Integer} Flags The duplication flags. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_duplicate_flags">PSS_DUPLICATE_FLAGS</a>.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-pssduplicatesnapshot
     * @since windows8.1
     */
    static PssDuplicateSnapshot(SourceProcessHandle, SnapshotHandle, TargetProcessHandle, TargetSnapshotHandle, Flags) {
        SourceProcessHandle := SourceProcessHandle is Win32Handle ? NumGet(SourceProcessHandle, "ptr") : SourceProcessHandle
        SnapshotHandle := SnapshotHandle is Win32Handle ? NumGet(SnapshotHandle, "ptr") : SnapshotHandle
        TargetProcessHandle := TargetProcessHandle is Win32Handle ? NumGet(TargetProcessHandle, "ptr") : TargetProcessHandle

        result := DllCall("KERNEL32.dll\PssDuplicateSnapshot", "ptr", SourceProcessHandle, "ptr", SnapshotHandle, "ptr", TargetProcessHandle, "ptr", TargetSnapshotHandle, "int", Flags, "uint")
        return result
    }

    /**
     * Creates a walk marker.
     * @param {Pointer<PSS_ALLOCATOR>} Allocator A structure that provides functions to allocate and free memory.  If you provide the structure, <b>PssWalkMarkerCreate</b> uses the functions to  allocate the internal walk marker structures. Otherwise it uses the default process heap. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ns-processsnapshot-pss_allocator">PSS_ALLOCATOR</a>.
     * @param {Pointer<HPSSWALK>} WalkMarkerHandle A handle to the walk marker that this function creates.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or the following error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not allocate memory for the walk marker.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalkmarkercreate
     * @since windows8.1
     */
    static PssWalkMarkerCreate(Allocator, WalkMarkerHandle) {
        result := DllCall("KERNEL32.dll\PssWalkMarkerCreate", "ptr", Allocator, "ptr", WalkMarkerHandle, "uint")
        return result
    }

    /**
     * Frees a walk marker created by PssWalkMarkerCreate.
     * @param {HPSSWALK} WalkMarkerHandle A handle to the walk marker.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success.
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalkmarkerfree
     * @since windows8.1
     */
    static PssWalkMarkerFree(WalkMarkerHandle) {
        WalkMarkerHandle := WalkMarkerHandle is Win32Handle ? NumGet(WalkMarkerHandle, "ptr") : WalkMarkerHandle

        result := DllCall("KERNEL32.dll\PssWalkMarkerFree", "ptr", WalkMarkerHandle, "uint")
        return result
    }

    /**
     * Returns the current position of a walk marker.
     * @param {HPSSWALK} WalkMarkerHandle A  handle to the walk marker.
     * @param {Pointer<Pointer>} Position The walk marker position that this function returns.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success.
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalkmarkergetposition
     * @since windows8.1
     */
    static PssWalkMarkerGetPosition(WalkMarkerHandle, Position) {
        WalkMarkerHandle := WalkMarkerHandle is Win32Handle ? NumGet(WalkMarkerHandle, "ptr") : WalkMarkerHandle

        PositionMarshal := Position is VarRef ? "ptr*" : "ptr"

        result := DllCall("KERNEL32.dll\PssWalkMarkerGetPosition", "ptr", WalkMarkerHandle, PositionMarshal, Position, "uint")
        return result
    }

    /**
     * Sets the position of a walk marker.
     * @param {HPSSWALK} WalkMarkerHandle A handle to the walk marker.
     * @param {Pointer} Position The position to set. This is a position that the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalkmarkergetposition">PssWalkMarkerGetPosition</a> function provided.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success or one of the following error codes.
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalkmarkersetposition
     * @since windows8.1
     */
    static PssWalkMarkerSetPosition(WalkMarkerHandle, Position) {
        WalkMarkerHandle := WalkMarkerHandle is Win32Handle ? NumGet(WalkMarkerHandle, "ptr") : WalkMarkerHandle

        result := DllCall("KERNEL32.dll\PssWalkMarkerSetPosition", "ptr", WalkMarkerHandle, "ptr", Position, "uint")
        return result
    }

    /**
     * Rewinds a walk marker back to the beginning.
     * @param {HPSSWALK} WalkMarkerHandle A handle to the walk marker.
     * @returns {Integer} This function returns <b>ERROR_SUCCESS</b> on success.
     * 
     * All error codes are defined in winerror.h. Use <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> with the <b>FORMAT_MESSAGE_FROM_SYSTEM</b> flag to get a message for an error code.
     * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/nf-processsnapshot-psswalkmarkerseektobeginning
     * @since windows8.1
     */
    static PssWalkMarkerSeekToBeginning(WalkMarkerHandle) {
        WalkMarkerHandle := WalkMarkerHandle is Win32Handle ? NumGet(WalkMarkerHandle, "ptr") : WalkMarkerHandle

        result := DllCall("KERNEL32.dll\PssWalkMarkerSeekToBeginning", "ptr", WalkMarkerHandle, "uint")
        return result
    }

;@endregion Methods
}
