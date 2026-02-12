#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\FrameworkElementAutomationPeer.ahk
#Include .\IInkToolbarAutomationPeer.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) types to Microsoft UI Automation.
 * @remarks
 * This class has an **internal** constructor.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.inktoolbarautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class InkToolbarAutomationPeer extends FrameworkElementAutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkToolbarAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkToolbarAutomationPeer.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
