#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorItemAutomationPeer.ahk
#Include .\IGridViewItemDataAutomationPeer.ahk
#Include ..\Provider\IScrollItemProvider.ahk
#Include .\IGridViewItemDataAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [GridView](../windows.ui.xaml.controls/gridview.md) items to Microsoft UI Automation, using a data representation of the item so that the peer supports scrolling to that item with data awareness.
 * @remarks
 * GridViewItemDataAutomationPeer is generated from [GridViewAutomationPeer](gridviewautomationpeer.md) logic, not an associated control class.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.gridviewitemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class GridViewItemDataAutomationPeer extends SelectorItemAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGridViewItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGridViewItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} item 
     * @param {GridViewAutomationPeer} parent 
     * @returns {GridViewItemDataAutomationPeer} 
     */
    static CreateInstanceWithParentAndItem(item, parent) {
        if (!GridViewItemDataAutomationPeer.HasProp("__IGridViewItemDataAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.GridViewItemDataAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGridViewItemDataAutomationPeerFactory.IID)
            GridViewItemDataAutomationPeer.__IGridViewItemDataAutomationPeerFactory := IGridViewItemDataAutomationPeerFactory(factoryPtr)
        }

        return GridViewItemDataAutomationPeer.__IGridViewItemDataAutomationPeerFactory.CreateInstanceWithParentAndItem(item, parent, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Scrolls the content area of a container object in order to display the control within the visible region (viewport) of the container.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.gridviewitemdataautomationpeer.scrollintoview
     */
    ScrollIntoView() {
        if (!this.HasProp("__IScrollItemProvider")) {
            if ((queryResult := this.QueryInterface(IScrollItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollItemProvider := IScrollItemProvider(outPtr)
        }

        return this.__IScrollItemProvider.ScrollIntoView()
    }

;@endregion Instance Methods
}
