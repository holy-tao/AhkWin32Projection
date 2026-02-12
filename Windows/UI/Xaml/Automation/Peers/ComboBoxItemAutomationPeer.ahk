#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IComboBoxItemAutomationPeer.ahk
#Include .\IComboBoxItemAutomationPeerFactory.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the [ComboBoxItem](../windows.ui.xaml.controls/comboboxitem.md) contents in a [ComboBox](../windows.ui.xaml.controls/combobox.md) to Microsoft UI Automation.
 * @remarks
 * The Windows Runtime  [ComboBoxItem](../windows.ui.xaml.controls/comboboxitem.md) class creates a new ComboBoxItemAutomationPeer as its [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ComboBoxItemAutomationPeer if you are deriving a custom class from [ComboBoxItem](../windows.ui.xaml.controls/comboboxitem.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.comboboxitemautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ComboBoxItemAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IComboBoxItemAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IComboBoxItemAutomationPeer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {ComboBoxItem} owner 
     * @returns {ComboBoxItemAutomationPeer} 
     */
    static CreateInstanceWithOwner(owner) {
        if (!ComboBoxItemAutomationPeer.HasProp("__IComboBoxItemAutomationPeerFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Automation.Peers.ComboBoxItemAutomationPeer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IComboBoxItemAutomationPeerFactory.IID)
            ComboBoxItemAutomationPeer.__IComboBoxItemAutomationPeerFactory := IComboBoxItemAutomationPeerFactory(factoryPtr)
        }

        return ComboBoxItemAutomationPeer.__IComboBoxItemAutomationPeerFactory.CreateInstanceWithOwner(owner, 0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
