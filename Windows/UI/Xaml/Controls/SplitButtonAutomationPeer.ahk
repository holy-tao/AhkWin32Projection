#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Automation\Peers\FrameworkElementAutomationPeer.ahk
#Include .\ISplitButtonAutomationPeer.ahk
#Include ..\Automation\Provider\IExpandCollapseProvider.ahk
#Include ..\Automation\Provider\IInvokeProvider.ahk
#Include .\ISplitButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes [SplitButton](splitbutton.md) types to Microsoft UI Automation.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButtonAutomationPeer](/windows/winui/api/microsoft.ui.xaml.controls.splitbuttonautomationpeer) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbuttonautomationpeer
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SplitButtonAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {SplitButton} owner 
     * @returns {SplitButtonAutomationPeer} 
     */
    static CreateInstance(owner) {
        if (!SplitButtonAutomationPeer.HasProp("__ISplitButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SplitButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISplitButtonAutomationPeerFactory.IID)
            SplitButtonAutomationPeer.__ISplitButtonAutomationPeerFactory := ISplitButtonAutomationPeerFactory(factoryPtr)
        }

        return SplitButtonAutomationPeer.__ISplitButtonAutomationPeerFactory.CreateInstance(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the state, expanded or collapsed, of the control.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButtonAutomationPeer.ExpandCollapseState](/windows/winui/api/microsoft.ui.xaml.controls.splitbuttonautomationpeer.expandcollapsestate) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbuttonautomationpeer.expandcollapsestate
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
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButtonAutomationPeer.Collapse](/windows/winui/api/microsoft.ui.xaml.controls.splitbuttonautomationpeer.collapse) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbuttonautomationpeer.collapse
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
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButtonAutomationPeer.Expand](/windows/winui/api/microsoft.ui.xaml.controls.splitbuttonautomationpeer.expand) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbuttonautomationpeer.expand
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
     * Sends a request to click the button associated with the automation peer.
     * 
     * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.SplitButtonAutomationPeer.Invoke](/windows/winui/api/microsoft.ui.xaml.controls.splitbuttonautomationpeer.invoke) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.splitbuttonautomationpeer.invoke
     */
    Invoke() {
        if (!this.HasProp("__IInvokeProvider")) {
            if ((queryResult := this.QueryInterface(IInvokeProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInvokeProvider := IInvokeProvider(outPtr)
        }

        return this.__IInvokeProvider.Invoke()
    }

;@endregion Instance Methods
}
