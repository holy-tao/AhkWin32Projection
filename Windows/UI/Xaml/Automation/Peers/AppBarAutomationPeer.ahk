#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IAppBarAutomationPeer.ahk
#Include ..\Provider\IToggleProvider.ahk
#Include ..\Provider\IExpandCollapseProvider.ahk
#Include ..\Provider\IWindowProvider.ahk
#Include .\IAppBarAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [AppBar](../windows.ui.xaml.controls/appbar.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [AppBar](../windows.ui.xaml.controls/appbar.md) class creates a new AppBarAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from AppBarAutomationPeer if you are deriving a custom class from [AppBar](../windows.ui.xaml.controls/appbar.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AppBarAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppBarAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppBarAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {AppBar} owner 
     * @returns {AppBarAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!AppBarAutomationPeer.HasProp("__IAppBarAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AppBarAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppBarAutomationPeerFactory.IID)
            AppBarAutomationPeer.__IAppBarAutomationPeerFactory := IAppBarAutomationPeerFactory(factoryPtr)
        }

        return AppBarAutomationPeer.__IAppBarAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Retrieves the toggle state of the owner [AppBar](../windows.ui.xaml.controls/appbar.md).
     * @remarks
     * An automation element must cycle through its toggle state in this order: **On**, **Off** and, if supported, **Indeterminate**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.togglestate
     * @type {Integer} 
     */
    ToggleState {
        get => this.get_ToggleState()
    }

    /**
     * Gets the state, expanded or collapsed, of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Gets a Boolean value indicating if the app bar is modal.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.ismodal
     * @type {Boolean} 
     */
    IsModal {
        get => this.get_IsModal()
    }

    /**
     * Gets a Boolean value indicating if the app bar is the topmost element in the z-order of layout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.istopmost
     * @type {Boolean} 
     */
    IsTopmost {
        get => this.get_IsTopmost()
    }

    /**
     * Gets a Boolean value that indicates whether the app bar can be maximized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.maximizable
     * @type {Boolean} 
     */
    Maximizable {
        get => this.get_Maximizable()
    }

    /**
     * Gets a Boolean value that indicates whether the app bar can be minimized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.minimizable
     * @type {Boolean} 
     */
    Minimizable {
        get => this.get_Minimizable()
    }

    /**
     * Gets the interaction state of the app bar, such as running, closing, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.interactionstate
     * @type {Integer} 
     */
    InteractionState {
        get => this.get_InteractionState()
    }

    /**
     * Gets the visual state of the app bar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.visualstate
     * @type {Integer} 
     */
    VisualState {
        get => this.get_VisualState()
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
    get_ToggleState() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.get_ToggleState()
    }

    /**
     * Cycles through the toggle states of an [AppBarAutomationPeer](appbarautomationpeer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.toggle
     */
    Toggle() {
        if (!this.HasProp("__IToggleProvider")) {
            if ((queryResult := this.QueryInterface(IToggleProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToggleProvider := IToggleProvider(outPtr)
        }

        return this.__IToggleProvider.Toggle()
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
     * Hides all nodes, controls, or content that are descendants of the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.collapse
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
     * Displays all child nodes, controls, or content of the control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.expand
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
     * @returns {Boolean} 
     */
    get_IsModal() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_IsModal()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTopmost() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_IsTopmost()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Maximizable() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_Maximizable()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Minimizable() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_Minimizable()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionState() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_InteractionState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VisualState() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.get_VisualState()
    }

    /**
     * Closes the app bar.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.close
     */
    Close() {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.Close()
    }

    /**
     * Changes the visual state of the app bar (such as minimizing or maximizing it).
     * @param {Integer} state The visual state of the app bar to change to, as a value of the enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.setvisualstate
     */
    SetVisualState(state) {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.SetVisualState(state)
    }

    /**
     * Blocks the calling code for the specified time or until the associated process enters an idle state, whichever completes first.
     * @param {Integer} milliseconds The amount of time, in milliseconds, to wait for the associated process to become idle.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.appbarautomationpeer.waitforinputidle
     */
    WaitForInputIdle(milliseconds) {
        if (!this.HasProp("__IWindowProvider")) {
            if ((queryResult := this.QueryInterface(IWindowProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowProvider := IWindowProvider(outPtr)
        }

        return this.__IWindowProvider.WaitForInputIdle(milliseconds)
    }

;@endregion Instance Methods
}
