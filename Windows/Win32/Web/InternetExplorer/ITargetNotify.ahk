#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class ITargetNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetNotify
     * @type {Guid}
     */
    static IID => Guid("{863a99a0-21bc-11d0-82b4-00a0c90c29c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCreate", "OnReuse"]

    /**
     * 
     * @param {IUnknown} pUnkDestination 
     * @param {Integer} cbCookie 
     * @returns {HRESULT} 
     */
    OnCreate(pUnkDestination, cbCookie) {
        result := ComCall(3, this, "ptr", pUnkDestination, "uint", cbCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkDestination 
     * @returns {HRESULT} 
     */
    OnReuse(pUnkDestination) {
        result := ComCall(4, this, "ptr", pUnkDestination, "HRESULT")
        return result
    }
}
