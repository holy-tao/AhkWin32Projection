#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IRawElementProviderSimple.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes a Microsoft UI Automation method to enable applications to find an element in a container, such as a virtualized list. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.ItemContainer](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * Controls that contain a large number of child items can use virtualization to efficiently manage the items. With virtualization, the control maintains full information in memory for only a subset of items at any given time. Typically, the subset includes only those items that are currently visible to the user. Full information about the remaining virtualized items is kept in storage and is loaded into memory, or realized, as the control needs it, for example, as new items become visible to the user. A related pattern is [IVirtualizedItemProvider](ivirtualizeditemprovider.md). For more info on what this pattern is for, see [ItemContainer Control Pattern](/windows/desktop/WinAuto/uiauto-implementingitemcontainer).
 * 
 * IItemContainerProvider is implemented by the existing Windows Runtime automation peers for various list controls or views, controls that share the base class [ItemsControl](../windows.ui.xaml.controls/itemscontrol.md). Each of these peers inherits from [ItemsControlAutomationPeer](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer.md), and [ItemsControlAutomationPeer](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer.md) provides the common [FindItemByProperty](../windows.ui.xaml.automation.peers/itemscontrolautomationpeer_finditembyproperty_1997743353.md) implementation.
 * 
 * The IItemContainerProvider pattern doesn't have a pattern property identifier class, the only API to implement is [FindItemByProperty](iitemcontainerprovider_finditembyproperty_1997743353.md), a method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iitemcontainerprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IItemContainerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IItemContainerProvider
     * @type {Guid}
     */
    static IID => Guid("{ef5cd845-e1d4-40f4-bad5-c7fad44a703e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindItemByProperty"]

    /**
     * Retrieves an element within a containing element, based on a specified property value. (IItemContainerProvider.FindItemByProperty)
     * @remarks
     * For virtual lists, the element returned may be a placeholder. <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-ivirtualizeditemprovider-realize">IVirtualizedItemProvider::Realize</a> can then be used to make the item fully available.
     * 
     * The method returns E_INVALIDARG if searching by the specified property is not supported. Most containers should support <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_NamePropertyId</a> and, if appropriate, <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-automation-element-propids">UIA_AutomationIdPropertyId</a> and <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-control-pattern-propids">UIA_SelectionItemIsSelectedPropertyId</a>.
     * 
     * If <i>propertyId</i> is 0, all items are a match. This value can be  used
     * with <i>pStartAfter</i> equalling <b>NULL</b> to get the first item, and then to get successive
     * items. In this case, <i>value</i> should be VT_EMPTY.
     * @param {IRawElementProviderSimple} startAfter 
     * @param {AutomationProperty} automationProperty_ 
     * @param {IInspectable} value Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinAuto/variant-structure">VARIANT</a></b>
     * 
     * The value of the property.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iitemcontainerprovider-finditembyproperty
     */
    FindItemByProperty(startAfter, automationProperty_, value) {
        result := ComCall(6, this, "ptr", startAfter, "ptr", automationProperty_, "ptr", value, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IRawElementProviderSimple(result_)
    }
}
