#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IRatingItemInfo.ahk
#Include .\IRatingItemInfoFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents information about the visual states of the elements that represent a rating.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.RatingItemInfo](/windows/winui/api/microsoft.ui.xaml.controls.ratingiteminfo) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.ratingiteminfo
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RatingItemInfo extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRatingItemInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRatingItemInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {RatingItemInfo} 
     */
    static CreateInstance() {
        if (!RatingItemInfo.HasProp("__IRatingItemInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RatingItemInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRatingItemInfoFactory.IID)
            RatingItemInfo.__IRatingItemInfoFactory := IRatingItemInfoFactory(factoryPtr)
        }

        return RatingItemInfo.__IRatingItemInfoFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
