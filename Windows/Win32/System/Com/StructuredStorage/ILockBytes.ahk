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
     * 
     * @param {Integer} ulOffset 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbRead 
     * @returns {HRESULT} 
     */
    ReadAt(ulOffset, pv, cb, pcbRead) {
        result := ComCall(3, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", pcbRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulOffset 
     * @param {Pointer} pv 
     * @param {Integer} cb 
     * @param {Pointer<UInt32>} pcbWritten 
     * @returns {HRESULT} 
     */
    WriteAt(ulOffset, pv, cb, pcbWritten) {
        result := ComCall(4, this, "uint", ulOffset, "ptr", pv, "uint", cb, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    SetSize(cb) {
        result := ComCall(6, this, "uint", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(7, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(8, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<STATSTG>} pstatstg 
     * @param {Integer} grfStatFlag 
     * @returns {HRESULT} 
     */
    Stat(pstatstg, grfStatFlag) {
        result := ComCall(9, this, "ptr", pstatstg, "uint", grfStatFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
