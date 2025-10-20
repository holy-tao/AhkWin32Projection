#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives Acessibility Window Docking events.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-iaccessibilitydockingservicecallback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IAccessibilityDockingServiceCallback extends IUnknown{
    /**
     * The interface identifier for IAccessibilityDockingServiceCallback
     * @type {Guid}
     */
    static IID => Guid("{157733fd-a592-42e5-b594-248468c5a81b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} undockReason 
     * @returns {HRESULT} 
     */
    Undocked(undockReason) {
        result := ComCall(3, this, "int", undockReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
