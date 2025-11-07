#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that retrieves an item from a container, such as a virtual list.
 * @remarks
 * 
  * This interface is not limited to use by virtualized containers. Any container that can implement efficient name lookup can support this <i>control pattern</i>, enabling clients to look up names more quickly than by using methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-findfirst">FindFirst</a>, which must traverse the Microsoft UI Automation tree.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationitemcontainerpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationItemContainerPattern extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationItemContainerPattern
     * @type {Guid}
     */
    static IID => Guid("{c690fdb2-27a8-423c-812d-429773c9084e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindItemByProperty"]

    /**
     * 
     * @param {IUIAutomationElement} pStartAfter 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @returns {IUIAutomationElement} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationitemcontainerpattern-finditembyproperty
     */
    FindItemByProperty(pStartAfter, propertyId, value) {
        result := ComCall(3, this, "ptr", pStartAfter, "int", propertyId, "ptr", value, "ptr*", &pFound := 0, "HRESULT")
        return IUIAutomationElement(pFound)
    }
}
