#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Automation\Peers\ButtonAutomationPeer.ahk
#Include .\IDropDownButtonAutomationPeer.ahk
#Include ..\Automation\Provider\IExpandCollapseProvider.ahk
#Include .\IDropDownButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes [DropDownButton](dropdownbutton.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.DropDownButtonAutomationPeer](/windows/winui/api/microsoft.ui.xaml.controls.dropdownbuttonautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dropdownbuttonautomationpeer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class DropDownButtonAutomationPeer extends ButtonAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDropDownButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDropDownButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {DropDownButton} owner 
     * @returns {DropDownButtonAutomationPeer} 
     */
    static CreateInstance(owner) {
        if (!DropDownButtonAutomationPeer.HasProp("__IDropDownButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.DropDownButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDropDownButtonAutomationPeerFactory.IID)
            DropDownButtonAutomationPeer.__IDropDownButtonAutomationPeerFactory := IDropDownButtonAutomationPeerFactory(factoryPtr)
        }

        return DropDownButtonAutomationPeer.__IDropDownButtonAutomationPeerFactory.CreateInstance(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state, expanded or collapsed, of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.DropDownButtonAutomationPeer.ExpandCollapseState](/windows/winui/api/microsoft.ui.xaml.controls.dropdownbuttonautomationpeer.expandcollapsestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dropdownbuttonautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExpandCollapseState() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.get_ExpandCollapseState()
    }

    /**
     * Hides the control's drop down menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.DropDownButtonAutomationPeer.Collapse](/windows/winui/api/microsoft.ui.xaml.controls.dropdownbuttonautomationpeer.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dropdownbuttonautomationpeer.collapse
     */
    Collapse() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Collapse()
    }

    /**
     * Displays the control's drop down menu.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.DropDownButtonAutomationPeer.Expand](/windows/winui/api/microsoft.ui.xaml.controls.dropdownbuttonautomationpeer.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.dropdownbuttonautomationpeer.expand
     */
    Expand() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Expand()
    }

;@endregion Instance Methods
}
