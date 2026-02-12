#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support access by a Microsoft UI Automation client to controls that visually expand to display content and that collapse to hide content. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.ExpandCollapse](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [ExpandCollapse Control Pattern](/windows/desktop/WinAuto/uiauto-implementingexpandcollapse).
 * 
 * IExpandCollapseProvider is implemented by the existing Windows Runtime automation peer for [ComboBox](../windows.ui.xaml.controls/combobox.md) ([ComboBoxAutomationPeer](../windows.ui.xaml.automation.peers/comboboxautomationpeer.md)).
 * 
 * Use [ExpandCollapsePatternIdentifiers](../windows.ui.xaml.automation/expandcollapsepatternidentifiers.md) if you want to reference the IExpandCollapseProvider pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iexpandcollapseprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IExpandCollapseProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IExpandCollapseProvider
     * @type {Guid}
     */
    static IID => Guid("{49ac8399-d626-4543-94b9-a6d9a9593af6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExpandCollapseState", "Collapse", "Expand"]

    /**
     * Gets the state (expanded or collapsed) of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iexpandcollapseprovider.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Indicates the state, expanded or collapsed, of the control.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-get_expandcollapsestate
     */
    get_ExpandCollapseState() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Hides all child nodes, controls, or content of this element.
     * @remarks
     * This is a blocking method that returns after the element has been collapsed.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-collapse
     */
    Collapse() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays all child nodes, controls, or content of the control.
     * @remarks
     * This is a blocking method that returns after the control has been expanded.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iexpandcollapseprovider-expand
     */
    Expand() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
