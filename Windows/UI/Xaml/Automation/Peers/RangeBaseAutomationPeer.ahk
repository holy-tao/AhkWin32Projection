#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IRangeBaseAutomationPeer.ahk
#Include ..\Provider\IRangeValueProvider.ahk
#Include .\IRangeBaseAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * A base class that provides a Microsoft UI Automation peer implementation for types that derive from [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md).
 * @remarks
 * The Windows Runtime  [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) class creates a new RangeBaseAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from RangeBaseAutomationPeer if you are deriving a custom class from [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * 
 * > [!NOTE]
 * > Base classes for XAML UI don't typically have an [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) implementation but [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md) does. However, the peer it creates is missing some information. Therefore you should still follow the pattern of defining a new peer based on RangeBaseAutomationPeer and creating an instance of it in [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) for a custom control that's based on [RangeBase](../windows.ui.xaml.controls.primitives/rangebase.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class RangeBaseAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRangeBaseAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRangeBaseAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {RangeBase} owner 
     * @returns {RangeBaseAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!RangeBaseAutomationPeer.HasProp("__IRangeBaseAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.RangeBaseAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRangeBaseAutomationPeerFactory.IID)
            RangeBaseAutomationPeer.__IRangeBaseAutomationPeerFactory := IRangeBaseAutomationPeerFactory(factoryPtr)
        }

        return RangeBaseAutomationPeer.__IRangeBaseAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the value of a control is read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets the value that is added to or subtracted from the [Value](rangebaseautomationpeer_value.md) property when a large change is made, such as with the PAGE DOWN key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.largechange
     * @type {Float} 
     */
    LargeChange {
        get => this.get_LargeChange()
    }

    /**
     * Gets the maximum range value that is supported by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.maximum
     * @type {Float} 
     */
    Maximum {
        get => this.get_Maximum()
    }

    /**
     * Gets the minimum range value that is supported by the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.minimum
     * @type {Float} 
     */
    Minimum {
        get => this.get_Minimum()
    }

    /**
     * Gets the value that is added to or subtracted from the [Value](rangebaseautomationpeer_value.md) property when a small change is made, such as with an arrow key.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.smallchange
     * @type {Float} 
     */
    SmallChange {
        get => this.get_SmallChange()
    }

    /**
     * Gets the value of the control.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.value
     * @type {Float} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_IsReadOnly()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LargeChange() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_LargeChange()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Maximum() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_Maximum()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Minimum() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_Minimum()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SmallChange() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_SmallChange()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Value() {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.get_Value()
    }

    /**
     * Sets the value of the control, as an implementation of the [IValueProvider](../windows.ui.xaml.automation.provider/ivalueprovider.md) pattern.
     * @param {Float} value The value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.rangebaseautomationpeer.setvalue
     */
    SetValue(value) {
        if (!this.HasProp("__IRangeValueProvider")) {
            if ((queryResult := this.QueryInterface(IRangeValueProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRangeValueProvider := IRangeValueProvider(outPtr)
        }

        return this.__IRangeValueProvider.SetValue(value)
    }

;@endregion Instance Methods
}
