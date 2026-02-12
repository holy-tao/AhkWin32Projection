#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Automation\Peers\FrameworkElementAutomationPeer.ahk
#Include .\IToggleSplitButtonAutomationPeer.ahk
#Include ..\Automation\Provider\IExpandCollapseProvider.ahk
#Include ..\Automation\Provider\IToggleProvider.ahk
#Include .\IToggleSplitButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes [ToggleSplitButton](togglesplitbutton.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ToggleSplitButtonAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToggleSplitButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToggleSplitButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ToggleSplitButton} owner 
     * @returns {ToggleSplitButtonAutomationPeer} 
     */
    static CreateInstance(owner) {
        if (!ToggleSplitButtonAutomationPeer.HasProp("__IToggleSplitButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IToggleSplitButtonAutomationPeerFactory.IID)
            ToggleSplitButtonAutomationPeer.__IToggleSplitButtonAutomationPeerFactory := IToggleSplitButtonAutomationPeerFactory(factoryPtr)
        }

        return ToggleSplitButtonAutomationPeer.__IToggleSplitButtonAutomationPeerFactory.CreateInstance(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state, expanded or collapsed, of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer.ExpandCollapseState](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer.expandcollapsestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Gets the toggle state of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer.ToggleState](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer.togglestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer.togglestate
     * @type {Integer} 
     */
    ToggleState {
        get => this.get_ToggleState()
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
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer.Collapse](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer.collapse
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
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer.Expand](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer.expand
     */
    Expand() {
        if (!this.HasProp("__IExpandCollapseProvider")) {
            if ((queryResult := this.QueryInterface(IExpandCollapseProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IExpandCollapseProvider := IExpandCollapseProvider(outPtr)
        }

        return this.__IExpandCollapseProvider.Expand()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleState() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.get_ToggleState()
    }

    /**
     * Cycles through the toggle states of a control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.ToggleSplitButtonAutomationPeer.Toggle](/windows/winui/api/microsoft.ui.xaml.controls.togglesplitbuttonautomationpeer.toggle) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.togglesplitbuttonautomationpeer.toggle
     */
    Toggle() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.Toggle()
    }

;@endregion Instance Methods
}
