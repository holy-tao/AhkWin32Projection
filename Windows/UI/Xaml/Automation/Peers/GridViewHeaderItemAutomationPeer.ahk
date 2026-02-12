#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ListViewBaseHeaderItemAutomationPeer.ahk
#Include .\IGridViewHeaderItemAutomationPeer.ahk
#Include .\IGridViewHeaderItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [GridViewHeaderItem](../windows.ui.xaml.controls/gridviewheaderitem.md) types to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.gridviewheaderitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class GridViewHeaderItemAutomationPeer extends ListViewBaseHeaderItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewHeaderItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewHeaderItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {GridViewHeaderItem} owner 
     * @returns {GridViewHeaderItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!GridViewHeaderItemAutomationPeer.HasProp("__IGridViewHeaderItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.GridViewHeaderItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewHeaderItemAutomationPeerFactory.IID)
            GridViewHeaderItemAutomationPeer.__IGridViewHeaderItemAutomationPeerFactory := IGridViewHeaderItemAutomationPeerFactory(factoryPtr)
        }

        return GridViewHeaderItemAutomationPeer.__IGridViewHeaderItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
