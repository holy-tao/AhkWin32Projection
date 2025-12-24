#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\STATSTG.ahk
#Include ..\IUnknown.ahk

/**
 * The ILockBytes interface is implemented on a byte array object that is backed by some physical storage, such as a disk file, global memory, or a database.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ilockbytes
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
     * @param {Integer} ulOffset Specifies the starting point from the beginning of the byte array for reading data.
     * @param {Pointer} pv Pointer to the buffer into which the byte array is read.  The size of this buffer is contained in <i>cb</i>.
     * @param {Integer} cb Specifies the number of bytes of data to attempt to read from the byte array.
     * @returns {Integer} Pointer to a <b>ULONG</b> where this method writes the actual number of bytes read from the byte array. You can set this pointer to <b>NULL</b> to indicate that you are not interested in this value. In this case, this method does not provide the actual number of bytes that were read.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-readat
     */
    ReadAt(ulOffset, pv, cb) {
        result := ComCall(3, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbRead := 0, "HRESULT")
        return pcbRead
    }

    /**
     * The WriteAt method writes the specified number of bytes starting at a specified offset from the beginning of the byte array.
     * @param {Integer} ulOffset Specifies the starting point from the beginning of the byte array for the data to be written.
     * @param {Pointer} pv Pointer to the buffer containing the data to be written.
     * @param {Integer} cb Specifies the number of bytes of data to attempt to write into the byte array.
     * @returns {Integer} Pointer to a location where this method specifies the actual number of bytes written to the byte array. You can set this pointer to <b>NULL</b> to indicate that you are not interested in this value. In this case, this method does not provide the actual number of bytes written.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-writeat
     */
    WriteAt(ulOffset, pv, cb) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", &pcbWritten := 0, "HRESULT")
        return pcbWritten
    }

    /**
     * The Flush method ensures that any internal buffers maintained by the ILockBytes implementation are written out to the underlying physical storage.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The SetSize method changes the size of the byte array.
     * @param {Integer} cb Specifies the new size of the byte array as a number of bytes.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The size of the byte array was successfully changed.|
     * |STG_E_ACCESSDENIED | The caller does not have permission to access the byte array.|
     * |STG_E_MEDIUMFULL | The byte array size is not changed because there is no space left on the storage device.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-setsize
     */
    SetSize(cb) {
        result := ComCall(6, this, "uint", cb, "HRESULT")
        return result
    }

    /**
     * The LockRegion method restricts access to a specified range of bytes in the byte array.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(7, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The UnlockRegion method removes the access restriction on a previously locked range of bytes.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(8, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * The Stat method retrieves a STATSTG structure containing information for this byte array object.
     * @param {Integer} grfStatFlag Specifies whether this method should supply the <b>pwcsName</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure through values taken from the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wtypes/ne-wtypes-statflag">STATFLAG</a> enumeration. If the STATFLAG_NONAME is specified, the <b>pwcsName</b> member of 
     * <b>STATSTG</b> is not supplied, thus saving a memory-allocation operation. The other possible value, STATFLAG_DEFAULT, indicates that all members of the 
     * <b>STATSTG</b> structure be supplied.
     * @returns {STATSTG} Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-statstg">STATSTG</a> structure in which this method places information about this byte array object. The pointer is <b>NULL</b> if an error occurs.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ilockbytes-stat
     */
    Stat(grfStatFlag) {
        pstatstg := STATSTG()
        result := ComCall(9, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return pstatstg
    }
}
