#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ContentLinkProvider.ahk
#Include .\IPlaceContentLinkProvider.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines a [ContentLink](contentlink.md) that contains a place.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.placecontentlinkprovider
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class PlaceContentLinkProvider extends ContentLinkProvider {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlaceContentLinkProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlaceContentLinkProvider.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the PlaceContentLinkProvider class.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Documents.PlaceContentLinkProvider")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
