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
     * 
     * @param {Pointer<BSTR>} pTipUrl 
     * @returns {HRESULT} 
     */
    GetTipUrl(pTipUrl) {
        result := ComCall(3, this, "ptr", pTipUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
