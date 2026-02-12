#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AutomationPeer.ahk
#Include .\ILoopingSelectorItemDataAutomationPeer.ahk
#Include ..\Provider\IVirtualizedItemProvider.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Exposes the data content of a [LoopingSelectorItem](../windows.ui.xaml.controls.primitives/loopingselectoritem.md) to Microsoft UI Automation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemdataautomationpeer
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class LoopingSelectorItemDataAutomationPeer extends AutomationPeer {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelectorItemDataAutomationPeer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelectorItemDataAutomationPeer.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Makes the virtual item fully accessible as a Microsoft UI Automation element.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.loopingselectoritemdataautomationpeer.realize
     */
    Realize() {
        if (!this.HasProp("__IVirtualizedItemProvider")) {
            if ((queryResult := this.QueryInterface(IVirtualizedItemProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVirtualizedItemProvider := IVirtualizedItemProvider(outPtr)
        }

        return this.__IVirtualizedItemProvider.Realize()
    }

;@endregion Instance Methods
}
