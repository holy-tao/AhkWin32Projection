#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IAutoSuggestBoxAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IAutoSuggestBoxAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.autosuggestboxautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutoSuggestBoxAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoSuggestBoxAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoSuggestBoxAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [AutoSuggestBoxAutomationPeer](autosuggestboxautomationpeer.md) class.
     * @param {AutoSuggestBox} owner The owner element to create for.
     * @returns {AutoSuggestBoxAutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.autosuggestboxautomationpeer.#ctor
     */
    static CreateInstanceWithOwner(owner) {
        if (!AutoSuggestBoxAutomationPeer.HasProp("__IAutoSuggestBoxAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutoSuggestBoxAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoSuggestBoxAutomationPeerFactory.IID)
            AutoSuggestBoxAutomationPeer.__IAutoSuggestBoxAutomationPeerFactory := IAutoSuggestBoxAutomationPeerFactory(factoryPtr)
        }

        return AutoSuggestBoxAutomationPeer.__IAutoSuggestBoxAutomationPeerFactory.CreateInstanceWithOwner(owner)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to submit the auto-suggest query to the [AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) associated with the automation peer.
     * @remarks
     * Calls to **Invoke** should return immediately without blocking. However, this behavior is entirely dependent on the Microsoft UI Automation provider implementation. In scenarios where calling **Invoke** causes a blocking issue, such as a modal dialog, a separate helper thread may be required to call the method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.autosuggestboxautomationpeer.invoke
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
