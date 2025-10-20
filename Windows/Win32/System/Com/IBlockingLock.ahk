#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides a semaphore that can be used to provide temporarily exclusive access to a shared resource such as a file.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-iblockinglock
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IBlockingLock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBlockingLock
     * @type {Guid}
     */
    static IID => Guid("{30f3d47a-6447-11d1-8e3c-00c04fb9386d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lock", "Unlock"]

    /**
     * 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iblockinglock-lock
     */
    Lock(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-iblockinglock-unlock
     */
    Unlock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
