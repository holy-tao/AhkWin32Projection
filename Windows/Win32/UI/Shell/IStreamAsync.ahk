#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * Exposes methods to manage input/outpout (I/O) to an asynchronous stream.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-istreamasync
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStreamAsync extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamAsync
     * @type {Guid}
     */
    static IID => Guid("{fe0b6665-e0ca-49b9-a178-2b5cb48d92a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadAsync", "WriteAsync", "OverlappedResult", "CancelIo"]

    /**
     * Reads information from a stream asynchronously. For example, the Shell implements this interface on file items when transferring them asynchronously.
     * @param {Pointer} pv Type: <b>void*</b>
     * 
     * When this method returns successfully, returns a buffer that is <i>cb</i> bytes long and contains <i>pcbRead</i> bytes of information from the read operation.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The number of bytes to read from the stream.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Type: <b>LPOVERLAPPED</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure that contains information used in the asynchronous read operation.
     * @returns {Integer} Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> value that, when this method returns successfully, states the actual number of bytes read to the buffer pointed to by <i>pv</i>. This value can be <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-istreamasync-readasync
     */
    ReadAsync(pv, cb, lpOverlapped) {
        result := ComCall(14, this, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, "ptr", lpOverlapped, "HRESULT")
        return pcbRead
    }

    /**
     * Writes information to a stream asynchronously. For example, the Shell implements this method on file items when transferring them asynchronously.
     * @param {Pointer} lpBuffer Type: <b>const void*</b>
     * 
     * A pointer to a buffer of size <i>cb</i> bytes that contains the information to be written to the stream.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * The size of the buffer pointed to by <i>lpBuffer</i>, in bytes.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Type: <b>LPOVERLAPPED</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure that contains information used in the asynchronous write operation.
     * @returns {Integer} Type: <b>LPDWORD</b>
     * 
     * Pointer to a <b>DWORD</b> value that, when the method returns successfully, states the actual number of bytes written to the stream. This value can be <b>NULL</b> if this information is not needed.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-istreamasync-writeasync
     */
    WriteAsync(lpBuffer, cb, lpOverlapped) {
        result := ComCall(15, this, "ptr", lpBuffer, "uint", cb, "uint*", &pcbWritten := 0, "ptr", lpOverlapped, "HRESULT")
        return pcbWritten
    }

    /**
     * Retrieves the results of an overlapped operation.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Type: <b>LPOVERLAPPED*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure that was specified when the overlapped operation was started.
     * @param {BOOL} bWait Type: <b>BOOL</b>
     * 
     * If <b>TRUE</b> the method does not return until the operation has been completed.  If <b>FALSE</b> and an operation is pending, the method returns the HRESULT equivalent to ERROR_IO_INCOMPLETE.
     * @returns {Integer} Type: <b>LPDWORD</b>
     * 
     * When this method returns, contains the number of bytes that were actually transferred by a read or write operation.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-istreamasync-overlappedresult
     */
    OverlappedResult(lpOverlapped, bWait) {
        result := ComCall(16, this, "ptr", lpOverlapped, "uint*", &lpNumberOfBytesTransferred := 0, "int", bWait, "HRESULT")
        return lpNumberOfBytesTransferred
    }

    /**
     * Marks all pending input/output (I/O) operations as canceled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nf-shobjidl-istreamasync-cancelio
     */
    CancelIo() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
