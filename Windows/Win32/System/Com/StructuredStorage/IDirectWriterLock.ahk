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
     * 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-waitforwriteaccess
     */
    WaitForWriteAccess(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-releasewriteaccess
     */
    ReleaseWriteAccess() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-idirectwriterlock-havewriteaccess
     */
    HaveWriteAccess() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
