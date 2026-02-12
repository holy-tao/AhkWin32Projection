#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IButtonBaseAutomationPeer.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a base class for exposing classes derived from [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) to Microsoft UI Automation.
 * @remarks
 * ButtonBaseAutomationPeer has a protected constructor, so you won't be able to use it directly for an [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) definition. Derive your automation peer from ButtonBaseAutomationPeer if you are deriving a custom class from [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) and want to add automation support for additional features that you enabled in your custom class. Then override [OnCreateAutomationPeer](../windows.ui.xaml/uielement_oncreateautomationpeer_1478162674.md) so that it returns your custom peer. Note that [ButtonBase](../windows.ui.xaml.controls.primitives/buttonbase.md) already has derived classes, each of which also has a derived peer, so make sure that you really want to derive from this base class rather than use one of the existing XAML-enabled derived button classes.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.buttonbaseautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class ButtonBaseAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IButtonBaseAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IButtonBaseAutomationPeer.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
