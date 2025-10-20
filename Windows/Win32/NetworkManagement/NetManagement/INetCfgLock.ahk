#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgLock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgLock
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae9f-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireWriteLock", "ReleaseWriteLock", "IsWriteLocked"]

    /**
     * 
     * @param {Integer} cmsTimeout 
     * @param {PWSTR} pszwClientDescription 
     * @param {Pointer<PWSTR>} ppszwClientDescription 
     * @returns {HRESULT} 
     */
    AcquireWriteLock(cmsTimeout, pszwClientDescription, ppszwClientDescription) {
        pszwClientDescription := pszwClientDescription is String ? StrPtr(pszwClientDescription) : pszwClientDescription

        result := ComCall(3, this, "uint", cmsTimeout, "ptr", pszwClientDescription, "ptr", ppszwClientDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseWriteLock() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwClientDescription 
     * @returns {HRESULT} 
     */
    IsWriteLocked(ppszwClientDescription) {
        result := ComCall(5, this, "ptr", ppszwClientDescription, "HRESULT")
        return result
    }
}
