#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IAutomationPeerAnnotation.ahk
#Include .\IAutomationPeerAnnotationFactory.ahk
#Include .\IAutomationPeerAnnotationStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a single UI automation annotation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AutomationPeerAnnotation extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationPeerAnnotation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationPeerAnnotation.IID

    /**
     * Identifies the [AutomationPeerAnnotation.Type](automationpeerannotation_type.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.typeproperty
     * @type {DependencyProperty} 
     */
    static TypeProperty {
        get => AutomationPeerAnnotation.get_TypeProperty()
    }

    /**
     * Identifies the [AutomationPeerAnnotation.Peer](automationpeerannotation_peer.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.peerproperty
     * @type {DependencyProperty} 
     */
    static PeerProperty {
        get => AutomationPeerAnnotation.get_PeerProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the  class using the defined parameter.
     * @param {Integer} type The type of annotation.
     * @returns {AutomationPeerAnnotation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.#ctor
     */
    static CreateInstance(type) {
        if (!AutomationPeerAnnotation.HasProp("__IAutomationPeerAnnotationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerAnnotationFactory.IID)
            AutomationPeerAnnotation.__IAutomationPeerAnnotationFactory := IAutomationPeerAnnotationFactory(factoryPtr)
        }

        return AutomationPeerAnnotation.__IAutomationPeerAnnotationFactory.CreateInstance(type)
    }

    /**
     * Initializes a new instance of the  class using the defined parameters.
     * @param {Integer} type The type of annotation.
     * @param {AutomationPeer} peer The automation peer of the element that implements the annotation.
     * @returns {AutomationPeerAnnotation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.#ctor
     */
    static CreateWithPeerParameter(type, peer) {
        if (!AutomationPeerAnnotation.HasProp("__IAutomationPeerAnnotationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerAnnotationFactory.IID)
            AutomationPeerAnnotation.__IAutomationPeerAnnotationFactory := IAutomationPeerAnnotationFactory(factoryPtr)
        }

        return AutomationPeerAnnotation.__IAutomationPeerAnnotationFactory.CreateWithPeerParameter(type, peer)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TypeProperty() {
        if (!AutomationPeerAnnotation.HasProp("__IAutomationPeerAnnotationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerAnnotationStatics.IID)
            AutomationPeerAnnotation.__IAutomationPeerAnnotationStatics := IAutomationPeerAnnotationStatics(factoryPtr)
        }

        return AutomationPeerAnnotation.__IAutomationPeerAnnotationStatics.get_TypeProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PeerProperty() {
        if (!AutomationPeerAnnotation.HasProp("__IAutomationPeerAnnotationStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutomationPeerAnnotationStatics.IID)
            AutomationPeerAnnotation.__IAutomationPeerAnnotationStatics := IAutomationPeerAnnotationStatics(factoryPtr)
        }

        return AutomationPeerAnnotation.__IAutomationPeerAnnotationStatics.get_PeerProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the type of the annotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the automation peer of the element that implements the annotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.automationpeerannotation.peer
     * @type {AutomationPeer} 
     */
    Peer {
        get => this.get_Peer()
        set => this.put_Peer(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the  class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.AutomationPeerAnnotation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IAutomationPeerAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerAnnotation := IAutomationPeerAnnotation(outPtr)
        }

        return this.__IAutomationPeerAnnotation.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IAutomationPeerAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerAnnotation := IAutomationPeerAnnotation(outPtr)
        }

        return this.__IAutomationPeerAnnotation.put_Type(value)
    }

    /**
     * 
     * @returns {AutomationPeer} 
     */
    get_Peer() {
        if (!this.HasProp("__IAutomationPeerAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerAnnotation := IAutomationPeerAnnotation(outPtr)
        }

        return this.__IAutomationPeerAnnotation.get_Peer()
    }

    /**
     * 
     * @param {AutomationPeer} value 
     * @returns {HRESULT} 
     */
    put_Peer(value) {
        if (!this.HasProp("__IAutomationPeerAnnotation")) {
            if ((queryResult := this.QueryInterface(IAutomationPeerAnnotation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationPeerAnnotation := IAutomationPeerAnnotation(outPtr)
        }

        return this.__IAutomationPeerAnnotation.put_Peer(value)
    }

;@endregion Instance Methods
}
