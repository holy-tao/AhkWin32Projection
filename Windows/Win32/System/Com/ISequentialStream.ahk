#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * The ISequentialStream interface supports simplified sequential access to stream objects. The IStream interface inherits its Read and Write methods from ISequentialStream.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-isequentialstream
 * @namespace Windows.Win32.System.Com
 */
export default struct ISequentialStream extends IUnknown {
    /**
     * The interface identifier for ISequentialStream
     * @type {Guid}
     */
    static IID := Guid("{0c733a30-2a1c-11ce-ade5-00aa0044773d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISequentialStream interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Read  : IntPtr
        Write : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISequentialStream.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Reads a specified number of bytes from the stream object into memory, starting at the current seek pointer.
     * @remarks
     * This method reads bytes from this stream object into memory. The stream object must be opened in <b>STGM_READ</b> mode. This method adjusts the seek pointer by the actual number of bytes read.
     * 
     * The number of bytes actually read is also returned in the <i>pcbRead</i> parameter.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * The actual number of bytes read can be less than the number of bytes requested if an error occurs or if the end of the stream is reached during the read operation.  The number of bytes returned should always  be compared to the number of bytes requested.  If the number of bytes returned is less than the number of bytes requested, it usually means the <b>Read</b> method attempted to read  past the end of the stream.
     * 
     * The application should handle both a returned error  and <b>S_OK</b> return values on end-of-stream read operations.
     * @param {Integer} pv A pointer to the buffer which the stream data is read into.
     * @param {Integer} cb The number of bytes of data to read from the stream object.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable that receives the actual number of bytes read from the stream object. 
     * 
     * <div class="alert"><b>Note</b>  The number of bytes read may be zero.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isequentialstream-read
     */
    Read(pv, cb) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, Int32)
        return pcbRead
    }

    /**
     * Writes a specified number of bytes into the stream object starting at the current seek pointer.
     * @remarks
     * <b>ISequentialStream::Write</b> writes the specified data to a stream object. The seek pointer is adjusted for the number of bytes actually written. The number of bytes actually written is returned in the <i>pcbWritten</i> parameter. If the byte count is zero bytes, the write operation has no effect.
     * 
     * If the seek pointer is currently past the end of the stream and the byte count is nonzero, this method increases the size of the stream to the seek pointer and writes the specified bytes starting at the seek pointer. The fill bytes written to the stream are not initialized to any particular value. This is the same as the end-of-file behavior in the MS-DOS FAT file system.
     * 
     * With a zero byte count and a seek pointer past the end of the stream, this method does not create the fill bytes to increase the stream to the seek pointer. In this case, you must call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-setsize">IStream::SetSize</a> method to increase the size of the stream and write the fill bytes.
     * 
     * The <i>pcbWritten</i> parameter can have a value even if an error occurs.
     * 
     * In the COM-provided implementation, stream objects are not sparse. Any fill bytes are eventually allocated on the disk and assigned to the stream.
     * @param {Integer} pv A pointer to the buffer that contains the data that is to be written to the stream. A valid pointer must be provided for this parameter even when <i>cb</i> is zero.
     * @param {Integer} cb The number of bytes of data to attempt to write into the stream. This value can be zero.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable where this method writes the actual number of bytes written to the stream object. The caller can set this pointer to <b>NULL</b>, in which case this method does not provide the actual number of bytes written.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-isequentialstream-write
     */
    Write(pv, cb) {
        result := ComCall(4, this, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, Int32)
        return pcbWritten
    }

    Query(iid) {
        if (ISequentialStream.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Read := CallbackCreate(GetMethod(implObj, "Read"), flags, 4)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Read)
        CallbackFree(this.vtbl.Write)
    }
}
