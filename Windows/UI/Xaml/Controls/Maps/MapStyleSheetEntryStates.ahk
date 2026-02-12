#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapStyleSheetEntryStatesStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the names of the supported style entry states of a map style sheet. These states map to state-specific styles defined in the map's style sheet.
 * @remarks
 * You can set the [MapStyleSheetEntryState](mapelement_mapstylesheetentrystate.md) property of a [MapElement](mapelement.md) to any of these states. If the map's style sheet defines a style for that state, the style is applied to the [MapElement](mapelement.md).
 * 
 * To learn more about entries in a map style sheet, see [Map style sheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet#version).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentrystates
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapStyleSheetEntryStates extends IInspectable {
;@region Static Properties
    /**
     * Gets the name for the disabled visual state of the [MapElement](mapelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentrystates.disabled
     * @type {HSTRING} 
     */
    static Disabled {
        get => MapStyleSheetEntryStates.get_Disabled()
    }

    /**
     * Gets the name for the hover visual state of the [MapElement](mapelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentrystates.hover
     * @type {HSTRING} 
     */
    static Hover {
        get => MapStyleSheetEntryStates.get_Hover()
    }

    /**
     * Gets the name for the selected visual state of the [MapElement](mapelement.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentrystates.selected
     * @type {HSTRING} 
     */
    static Selected {
        get => MapStyleSheetEntryStates.get_Selected()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Disabled() {
        if (!MapStyleSheetEntryStates.HasProp("__IMapStyleSheetEntryStatesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntryStatesStatics.IID)
            MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics := IMapStyleSheetEntryStatesStatics(factoryPtr)
        }

        return MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics.get_Disabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Hover() {
        if (!MapStyleSheetEntryStates.HasProp("__IMapStyleSheetEntryStatesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntryStatesStatics.IID)
            MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics := IMapStyleSheetEntryStatesStatics(factoryPtr)
        }

        return MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics.get_Hover()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Selected() {
        if (!MapStyleSheetEntryStates.HasProp("__IMapStyleSheetEntryStatesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntryStates")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntryStatesStatics.IID)
            MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics := IMapStyleSheetEntryStatesStatics(factoryPtr)
        }

        return MapStyleSheetEntryStates.__IMapStyleSheetEntryStatesStatics.get_Selected()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
