#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SelectorAutomationPeer.ahk
#Include .\IListViewBaseAutomationPeer.ahk
#Include ..\Provider\IDropTargetProvider.ahk
#Include .\IListViewBaseAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * A base class that provides a Microsoft UI Automation peer implementation for types that derive from [ListViewBase](../windows.ui.xaml.controls/listviewbase.md).
 * @remarks
 * [ListViewBase](../windows.ui.xaml.controls/listviewbase.md) isn't used as a control class, because it is the base class for other controls. You could either derive from those other controls or derive from directly, but the latter means that you have to provide a template and a lot more behavior. If you derive from [ListViewBase](../windows.ui.xaml.controls/listviewbase.md), override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns a custom peer that is based on ListViewBaseAutomationPeer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewbaseautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ListViewBaseAutomationPeer extends SelectorAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListViewBaseAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListViewBaseAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ListViewBase} owner 
     * @returns {ListViewBaseAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ListViewBaseAutomationPeer.HasProp("__IListViewBaseAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ListViewBaseAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IListViewBaseAutomationPeerFactory.IID)
            ListViewBaseAutomationPeer.__IListViewBaseAutomationPeerFactory := IListViewBaseAutomationPeerFactory(factoryPtr)
        }

        return ListViewBaseAutomationPeer.__IListViewBaseAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string that indicates what will happen when the item is dropped.
     * @remarks
     * This property is relevant for draggable items when the drop targets are ambiguous. In this case the [ListViewBase](listviewbaseautomationpeer.md) drag origin suggests an effect of being dropped via this property. The drop target can choose to use the DropEffect value instead of the default drop effect of the target.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewbaseautomationpeer.dropeffect
     * @type {HSTRING} 
     */
    DropEffect {
        get => this.get_DropEffect()
    }

    /**
     * Gets an array of strings that enumerates possible drop effects when this item is dropped.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.listviewbaseautomationpeer.dropeffects
     */
    DropEffects {
        get => this.get_DropEffects()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DropEffect() {
        if (!this.HasProp("__IDropTargetProvider")) {
            if ((queryResult := this.QueryInterface(IDropTargetProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropTargetProvider := IDropTargetProvider(outPtr)
        }

        return this.__IDropTargetProvider.get_DropEffect()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_DropEffects(value) {
        if (!this.HasProp("__IDropTargetProvider")) {
            if ((queryResult := this.QueryInterface(IDropTargetProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDropTargetProvider := IDropTargetProvider(outPtr)
        }

        return this.__IDropTargetProvider.get_DropEffects(value)
    }

;@endregion Instance Methods
}
