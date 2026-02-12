#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlaceInfoHelperStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Creates [PlaceInfo](../windows.services.maps/placeinfo.md) instances by using businesses and places found in searches that are performed against data that has been cached locally on the device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.placeinfohelper
 * @namespace Windows.Services.Maps.LocalSearch
 * @version WindowsRuntime 1.4
 */
class PlaceInfoHelper extends IInspectable {
;@region Static Methods
    /**
     * Creates a [PlaceInfo](../windows.services.maps/placeinfo.md) instance.
     * @param {LocalLocation} location_ The location of a business or place.
     * @returns {PlaceInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.localsearch.placeinfohelper.createfromlocallocation
     */
    static CreateFromLocalLocation(location_) {
        if (!PlaceInfoHelper.HasProp("__IPlaceInfoHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.LocalSearch.PlaceInfoHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlaceInfoHelperStatics.IID)
            PlaceInfoHelper.__IPlaceInfoHelperStatics := IPlaceInfoHelperStatics(factoryPtr)
        }

        return PlaceInfoHelper.__IPlaceInfoHelperStatics.CreateFromLocalLocation(location_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
