#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISchemaLock extends IUnknown{
    /**
     * The interface identifier for ISchemaLock
     * @type {Guid}
     */
    static IID => Guid("{4c2389fb-2511-11d4-b258-00c04f7971ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Integer} lmMode 
     * @param {Pointer<HANDLE>} phLockHandle 
     * @param {Pointer<UInt64>} pTableVersion 
     * @returns {HRESULT} 
     */
    GetSchemaLock(pTableID, lmMode, phLockHandle, pTableVersion) {
        result := ComCall(3, this, "ptr", pTableID, "uint", lmMode, "ptr", phLockHandle, "uint*", pTableVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hLockHandle 
     * @returns {HRESULT} 
     */
    ReleaseSchemaLock(hLockHandle) {
        hLockHandle := hLockHandle is Win32Handle ? NumGet(hLockHandle, "ptr") : hLockHandle

        result := ComCall(4, this, "ptr", hLockHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
