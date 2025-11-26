#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STATSTG.ahk
#Include .\IStream.ahk
#Include .\ISequentialStream.ahk

/**
 * The IStream interface lets you read and write data to stream objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-istream
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
     * @param {Integer} dlibMove The displacement to be added to the location indicated by the <i>dwOrigin</i> parameter. If <i>dwOrigin</i> is <b>STREAM_SEEK_SET</b>, this is interpreted as an unsigned value rather than a signed value.
     * @param {Integer} dwOrigin The origin for the displacement specified in <i>dlibMove</i>. The origin can be the beginning of the file (<b>STREAM_SEEK_SET</b>), the current seek pointer (<b>STREAM_SEEK_CUR</b>), or the end of the file (<b>STREAM_SEEK_END</b>). For more information about values, see the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-stream_seek">STREAM_SEEK</a> enumeration.
     * @returns {Integer} A pointer to the location where this method writes the value of the new seek pointer from the beginning of the stream. 
     * 
     * You can set this pointer to <b>NULL</b>. In this case, this method does not provide the new seek pointer.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-seek
     */
    Seek(dlibMove, dwOrigin) {
        result := ComCall(5, this, "int64", dlibMove, "uint", dwOrigin, "uint*", &plibNewPosition := 0, "HRESULT")
        return plibNewPosition
    }

    /**
     * Changes the size of the stream object.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-setsize
     */
    SetSize(libNewSize) {
        result := ComCall(6, this, "uint", libNewSize, "HRESULT")
        return result
    }

    /**
     * Copies a specified number of bytes from the current seek pointer in the stream to the current seek pointer in another stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-copyto
     */
    CopyTo(pstm, cb, pcbRead, pcbWritten) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pstm, "uint", cb, pcbReadMarshal, pcbRead, pcbWrittenMarshal, pcbWritten, "HRESULT")
        return result
    }

    /**
     * The Commit method ensures that any changes made to a stream object open in transacted mode are reflected in the parent storage.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(8, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * The Revert method discards all changes that have been made to a transacted stream since the last IStream::Commit call. On streams open in direct mode and streams using the COM compound file implementation of IStream::Revert, this method has no effect.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The stream was successfully reverted to its previous version.|
     * |E_PENDING | Asynchronous Storage only: Part or all of the stream's data is currently unavailable. |
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-revert
     */
    Revert() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The LockRegion method restricts access to a specified range of bytes in the stream.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(10, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The UnlockRegion method removes the access restriction on a range of bytes previously restricted with IStream::LockRegion.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(11, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The Stat method retrieves the STATSTG structure for this stream.
     * @param {Integer} grfStatFlag Specifies that this method does not return some of the members in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure, thus saving a memory allocation operation. Values are taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-statflag">STATFLAG</a> enumeration.
     * @returns {STATSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure where this method places information about this stream object.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-stat
     */
    Stat(grfStatFlag) {
        pstatstg := STATSTG()
        result := ComCall(12, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return pstatstg
    }

    /**
     * The Clone method creates a new stream object with its own seek pointer that references the same bytes as the original stream.
     * @returns {IStream} When successful, pointer to the location of an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the new stream object. If an error occurs, this parameter is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-istream-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppstm := 0, "HRESULT")
        return IStream(ppstm)
    }
}
