#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaMarkerTypesStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Provides a static list of media marker types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediamarkertypes
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class MediaMarkerTypes extends IInspectable {
;@region Static Properties
    /**
     * Gets the value of the Bookmark type which is returned as the string "Bookmark"
     * @see https://learn.microsoft.com/uwp/api/windows.media.mediamarkertypes.bookmark
     * @type {HSTRING} 
     */
    static Bookmark {
        get => MediaMarkerTypes.get_Bookmark()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bookmark() {
        if (!MediaMarkerTypes.HasProp("__IMediaMarkerTypesStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.MediaMarkerTypes")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaMarkerTypesStatics.IID)
            MediaMarkerTypes.__IMediaMarkerTypesStatics := IMediaMarkerTypesStatics(factoryPtr)
        }

        return MediaMarkerTypes.__IMediaMarkerTypesStatics.get_Bookmark()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
