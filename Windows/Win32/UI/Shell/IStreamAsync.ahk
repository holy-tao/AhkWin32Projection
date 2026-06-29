#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Exposes methods to manage input/output (I/O) to an asynchronous stream.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istreamasync
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStreamAsync extends IStream {
    /**
     * The interface identifier for IStreamAsync
     * @type {Guid}
     */
    static IID := Guid("{fe0b6665-e0ca-49b9-a178-2b5cb48d92a5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamAsync interfaces
    */
    struct Vtbl extends IStream.Vtbl {
        ReadAsync        : IntPtr
        WriteAsync       : IntPtr
        OverlappedResult : IntPtr
        CancelIo         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamAsync.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads information from a stream asynchronously. For example, the Shell implements this interface on file items when transferring them asynchronously.
     * @remarks
     * <b>IStreamAsync::ReadAsync</b> should reset the event specified by the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure to a nonsignaled state when it begins the input/output (I/O) operation.
     * 
     * This method has been implemented in the Shell as a thin wrapper around the public <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-readfile">ReadFile</a> API.
     * @param {Integer} pv Type: <b>void*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-readasync
     */
    ReadAsync(pv, cb, lpOverlapped) {
        result := ComCall(14, this, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
        return pcbRead
    }

    /**
     * Writes information to a stream asynchronously. For example, the Shell implements this method on file items when transferring them asynchronously.
     * @remarks
     * <b>WriteAsync</b> should reset the event specified by the <b>hEvent</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure to a nonsignaled state when it begins the input/output (I/O) operation.
     * @param {Integer} lpBuffer Type: <b>const void*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-writeasync
     */
    WriteAsync(lpBuffer, cb, lpOverlapped) {
        result := ComCall(15, this, "ptr", lpBuffer, "uint", cb, "uint*", &pcbWritten := 0, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-overlappedresult
     */
    OverlappedResult(lpOverlapped, bWait) {
        result := ComCall(16, this, OVERLAPPED.Ptr, lpOverlapped, "uint*", &lpNumberOfBytesTransferred := 0, BOOL, bWait, "HRESULT")
        return lpNumberOfBytesTransferred
    }

    /**
     * Marks all pending input/output (I/O) operations as canceled.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-istreamasync-cancelio
     */
    CancelIo() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamAsync.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadAsync := CallbackCreate(GetMethod(implObj, "ReadAsync"), flags, 5)
        this.vtbl.WriteAsync := CallbackCreate(GetMethod(implObj, "WriteAsync"), flags, 5)
        this.vtbl.OverlappedResult := CallbackCreate(GetMethod(implObj, "OverlappedResult"), flags, 4)
        this.vtbl.CancelIo := CallbackCreate(GetMethod(implObj, "CancelIo"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadAsync)
        CallbackFree(this.vtbl.WriteAsync)
        CallbackFree(this.vtbl.OverlappedResult)
        CallbackFree(this.vtbl.CancelIo)
    }
}
