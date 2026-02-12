#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\STATSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The ILockBytes interface is implemented on a byte array object that is backed by some physical storage, such as a disk file, global memory, or a database.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-ilockbytes
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class ILockBytes extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockBytes
     * @type {Guid}
     */
    static IID => Guid("{0000000a-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadAt", "WriteAt", "Flush", "SetSize", "LockRegion", "UnlockRegion", "Stat"]

    /**
     * The ReadAt method reads a specified number of bytes starting at a specified offset from the beginning of the byte array object.
     * @remarks
     * <b>ILockBytes::ReadAt</b> reads bytes from the byte array object. It reports the number of bytes that were actually read. This value may be less than the number of bytes requested if an error occurs or if the end of the byte array is reached during the read.
     * 
     * It is not an error to read less than the specified number of bytes if the operation encounters the end of the byte array. Note that this is the same end-of-file behavior as found in MS-DOS file allocation table (FAT) file system files.
     * @param {Integer} ulOffset Specifies the starting point from the beginning of the byte array for reading data.
     * @param {Pointer} pv Pointer to the buffer into which the byte array is read.  The size of this buffer is contained in <i>cb</i>.
     * @param {Integer} cb Specifies the number of bytes of data to attempt to read from the byte array.
     * @returns {Integer} Pointer to a <b>ULONG</b> where this method writes the actual number of bytes read from the byte array. You can set this pointer to <b>NULL</b> to indicate that you are not interested in this value. In this case, this method does not provide the actual number of bytes that were read.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-readat
     */
    ReadAt(ulOffset, pv, cb) {
        result := ComCall(3, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbRead
    }

    /**
     * The WriteAt method writes the specified number of bytes starting at a specified offset from the beginning of the byte array.
     * @remarks
     * <b>ILockBytes::WriteAt</b> writes the specified data at the specified location in the byte array. The number of bytes actually written must always be returned in <i>pcbWritten</i>, even if an error is returned. If the byte count is zero bytes, the write operation has no effect.
     * 
     * If <i>ulOffset</i> is past the end of the byte array and <i>cb</i> is greater than zero, <b>ILockBytes::WriteAt</b> increases the size of the byte array. The fill bytes written to the byte array are not initialized to any particular value.
     * @param {Integer} ulOffset Specifies the starting point from the beginning of the byte array for the data to be written.
     * @param {Pointer} pv Pointer to the buffer containing the data to be written.
     * @param {Integer} cb Specifies the number of bytes of data to attempt to write into the byte array.
     * @returns {Integer} Pointer to a location where this method specifies the actual number of bytes written to the byte array. You can set this pointer to <b>NULL</b> to indicate that you are not interested in this value. In this case, this method does not provide the actual number of bytes written.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-writeat
     */
    WriteAt(ulOffset, pv, cb) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbWritten
    }

    /**
     * The Flush method ensures that any internal buffers maintained by the ILockBytes implementation are written out to the underlying physical storage.
     * @remarks
     * <b>ILockBytes::Flush</b> flushes internal buffers to the underlying storage device.
     * 
     * The COM-provided implementation of compound files calls this method during a transacted commit operation to provide a two-phase commit process that protects against loss of data.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The flush operation was successful.|
     * |STG_E_ACCESSDENIED | The caller does not have permission to access the byte array.|
     * |STG_E_MEDIUMFULL | The flush operation is not completed because there is no space left on the storage device.|
     * |E_FAIL | General failure writing data.|
     * |STG_E_TOOMANYFILESOPEN | Under certain circumstances, the **Flush** method executes a download-and-closeto flush, which can lead to a return value of STG_E_TOOMANYFILESOPEN if no file handles are available.|
     * |STG_E_INVALIDHANDLE | An underlying file has been prematurely closed, or the correct floppy disk has been replaced by an invalid one.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-flush
     */
    Flush() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetSize method changes the size of the byte array.
     * @remarks
     * <b>ILockBytes::SetSize</b> changes the size of the byte array. If the <i>cb</i> parameter is larger than the current byte array, the byte array is extended to the indicated size by filling the intervening space with bytes of undefined value, as does 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-writeat">ILockBytes::WriteAt</a>, if the seek pointer is past the current end-of-stream.
     * 
     * If the <i>cb</i> parameter is smaller than the current byte array, the byte array is truncated to the indicated size.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Callers cannot rely on STG_E_MEDIUMFULL being returned at the appropriate time because of cache buffering in the operating system or network. However, callers must be able to deal with this return code because some 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> implementations might support it.
     * @param {Integer} cb Specifies the new size of the byte array as a number of bytes.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The size of the byte array was successfully changed.|
     * |STG_E_ACCESSDENIED | The caller does not have permission to access the byte array.|
     * |STG_E_MEDIUMFULL | The byte array size is not changed because there is no space left on the storage device.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-setsize
     */
    SetSize(cb) {
        result := ComCall(6, this, "uint", cb, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The LockRegion method restricts access to a specified range of bytes in the byte array.
     * @remarks
     * <b>ILockBytes::LockRegion</b> restricts access to the specified range of bytes. Once a region is locked, attempts by others to gain access to the restricted range must fail with the STG_E_ACCESSDENIED error.
     * 
     * The byte range can extend past the current end of the byte array. Locking beyond the end of an array is useful as a method of communication between different instances of the byte array object without changing data that is actually part of the byte array. For example, an implementation of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> for compound files could rely on locking past the current end of the array as a means of access control, using specific locked regions to indicate permissions currently granted.
     * 
     * The <i>dwLockType</i> parameter specifies one of three types of locking, using values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration. The types are as follows: locking to exclude other writers, locking to exclude other readers or writers, and locking that allows only one requester to obtain a lock on the given range. This third type of locking is usually an alias for one of the other two lock types, and permits an Implementer to add other behavior as well. A given byte array might support either of the first two types, or both.
     * 
     * To determine the lock types supported by a particular 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> implementation, you can examine the <b>grfLocksSupported</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-stat">ILockBytes::Stat</a>.
     * 
     * Any region locked with <b>ILockBytes::LockRegion</b> must later be explicitly unlocked by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-unlockregion">ILockBytes::UnlockRegion</a> with exactly the same values for the <i>libOffset</i>, <i>cb</i>, and <i>dwLockType</i> parameters. The region must be unlocked before the stream is released. Two adjacent regions cannot be locked separately and then unlocked with a single unlock call.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Since the type of locking supported is optional and can vary in different implementations of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a>, you must provide code to deal with the STG_E_INVALIDFUNCTION error.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * Support for this method depends on how the storage object built on top of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ilockbytes">ILockBytes</a> implementation is used. If you know that only one storage object at any given time can be opened on the storage device that underlies the byte array, then your 
     * <b>ILockBytes</b> implementation does not need to support locking. However, if multiple simultaneous openings of a storage object are possible, then region locking is needed to coordinate them.
     * 
     * A 
     * <b>LockRegion</b> implementation can choose to support all, some, or none of the lock types. For unsupported lock types, the implementation should return STG_E_INVALIDFUNCTION.
     * @param {Integer} libOffset Specifies the byte offset for the beginning of the range.
     * @param {Integer} cb Specifies, in bytes, the length of the range to be restricted.
     * @param {Integer} dwLockType Specifies the type of restrictions being requested on accessing the range. This parameter uses one of the values from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The specified range of bytes was locked.|
     * |STG_E_INVALIDFUNCTION | Locking is not supported at all or the specific type of lock requested is not supported.|
     * |STG_E_ACCESSDENIED | Access denied because the caller has insufficient permission, or another caller has the file open and locked.|
     * |STG_E_LOCKVIOLATION | Access denied because another caller has the file open and locked.|
     * |STG_E_INVALIDHANDLE | An underlying file has been prematurely closed, or the correct floppy disk has been replaced by an invalid one.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(7, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The UnlockRegion method removes the access restriction on a previously locked range of bytes.
     * @remarks
     * <b>ILockBytes::UnlockRegion</b> unlocks a region previously locked with a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ilockbytes-lockregion">ILockBytes::LockRegion</a>. Each region locked must be explicitly unlocked, using the same values for the <i>libOffset</i>, <i>cb</i>, and <i>dwLockType</i> parameters as in the matching calls to <b>ILockBytes::LockRegion</b>. Two adjacent regions cannot be locked separately and then unlocked with a single unlock call.
     * @param {Integer} libOffset Specifies the byte offset for the beginning of the range.
     * @param {Integer} cb Specifies, in bytes, the length of the range that is restricted.
     * @param {Integer} dwLockType Specifies the type of access restrictions previously placed on the range. This parameter uses a value from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ne-objidl-locktype">LOCKTYPE</a> enumeration.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The byte range was unlocked.|
     * |STG_E_INVALIDFUNCTION | Locking is not supported at all or the specific type of lock requested is not supported.|
     * |STG_E_LOCKVIOLATION | The requested unlock cannot be granted.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(8, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Stat method retrieves a STATSTG structure containing information for this byte array object.
     * @remarks
     * <b>ILockBytes::Stat</b> should supply information about the byte array object in a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure.
     * @param {Integer} grfStatFlag Specifies whether this method should supply the <b>pwcsName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure through values taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-statflag">STATFLAG</a> enumeration. If the STATFLAG_NONAME is specified, the <b>pwcsName</b> member of 
     * <b>STATSTG</b> is not supplied, thus saving a memory-allocation operation. The other possible value, STATFLAG_DEFAULT, indicates that all members of the 
     * <b>STATSTG</b> structure be supplied.
     * @returns {STATSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure in which this method places information about this byte array object. The pointer is <b>NULL</b> if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-ilockbytes-stat
     */
    Stat(grfStatFlag) {
        pstatstg := STATSTG()
        result := ComCall(9, this, "ptr", pstatstg, "uint", grfStatFlag, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pstatstg
    }
}
