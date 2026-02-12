#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IPivotItemAutomationPeer.ahk
#Include .\IPivotItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [PivotItem](../windows.ui.xaml.controls/pivotitem.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class PivotItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PivotItemAutomationPeer](pivotitemautomationpeer.md) class.
     * @param {PivotItem} owner The [PivotItem](../windows.ui.xaml.controls/pivotitem.md) to create a peer for.
     * @returns {PivotItemAutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.pivotitemautomationpeer.#ctor
     */
    static CreateInstanceWithOwner(owner) {
        if (!PivotItemAutomationPeer.HasProp("__IPivotItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.PivotItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPivotItemAutomationPeerFactory.IID)
            PivotItemAutomationPeer.__IPivotItemAutomationPeerFactory := IPivotItemAutomationPeerFactory(factoryPtr)
        }

        return PivotItemAutomationPeer.__IPivotItemAutomationPeerFactory.CreateInstanceWithOwner(owner)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
