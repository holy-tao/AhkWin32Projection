#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} ulOffset 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-readat
     */
    ReadAt(ulOffset, pv, cb, pcbRead) {
        result := ComCall(3, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", pcbRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulOffset 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-writeat
     */
    WriteAt(ulOffset, pv, cb, pcbWritten) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", pcbWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-setsize
     */
    SetSize(cb) {
        result := ComCall(6, this, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(7, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(8, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STATSTG>} pstatstg 
     * @param {Integer} grfStatFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ilockbytes-stat
     */
    Stat(pstatstg, grfStatFlag) {
        result := ComCall(9, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return result
    }
}
