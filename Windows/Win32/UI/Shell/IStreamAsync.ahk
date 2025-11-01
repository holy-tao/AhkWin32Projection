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
     * 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-readasync
     */
    ReadAsync(pv, cb, pcbRead, lpOverlapped) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", pv, "uint", cb, pcbReadMarshal, pcbRead, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpBuffer 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-writeasync
     */
    WriteAsync(lpBuffer, cb, pcbWritten, lpOverlapped) {
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "ptr", lpBuffer, "uint", cb, pcbWrittenMarshal, pcbWritten, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<Integer>} lpNumberOfBytesTransferred 
     * @param {BOOL} bWait 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-overlappedresult
     */
    OverlappedResult(lpOverlapped, lpNumberOfBytesTransferred, bWait) {
        lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, "int", bWait, "HRESULT")
        return result
    }

    /**
     * Cancels all pending input and output (I/O) operations that are issued by the calling thread for the specified file.
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. The cancel operation for all pending I/O operations issued by the calling thread for the specified file handle was successfully requested. The thread can use the <a href="/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function to determine when the I/O operations themselves have been completed.
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-cancelio
     */
    CancelIo() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
