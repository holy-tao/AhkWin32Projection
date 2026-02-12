#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IMapStyleSheet.ahk
#Include .\IMapStyleSheetStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a set of rules that define the style of the map in a [map control](mapcontrol.md). This class provides methods to:
  * 1. Retrieve common base map styles.
  * 2. Load custom sheets through [ParseFromJson](mapstylesheet_parsefromjson_1626148147.md) and [TryParseFromJson](mapstylesheet_tryparsefromjson_599503431.md).  To learn more about JSON style sheets, see [Map stylesheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet).  
  * 3. Combine multiple sheets, where later sheets override earlier sheets, using the [Combine](mapstylesheet_combine_123662630.md) method.  Usually a common base map style is be combined with custom JSON to create a customized map style.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapStyleSheet extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapStyleSheet

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapStyleSheet.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) that presents an aerial view of the map.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.aerial
     */
    static Aerial() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.Aerial()
    }

    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) that presents a hybrid map that combines an aerial map with roads.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.aerialwithoverlay
     */
    static AerialWithOverlay() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.AerialWithOverlay()
    }

    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) that presents a road map with a light theme.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.roadlight
     */
    static RoadLight() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.RoadLight()
    }

    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) that presents a road map with a dark theme.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.roaddark
     */
    static RoadDark() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.RoadDark()
    }

    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) styles the map with a high contrast light theme.
     * @remarks
     * High contrast themes use a small palette of contrasting colors that makes the interface easier to see.
     * 
     * See [High contrast themes](/windows/uwp/accessibility/high-contrast-themes).
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.roadhighcontrastlight
     */
    static RoadHighContrastLight() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.RoadHighContrastLight()
    }

    /**
     * Gets a [MapStyleSheet](mapstylesheet.md) styles the map with a high contrast dark theme.
     * @remarks
     * High contrast themes use a small palette of contrasting colors that makes the interface easier to see.
     * 
     * See [High contrast themes](/windows/uwp/accessibility/high-contrast-themes).
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.roadhighcontrastdark
     */
    static RoadHighContrastDark() {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.RoadHighContrastDark()
    }

    /**
     * Combines the rules defined in two [MapStyleSheet](mapstylesheet.md) instances.
     * @remarks
     * If both [MapStyleSheet](mapstylesheet.md) instances define the same rule, the last instance will override the rule defined in the first instance.
     * @param {IIterable<MapStyleSheet>} styleSheets The [MapStyleSheet](mapstylesheet.md) instances that you want to combine.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.combine
     */
    static Combine(styleSheets) {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.Combine(styleSheets)
    }

    /**
     * Creates a stylesheet by parsing a JSON markup string that defines a set of custom rules.
     * @param {HSTRING} styleAsJson A JSON markup string that defines a set of custom rules.
     * @returns {MapStyleSheet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.parsefromjson
     */
    static ParseFromJson(styleAsJson) {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.ParseFromJson(styleAsJson)
    }

    /**
     * Creates stylesheet by parsing a JSON markup string that defines a set of custom rules.
     * @remarks
     * To learn more about the properties that you can use in your JSON string to define styles, see [Map stylesheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet).
     * 
     * If there's an error in the JSON markup string, this method does not throw an exception. Instead, it returns **false**.
     * @param {HSTRING} styleAsJson A JSON markup string that defines a set of custom rules.
     * @param {Pointer<MapStyleSheet>} styleSheet The [MapStyleSheet](mapstylesheet.md) that will represent the rules defined in JSON markup string.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheet.tryparsefromjson
     */
    static TryParseFromJson(styleAsJson, styleSheet) {
        if (!MapStyleSheet.HasProp("__IMapStyleSheetStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheet")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetStatics.IID)
            MapStyleSheet.__IMapStyleSheetStatics := IMapStyleSheetStatics(factoryPtr)
        }

        return MapStyleSheet.__IMapStyleSheetStatics.TryParseFromJson(styleAsJson, styleSheet)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
