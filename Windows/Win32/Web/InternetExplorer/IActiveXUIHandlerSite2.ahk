#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IActiveXUIHandlerSite2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActiveXUIHandlerSite2
     * @type {Guid}
     */
    static IID => Guid("{7e3707b2-d087-4542-ac1f-a0d2fcd080fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSuspensionExemption", "RemoveSuspensionExemption"]

    /**
     * 
     * @param {Pointer<Integer>} pullCookie 
     * @returns {HRESULT} 
     */
    AddSuspensionExemption(pullCookie) {
        pullCookieMarshal := pullCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pullCookieMarshal, pullCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ullCookie 
     * @returns {HRESULT} 
     */
    RemoveSuspensionExemption(ullCookie) {
        result := ComCall(4, this, "uint", ullCookie, "HRESULT")
        return result
    }
}
