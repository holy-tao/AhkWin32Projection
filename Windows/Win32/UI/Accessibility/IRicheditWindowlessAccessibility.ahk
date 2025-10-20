#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the host container of a windowless rich edit control to obtain the Microsoft UI Automation provider for the parent of the control.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nn-textserv-iricheditwindowlessaccessibility
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IRicheditWindowlessAccessibility extends IUnknown{
    /**
     * The interface identifier for IRicheditWindowlessAccessibility
     * @type {Guid}
     */
    static IID => Guid("{983e572d-20cd-460b-9104-83111592dd10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IRawElementProviderWindowlessSite>} pSite 
     * @param {Pointer<IRawElementProviderSimple>} ppProvider 
     * @returns {HRESULT} 
     */
    CreateProvider(pSite, ppProvider) {
        result := ComCall(3, this, "ptr", pSite, "ptr", ppProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
