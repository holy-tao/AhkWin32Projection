#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STATSTG.ahk
#Include .\IStream.ahk
#Include .\ISequentialStream.ahk

/**
 * The IStream interface lets you read and write data to stream objects.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-istream
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IStream extends ISequentialStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStream
     * @type {Guid}
     */
    static IID => Guid("{0000000c-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Seek", "SetSize", "CopyTo", "Commit", "Revert", "LockRegion", "UnlockRegion", "Stat", "Clone"]

    /**
     * Changes the seek pointer to a new location. The new location is relative to either the beginning of the stream, the end of the stream, or the current seek pointer.
     * @remarks
     * <b>IStream::Seek</b> changes the seek pointer so that subsequent read and write operations can be performed at a different location in the stream object. It is an error to seek before the beginning of the stream. It is not, however, an error to seek past the end of the stream. Seeking past the end of the stream is useful for subsequent write operations, as the stream byte range will be extended to the new seek position immediately before the write is complete.
     * 
     * You can also use this method to obtain the current value of the seek pointer by calling this method with the <i>dwOrigin</i> parameter set to <b>STREAM_SEEK_CUR</b> and the <i>dlibMove</i> parameter set to 0 so that the seek pointer is not changed. The current seek pointer is returned in the <i>plibNewPosition</i> parameter.
     * @param {Integer} dlibMove The displacement to be added to the location indicated by the <i>dwOrigin</i> parameter. If <i>dwOrigin</i> is <b>STREAM_SEEK_SET</b>, this is interpreted as an unsigned value rather than a signed value.
     * @param {Integer} dwOrigin The origin for the displacement specified in <i>dlibMove</i>. The origin can be the beginning of the file (<b>STREAM_SEEK_SET</b>), the current seek pointer (<b>STREAM_SEEK_CUR</b>), or the end of the file (<b>STREAM_SEEK_END</b>). For more information about values, see the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-stream_seek">STREAM_SEEK</a> enumeration.
     * @returns {Integer} A pointer to the location where this method writes the value of the new seek pointer from the beginning of the stream. 
     * 
     * You can set this pointer to <b>NULL</b>. In this case, this method does not provide the new seek pointer.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-seek
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(5, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * Changes the size of the stream object.
     * @remarks
     * <b>IStream::SetSize</b> changes the size of the stream object. Call this method to preallocate space for the stream. If the <i>libNewSize</i> parameter is larger than the current stream size, the stream is extended to the indicated size by filling the intervening space with bytes of undefined value. This operation is similar to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> method if the seek pointer is past the current end of the stream.
     * 
     * If the <i>libNewSize</i> parameter is smaller than the current stream, the stream is truncated to the indicated size.
     * 
     * The seek pointer is not affected by the change in stream size.
     * 
     * Calling <b>IStream::SetSize</b> can be an effective way to obtain a large chunk of contiguous space.
     * @param {Integer} libNewSize Specifies the new size, in bytes, of the stream.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The size of the stream object was successfully changed.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable.|
     * |STG_E_MEDIUMFULL | The stream size is not changed because there is no space left on the storage device.|
     * |STG_E_INVALIDFUNCTION | The value of the *libNewSize* parameter is not supported by the implementation. Not all streams support greater than 232 bytes. If a stream does not support more than 232 bytes, the high DWORD data type of *libNewSize* must be zero. If it is nonzero, the implementation may return STG_E_INVALIDFUNCTION. In general, COM-based implementations of the IStream interface do not support streams larger than 232 bytes.|
     * |STG_E_REVERTED | The object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-setsize
     */
    SetSize(libNewSize) {
        result := ComCall(6, this, "uint", libNewSize, "HRESULT")
        return result
    }

    /**
     * Copies a specified number of bytes from the current seek pointer in the stream to the current seek pointer in another stream.
     * @remarks
     * The <b>CopyTo</b> method copies the specified bytes from one stream to another. It can also be used to copy a stream to itself. The seek pointer in each stream instance is adjusted for the number of bytes read or written. This method is equivalent to reading <i>cb</i> bytes into memory using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-read">ISequentialStream::Read</a> and then immediately writing them to the destination stream using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a>, although <b>IStream::CopyTo</b> will be more efficient.
     * 
     * The destination stream can be a clone of the source stream created by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-clone">IStream::Clone</a> method.
     * 
     * If <b>IStream::CopyTo</b> returns an error, you cannot assume that the seek pointers are valid for either the source or destination. Additionally, the values of <i>pcbRead</i> and <i>pcbWritten</i> are not meaningful even though they are returned.
     * 
     * If <b>IStream::CopyTo</b> returns successfully, the actual number of bytes read and written are the same.
     * 
     * To copy the remainder of the source from the current seek pointer, specify the maximum large integer value for the <i>cb</i> parameter. If the seek pointer is the beginning of the stream, this operation copies the entire stream.
     * @param {IStream} pstm A pointer to the destination stream. The stream pointed to by <i>pstm</i> can be a new stream or a clone of the source stream.
     * @param {Integer} cb The number of bytes to copy from the source stream.
     * @param {Pointer<Integer>} pcbRead A pointer to the location where this method writes the actual number of bytes read from the source. You can set this pointer to <b>NULL</b>. In this case, this method does not provide the actual number of bytes read.
     * @param {Pointer<Integer>} pcbWritten A pointer to the location where this method writes the actual number of bytes written to the destination. You can set this pointer to <b>NULL</b>. In this case, this method does not provide the actual number of bytes written.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The stream object was successfully copied.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the data to be copied is currently unavailable. |
     * |STG_E_INVALIDPOINTER | The value of one of the pointer parameters is invalid.|
     * |STG_E_MEDIUMFULL | The stream is not copied because there is no space left on the storage device.|
     * |STG_E_REVERTED | The object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-copyto
     */
    CopyTo(pstm, cb, pcbRead, pcbWritten) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pstm, "uint", cb, pcbReadMarshal, pcbRead, pcbWrittenMarshal, pcbWritten, "HRESULT")
        return result
    }

    /**
     * The Commit method ensures that any changes made to a stream object open in transacted mode are reflected in the parent storage.
     * @remarks
     * The <b>Commit</b>  method ensures that changes to a stream object opened in transacted mode are reflected in the parent storage. Changes that have been made to the stream since it was opened or last committed are reflected to the parent storage object. If the parent is opened in transacted mode, the parent may revert at a later time, rolling back the changes to this stream object. The compound file implementation does not support the opening of streams in transacted mode, so this method has very little effect other than to flush memory buffers. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Stg/istream-compound-file-implementation">IStream - Compound File Implementation</a>.
     * 
     * If the stream is open in direct mode, this method ensures that any memory buffers have been flushed out to the underlying storage object. This is much like a flush in traditional file systems.
     * 
     * The <b>IStream::Commit</b> method is useful on a direct mode stream when the implementation of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> interface is a wrapper for underlying file system APIs. In this case, <b>IStream::Commit</b> would be connected to the file system's flush call.
     * @param {Integer} grfCommitFlags Controls how the changes for the stream object are committed. See the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-stgc">STGC</a> enumeration for a definition of these values.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | Changes to the stream object were successfully committed to the parent level.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable. |
     * |STG_E_MEDIUMFULL | The commit operation failed due to lack of space on the storage device.|
     * |STG_E_REVERTED | The object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(8, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * The Revert method discards all changes that have been made to a transacted stream since the last IStream::Commit call. On streams open in direct mode and streams using the COM compound file implementation of IStream::Revert, this method has no effect.
     * @remarks
     * The <b>Revert</b> method discards changes made to a transacted stream since the last commit operation.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The stream was successfully reverted to its previous version.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable. |
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-revert
     */
    Revert() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The LockRegion method restricts access to a specified range of bytes in the stream.
     * @remarks
     * The byte range of the stream can be extended.  Locking an extended range for the stream is useful as a method of communication between different instances of the stream without changing data that is actually part of the stream.
     * 
     * Three types of locking can be supported: locking to exclude other writers, locking to exclude other readers or writers, and locking that allows only one requester to obtain a lock on the given range, which is usually an alias for one of the other two lock types. A given stream instance might support either of the first two types, or both. The lock type is specified by <i>dwLockType</i>, using a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration.
     * 
     * Any region locked with <b>IStream::LockRegion</b> must later be explicitly unlocked by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-unlockregion">IStream::UnlockRegion</a> with exactly the same values for the <i>libOffset</i>, <i>cb</i>, and <i>dwLockType</i> parameters. The region must be unlocked before the stream is released. Two adjacent regions cannot be locked separately and then unlocked with a single unlock call.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Since the type of locking supported is optional and can vary in different implementations of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, you must provide code to deal with the STG_E_INVALIDFUNCTION error.
     * 
     * The <b>LockRegion</b> method has no effect in the compound file implementation, because the implementation does not support range locking.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Support for this method is optional for implementations of stream objects since it may not be supported by the underlying file system. The type of locking supported is also optional. The STG_E_INVALIDFUNCTION error is returned if the requested type of locking is not supported.
     * @param {Integer} libOffset Integer that specifies the byte offset for the beginning of the range.
     * @param {Integer} cb Integer that specifies the length of the range, in bytes, to be restricted.
     * @param {Integer} dwLockType Specifies the restrictions being requested on accessing the range.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The specified range of bytes was locked.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable. |
     * |STG_E_INVALIDFUNCTION | Locking is not supported at all or the specific type of lock requested is not supported.|
     * |STG_E_LOCKVIOLATION | Requested lock is supported, but cannot be granted because of an existing lock.|
     * |STG_E_REVERTED | The object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(10, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The UnlockRegion method removes the access restriction on a range of bytes previously restricted with IStream::LockRegion.
     * @remarks
     * <b>IStream::UnlockRegion</b> unlocks a region previously locked with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istream-lockregion">IStream::LockRegion</a> method. Locked regions must later be explicitly unlocked by calling <b>IStream::UnlockRegion</b> with exactly the same values for the <i>libOffset</i>, <i>cb</i>, and <i>dwLockType</i> parameters. The region must be unlocked before the stream is released. Two adjacent regions cannot be locked separately and then unlocked with a single unlock call.
     * @param {Integer} libOffset Specifies the byte offset for the beginning of the range.
     * @param {Integer} cb Specifies, in bytes, the length of the range to be restricted.
     * @param {Integer} dwLockType Specifies the access restrictions previously placed on the range.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The byte range was unlocked.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable.|
     * |STG_E_INVALIDFUNCTION | Locking is not supported at all or the specific type of lock requested is not supported.|
     * |STG_E_LOCKVIOLATION | The requested unlock operation cannot be granted.|
     * |STG_E_REVERTED | The object has been invalidated by a revert operation above it in the transaction tree.|
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(11, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The Stat method retrieves the STATSTG structure for this stream.
     * @remarks
     * <b>IStream::Stat</b> retrieves a pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure that contains information about this open stream. When this stream is within a structured storage and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-enumelements">IStorage::EnumElements</a> is called, it creates an enumerator object with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumstatstg">IEnumSTATSTG</a> interface on it, which can be called to enumerate the storages and streams through the 
     * <b>STATSTG</b> structures associated with each of them.
     * @param {Integer} grfStatFlag Specifies that this method does not return some of the members in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure, thus saving a memory allocation operation. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-statflag">STATFLAG</a> enumeration.
     * @returns {STATSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure where this method places information about this stream object.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-stat
     */
    Stat(grfStatFlag) {
        pstatstg := STATSTG()
        result := ComCall(12, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return pstatstg
    }

    /**
     * The Clone method creates a new stream object with its own seek pointer that references the same bytes as the original stream.
     * @remarks
     * The <b>Clone</b> method creates a new stream object for accessing the same bytes but using a separate seek pointer. The new stream object sees the same data as the source-stream object. Changes written to one object are immediately visible in the other. Range locking is shared between the stream objects.
     * 
     * The initial setting of the seek pointer in the cloned stream instance is the same as the current setting of the seek pointer in the original stream at the time of the clone operation.
     * @returns {IStream} When successful, pointer to the location of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the new stream object. If an error occurs, this parameter is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppstm := 0, "HRESULT")
        return IStream(ppstm)
    }
}
