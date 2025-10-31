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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Undocked"]

    /**
     * 
     * @param {Integer} undockReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-iaccessibilitydockingservicecallback-undocked
     */
    Undocked(undockReason) {
        result := ComCall(3, this, "int", undockReason, "HRESULT")
        return result
    }
}
