#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostControl extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppObject 
     * @returns {HRESULT} 
     */
    GetHostManager(riid, ppObject) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAppDomainID 
     * @param {Pointer<IUnknown>} pUnkAppDomainManager 
     * @returns {HRESULT} 
     */
    SetAppDomainManager(dwAppDomainID, pUnkAppDomainManager) {
        result := ComCall(4, this, "uint", dwAppDomainID, "ptr", pUnkAppDomainManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
