#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IAutomationPeer.ahk
#Include .\IAutomationPeer3.ahk
#Include .\IAutomationPeer4.ahk
#Include .\IAutomationPeer5.ahk
#Include .\IAutomationPeer6.ahk
#Include .\IAutomationPeer7.ahk
#Include .\IAutomationPeer8.ahk
#Include .\IAutomationPeer9.ahk
#Include .\IAutomationPeerProtected.ahk
#Include .\IAutomationPeerOverrides.ahk
#Include .\IAutomationPeerOverrides2.ahk
#Include .\IAutomationPeerOverrides3.ahk
#Include .\IAutomationPeerOverrides4.ahk
#Include .\IAutomationPeerOverrides5.ahk
#Include .\IAutomationPeerOverrides6.ahk
#Include .\IAutomationPeerOverrides8.ahk
#Include .\IAutomationPeerOverrides9.ahk
#Include .\IAutomationPeerStatics3.ahk
#Include .\IAutomationPeerStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides a base class that exposes the automation peer for an associated owner class to Microsoft UI Automation.
 * @remarks
 * AutomationPeer is the class that provides almost all of the API that eventually forwards the Microsoft UI Automation information for a UWP app using C++, C#, or Visual Basic to a Microsoft UI Automation client. Typical Microsoft UI Automation clients aren't calling AutomationPeer methods directly. These clients are often assistive technology that are using other programming models and operating as services, and are not likely to be calling Windows Runtime methods. But the general Microsoft UI Automation support in the Windows Runtime forwards all this information using the provider side of the Microsoft UI Automation framework. Any clients to Microsoft UI Automation can interact with the representative automation trees of a UWP app using C++, C#, or Visual Basic.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationPeer extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Generates a runtime identifier for the element that is associated with the automation peer.
     * @returns {RawElementProviderRuntimeId} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.generaterawelementproviderruntimeid
     */
    static GenerateRawElementProviderRuntimeId() {
        if (!AutomationPeer.HasProp("__IAutomationPeerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerStatics3.IID)
            AutomationPeer.__IAutomationPeerStatics3 := IAutomationPeerStatics3(factoryPtr)
        }

        return AutomationPeer.__IAutomationPeerStatics3.GenerateRawElementProviderRuntimeId()
    }

    /**
     * Gets a value that indicates whether Microsoft UI Automation reports that a client is listening for the specified event.
     * @param {Integer} eventId One of the enumeration values.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.listenerexists
     */
    static ListenerExists(eventId) {
        if (!AutomationPeer.HasProp("__IAutomationPeerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerStatics.IID)
            AutomationPeer.__IAutomationPeerStatics := IAutomationPeerStatics(factoryPtr)
        }

        return AutomationPeer.__IAutomationPeerStatics.ListenerExists(eventId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets an [AutomationPeer](automationpeer.md) that is reported to the automation client as the source for all the events that come from this [AutomationPeer](automationpeer.md). See Remarks.
     * @remarks
     * EventsSource is typically set by [AutomationPeer](automationpeer.md) implementations in cases where the automation provider element is a child element of another element that also has a peer, and the best automation experience for clients is to treat the parent as the source for automation events. In such cases, the child element's peer implementation sets EventsSource to return the [AutomationPeer](automationpeer.md) of the parent element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.eventssource
     * @type {AutomationPeer} 
     */
    EventsSource {
        get => this.get_EventsSource()
        set => this.put_EventsSource(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {AutomationPeer} 
     */
    get_EventsSource() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.get_EventsSource()
    }

    /**
     * 
     * @param {AutomationPeer} value 
     * @returns {HRESULT} 
     */
    put_EventsSource(value) {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.put_EventsSource(value)
    }

    /**
     * Gets the control pattern that is associated with the specified [PatternInterface](patterninterface.md).
     * @param {Integer} patternInterface_ A value from the [PatternInterface](patterninterface.md) enumeration.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpattern
     */
    GetPattern(patternInterface_) {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetPattern(patternInterface_)
    }

    /**
     * Raises an automation event.
     * @param {Integer} eventId The event identifier for the event to raise, as a value of the enumeration. See [AutomationEvents](automationevents.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.raiseautomationevent
     */
    RaiseAutomationEvent(eventId) {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.RaiseAutomationEvent(eventId)
    }

    /**
     * Raises an event to notify the automation client of a changed property value.
     * @param {AutomationProperty} automationProperty_ The property that changed.
     * @param {IInspectable} oldValue The previous value of the property.
     * @param {IInspectable} newValue The new value of the property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.raisepropertychangedevent
     */
    RaisePropertyChangedEvent(automationProperty_, oldValue, newValue) {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.RaisePropertyChangedEvent(automationProperty_, oldValue, newValue)
    }

    /**
     * Gets the accelerator key combinations for the object that is associated with the UI Automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getacceleratorkey
     */
    GetAcceleratorKey() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetAcceleratorKey()
    }

    /**
     * Gets the access key for the element that is associated with the automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getaccesskey
     */
    GetAccessKey() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetAccessKey()
    }

    /**
     * Gets the control type for the element that is associated with the UI Automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getautomationcontroltype
     */
    GetAutomationControlType() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetAutomationControlType()
    }

    /**
     * Gets the **AutomationId** of the element that is associated with the automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getautomationid
     */
    GetAutomationId() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetAutomationId()
    }

    /**
     * Gets the [Rect](../windows.foundation/rect.md) object that represents the screen coordinates of the element that is associated with the automation peer.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getboundingrectangle
     */
    GetBoundingRectangle() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetBoundingRectangle()
    }

    /**
     * Gets the collection of child elements that are represented in the UI Automation tree as immediate child elements of the automation peer.
     * @returns {IVector<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getchildren
     */
    GetChildren() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetChildren()
    }

    /**
     * Gets a name that is used with [AutomationControlType](automationcontroltype.md), to differentiate the control that is represented by this [AutomationPeer](automationpeer.md).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getclassname
     */
    GetClassName() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetClassName()
    }

    /**
     * Gets a point on the element that is associated with the automation peer that responds to a mouse click.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getclickablepoint
     */
    GetClickablePoint() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetClickablePoint()
    }

    /**
     * Gets text that describes the functionality of the control that is associated with the automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.gethelptext
     */
    GetHelpText() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetHelpText()
    }

    /**
     * Gets text that conveys the visual status of the element that is associated with this automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getitemstatus
     */
    GetItemStatus() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetItemStatus()
    }

    /**
     * Gets a string that describes what kind of item an element represents.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getitemtype
     */
    GetItemType() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetItemType()
    }

    /**
     * Gets the [AutomationPeer](automationpeer.md) for the [UIElement](../windows.ui.xaml/uielement.md) that is targeted to the element.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlabeledby
     */
    GetLabeledBy() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetLabeledBy()
    }

    /**
     * Gets a localized string that represents the [AutomationControlType](automationcontroltype.md) value for the control that is associated with this automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlocalizedcontroltype
     */
    GetLocalizedControlType() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetLocalizedControlType()
    }

    /**
     * Gets text that describes the element that is associated with this automation peer. The Microsoft UI Automation  **Name** value is the primary identifier used by most assistive technology when they represent your app's UI by interacting with the Microsoft UI Automation framework.
     * @remarks
     * [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) introduces behavior to GetName by providing an intermediate [GetNameCore](automationpeer_getnamecore_2066192858.md) implementation. If an element has a value for the **LabeledBy**Microsoft UI Automation property, the labeling element's **Name** value is used as the **Name**.
     * 
     * [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) also introduces behavior through an internal **GetPlainText** method that other default peer classes may override in order to access the content model of that control and return a useful default for **Name**. For example, any [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived class will use a string representation of its [Content](../windows.ui.xaml.controls/contentcontrol_content.md) value as the default **Name**. This is enabled because internally [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) implements **GetPlainText** and imparts that behavior to all [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived classes. This is how you get a useful **Name** default from the string value of a [Button](../windows.ui.xaml.controls/button.md), for example.
     * 
     * Other specific peers also may have an intermediate [GetNameCore](automationpeer_getnamecore_2066192858.md) implementation that provides a useful way for that particular Windows Runtime control to provide built-in values for **Name**. The source of these values comes from other UI properties that are typically set in XAML or as app user code. For example, [TextBoxAutomationPeer](textboxautomationpeer.md) implements behavior that uses the value of the [Text](../windows.ui.xaml.controls/textbox_text.md) property from the owner [TextBox](../windows.ui.xaml.controls/textbox.md) as the default **Name**. From the user code perspective, the default behavior can be overridden by applying a different [AutomationProperties.Name](/uwp/api/windows.ui.xaml.automation.automationproperties.name) value. From the peer implementer / provider perspective, the default behavior of the peer can be changed by deriving a new peer class from the existing peer, overriding [GetNameCore](automationpeer_getnamecore_2066192858.md), and giving it a new implementation that wouldn't call the base implementation in at least some cases.
     * 
     * To learn more about the possible default behavior of specific peer classes for default Windows Runtime controls, see the reference topic for that particular peer class and look for implementation notes in the Remarks section.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getname
     */
    GetName() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetName()
    }

    /**
     * Gets a value that indicates the explicit control orientation, if any.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getorientation
     */
    GetOrientation() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetOrientation()
    }

    /**
     * Gets a value that indicates whether the element that is associated with this automation peer currently has keyboard focus.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.haskeyboardfocus
     */
    HasKeyboardFocus() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.HasKeyboardFocus()
    }

    /**
     * Gets a value that indicates whether the element that is associated with this automation peer contains data that is presented to the user.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iscontentelement
     */
    IsContentElement() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsContentElement()
    }

    /**
     * Gets a value that indicates whether the element is understood by the user as interactive or as contributing to the logical structure of the control in the GUI.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iscontrolelement
     */
    IsControlElement() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsControlElement()
    }

    /**
     * Gets a value that indicates whether the element associated with this automation peer supports interaction.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isenabled
     */
    IsEnabled() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsEnabled()
    }

    /**
     * Gets a value that indicates whether the element can accept keyboard focus.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iskeyboardfocusable
     */
    IsKeyboardFocusable() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsKeyboardFocusable()
    }

    /**
     * Gets a value that indicates whether an element is off the screen.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isoffscreen
     */
    IsOffscreen() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsOffscreen()
    }

    /**
     * Gets a value that indicates whether the element contains sensitive content.
     * @remarks
     * This property enables applications such as screen readers to determine whether the text content of a control should be read aloud.
     * 
     * 
     * <!--This remark taken from the RTM .NET documentation. I don't think you should shorten 'applications' to 'apps' here because screen readers are desktop applications that well predate Windows 8; there will probably never be a true screen reader "app" because it requires system integration that the Windows 8 appmodel will never make available to a developer.-->
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.ispassword
     */
    IsPassword() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsPassword()
    }

    /**
     * Gets a value that indicates whether the element that is associated with this peer must be completed on a form.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isrequiredforform
     */
    IsRequiredForForm() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.IsRequiredForForm()
    }

    /**
     * Sets the keyboard focus on the element that is associated with this automation peer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.setfocus
     */
    SetFocus() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.SetFocus()
    }

    /**
     * Gets the [AutomationPeer](automationpeer.md) that is the parent of this [AutomationPeer](automationpeer.md).
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getparent
     */
    GetParent() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetParent()
    }

    /**
     * Triggers recalculation of the main properties of the [AutomationPeer](automationpeer.md) and raises the [PropertyChanged](automationpeer_raisepropertychangedevent_715050195.md) notification to the automation client if the properties have changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.invalidatepeer
     */
    InvalidatePeer() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.InvalidatePeer()
    }

    /**
     * Gets an [AutomationPeer](automationpeer.md) from the specified point.
     * @remarks
     * This method is a utility for hit testing practical UI coordinates, evaluating the corresponding UI element, and returning the peer that corresponds to the hit-tested UI element.
     * @param {POINT} point_ The relative position of the target UI element in the UI.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpeerfrompoint
     */
    GetPeerFromPoint(point_) {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetPeerFromPoint(point_)
    }

    /**
     * Gets the live setting notification behavior information for the object that is associated with the UI Automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlivesetting
     */
    GetLiveSetting() {
        if (!this.HasProp("__IAutomationPeer")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer := IAutomationPeer(outPtr)
        }

        return this.__IAutomationPeer.GetLiveSetting()
    }

    /**
     * Gets the element in the specified direction within the UI automation tree.
     * @param {Integer} direction_ The specified direction.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.navigate
     */
    Navigate(direction_) {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.Navigate(direction_)
    }

    /**
     * Gets an element from the specified point.
     * @param {POINT} pointInWindowCoordinates The specified point.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getelementfrompoint
     */
    GetElementFromPoint(pointInWindowCoordinates) {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetElementFromPoint(pointInWindowCoordinates)
    }

    /**
     * Gets the element that currently has the focus.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getfocusedelement
     */
    GetFocusedElement() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetFocusedElement()
    }

    /**
     * Shows the available context menu for the owner element.
     * @remarks
     * Calling ShowContextMenu throws an error if a context menu cannot be shown. If no context menu is available directly on the element on which it was invoked, the Microsoft UI Automation logic implemented by a provider should attempt to show a context menu for the Microsoft UI Automation tree parent of the element.
     * 
     * Scenarios for invoking a context menu from an element include auto-correction and spelling alternatives for text input. The UI elements that display these are not part of the default tab sequence and are not part of an initial Microsoft UI Automation tree until the context that requires them is detected.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.showcontextmenu
     */
    ShowContextMenu() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.ShowContextMenu()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls GetControlledPeers or an equivalent Microsoft UI Automation client API such as getting a property value as identified by **UIA_ControllerForPropertyId**.
     * @remarks
     * Examining controlled peers is an advanced scenario that most peer implementations won't need to use.
     * 
     * The naming of the framework implementation and the Microsoft UI Automation property that clients can use to access this info are slightly different. Microsoft UI Automation clients should use the identifier **UIA_ControllerForPropertyId** to request the value of this property when using the Microsoft UI Automation client interfaces such as [IUIAutomation](/windows/desktop/api/uiautomationclient/nn-uiautomationclient-iuiautomation).
     * @returns {IVectorView<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getcontrolledpeers
     */
    GetControlledPeers() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetControlledPeers()
    }

    /**
     * Gets a reference to the list of UI automation annotations for the current automation peer.
     * @returns {IVector<AutomationPeerAnnotation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getannotations
     */
    GetAnnotations() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetAnnotations()
    }

    /**
     * Sets the [AutomationPeer](automationpeer.md) that is the parent of this [AutomationPeer](automationpeer.md).
     * @remarks
     * > You can't re-parent an [AutomationPeer](automationpeer.md) for a UWP app. This functionality is only available for a Windows Phone 8.x app.
     * @param {AutomationPeer} peer The parent automation peer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.setparent
     */
    SetParent(peer) {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.SetParent(peer)
    }

    /**
     * Raises an event to notify the Microsoft UI Automation core that a text control has programmatically changed text.
     * @param {Integer} automationTextEditChangeType_ The type of change that was made to the text.
     * @param {IVectorView<HSTRING>} changedData The new text.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.raisetextedittextchangedevent
     */
    RaiseTextEditTextChangedEvent(automationTextEditChangeType_, changedData) {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.RaiseTextEditTextChangedEvent(automationTextEditChangeType_, changedData)
    }

    /**
     * Returns the 1-based integer for the ordinal position in the set for the element that is associated with the automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpositioninset
     */
    GetPositionInSet() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetPositionInSet()
    }

    /**
     * Returns the 1-based integer for the size of the set where the element that is associated with the automation peer is located.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getsizeofset
     */
    GetSizeOfSet() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetSizeOfSet()
    }

    /**
     * Returns the 1-based integer for the level (hierarchy) of the element that is associated with the automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlevel
     */
    GetLevel() {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.GetLevel()
    }

    /**
     * Raises an event to notify the Microsoft UI Automation core that the tree structure has changed.
     * @param {Integer} structureChangeType_ The type of change that has occurred.
     * @param {AutomationPeer} child The element to which the change has been made.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.raisestructurechangedevent
     */
    RaiseStructureChangedEvent(structureChangeType_, child) {
        if (!this.HasProp("__IAutomationPeer3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer3 := IAutomationPeer3(outPtr)
        }

        return this.__IAutomationPeer3.RaiseStructureChangedEvent(structureChangeType_, child)
    }

    /**
     * Gets the landmark type for this automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlandmarktype
     */
    GetLandmarkType() {
        if (!this.HasProp("__IAutomationPeer4")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer4 := IAutomationPeer4(outPtr)
        }

        return this.__IAutomationPeer4.GetLandmarkType()
    }

    /**
     * Gets a localized string that represents the [AutomationLandmarkType](automationlandmarktype.md) value for the element that is associated with this automation peer.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlocalizedlandmarktype
     */
    GetLocalizedLandmarkType() {
        if (!this.HasProp("__IAutomationPeer4")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer4 := IAutomationPeer4(outPtr)
        }

        return this.__IAutomationPeer4.GetLocalizedLandmarkType()
    }

    /**
     * Gets a Boolean value that indicates whether the automation element represents peripheral UI.
     * @remarks
     * Peripheral UI appears and supports user interaction, but does not take keyboard focus when it appears. Examples of peripheral UI include popups, flyouts, context menus, or floating notifications.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isperipheral
     */
    IsPeripheral() {
        if (!this.HasProp("__IAutomationPeer5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer5 := IAutomationPeer5(outPtr)
        }

        return this.__IAutomationPeer5.IsPeripheral()
    }

    /**
     * Gets a Boolean value that indicates whether the entered or selected value is valid for the form rule associated with the automation element.
     * @remarks
     * As an example, if the user entered "425-555-5555" for a zip code field that requires 5 or 9 digits, the IsDataValidForForm property can be set to **false** to indicate that the data is not valid.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isdatavalidforform
     */
    IsDataValidForForm() {
        if (!this.HasProp("__IAutomationPeer5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer5 := IAutomationPeer5(outPtr)
        }

        return this.__IAutomationPeer5.IsDataValidForForm()
    }

    /**
     * Gets a localized string that describes the actual visual appearance or contents of something such as an image or image control.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getfulldescription
     */
    GetFullDescription() {
        if (!this.HasProp("__IAutomationPeer5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer5 := IAutomationPeer5(outPtr)
        }

        return this.__IAutomationPeer5.GetFullDescription()
    }

    /**
     * Calls [GetCultureCore](automationpeer_getculturecore_562664259.md) to get the culture value for the element that is associated with the automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getculture
     */
    GetCulture() {
        if (!this.HasProp("__IAutomationPeer6")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer6 := IAutomationPeer6(outPtr)
        }

        return this.__IAutomationPeer6.GetCulture()
    }

    /**
     * Initiates a notification event.
     * @param {Integer} notificationKind_ Specifies the type of the notification.
     * @param {Integer} notificationProcessing_ Specifies the order in which to process the notification.
     * @param {HSTRING} displayString A display string describing the event.
     * @param {HSTRING} activityId A unique non-localized string to identify an action or group of actions. Use this to pass additional information to the event handler.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.raisenotificationevent
     */
    RaiseNotificationEvent(notificationKind_, notificationProcessing_, displayString, activityId) {
        if (!this.HasProp("__IAutomationPeer7")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer7 := IAutomationPeer7(outPtr)
        }

        return this.__IAutomationPeer7.RaiseNotificationEvent(notificationKind_, notificationProcessing_, displayString, activityId)
    }

    /**
     * Gets the heading level of the UI Automation element that is associated with this automation peer.
     * @remarks
     * Heading elements organize the user interface and make it easier to navigate. Some assistive technology (AT) allows users to quickly jump between headings. Headings have a level from 1 to 9.  
     * 
     * ![Mouse settings page in Windows Ease of Access settings](images/MouseSettings.png)
     * 
     * Examples of headings would be section titles within Windows Settings. For instance, under the **Ease of Access** -> **Mouse** page, **Pointer size**, **Pointer color**, and **Mouse keys** would be a heading of level 1.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getheadinglevel
     */
    GetHeadingLevel() {
        if (!this.HasProp("__IAutomationPeer8")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer8 := IAutomationPeer8(outPtr)
        }

        return this.__IAutomationPeer8.GetHeadingLevel()
    }

    /**
     * Gets a value that indicates whether the element associated with this automation peer is a dialog window.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isdialog
     */
    IsDialog() {
        if (!this.HasProp("__IAutomationPeer9")) {
            if ((queryResult := this.QueryInterface(IAutomationPeer9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeer9 := IAutomationPeer9(outPtr)
        }

        return this.__IAutomationPeer9.IsDialog()
    }

    /**
     * Gets an [AutomationPeer](automationpeer.md) for the specified [IRawElementProviderSimple](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple) proxy.
     * @param {IRawElementProviderSimple} provider The class that implements [IRawElementProviderSimple](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple).
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.peerfromprovider
     */
    PeerFromProvider(provider) {
        if (!this.HasProp("__IAutomationPeerProtected")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerProtected := IAutomationPeerProtected(outPtr)
        }

        return this.__IAutomationPeerProtected.PeerFromProvider(provider)
    }

    /**
     * Gets the [IRawElementProviderSimple](/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple) proxy for the specified [AutomationPeer](automationpeer.md).
     * @param {AutomationPeer} peer The automation peer.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.providerfrompeer
     */
    ProviderFromPeer(peer) {
        if (!this.HasProp("__IAutomationPeerProtected")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerProtected.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerProtected := IAutomationPeerProtected(outPtr)
        }

        return this.__IAutomationPeerProtected.ProviderFromPeer(peer)
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetPattern](automationpeer_getpattern_2046576749.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level returns **null**, because the basic peer class doesn't support any patterns. The majority of existing Windows Runtime peer classes override this method to report the patterns that a particular peer supports.
     * 
     * Overriding this method to return the implementation of patterns that your peer class supports is one of the most common scenarios for implementing an automation peer. See [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
     * 
     * > [!NOTE]
     * >
     * > **This sample is not maintained and might not compile.**
     * >
     * > See [XAML accessibility sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/XAML%20accessibility%20sample) for an implementation of [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) that defines the custom peer returned by [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) (the peer implementation is part of Scenario 3 in this sample).
     * @param {Integer} patternInterface_ A value from the [PatternInterface](patterninterface.md) enumeration.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpatterncore
     */
    GetPatternCore(patternInterface_) {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetPatternCore(patternInterface_)
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetAcceleratorKey](automationpeer_getacceleratorkey_970307487.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getacceleratorkeycore
     */
    GetAcceleratorKeyCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetAcceleratorKeyCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetAccessKey](automationpeer_getaccesskey_372284052.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getaccesskeycore
     */
    GetAccessKeyCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetAccessKeyCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetAutomationControlType](automationpeer_getautomationcontroltype_1156384152.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The base implementation for [AutomationPeer](automationpeer.md) and [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) return **Custom**. If you keep this behavior, you must override [GetLocalizedControlTypeCore](automationpeer_getlocalizedcontroltypecore_1799576178.md).
     * 
     * The more common scenario for defining an automation peer is overriding one of the existing peer classes that pairs with the control class you are overriding. In this case each such peer class reports a practical value of [AutomationControlType](automationcontroltype.md) that makes sense for the original owner control that the peer was implemented for. Often you can leave this behavior alone. It isn't typical to derive from a control-specific peer and use its behavior but then change the **AutomationControlType**, which is probably the most basic information that a peer reports. Check the existing behavior of the peer class you are overriding, and verify that you're reporting the correct control type. Also, double-check that there isn't a more specific peer class available that could already be reporting the correct control type as well as providing other behavior that's more appropriate for your peer. For more info, see [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getautomationcontroltypecore
     */
    GetAutomationControlTypeCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetAutomationControlTypeCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetAutomationId](automationpeer_getautomationid_1912681712.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * Providing a class-based behavior for **AutomationId** is uncommon. Typically, app authors set values for elements in the app by setting the [AutomationProperties.AutomationId](/uwp/api/windows.ui.xaml.automation.automationproperties.automationid) attached property in the XAML UI definition.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getautomationidcore
     */
    GetAutomationIdCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetAutomationIdCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetBoundingRectangle](automationpeer_getboundingrectangle_297705113.md) or an equivalent Microsoft UI Automation client API.
     * @returns {RECT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getboundingrectanglecore
     */
    GetBoundingRectangleCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetBoundingRectangleCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetChildren](automationpeer_getchildren_555647254.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The base implementation returns null. Peers that represent controls with item collections may override this result. Test the behavior of the peer you are using or overriding and override GetChildrenCore if you want to change that behavior.
     * @returns {IVector<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getchildrencore
     */
    GetChildrenCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetChildrenCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetClassName](automationpeer_getclassname_614238974.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * You should never invoke the base behavior, and all custom peers should override GetClassNameCore to report the class name that is unique to that peer class. For more info, see [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getclassnamecore
     */
    GetClassNameCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetClassNameCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetClickablePoint](automationpeer_getclickablepoint_955785073.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The base implementation returns a default [Point](../windows.foundation/point.md) (coordinates 0,0). Peers that represent items defer to the container. [ScrollBarAutomationPeer](scrollbarautomationpeer.md) and [SliderAutomationPeer](sliderautomationpeer.md) both have behavior that can't adequately express one point for the purposes of [GetClickablePoint](automationpeer_getclickablepoint_955785073.md) scenarios, so these return a [Point](../windows.foundation/point.md) where the coordinate values are NaN.
     * 
     * > [!NOTE]
     * > In C#, you can obtain NaN from [Double.NaN](/dotnet/api/system.double.nan?view=dotnet-uwp-10.0&preserve-view=true).
     * >
     * > In C++, you can obtain NaN by using the [`NAN` macro](/cpp/standard-library/cmath) or [`std::numeric_limits<double>::quiet_NaN`](/cpp/standard-library/numeric-limits-class#quiet_nan).
     * >
     * > Do not use the `==` operator to test for NaN.
     * >
     * > In C#, use [Double.IsNaN()](/dotnet/api/system.double.isnan?view=dotnet-uwp-10.0&preserve-view=true) to test for NaN.
     * >
     * > In C++, use [isnan()](/cpp/c-runtime-library/reference/isnan-isnan-isnanf) to test for NaN.
     * @returns {POINT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getclickablepointcore
     */
    GetClickablePointCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetClickablePointCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetHelpText](automationpeer_gethelptext_1251901404.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * Specifying a control behavior for help text is uncommon. In most cases, apps that need it will establish help text information in the UI by applying the [AutomationProperties.HelpText](/uwp/api/windows.ui.xaml.automation.automationproperties.helptext) attached property to the UI definition XAML.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.gethelptextcore
     */
    GetHelpTextCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetHelpTextCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetItemStatus](automationpeer_getitemstatus_341251311.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getitemstatuscore
     */
    GetItemStatusCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetItemStatusCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetItemType](automationpeer_getitemtype_747068727.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getitemtypecore
     */
    GetItemTypeCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetItemTypeCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetLabeledBy](automationpeer_getlabeledby_1845689.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * Specifying a control behavior for labeling is uncommon except for composite data presentation controls that use headers or similar metaphors. In most cases apps establish labeling information between the elements in an app-specific UI by applying the [AutomationProperties.LabeledBy](/uwp/api/windows.ui.xaml.automation.automationproperties.labeledby) attached property to the UI definition XAML.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlabeledbycore
     */
    GetLabeledByCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetLabeledByCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetLocalizedControlType](automationpeer_getlocalizedcontroltype_677460473.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * This method is very rarely overridden by peers. So long as you provide a value for [GetAutomationControlTypeCore](automationpeer_getautomationcontroltypecore_1718556232.md), all the enumerated constant names from [AutomationControlType](automationcontroltype.md) are already available in localized form to Microsoft UI Automation clients. The necessary translated strings are part of the Microsoft UI Automation support in every Microsoft Windows client. However, if you specify [Custom](automationcontroltype.md) as the control type, you must support a localized control type string that represents the role of the element (for example, "color picker" for a custom control that enables users to choose and specify colors).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlocalizedcontroltypecore
     */
    GetLocalizedControlTypeCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetLocalizedControlTypeCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetName](automationpeer_getname_1386609741.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) introduces behavior to [GetName](automationpeer_getname_1386609741.md) by providing an intermediate GetNameCore implementation. If an element has a value for the **LabeledBy**Microsoft UI Automation property, the labeling element's **Name** value is used as the **Name**.
     * 
     * [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) also introduces behavior through an internal **GetPlainText** method that other default peer classes may override in order to access the content model of that control and return a useful default for **Name**. For example, any [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived class will use a string representation of its [Content](../windows.ui.xaml.controls/contentcontrol_content.md) value as the default **Name**. This is enabled because internally [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) implements **GetPlainText** and imparts that behavior to all [ContentControl](../windows.ui.xaml.controls/contentcontrol.md) derived classes. This is how you get a useful **Name** default from the string value of a [Button](../windows.ui.xaml.controls/button.md), for example.
     * 
     * Other specific peers also may have an intermediate GetNameCore implementation that provides a useful way for that particular Windows Runtime control to provide built-in values for **Name**. The source of these values comes from other UI properties that are typically set in XAML or as app user code. For example, [TextBoxAutomationPeer](textboxautomationpeer.md) implements behavior that uses the value of the [Text](../windows.ui.xaml.controls/textbox_text.md) property from the owner [TextBox](../windows.ui.xaml.controls/textbox.md) as the default **Name**. From the user code perspective, the default behavior can be overridden by applying a different [AutomationProperties.Name](/uwp/api/windows.ui.xaml.automation.automationproperties.name) value. From the peer implementer / provider perspective, the default behavior of the peer can be changed by deriving a new peer class from the existing peer, overriding GetNameCore, and giving it a new implementation that wouldn't call the base implementation in at least some cases.
     * 
     * To learn more about the possible default behavior of specific peer classes for default Windows Runtime controls, see the reference topic for that particular peer class and look for implementation notes in the Remarks section.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getnamecore
     */
    GetNameCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetNameCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetOrientation](automationpeer_getorientation_419829207.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The base [AutomationPeer](automationpeer.md) implementation returns **None**. Peers that represent items may modify this to report information from their container. [ScrollBarAutomationPeer](scrollbarautomationpeer.md) and [SliderAutomationPeer](sliderautomationpeer.md) both have a pattern they can access that knows about orientation, so these peers can return a determined value. Test the existing return value in the peer that you are using or overriding and then override that behavior if necessary.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getorientationcore
     */
    GetOrientationCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetOrientationCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [HasKeyboardFocus](automationpeer_haskeyboardfocus_1926443629.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level checks whether the owner has focus, and always returns **false** if the owner isn't focusable. [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) expands this behavior somewhat because it adds awareness of owner characteristics that rely on the owner being a [Control](../windows.ui.xaml.controls/control.md) subclass. Test the existing return value in the peer that you are using or overriding and then override that behavior if necessary.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.haskeyboardfocuscore
     */
    HasKeyboardFocusCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.HasKeyboardFocusCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsContentElement](automationpeer_iscontentelement_545450603.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level returns **false**. However, [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) adds behavior that changes the default to **true**. Other specific peers also may affect this behavior; for example [ItemAutomationPeer](itemautomationpeer.md) defers to its container. Test the existing return value in the peer that you are using or overriding and then override that behavior if necessary.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iscontentelementcore
     */
    IsContentElementCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsContentElementCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsControlElement](automationpeer_iscontrolelement_1004644794.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level returns **false**. However, [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) adds behavior that changes the default to **true**. Other specific peers also may affect this behavior; for example many peers return different values depending on whether the owner is created from a control template. Test the existing return value in the peer that you are using or overriding and then override that behavior if necessary.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iscontrolelementcore
     */
    IsControlElementCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsControlElementCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsEnabled](automationpeer_isenabled_180154405.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level returns **true**. However, [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) adds behavior that checks whether the owner is a [Control](../windows.ui.xaml.controls/control.md) and forwards owner information from [Control.IsEnabled](../windows.ui.xaml.controls/control_isenabled.md). For cases where the owner is not a control but does have a peer, such as for a [TextBlock](../windows.ui.xaml.controls/textblock.md), the [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) implementation returns **true**.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isenabledcore
     */
    IsEnabledCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsEnabledCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsKeyboardFocusable](automationpeer_iskeyboardfocusable_2030365113.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation at the [AutomationPeer](automationpeer.md) level returns **false**. However, [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) adds behavior that checks whether the owner is a [Control](../windows.ui.xaml.controls/control.md) or otherwise focusable, and whether the owner is enabled.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.iskeyboardfocusablecore
     */
    IsKeyboardFocusableCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsKeyboardFocusableCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsOffscreen](automationpeer_isoffscreen_970705929.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation returns a result that is based on the owner's [Visibility](../windows.ui.xaml/uielement_visibility.md) value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isoffscreencore
     */
    IsOffscreenCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsOffscreenCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsPassword](automationpeer_ispassword_1875117543.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation returns **false**. [PasswordBoxAutomationPeer](passwordboxautomationpeer.md) provides an implementation that returns **true**. If the peer being returned by your control is [PasswordBoxAutomationPeer](passwordboxautomationpeer.md) or derived from it, you will inherit that behavior.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.ispasswordcore
     */
    IsPasswordCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsPasswordCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsRequiredForForm](automationpeer_isrequiredforform_1300796554.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation returns false. Overriding this value at the peer level to return true is probably an uncommon scenario, because you are implying that every instance of your control has a required-for-form behavior no matter what app or UI situation it is used for. It's more typical for apps to specify a required-for-form behavior that is declared in the app's XAML UI definitions, by setting [AutomationProperties.IsRequiredForForm](/uwp/api/windows.ui.xaml.automation.automationproperties.isrequiredforform).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isrequiredforformcore
     */
    IsRequiredForFormCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.IsRequiredForFormCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [SetFocus](automationpeer_setfocus_192955311.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The standard implementation uses [IsKeyboardFocusable](automationpeer_iskeyboardfocusable_2030365113.md) to determine whether the peer reports that the owner can be focused. [FrameworkElementAutomationPeer](frameworkelementautomationpeer.md) adds behavior that performs the actual focus operation if it is possible.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.setfocuscore
     */
    SetFocusCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.SetFocusCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetPeerFromPoint](automationpeer_getpeerfrompoint_1490374452.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * <!--This one is vague because I can't find the base implementation-->
     * Test the existing return value in the peer that you are using or overriding and then override that behavior if necessary.
     * @param {POINT} point_ The relative position of the target UI element in the UI.
     * @returns {AutomationPeer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpeerfrompointcore
     */
    GetPeerFromPointCore(point_) {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetPeerFromPointCore(point_)
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetLiveSetting](automationpeer_getlivesetting_295263812.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlivesettingcore
     */
    GetLiveSettingCore() {
        if (!this.HasProp("__IAutomationPeerOverrides")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides := IAutomationPeerOverrides(outPtr)
        }

        return this.__IAutomationPeerOverrides.GetLiveSettingCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [ShowContextMenu](automationpeer_showcontextmenu_289083366.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.showcontextmenucore
     */
    ShowContextMenuCore() {
        if (!this.HasProp("__IAutomationPeerOverrides2")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides2 := IAutomationPeerOverrides2(outPtr)
        }

        return this.__IAutomationPeerOverrides2.ShowContextMenuCore()
    }

    /**
     * Gets a list of the controlled peers for the current automation peer.
     * @remarks
     * Examining controlled peers is an advanced scenario that most peer implementations won't need to use.
     * @returns {IVectorView<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getcontrolledpeerscore
     */
    GetControlledPeersCore() {
        if (!this.HasProp("__IAutomationPeerOverrides2")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides2 := IAutomationPeerOverrides2(outPtr)
        }

        return this.__IAutomationPeerOverrides2.GetControlledPeersCore()
    }

    /**
     * Provides the peer’s behavior when a Microsoft UI Automation client calls [Navigate](automationpeer_navigate_1737660010.md) or an equivalent Microsoft UI Automation client API.
     * @param {Integer} direction_ The specified direction.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.navigatecore
     */
    NavigateCore(direction_) {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.NavigateCore(direction_)
    }

    /**
     * Provides the behavior of the peer when a Microsoft UI Automation client calls [GetElementFromPoint](automationpeer_getelementfrompoint_1217124515.md) or an equivalent Microsoft UI Automation client API.
     * @param {POINT} pointInWindowCoordinates The specified point.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getelementfrompointcore
     */
    GetElementFromPointCore(pointInWindowCoordinates) {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetElementFromPointCore(pointInWindowCoordinates)
    }

    /**
     * Provides the behavior of the peer when a Microsoft UI Automation client calls [GetFocusedElement](automationpeer_getfocusedelement_1183614552.md) or an equivalent Microsoft UI Automation client API.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getfocusedelementcore
     */
    GetFocusedElementCore() {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetFocusedElementCore()
    }

    /**
     * Provides the behavior of the peer when a Microsoft UI Automation client calls [GetAnnotations](automationpeer_getannotations_676104854.md) or an equivalent Microsoft UI Automation client API.
     * @returns {IVector<AutomationPeerAnnotation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getannotationscore
     */
    GetAnnotationsCore() {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetAnnotationsCore()
    }

    /**
     * Provides the peer’s behavior when a Microsoft UI Automation client calls [GetPositionInSet](automationpeer_getpositioninset_381040721.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getpositioninsetcore
     */
    GetPositionInSetCore() {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetPositionInSetCore()
    }

    /**
     * Provides the peer’s behavior when a Microsoft UI Automation client calls [GetSizeOfSet](automationpeer_getsizeofset_1955371227.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getsizeofsetcore
     */
    GetSizeOfSetCore() {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetSizeOfSetCore()
    }

    /**
     * Provides the behavior of the peer when a Microsoft UI Automation client calls [GetLevel](automationpeer_getlevel_533003345.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlevelcore
     */
    GetLevelCore() {
        if (!this.HasProp("__IAutomationPeerOverrides3")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides3 := IAutomationPeerOverrides3(outPtr)
        }

        return this.__IAutomationPeerOverrides3.GetLevelCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetLandmarkType](automationpeer_getlandmarktype_897276768.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlandmarktypecore
     */
    GetLandmarkTypeCore() {
        if (!this.HasProp("__IAutomationPeerOverrides4")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides4 := IAutomationPeerOverrides4(outPtr)
        }

        return this.__IAutomationPeerOverrides4.GetLandmarkTypeCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetLocalizedLandmarkType](automationpeer_getlocalizedlandmarktype_372977641.md) or an equivalent Microsoft UI Automation client API.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getlocalizedlandmarktypecore
     */
    GetLocalizedLandmarkTypeCore() {
        if (!this.HasProp("__IAutomationPeerOverrides4")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides4 := IAutomationPeerOverrides4(outPtr)
        }

        return this.__IAutomationPeerOverrides4.GetLocalizedLandmarkTypeCore()
    }

    /**
     * Provides the peer’s behavior when a Microsoft UI Automation client accesses [IsPeripheral](automationpeer_isperipheral_1509271576.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isperipheralcore
     */
    IsPeripheralCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.IsPeripheralCore()
    }

    /**
     * Provides the peer’s behavior when a Microsoft UI Automation client accesses [IsDataValidForForm](automationpeer_isdatavalidforform_1579318026.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isdatavalidforformcore
     */
    IsDataValidForFormCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.IsDataValidForFormCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetFullDescription](automationpeer_getfulldescription_2065753949.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * You should never invoke the base behavior, and all custom peers should override GetFullDescriptionCore to report the full description of this [AutomationPeer](automationpeer.md). For more info, see [Custom automation peers](/windows/uwp/accessibility/custom-automation-peers).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getfulldescriptioncore
     */
    GetFullDescriptionCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.GetFullDescriptionCore()
    }

    /**
     * Gets a collection of elements that provide more information about the automation element.
     * @remarks
     * GetDescribedBy is used when an automation element is explained by another segment of the application UI. For example, the collection can point to a text element of "2,529 items in 85 groups, 10 items selected" from a complex custom list object. Instead of using the object model for clients to digest similar information, the collection returned by GetDescribedBy can offer quick access to UI elements that may already offer useful end-user information that describes the UI element.
     * @returns {IIterable<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getdescribedbycore
     */
    GetDescribedByCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.GetDescribedByCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetFlowsTo](../windows.ui.xaml.automation/automationproperties_getflowsto_483856830.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The "Core" methods are the standard implementations that perform the default action of an associated UI Automation client-callable method. You can override any of the "Core" methods to return alternative values in a custom automation peer. In this case, GetFlowsToCore is invoked any time that [GetFlowsTo](../windows.ui.xaml.automation/automationproperties_getflowsto_483856830.md) is called.
     * 
     * The base implementation for [AutomationPeer](automationpeer.md) returns null.
     * @returns {IIterable<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getflowstocore
     */
    GetFlowsToCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.GetFlowsToCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetFlowsFrom](../windows.ui.xaml.automation/automationproperties_getflowsfrom_1915156123.md) or an equivalent Microsoft UI Automation client API.
     * @remarks
     * The "Core" methods are the standard implementations that perform the default action of an associated UI Automation client-callable method. You can override any of the "Core" methods to return alternative values in a custom automation peer. In this case, GetFlowsFromCore is invoked any time that [GetFlowsFrom](../windows.ui.xaml.automation/automationproperties_getflowsfrom_1915156123.md) is called.
     * 
     * The base implementation for [AutomationPeer](automationpeer.md) returns null.
     * @returns {IIterable<AutomationPeer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getflowsfromcore
     */
    GetFlowsFromCore() {
        if (!this.HasProp("__IAutomationPeerOverrides5")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides5 := IAutomationPeerOverrides5(outPtr)
        }

        return this.__IAutomationPeerOverrides5.GetFlowsFromCore()
    }

    /**
     * Gets the culture value for the element that is associated with the automation peer.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getculturecore
     */
    GetCultureCore() {
        if (!this.HasProp("__IAutomationPeerOverrides6")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides6 := IAutomationPeerOverrides6(outPtr)
        }

        return this.__IAutomationPeerOverrides6.GetCultureCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [GetHeadingLevel](automationpeer_getheadinglevel_1176568834.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.getheadinglevelcore
     */
    GetHeadingLevelCore() {
        if (!this.HasProp("__IAutomationPeerOverrides8")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides8 := IAutomationPeerOverrides8(outPtr)
        }

        return this.__IAutomationPeerOverrides8.GetHeadingLevelCore()
    }

    /**
     * Provides the peer's behavior when a Microsoft UI Automation client calls [IsDialog](automationpeer_isdialog_1486667341.md) or an equivalent Microsoft UI Automation client API.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeer.isdialogcore
     */
    IsDialogCore() {
        if (!this.HasProp("__IAutomationPeerOverrides9")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerOverrides9.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerOverrides9 := IAutomationPeerOverrides9(outPtr)
        }

        return this.__IAutomationPeerOverrides9.IsDialogCore()
    }

;@endregion Instance Methods
}
