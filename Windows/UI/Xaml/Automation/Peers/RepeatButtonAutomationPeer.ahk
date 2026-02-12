#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ButtonBaseAutomationPeer.ahk
#Include .\IRepeatButtonAutomationPeer.ahk
#Include ..\Provider\IInvokeProvider.ahk
#Include .\IRepeatButtonAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) types to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) class creates a new RepeatButtonAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) is sealed, so the normal scenario of deriving from the [RepeatButton](../windows.ui.xaml.controls.primitives/repeatbutton.md) class and its existing peer isn't applicable to RepeatButtonAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.repeatbuttonautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RepeatButtonAutomationPeer extends ButtonBaseAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRepeatButtonAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRepeatButtonAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RepeatButton} owner 
     * @returns {RepeatButtonAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RepeatButtonAutomationPeer.HasProp("__IRepeatButtonAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RepeatButtonAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRepeatButtonAutomationPeerFactory.IID)
            RepeatButtonAutomationPeer.__IRepeatButtonAutomationPeerFactory := IRepeatButtonAutomationPeerFactory(factoryPtr)
        }

        return RepeatButtonAutomationPeer.__IRepeatButtonAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sends a request to click the repeat button associated with the automation peer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.repeatbuttonautomationpeer.invoke
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
