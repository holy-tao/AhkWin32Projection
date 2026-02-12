#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapStyleSheetEntriesStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the names of JavaScript Object Notation (JSON) supported style entries in the map style sheet.
 * @remarks
 * You can set the [MapStyleSheetEntry](mapelement_mapstylesheetentry.md) property of a [MapElement](mapelement.md) to any of these entry names. If the map's style sheet defines a style for that entry name, the style is applied to the [MapElement](mapelement.md).
 * 
 * To learn more about entries in a map style sheet, see [Map style sheet reference](/windows/uwp/maps-and-location/elements-of-map-style-sheet#version).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapStyleSheetEntries extends IInspectable {
;@region Static Properties
    /**
     * Gets the JSON entry name that represents areas of land use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.area
     * @type {HSTRING} 
     */
    static Area {
        get => MapStyleSheetEntries.get_Area()
    }

    /**
     * Gets the JSON entry name that represents areas that encompass an airport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.airport
     * @type {HSTRING} 
     */
    static Airport {
        get => MapStyleSheetEntries.get_Airport()
    }

    /**
     * Gets the JSON entry name that represents areas of cemeteries.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.cemetery
     * @type {HSTRING} 
     */
    static Cemetery {
        get => MapStyleSheetEntries.get_Cemetery()
    }

    /**
     * Gets the JSON entry name that represents areas of entire continents.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.continent
     * @type {HSTRING} 
     */
    static Continent {
        get => MapStyleSheetEntries.get_Continent()
    }

    /**
     * Gets the JSON entry name that represents areas of schools.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.education
     * @type {HSTRING} 
     */
    static Education {
        get => MapStyleSheetEntries.get_Education()
    }

    /**
     * Gets the JSON entry name that represents areas of Indian reservations.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.indigenouspeoplesreserve
     * @type {HSTRING} 
     */
    static IndigenousPeoplesReserve {
        get => MapStyleSheetEntries.get_IndigenousPeoplesReserve()
    }

    /**
     * Gets the JSON entry name that represents labels in island areas.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.island
     * @type {HSTRING} 
     */
    static Island {
        get => MapStyleSheetEntries.get_Island()
    }

    /**
     * Gets the JSON entry name that represents areas of land that are used for medical purposes (For example: a hospital campus).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.medical
     * @type {HSTRING} 
     */
    static Medical {
        get => MapStyleSheetEntries.get_Medical()
    }

    /**
     * Gets the JSON entry name that represents areas of military bases.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.military
     * @type {HSTRING} 
     */
    static Military {
        get => MapStyleSheetEntries.get_Military()
    }

    /**
     * Gets the JSON entry name that represents areas of land that are used for nautical purposes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.nautical
     * @type {HSTRING} 
     */
    static Nautical {
        get => MapStyleSheetEntries.get_Nautical()
    }

    /**
     * Gets the JSON entry name that represents labels in areas defined as neighborhoods.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.neighborhood
     * @type {HSTRING} 
     */
    static Neighborhood {
        get => MapStyleSheetEntries.get_Neighborhood()
    }

    /**
     * Gets the JSON entry name that represents land areas that are covered by a runway.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.runway
     * @type {HSTRING} 
     */
    static Runway {
        get => MapStyleSheetEntries.get_Runway()
    }

    /**
     * Gets the JSON entry name that represents sandy areas like beaches.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.sand
     * @type {HSTRING} 
     */
    static Sand {
        get => MapStyleSheetEntries.get_Sand()
    }

    /**
     * Gets the JSON entry name that represents areas of ground allocated for malls or other shopping centers.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.shoppingcenter
     * @type {HSTRING} 
     */
    static ShoppingCenter {
        get => MapStyleSheetEntries.get_ShoppingCenter()
    }

    /**
     * Gets the JSON entry name that represents area of a stadium.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.stadium
     * @type {HSTRING} 
     */
    static Stadium {
        get => MapStyleSheetEntries.get_Stadium()
    }

    /**
     * Gets the JSON entry name that represents forests, grassy areas, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.vegetation
     * @type {HSTRING} 
     */
    static Vegetation {
        get => MapStyleSheetEntries.get_Vegetation()
    }

    /**
     * Gets the JSON entry name that represents area of forest land.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.forest
     * @type {HSTRING} 
     */
    static Forest {
        get => MapStyleSheetEntries.get_Forest()
    }

    /**
     * Gets the JSON entry name that represents areas of golf courses.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.golfcourse
     * @type {HSTRING} 
     */
    static GolfCourse {
        get => MapStyleSheetEntries.get_GolfCourse()
    }

    /**
     * Gets the JSON entry name that represents park areas.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.park
     * @type {HSTRING} 
     */
    static Park {
        get => MapStyleSheetEntries.get_Park()
    }

    /**
     * Gets the JSON entry name that represents extracted pitches such as a baseball field or tennis court.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.playingfield
     * @type {HSTRING} 
     */
    static PlayingField {
        get => MapStyleSheetEntries.get_PlayingField()
    }

    /**
     * Gets the JSON entry name that represents areas of nature reserves.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.reserve
     * @type {HSTRING} 
     */
    static Reserve {
        get => MapStyleSheetEntries.get_Reserve()
    }

    /**
     * Gets the JSON entry name that represents all point features that are rendered with an icon of some sort.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.point
     * @type {HSTRING} 
     */
    static Point {
        get => MapStyleSheetEntries.get_Point()
    }

    /**
     * Gets the JSON entry name for icons that represent natural landmarks such as a volcano peak or waterfall.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.naturalpoint
     * @type {HSTRING} 
     */
    static NaturalPoint {
        get => MapStyleSheetEntries.get_NaturalPoint()
    }

    /**
     * Gets the JSON entry name for icons that represent mountain peaks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.peak
     * @type {HSTRING} 
     */
    static Peak {
        get => MapStyleSheetEntries.get_Peak()
    }

    /**
     * Gets the JSON entry name for icons that represent volcano peaks.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.volcanicpeak
     * @type {HSTRING} 
     */
    static VolcanicPeak {
        get => MapStyleSheetEntries.get_VolcanicPeak()
    }

    /**
     * Gets the JSON entry name for icons that represent water feature locations such as a waterfall.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.waterpoint
     * @type {HSTRING} 
     */
    static WaterPoint {
        get => MapStyleSheetEntries.get_WaterPoint()
    }

    /**
     * Gets the JSON entry name that represents restaurants, hospitals, schools, marinas, ski areas, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.pointofinterest
     * @type {HSTRING} 
     */
    static PointOfInterest {
        get => MapStyleSheetEntries.get_PointOfInterest()
    }

    /**
     * Gets the JSON entry name that represents restaurants, hospitals, schools, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.business
     * @type {HSTRING} 
     */
    static Business {
        get => MapStyleSheetEntries.get_Business()
    }

    /**
     * Gets the JSON entry name that represents restaurants, cafés, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.foodpoint
     * @type {HSTRING} 
     */
    static FoodPoint {
        get => MapStyleSheetEntries.get_FoodPoint()
    }

    /**
     * Gets the JSON entry name for icons that represent the size of populated place (For example: a city or town).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.populatedplace
     * @type {HSTRING} 
     */
    static PopulatedPlace {
        get => MapStyleSheetEntries.get_PopulatedPlace()
    }

    /**
     * Gets the JSON entry name for icons that represent the capital of a populated place.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.capital
     * @type {HSTRING} 
     */
    static Capital {
        get => MapStyleSheetEntries.get_Capital()
    }

    /**
     * Gets the JSON entry name for icons that represent the capital of a state or province.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.admindistrictcapital
     * @type {HSTRING} 
     */
    static AdminDistrictCapital {
        get => MapStyleSheetEntries.get_AdminDistrictCapital()
    }

    /**
     * Gets the JSON entry name for icons that represent the capital of a country or region.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.countryregioncapital
     * @type {HSTRING} 
     */
    static CountryRegionCapital {
        get => MapStyleSheetEntries.get_CountryRegionCapital()
    }

    /**
     * Gets the JSON entry name for signs that represent the compact name for a road. (For example: I-5).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.roadshield
     * @type {HSTRING} 
     */
    static RoadShield {
        get => MapStyleSheetEntries.get_RoadShield()
    }

    /**
     * Gets the JSON entry name for icons that represent exits, typically from a controlled access highway.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.roadexit
     * @type {HSTRING} 
     */
    static RoadExit {
        get => MapStyleSheetEntries.get_RoadExit()
    }

    /**
     * Gets the JSON entry name for icons that represent bus stops, train stops, airports, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.transit
     * @type {HSTRING} 
     */
    static Transit {
        get => MapStyleSheetEntries.get_Transit()
    }

    /**
     * Gets the JSON entry name for political regions such as countries, regions and states.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.political
     * @type {HSTRING} 
     */
    static Political {
        get => MapStyleSheetEntries.get_Political()
    }

    /**
     * Gets the JSON entry name that represents a country.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.countryregion
     * @type {HSTRING} 
     */
    static CountryRegion {
        get => MapStyleSheetEntries.get_CountryRegion()
    }

    /**
     * Gets the JSON entry name that represents admin1, states, provinces, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.admindistrict
     * @type {HSTRING} 
     */
    static AdminDistrict {
        get => MapStyleSheetEntries.get_AdminDistrict()
    }

    /**
     * Gets the JSON entry name that represents admin2, counties, etc.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.district
     * @type {HSTRING} 
     */
    static District {
        get => MapStyleSheetEntries.get_District()
    }

    /**
     * Gets the JSON entry name that represents building and other building-like structures.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.structure
     * @type {HSTRING} 
     */
    static Structure {
        get => MapStyleSheetEntries.get_Structure()
    }

    /**
     * Gets the JSON entry name that represents a building.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.building
     * @type {HSTRING} 
     */
    static Building {
        get => MapStyleSheetEntries.get_Building()
    }

    /**
     * Gets the JSON entry name that represents an educational building such as a school.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.educationbuilding
     * @type {HSTRING} 
     */
    static EducationBuilding {
        get => MapStyleSheetEntries.get_EducationBuilding()
    }

    /**
     * Gets the JSON entry name that represents buildings that are used for medical purposes (For example: a hospital).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.medicalbuilding
     * @type {HSTRING} 
     */
    static MedicalBuilding {
        get => MapStyleSheetEntries.get_MedicalBuilding()
    }

    /**
     * Gets the JSON entry name that represents a transit building such as a bus station.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.transitbuilding
     * @type {HSTRING} 
     */
    static TransitBuilding {
        get => MapStyleSheetEntries.get_TransitBuilding()
    }

    /**
     * Gets the JSON entry name that represents lines that are part of the transportation network (For example: roads, trains, and ferries).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.transportation
     * @type {HSTRING} 
     */
    static Transportation {
        get => MapStyleSheetEntries.get_Transportation()
    }

    /**
     * Gets the JSON entry name for lines that represent all roads.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.road
     * @type {HSTRING} 
     */
    static Road {
        get => MapStyleSheetEntries.get_Road()
    }

    /**
     * Gets the JSON entry name for lines that represent highways with restricted access.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.controlledaccesshighway
     * @type {HSTRING} 
     */
    static ControlledAccessHighway {
        get => MapStyleSheetEntries.get_ControlledAccessHighway()
    }

    /**
     * Gets the JSON entry name for lines that represent ramps. These ramps typically appear alongside of controlled access highways.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.highspeedramp
     * @type {HSTRING} 
     */
    static HighSpeedRamp {
        get => MapStyleSheetEntries.get_HighSpeedRamp()
    }

    /**
     * Gets the JSON entry name for lines that represent highways.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.highway
     * @type {HSTRING} 
     */
    static Highway {
        get => MapStyleSheetEntries.get_Highway()
    }

    /**
     * Gets the JSON entry name for lines that represent main roads.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.majorroad
     * @type {HSTRING} 
     */
    static MajorRoad {
        get => MapStyleSheetEntries.get_MajorRoad()
    }

    /**
     * Gets the JSON entry name for lines that represent main roads with heavy traffic.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.arterialroad
     * @type {HSTRING} 
     */
    static ArterialRoad {
        get => MapStyleSheetEntries.get_ArterialRoad()
    }

    /**
     * Gets the JSON entry name for lines that represent streets.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.street
     * @type {HSTRING} 
     */
    static Street {
        get => MapStyleSheetEntries.get_Street()
    }

    /**
     * Gets the JSON entry name that represents lines that represent the entrance and exit of a highway.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.ramp
     * @type {HSTRING} 
     */
    static Ramp {
        get => MapStyleSheetEntries.get_Ramp()
    }

    /**
     * Gets the JSON entry name for lines that represent unpaved streets.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.unpavedstreet
     * @type {HSTRING} 
     */
    static UnpavedStreet {
        get => MapStyleSheetEntries.get_UnpavedStreet()
    }

    /**
     * Gets the JSON entry name that represents roads that cost money to use.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.tollroad
     * @type {HSTRING} 
     */
    static TollRoad {
        get => MapStyleSheetEntries.get_TollRoad()
    }

    /**
     * Gets the JSON entry name that represents railway lines.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.railway
     * @type {HSTRING} 
     */
    static Railway {
        get => MapStyleSheetEntries.get_Railway()
    }

    /**
     * Gets the JSON entry name that represents walking trails through parks or hiking trails.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.trail
     * @type {HSTRING} 
     */
    static Trail {
        get => MapStyleSheetEntries.get_Trail()
    }

    /**
     * Gets the JSON entry name that represents ferry route lines.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.waterroute
     * @type {HSTRING} 
     */
    static WaterRoute {
        get => MapStyleSheetEntries.get_WaterRoute()
    }

    /**
     * Gets the JSON entry name that represents anything that looks like water. This includes oceans and streams.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.water
     * @type {HSTRING} 
     */
    static Water {
        get => MapStyleSheetEntries.get_Water()
    }

    /**
     * Gets the JSON entry name that represents rivers, streams, or other water passages.
     * @remarks
     * This might be a line or polygon and might connect to non-river water bodies.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.river
     * @type {HSTRING} 
     */
    static River {
        get => MapStyleSheetEntries.get_River()
    }

    /**
     * Gets the JSON entry name that represents the styling for all route lines.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.routeline
     * @type {HSTRING} 
     */
    static RouteLine {
        get => MapStyleSheetEntries.get_RouteLine()
    }

    /**
     * Gets the JSON entry name that represents a walking route.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.walkingroute
     * @type {HSTRING} 
     */
    static WalkingRoute {
        get => MapStyleSheetEntries.get_WalkingRoute()
    }

    /**
     * Gets the JSON entry name that represents a driving route.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapstylesheetentries.drivingroute
     * @type {HSTRING} 
     */
    static DrivingRoute {
        get => MapStyleSheetEntries.get_DrivingRoute()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Area() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Area()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Airport() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Airport()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Cemetery() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Cemetery()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Continent() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Continent()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Education() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Education()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_IndigenousPeoplesReserve() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_IndigenousPeoplesReserve()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Island() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Island()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Medical() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Medical()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Military() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Military()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Nautical() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Nautical()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Neighborhood() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Neighborhood()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Runway() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Runway()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sand() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Sand()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ShoppingCenter() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_ShoppingCenter()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Stadium() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Stadium()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Vegetation() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Vegetation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Forest() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Forest()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_GolfCourse() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_GolfCourse()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Park() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Park()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PlayingField() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_PlayingField()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Reserve() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Reserve()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Point() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Point()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_NaturalPoint() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_NaturalPoint()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Peak() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Peak()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_VolcanicPeak() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_VolcanicPeak()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WaterPoint() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_WaterPoint()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PointOfInterest() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_PointOfInterest()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Business() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Business()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FoodPoint() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_FoodPoint()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PopulatedPlace() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_PopulatedPlace()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Capital() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Capital()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AdminDistrictCapital() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_AdminDistrictCapital()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CountryRegionCapital() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_CountryRegionCapital()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RoadShield() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_RoadShield()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RoadExit() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_RoadExit()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Transit() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Transit()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Political() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Political()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_CountryRegion() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_CountryRegion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_AdminDistrict() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_AdminDistrict()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_District() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_District()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Structure() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Structure()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Building() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Building()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_EducationBuilding() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_EducationBuilding()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MedicalBuilding() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_MedicalBuilding()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TransitBuilding() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_TransitBuilding()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Transportation() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Transportation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Road() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Road()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ControlledAccessHighway() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_ControlledAccessHighway()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HighSpeedRamp() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_HighSpeedRamp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Highway() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Highway()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MajorRoad() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_MajorRoad()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ArterialRoad() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_ArterialRoad()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Street() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Street()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Ramp() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Ramp()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_UnpavedStreet() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_UnpavedStreet()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TollRoad() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_TollRoad()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Railway() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Railway()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Trail() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Trail()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WaterRoute() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_WaterRoute()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Water() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_Water()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_River() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_River()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_RouteLine() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_RouteLine()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_WalkingRoute() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_WalkingRoute()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DrivingRoute() {
        if (!MapStyleSheetEntries.HasProp("__IMapStyleSheetEntriesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapStyleSheetEntries")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMapStyleSheetEntriesStatics.IID)
            MapStyleSheetEntries.__IMapStyleSheetEntriesStatics := IMapStyleSheetEntriesStatics(factoryPtr)
        }

        return MapStyleSheetEntries.__IMapStyleSheetEntriesStatics.get_DrivingRoute()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
