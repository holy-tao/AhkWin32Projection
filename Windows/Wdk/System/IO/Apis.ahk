#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Wdk.System.IO
 * @version v4.0.30319
 */
class IO {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Deprecated. Builds descriptors for the supplied buffer(s) and passes the untyped data to the device driver associated with the file handle. NtDeviceIoControlFile is superseded by DeviceIoControl.
     * @param {HANDLE} FileHandle Open file handle to the file or device to which the control information should be given.
     * @param {HANDLE} Event A handle to an event to be set to the <c>signaled</c> state when the operation completes. This parameter can be <b>NULL</b>.
     * @param {Pointer<PIO_APC_ROUTINE>} ApcRoutine Procedure to be invoked once the operation completes. This parameter can be <b>NULL</b>. For more information on Asynchronous Procedure Calls (APCs), see <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>.
     * @param {Pointer<Void>} ApcContext A pointer to pass to <i>ApcRoutine</i> when the operation completes. This parameter is required if an <i>ApcRoutine</i> is specified.
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock Variable to receive the final completion status and information about the operation. Service calls that return information return the length of the data that is written to the output buffer in the Information field of this variable.
     * @param {Integer} IoControlCode Code that indicates which device I/O control function is to be executed.
     * @param {Pointer} InputBuffer A pointer to a buffer that contains the information to be given to the target device. This parameter can be <b>NULL</b>. This information is device-dependent.
     * @param {Integer} InputBufferLength Length of the <i>InputBuffer</i> in bytes. If the buffer is not supplied, then this value is ignored.
     * @param {Pointer} OutputBuffer A pointer to a buffer that is to receive the device-dependent return information from the target device. This parameter can be <b>NULL</b>.
     * @param {Integer} OutputBufferLength Length of the <i>OutputBuffer</i> in bytes. If the buffer is not supplied, then this value is ignored.
     * @returns {NTSTATUS} The various NTSTATUS values are defined in NTSTATUS.H, which is distributed with the Windows DDK.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STATUS_SUCCESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control operation was properly queued to the I/O system. Once the operation completes, the status can be determined by examining the Status field of the I/O status block. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winternl/nf-winternl-ntdeviceiocontrolfile
     */
    static NtDeviceIoControlFile(FileHandle, Event, ApcRoutine, ApcContext, IoStatusBlock, IoControlCode, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength) {
        FileHandle := FileHandle is Win32Handle ? NumGet(FileHandle, "ptr") : FileHandle
        Event := Event is Win32Handle ? NumGet(Event, "ptr") : Event

        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        result := DllCall("ntdll.dll\NtDeviceIoControlFile", "ptr", FileHandle, "ptr", Event, "ptr", ApcRoutine, ApcContextMarshal, ApcContext, "ptr", IoStatusBlock, "uint", IoControlCode, "ptr", InputBuffer, "uint", InputBufferLength, "ptr", OutputBuffer, "uint", OutputBufferLength, "int")
        return result
    }

;@endregion Methods
}
