#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The ISequentialStream interface supports simplified sequential access to stream objects. The IStream interface inherits its Read and Write methods from ISequentialStream.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-isequentialstream
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ISequentialStream extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISequentialStream
     * @type {Guid}
     */
    static IID => Guid("{0c733a30-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Read", "Write"]

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
     * @param {Pointer} pv A pointer to the buffer which the stream data is read into.
     * @param {Integer} cb The number of bytes of data to read from the stream object.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable that receives the actual number of bytes read from the stream object. 
     * 
     * <div class="alert"><b>Note</b>  The number of bytes read may be zero.</div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-isequentialstream-read
     */
    Read(pv, cb) {
        result := ComCall(3, this, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, "int")
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
     * @param {Pointer} pv A pointer to the buffer that contains the data that is to be written to the stream. A valid pointer must be provided for this parameter even when <i>cb</i> is zero.
     * @param {Integer} cb The number of bytes of data to attempt to write into the stream. This value can be zero.
     * @returns {Integer} A pointer to a <b>ULONG</b> variable where this method writes the actual number of bytes written to the stream object. The caller can set this pointer to <b>NULL</b>, in which case this method does not provide the actual number of bytes written.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-isequentialstream-write
     */
    Write(pv, cb) {
        result := ComCall(4, this, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "int")
        return pcbWritten
    }
}
