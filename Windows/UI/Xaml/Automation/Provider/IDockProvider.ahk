#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that expose their dock properties in a docking container. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Dock](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * A docking container is a control that allows you to arrange child elements horizontally and vertically, relative to each other. For more info on what this pattern is for, see [Dock Control Pattern](/windows/desktop/WinAuto/uiauto-implementingdock).
 * 
 * IDockProvider isn't implemented by any existing Windows Runtime automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [DockPatternIdentifiers](../windows.ui.xaml.automation/dockpatternidentifiers.md) if you want to reference the IDockProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idockprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IDockProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDockProvider
     * @type {Guid}
     */
    static IID => Guid("{48c243f8-78b1-44a0-ac5f-750757bcde3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DockPosition", "SetDockPosition"]

    /**
     * Gets the current [DockPosition](../windows.ui.xaml.automation/dockposition.md) of the control in a docking container.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idockprovider.dockposition
     * @type {Integer} 
     */
    DockPosition {
        get => this.get_DockPosition()
    }

    /**
     * Indicates the current docking position of this element.
     * @remarks
     * A docking container is a control that allows the arrangement of child elements, both horizontally and vertically, relative to the boundaries of the docking container and other elements in the container.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-idockprovider-get_dockposition
     */
    get_DockPosition() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Docks the control in a docking container.
     * @param {Integer} dockPosition_ The dock position, relative to the boundaries of the docking container and to other elements in the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.idockprovider.setdockposition
     */
    SetDockPosition(dockPosition_) {
        result := ComCall(7, this, "int", dockPosition_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
