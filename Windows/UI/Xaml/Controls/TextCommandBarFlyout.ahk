#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CommandBarFlyout.ahk
#Include .\ITextCommandBarFlyout.ahk
#Include .\ITextCommandBarFlyoutFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a specialized command bar flyout that contains commands for editing text.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.TextCommandBarFlyout](/windows/winui/api/microsoft.ui.xaml.controls.textcommandbarflyout) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.textcommandbarflyout
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class TextCommandBarFlyout extends CommandBarFlyout {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextCommandBarFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextCommandBarFlyout.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {TextCommandBarFlyout} 
     */
    static CreateInstance() {
        if (!TextCommandBarFlyout.HasProp("__ITextCommandBarFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.TextCommandBarFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITextCommandBarFlyoutFactory.IID)
            TextCommandBarFlyout.__ITextCommandBarFlyoutFactory := ITextCommandBarFlyoutFactory(factoryPtr)
        }

        return TextCommandBarFlyout.__ITextCommandBarFlyoutFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
