#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CacheMode.ahk
#Include .\IBitmapCache.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the behavior of caching a visual element or tree of elements as bitmap surfaces.
 * @remarks
 * This class is infrastructure, and provides the underlying run-time value for the behavior when you specify `CacheMode="BitmapCache"` in XAML markup, or create a new BitmapCache in code to set [UIElement.CacheMode](../windows.ui.xaml/uielement_cachemode.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.bitmapcache
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class BitmapCache extends CacheMode {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBitmapCache

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBitmapCache.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [BitmapCache](bitmapcache.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.BitmapCache")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
