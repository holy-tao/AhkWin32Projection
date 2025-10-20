#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IActiveXUIHandlerSite2 extends IUnknown{
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
     * 
     * @param {Pointer<UInt64>} pullCookie 
     * @returns {HRESULT} 
     */
    AddSuspensionExemption(pullCookie) {
        result := ComCall(3, this, "uint*", pullCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullCookie 
     * @returns {HRESULT} 
     */
    RemoveSuspensionExemption(ullCookie) {
        result := ComCall(4, this, "uint", ullCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
