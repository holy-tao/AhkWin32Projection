#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that initiate or perform a single, unambiguous action and do not maintain state when activated.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must 
  *         support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementinginvoke">Invoke</a> control pattern.
  * 		
  * 
  * Controls implement <b>IInvokeProvider</b> if the same behavior is not 
  *         exposed through another  control pattern provider. For example, if 
  *         the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke">Invoke</a> method of a control performs the same 
  *         action as the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand">IExpandCollapseProvider::Expand</a> or <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse">Collapse</a> 
  *         method, the control should not also implement <b>IInvokeProvider</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iinvokeprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IInvokeProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInvokeProvider
     * @type {Guid}
     */
    static IID => Guid("{54fcb24b-e18e-47a2-b4d3-eccbe77599a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iinvokeprovider-invoke
     */
    Invoke() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
