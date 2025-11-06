#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as containers of other controls, such as a virtual list-view.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingitemcontainer">ItemContainer</a> control pattern allows a container object to efficiently lookup an item by a 
  * 		specified automation element property, such as Name, AutomationId, or IsSelected state. While this control 
  * 		pattern is introduced with a view to being used by virtualized containers, it can be implemented by any container 
  * 		that provides name lookup, independently of whether that container uses virtualization.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iitemcontainerprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IItemContainerProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemContainerProvider
     * @type {Guid}
     */
    static IID => Guid("{e747770b-39ce-4382-ab30-d8fb3f336f24}")

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
     * @param {IRawElementProviderSimple} pStartAfter 
     * @param {Integer} propertyId 
     * @param {VARIANT} value 
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iitemcontainerprovider-finditembyproperty
     */
    FindItemByProperty(pStartAfter, propertyId, value) {
        result := ComCall(3, this, "ptr", pStartAfter, "int", propertyId, "ptr", value, "ptr*", &pFound := 0, "HRESULT")
        return IRawElementProviderSimple(pFound)
    }
}
