#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorAutomationPeer.ahk
#Include .\IComboBoxAutomationPeer.ahk
#Include ..\Provider\IValueProvider.ahk
#Include ..\Provider\IExpandCollapseProvider.ahk
#Include ..\Provider\IWindowProvider.ahk
#Include .\IComboBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [ComboBox](../windows.ui.xaml.controls/combobox.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ComboBox](../windows.ui.xaml.controls/combobox.md) class creates a new ComboBoxAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ComboBoxAutomationPeer if you are deriving a custom class from [ComboBox](../windows.ui.xaml.controls/combobox.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ComboBoxAutomationPeer extends SelectorAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ComboBox} owner 
     * @returns {ComboBoxAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ComboBoxAutomationPeer.HasProp("__IComboBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ComboBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxAutomationPeerFactory.IID)
            ComboBoxAutomationPeer.__IComboBoxAutomationPeerFactory := IComboBoxAutomationPeerFactory(factoryPtr)
        }

        return ComboBoxAutomationPeer.__IComboBoxAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that specifies whether the value of a control is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the value of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * Gets the state, expanded or collapsed, of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.expandcollapsestate
     * @type {Integer} 
     */
    ExpandCollapseState {
        get => this.get_ExpandCollapseState()
    }

    /**
     * Gets a Boolean value indicating if the [ComboBox](../windows.ui.xaml.controls/combobox.md) control is modal.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.ismodal
     * @type {Boolean} 
     */
    IsModal {
        get => this.get_IsModal()
    }

    /**
     * Gets a Boolean value indicating if the [ComboBox](../windows.ui.xaml.controls/combobox.md) control is topmost.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.istopmost
     * @type {Boolean} 
     */
    IsTopmost {
        get => this.get_IsTopmost()
    }

    /**
     * Gets a Boolean value indicating if the [ComboBox](../windows.ui.xaml.controls/combobox.md) control can be maximized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.maximizable
     * @type {Boolean} 
     */
    Maximizable {
        get => this.get_Maximizable()
    }

    /**
     * Gets a Boolean value indicating if the [ComboBox](../windows.ui.xaml.controls/combobox.md) control can be minimized.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.minimizable
     * @type {Boolean} 
     */
    Minimizable {
        get => this.get_Minimizable()
    }

    /**
     * Gets the interaction state of the [ComboBox](../windows.ui.xaml.controls/combobox.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.interactionstate
     * @type {Integer} 
     */
    InteractionState {
        get => this.get_InteractionState()
    }

    /**
     * Gets the [WindowVisualState](../windows.ui.xaml.automation/windowvisualstate.md) for the [ComboBox](../windows.ui.xaml.controls/combobox.md) control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.visualstate
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
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.get_IsReadOnly()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.get_Value()
    }

    /**
     * Sets the value of a control, as an implementation of the [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md) pattern.
     * @param {HSTRING} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.setvalue
     */
    SetValue(value) {
        if (!this.HasProp("__IValueProvider")) {
            if ((queryResult := this.QueryInterface(IValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueProvider := IValueProvider(outPtr)
        }

        return this.__IValueProvider.SetValue(value)
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.collapse
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.expand
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
     * Attempts to close the [ComboBox](../windows.ui.xaml.controls/combobox.md) control.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.close
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
     * Changes the visual state of the [ComboBox](../windows.ui.xaml.controls/combobox.md) control.
     * @param {Integer} state The visual state for the [ComboBox](../windows.ui.xaml.controls/combobox.md) control, as a value of the enumeration.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.setvisualstate
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
     * Causes the calling code to block for the specified time or until the associated process enters an idle state, whichever completes first.
     * @param {Integer} milliseconds The amount of time, in milliseconds, to wait for the associated process to become idle. The maximum is **Int32.MaxValue**.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxautomationpeer.waitforinputidle
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
