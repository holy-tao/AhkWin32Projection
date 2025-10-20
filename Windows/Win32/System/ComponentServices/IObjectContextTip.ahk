#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves properties describing the Transaction Internet Protocol (TIP) transaction context.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iobjectcontexttip
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IObjectContextTip extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectContextTip
     * @type {Guid}
     */
    static IID => Guid("{92fd41ca-bad9-11d2-9a2d-00c04f797bc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTipUrl"]

    /**
     * 
     * @param {Pointer<BSTR>} pTipUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontexttip-gettipurl
     */
    GetTipUrl(pTipUrl) {
        result := ComCall(3, this, "ptr", pTipUrl, "HRESULT")
        return result
    }
}
