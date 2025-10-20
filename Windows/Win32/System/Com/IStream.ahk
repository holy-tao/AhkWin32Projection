#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISequentialStream.ahk

/**
 * The IStream interface lets you read and write data to stream objects.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-istream
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IStream extends ISequentialStream{
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
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @param {Pointer<UInt64>} plibNewPosition 
     * @returns {HRESULT} 
     */
    Seek(dlibMove, dwOrigin, plibNewPosition) {
        result := ComCall(5, this, "int64", dlibMove, "uint", dwOrigin, "uint*", plibNewPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} libNewSize 
     * @returns {HRESULT} 
     */
    SetSize(libNewSize) {
        result := ComCall(6, this, "uint", libNewSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pstm 
     * @param {Integer} cb 
     * @param {Pointer<UInt64>} pcbRead 
     * @param {Pointer<UInt64>} pcbWritten 
     * @returns {HRESULT} 
     */
    CopyTo(pstm, cb, pcbRead, pcbWritten) {
        result := ComCall(7, this, "ptr", pstm, "uint", cb, "uint*", pcbRead, "uint*", pcbWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} 
     */
    Commit(grfCommitFlags) {
        result := ComCall(8, this, "uint", grfCommitFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Revert() {
        result := ComCall(9, this, "int")
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
        result := ComCall(10, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
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
        result := ComCall(11, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "int")
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
        result := ComCall(12, this, "ptr", pstatstg, "uint", grfStatFlag, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppstm 
     * @returns {HRESULT} 
     */
    Clone(ppstm) {
        result := ComCall(13, this, "ptr", ppstm, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
