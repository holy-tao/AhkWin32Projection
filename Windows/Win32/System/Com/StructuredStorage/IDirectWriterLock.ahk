#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IDirectWriterLock interface enables a single writer to obtain exclusive write access to a root storage object opened in direct mode while allowing concurrent access by multiple readers.
 * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nn-objidl-idirectwriterlock
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IDirectWriterLock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectWriterLock
     * @type {Guid}
     */
    static IID => Guid("{0e6d4d92-6738-11cf-9608-00aa00680db4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WaitForWriteAccess", "ReleaseWriteAccess", "HaveWriteAccess"]

    /**
     * The WaitForWriteAccess method obtains exclusive write access to a storage object.
     * @remarks
     * When a storage is opened in direct mode (STGM_DIRECT) with the STGM_READWRITE|STGM_SHARE_DENY_WRITE, you can call this method to obtain exclusive write access to the storage.
     * 
     * This method returns immediately if no readers have the storage open. If the storage is still open for reading, this method blocks for the specified <i>dwTimeout</i> or until the current readers close the storage.
     * @param {Integer} dwTimeout Specifies the time in milliseconds that this method blocks while waiting to obtain exclusive write access to the storage object. If <i>dwTimeout</i> is zero, the method does not block waiting for exclusive access for writing. The INFINITE time-out defined in the Platform SDK is allowed for <i>dwTimeout</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The caller has successfully obtained exclusive write access to the storage.|
     * |S_FALSE | This method was called again without an intervening call to IDirectWriterLock::ReleaseWriteAccess.|
     * |STG_E_INUSE | The specified time-out expired without obtaining exclusive write access.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess
     */
    WaitForWriteAccess(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The ReleaseWriteAccess method releases the write lock previously obtained.
     * @remarks
     * The writer calls this method to release exclusive access to the storage object previously taken by calling <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess">IDirectWriterLock::WaitForWriteAccess</a>.
     * 
     * After the writer calls this method, it is safe to allow readers to reopen the storage again until the next call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess">IDirectWriterLock::WaitForWriteAccess</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The write lock was successfully released.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idirectwriterlock-releasewriteaccess
     */
    ReleaseWriteAccess() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The HaveWriteAccess method indicates whether the write lock has been taken.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The storage object is currently locked for write access.|
     * |S_FALSE | The storage object is not currently locked for write access.|
     * @see https://learn.microsoft.com/windows/win32/api//content/objidl/nf-objidl-idirectwriterlock-havewriteaccess
     */
    HaveWriteAccess() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
