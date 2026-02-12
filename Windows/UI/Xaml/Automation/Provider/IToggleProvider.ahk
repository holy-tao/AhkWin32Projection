#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support Microsoft UI Automation client access to controls that can cycle through a set of states and maintain a particular state. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.Toggle](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * Controls that do not maintain state when activated, such as buttons, toolbar buttons, and hyperlinks, must implement [IInvokeProvider](iinvokeprovider.md) instead. The **Toggle** pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Toggle Control Pattern](/windows/desktop/WinAuto/uiauto-implementingtoggle).
 * 
 * IToggleProvider is implemented by these existing Windows Runtime classes:
 * + [AppBarAutomationPeer](../windows.ui.xaml.automation.peers/appbarautomationpeer.md)
 * + [SemanticZoomAutomationPeer](../windows.ui.xaml.automation.peers/semanticzoomautomationpeer.md)
 * + [ToggleSwitchAutomationPeer](../windows.ui.xaml.automation.peers/toggleswitchautomationpeer.md)
 * + [ToggleButtonAutomationPeer](../windows.ui.xaml.automation.peers/togglebuttonautomationpeer.md), which is the base class for [RadioButtonAutomationPeer](../windows.ui.xaml.automation.peers/radiobuttonautomationpeer.md) and [CheckBoxAutomationPeer](../windows.ui.xaml.automation.peers/checkboxautomationpeer.md)
 * 
 * 
 * Use [TogglePatternIdentifiers](../windows.ui.xaml.automation/togglepatternidentifiers.md) if you want to reference the IToggleProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itoggleprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IToggleProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleProvider
     * @type {Guid}
     */
    static IID => Guid("{93b88290-656f-44f7-aeaf-78b8f944d062}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ToggleState", "Toggle"]

    /**
     * Gets the toggle state of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itoggleprovider.togglestate
     * @type {Integer} 
     */
    ToggleState {
        get => this.get_ToggleState()
    }

    /**
     * Specifies the toggle state of the control.
     * @remarks
     * A control must cycle through its <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState</a> in this order:  
     * <b>ToggleState_On</b>, <b>ToggleState_Off</b> 
     * and, if supported, <b>ToggleState_Indeterminate</b>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itoggleprovider-get_togglestate
     */
    get_ToggleState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Cycles through the toggle states of a control.
     * @remarks
     * A control must cycle through its <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-togglestate">ToggleState</a> in this order: 
     * <b>ToggleState_On</b>, <b>ToggleState_Off</b> 
     * and, if supported, <b>ToggleState_Indeterminate</b>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itoggleprovider-toggle
     */
    Toggle() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
