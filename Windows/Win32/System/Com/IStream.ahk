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
     * 
     * @param {Integer} dlibMove 
     * @param {Integer} dwOrigin 
     * @param {Pointer<Integer>} plibNewPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-seek
     */
    Seek(dlibMove, dwOrigin, plibNewPosition) {
        plibNewPositionMarshal := plibNewPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "int64", dlibMove, "uint", dwOrigin, plibNewPositionMarshal, plibNewPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} libNewSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-setsize
     */
    SetSize(libNewSize) {
        result := ComCall(6, this, "uint", libNewSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pstm 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcbRead 
     * @param {Pointer<Integer>} pcbWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-copyto
     */
    CopyTo(pstm, cb, pcbRead, pcbWritten) {
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"
        pcbWrittenMarshal := pcbWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pstm, "uint", cb, pcbReadMarshal, pcbRead, pcbWrittenMarshal, pcbWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfCommitFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-commit
     */
    Commit(grfCommitFlags) {
        result := ComCall(8, this, "uint", grfCommitFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-revert
     */
    Revert() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-lockregion
     */
    LockRegion(libOffset, cb, dwLockType) {
        result := ComCall(10, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} libOffset 
     * @param {Integer} cb 
     * @param {Integer} dwLockType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-unlockregion
     */
    UnlockRegion(libOffset, cb, dwLockType) {
        result := ComCall(11, this, "uint", libOffset, "uint", cb, "uint", dwLockType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STATSTG>} pstatstg 
     * @param {Integer} grfStatFlag 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-stat
     */
    Stat(pstatstg, grfStatFlag) {
        result := ComCall(12, this, "ptr", pstatstg, "uint", grfStatFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} ppstm 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-istream-clone
     */
    Clone(ppstm) {
        result := ComCall(13, this, "ptr*", ppstm, "HRESULT")
        return result
    }
}
