#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBaseAutomationPeer.ahk
#Include .\IButtonAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [Button](../windows.ui.xaml.controls/button.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [Button](../windows.ui.xaml.controls/button.md) class creates a new ButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ButtonAutomationPeer if you are deriving a custom class from [Button](../windows.ui.xaml.controls/button.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.buttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ButtonAutomationPeer extends ButtonBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Button} owner 
     * @returns {ButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ButtonAutomationPeer.HasProp("__IButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IButtonAutomationPeerFactory.IID)
            ButtonAutomationPeer.__IButtonAutomationPeerFactory := IButtonAutomationPeerFactory(factoryPtr)
        }

        return ButtonAutomationPeer.__IButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to click the button associated with the automation peer.
     * @remarks
     * Calls to **Invoke** should return immediately without blocking. However, this behavior is entirely dependent on the Microsoft UI Automation provider implementation. In scenarios where calling **Invoke** causes a blocking issue, such as a modal dialog, a separate helper thread may be required to call the method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.buttonautomationpeer.invoke
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
