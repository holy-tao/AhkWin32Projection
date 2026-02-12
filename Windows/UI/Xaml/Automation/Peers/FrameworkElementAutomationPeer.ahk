#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AutomationPeer.ahk
#Include .\IFrameworkElementAutomationPeer.ahk
#Include .\IFrameworkElementAutomationPeerFactory.ahk
#Include .\IFrameworkElementAutomationPeerStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [FrameworkElement](../windows.ui.xaml/frameworkelement.md) derived types (including all controls) to Microsoft UI Automation.
 * @remarks
 * There is no "ControlAutomationPeer" class. FrameworkElementAutomationPeer serves as implementation for all basic [Control](../windows.ui.xaml.controls/control.md) class scenarios that involve Microsoft UI Automation. This includes behavior that does not necessarily appear as a public API exposure, such as the practical implementations of many of the **Core** methods from [AutomationPeer](automationpeer.md).
 * 
 * FrameworkElementAutomationPeer includes extensive base implementation of peer behavior that other peers can use to report information that comes from owner classes at the [UIElement](../windows.ui.xaml/uielement.md) and [FrameworkElement](../windows.ui.xaml/frameworkelement.md) level. For more info, see the "Base implementation in FrameworkElementAutomationPeer" section of [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
 * <!--Maybe eventually also put this info in the Core methods, because it is overriders that most want to know the specifics of each such behavior whereas general consumers might want big picture or the semi client perspective you get from the non Core descs-->
 * 
 * In addition to the **Core** overrides, FrameworkElementAutomationPeer has two static utility methods that are useful for getting a peer handle from within control code, or for generating items peers from an item container peer for Microsoft UI Automation support. These are:
 * + [CreatePeerForElement](frameworkelementautomationpeer_createpeerforelement_1260151463.md)
 * + [FromElement](frameworkelementautomationpeer_fromelement_1666357111.md)
 * 
 * If you have a need to define a custom automation peer and can't identify a more derived peer class that pairs up with the control or base class you are deriving the owner class from, you should base your peer on FrameworkElementAutomationPeer. Even if the owner class isn't necessarily a [FrameworkElement](../windows.ui.xaml/frameworkelement.md), you can't practically derive peers from [AutomationPeer](automationpeer.md) directly because FrameworkElementAutomationPeer has many overrides that provide the expected behavior for layout, automation and UI interactions. You do need to derive your owner class from [UIElement](../windows.ui.xaml/uielement.md) at least, otherwise there is no way to create the peer on automation tree load with [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.frameworkelementautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class FrameworkElementAutomationPeer extends AutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFrameworkElementAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFrameworkElementAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {FrameworkElement} owner 
     * @returns {FrameworkElementAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!FrameworkElementAutomationPeer.HasProp("__IFrameworkElementAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementAutomationPeerFactory.IID)
            FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerFactory := IFrameworkElementAutomationPeerFactory(factoryPtr)
        }

        return FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

    /**
     * Returns the [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) for the specified [UIElement](../windows.ui.xaml/uielement.md).
     * @remarks
     * FromElement is a helper class that is used by custom control code to return the acting peer instance. Using the returned peer, you can fire automation events from within the same routines that also fire your general control logic events or change control properties. Or you can write your own helper methods that do this and are invoked from your control logic.
     * 
     * [CreatePeerForElement](frameworkelementautomationpeer_createpeerforelement_1260151463.md) has basically the same behavior as FromElement.
     * 
     * If FromElement returns **null**, it's probably because the element you passed does not have an implementation for [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md).
     * 
     * FromElement can return the peer even if the **CreateAutomationPeer** system logic hasn't run yet on the *element* target for some reason. It will invoke the same **CreateAutomationPeer** logic internally in order to get the peer.
     * @param {UIElement} element The [UIElement](../windows.ui.xaml/uielement.md) that is associated with this [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md).
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.frameworkelementautomationpeer.fromelement
     */
    static FromElement(element) {
        if (!FrameworkElementAutomationPeer.HasProp("__IFrameworkElementAutomationPeerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementAutomationPeerStatics.IID)
            FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerStatics := IFrameworkElementAutomationPeerStatics(factoryPtr)
        }

        return FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerStatics.FromElement(element)
    }

    /**
     * Creates a [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) for the specified [UIElement](../windows.ui.xaml/uielement.md).
     * @remarks
     * CreatePeerForElement is a helper class that is used by custom control code to return the acting peer instance. Using the returned peer, you can fire automation events from within the same routines that also fire your general control logic events or change control properties. Or you can write your own helper methods that do this and are invoked from your control logic.
     * 
     * The created [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) remains in memory until the associated [UIElement](../windows.ui.xaml/uielement.md) is destroyed. The same instance of the [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) is returned from subsequent calls to CreatePeerForElement and calls to [FromElement](frameworkelementautomationpeer_fromelement_1666357111.md) that reference the same *element* instance.
     * 
     * The type of the peer returned is determined by the [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) implementation of the relevant [UIElement](../windows.ui.xaml/uielement.md), which is typically a [Control](../windows.ui.xaml.controls/control.md). If the class code for the *element* type doesn't implement [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md), no peer is created, and CreatePeerForElement returns **null**. As a best practice you should always check for **null** after calling CreatePeerForElement, because there are a number of Windows Runtime elements that won't have an [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) implementation. For example, a [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) doesn't have a peer by default unless it's customized or is a more-derived Windows Runtime control.
     * 
     * CreatePeerForElement has basically the same behavior as [FromElement](frameworkelementautomationpeer_fromelement_1666357111.md).
     * 
     * CreatePeerForElement can return the peer even if the **CreateAutomationPeer** system logic hasn't run yet on the *element* target for some reason. It will invoke the same **CreateAutomationPeer** logic internally in order to get the peer.
     * @param {UIElement} element The [UIElement](../windows.ui.xaml/uielement.md) that is associated with this [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md).
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.frameworkelementautomationpeer.createpeerforelement
     */
    static CreatePeerForElement(element) {
        if (!FrameworkElementAutomationPeer.HasProp("__IFrameworkElementAutomationPeerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.FrameworkElementAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFrameworkElementAutomationPeerStatics.IID)
            FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerStatics := IFrameworkElementAutomationPeerStatics(factoryPtr)
        }

        return FrameworkElementAutomationPeer.__IFrameworkElementAutomationPeerStatics.CreatePeerForElement(element)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [UIElement](../windows.ui.xaml/uielement.md) owner that is associated with this [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md).
     * @remarks
     * If the owner element has been deleted, getting this property fails.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.frameworkelementautomationpeer.owner
     * @type {UIElement} 
     */
    Owner {
        get => this.get_Owner()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Owner() {
        if (!this.HasProp("__IFrameworkElementAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IFrameworkElementAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFrameworkElementAutomationPeer := IFrameworkElementAutomationPeer(outPtr)
        }

        return this.__IFrameworkElementAutomationPeer.get_Owner()
    }

;@endregion Instance Methods
}
