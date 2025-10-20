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
     * 
     * @param {Integer} dwTimeout 
     * @returns {HRESULT} 
     */
    Lock(dwTimeout) {
        result := ComCall(3, this, "uint", dwTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlock() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
