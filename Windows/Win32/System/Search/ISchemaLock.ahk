#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISchemaLock extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSchemaLock", "ReleaseSchemaLock"]

    /**
     * 
     * @param {Pointer<DBID>} pTableID 
     * @param {Integer} lmMode 
     * @param {Pointer<HANDLE>} phLockHandle 
     * @param {Pointer<Integer>} pTableVersion 
     * @returns {HRESULT} 
     */
    GetSchemaLock(pTableID, lmMode, phLockHandle, pTableVersion) {
        result := ComCall(3, this, "ptr", pTableID, "uint", lmMode, "ptr", phLockHandle, "uint*", pTableVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hLockHandle 
     * @returns {HRESULT} 
     */
    ReleaseSchemaLock(hLockHandle) {
        hLockHandle := hLockHandle is Win32Handle ? NumGet(hLockHandle, "ptr") : hLockHandle

        result := ComCall(4, this, "ptr", hLockHandle, "HRESULT")
        return result
    }
}
