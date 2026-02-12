#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RevealBrush.ahk
#Include .\IRevealBorderBrush.ahk
#Include .\IRevealBorderBrushFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * > [!Important]
  * > RevealBorderBrush is available for use in the operating systems specified in the Requirements section. However, we do not recommend its use as it may be altered or unavailable in subsequent versions.
  * 
  * Paints a control border with a reveal effect using composition brush and light effects.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Media.RevealBorderBrush](/windows/winui/api/microsoft.ui.xaml.media.revealborderbrush) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.revealborderbrush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RevealBorderBrush extends RevealBrush {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRevealBorderBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRevealBorderBrush.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RevealBorderBrush} 
     */
    static CreateInstance() {
        if (!RevealBorderBrush.HasProp("__IRevealBorderBrushFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RevealBorderBrush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRevealBorderBrushFactory.IID)
            RevealBorderBrush.__IRevealBorderBrushFactory := IRevealBorderBrushFactory(factoryPtr)
        }

        return RevealBorderBrush.__IRevealBorderBrushFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
