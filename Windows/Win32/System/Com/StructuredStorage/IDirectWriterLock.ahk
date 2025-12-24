#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IDirectWriterLock interface enables a single writer to obtain exclusive write access to a root storage object opened in direct mode while allowing concurrent access by multiple readers.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-idirectwriterlock
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
     * @param {Integer} dwTimeout Specifies the time in milliseconds that this method blocks while waiting to obtain exclusive write access to the storage object. If <i>dwTimeout</i> is zero, the method does not block waiting for exclusive access for writing. The INFINITE time-out defined in the Platform SDK is allowed for <i>dwTimeout</i>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The caller has successfully obtained exclusive write access to the storage.|
     * |S_FALSE | This method was called again without an intervening call to IDirectWriterLock::ReleaseWriteAccess.|
     * |STG_E_INUSE | The specified time-out expired without obtaining exclusive write access.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idirectwriterlock-waitforwriteaccess
     */
    WaitForWriteAccess(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * The ReleaseWriteAccess method releases the write lock previously obtained.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The write lock was successfully released.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idirectwriterlock-releasewriteaccess
     */
    ReleaseWriteAccess() {
        result := ComCall(4, this, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-idirectwriterlock-havewriteaccess
     */
    HaveWriteAccess() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
