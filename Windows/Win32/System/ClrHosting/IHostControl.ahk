#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostControl
     * @type {Guid}
     */
    static IID => Guid("{02ca073c-7079-4860-880a-c2f7a449c991}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHostManager", "SetAppDomainManager"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppObject 
     * @returns {HRESULT} 
     */
    GetHostManager(riid, ppObject) {
        result := ComCall(3, this, "ptr", riid, "ptr*", ppObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainID 
     * @param {IUnknown} pUnkAppDomainManager 
     * @returns {HRESULT} 
     */
    SetAppDomainManager(dwAppDomainID, pUnkAppDomainManager) {
        result := ComCall(4, this, "uint", dwAppDomainID, "ptr", pUnkAppDomainManager, "HRESULT")
        return result
    }
}
