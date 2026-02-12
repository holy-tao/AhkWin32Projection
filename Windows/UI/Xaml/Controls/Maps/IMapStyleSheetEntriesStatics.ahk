#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapStyleSheetEntriesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapStyleSheetEntriesStatics
     * @type {Guid}
     */
    static IID => Guid("{c9636345-ef1a-41a4-a757-bd4f43e1e4d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Area", "get_Airport", "get_Cemetery", "get_Continent", "get_Education", "get_IndigenousPeoplesReserve", "get_Island", "get_Medical", "get_Military", "get_Nautical", "get_Neighborhood", "get_Runway", "get_Sand", "get_ShoppingCenter", "get_Stadium", "get_Vegetation", "get_Forest", "get_GolfCourse", "get_Park", "get_PlayingField", "get_Reserve", "get_Point", "get_NaturalPoint", "get_Peak", "get_VolcanicPeak", "get_WaterPoint", "get_PointOfInterest", "get_Business", "get_FoodPoint", "get_PopulatedPlace", "get_Capital", "get_AdminDistrictCapital", "get_CountryRegionCapital", "get_RoadShield", "get_RoadExit", "get_Transit", "get_Political", "get_CountryRegion", "get_AdminDistrict", "get_District", "get_Structure", "get_Building", "get_EducationBuilding", "get_MedicalBuilding", "get_TransitBuilding", "get_Transportation", "get_Road", "get_ControlledAccessHighway", "get_HighSpeedRamp", "get_Highway", "get_MajorRoad", "get_ArterialRoad", "get_Street", "get_Ramp", "get_UnpavedStreet", "get_TollRoad", "get_Railway", "get_Trail", "get_WaterRoute", "get_Water", "get_River", "get_RouteLine", "get_WalkingRoute", "get_DrivingRoute"]

    /**
     * @type {HSTRING} 
     */
    Area {
        get => this.get_Area()
    }

    /**
     * @type {HSTRING} 
     */
    Airport {
        get => this.get_Airport()
    }

    /**
     * @type {HSTRING} 
     */
    Cemetery {
        get => this.get_Cemetery()
    }

    /**
     * @type {HSTRING} 
     */
    Continent {
        get => this.get_Continent()
    }

    /**
     * @type {HSTRING} 
     */
    Education {
        get => this.get_Education()
    }

    /**
     * @type {HSTRING} 
     */
    IndigenousPeoplesReserve {
        get => this.get_IndigenousPeoplesReserve()
    }

    /**
     * @type {HSTRING} 
     */
    Island {
        get => this.get_Island()
    }

    /**
     * @type {HSTRING} 
     */
    Medical {
        get => this.get_Medical()
    }

    /**
     * @type {HSTRING} 
     */
    Military {
        get => this.get_Military()
    }

    /**
     * @type {HSTRING} 
     */
    Nautical {
        get => this.get_Nautical()
    }

    /**
     * @type {HSTRING} 
     */
    Neighborhood {
        get => this.get_Neighborhood()
    }

    /**
     * @type {HSTRING} 
     */
    Runway {
        get => this.get_Runway()
    }

    /**
     * @type {HSTRING} 
     */
    Sand {
        get => this.get_Sand()
    }

    /**
     * @type {HSTRING} 
     */
    ShoppingCenter {
        get => this.get_ShoppingCenter()
    }

    /**
     * @type {HSTRING} 
     */
    Stadium {
        get => this.get_Stadium()
    }

    /**
     * @type {HSTRING} 
     */
    Vegetation {
        get => this.get_Vegetation()
    }

    /**
     * @type {HSTRING} 
     */
    Forest {
        get => this.get_Forest()
    }

    /**
     * @type {HSTRING} 
     */
    GolfCourse {
        get => this.get_GolfCourse()
    }

    /**
     * @type {HSTRING} 
     */
    Park {
        get => this.get_Park()
    }

    /**
     * @type {HSTRING} 
     */
    PlayingField {
        get => this.get_PlayingField()
    }

    /**
     * @type {HSTRING} 
     */
    Reserve {
        get => this.get_Reserve()
    }

    /**
     * @type {HSTRING} 
     */
    Point {
        get => this.get_Point()
    }

    /**
     * @type {HSTRING} 
     */
    NaturalPoint {
        get => this.get_NaturalPoint()
    }

    /**
     * @type {HSTRING} 
     */
    Peak {
        get => this.get_Peak()
    }

    /**
     * @type {HSTRING} 
     */
    VolcanicPeak {
        get => this.get_VolcanicPeak()
    }

    /**
     * @type {HSTRING} 
     */
    WaterPoint {
        get => this.get_WaterPoint()
    }

    /**
     * @type {HSTRING} 
     */
    PointOfInterest {
        get => this.get_PointOfInterest()
    }

    /**
     * @type {HSTRING} 
     */
    Business {
        get => this.get_Business()
    }

    /**
     * @type {HSTRING} 
     */
    FoodPoint {
        get => this.get_FoodPoint()
    }

    /**
     * @type {HSTRING} 
     */
    PopulatedPlace {
        get => this.get_PopulatedPlace()
    }

    /**
     * @type {HSTRING} 
     */
    Capital {
        get => this.get_Capital()
    }

    /**
     * @type {HSTRING} 
     */
    AdminDistrictCapital {
        get => this.get_AdminDistrictCapital()
    }

    /**
     * @type {HSTRING} 
     */
    CountryRegionCapital {
        get => this.get_CountryRegionCapital()
    }

    /**
     * @type {HSTRING} 
     */
    RoadShield {
        get => this.get_RoadShield()
    }

    /**
     * @type {HSTRING} 
     */
    RoadExit {
        get => this.get_RoadExit()
    }

    /**
     * @type {HSTRING} 
     */
    Transit {
        get => this.get_Transit()
    }

    /**
     * @type {HSTRING} 
     */
    Political {
        get => this.get_Political()
    }

    /**
     * @type {HSTRING} 
     */
    CountryRegion {
        get => this.get_CountryRegion()
    }

    /**
     * @type {HSTRING} 
     */
    AdminDistrict {
        get => this.get_AdminDistrict()
    }

    /**
     * @type {HSTRING} 
     */
    District {
        get => this.get_District()
    }

    /**
     * @type {HSTRING} 
     */
    Structure {
        get => this.get_Structure()
    }

    /**
     * @type {HSTRING} 
     */
    Building {
        get => this.get_Building()
    }

    /**
     * @type {HSTRING} 
     */
    EducationBuilding {
        get => this.get_EducationBuilding()
    }

    /**
     * @type {HSTRING} 
     */
    MedicalBuilding {
        get => this.get_MedicalBuilding()
    }

    /**
     * @type {HSTRING} 
     */
    TransitBuilding {
        get => this.get_TransitBuilding()
    }

    /**
     * @type {HSTRING} 
     */
    Transportation {
        get => this.get_Transportation()
    }

    /**
     * @type {HSTRING} 
     */
    Road {
        get => this.get_Road()
    }

    /**
     * @type {HSTRING} 
     */
    ControlledAccessHighway {
        get => this.get_ControlledAccessHighway()
    }

    /**
     * @type {HSTRING} 
     */
    HighSpeedRamp {
        get => this.get_HighSpeedRamp()
    }

    /**
     * @type {HSTRING} 
     */
    Highway {
        get => this.get_Highway()
    }

    /**
     * @type {HSTRING} 
     */
    MajorRoad {
        get => this.get_MajorRoad()
    }

    /**
     * @type {HSTRING} 
     */
    ArterialRoad {
        get => this.get_ArterialRoad()
    }

    /**
     * @type {HSTRING} 
     */
    Street {
        get => this.get_Street()
    }

    /**
     * @type {HSTRING} 
     */
    Ramp {
        get => this.get_Ramp()
    }

    /**
     * @type {HSTRING} 
     */
    UnpavedStreet {
        get => this.get_UnpavedStreet()
    }

    /**
     * @type {HSTRING} 
     */
    TollRoad {
        get => this.get_TollRoad()
    }

    /**
     * @type {HSTRING} 
     */
    Railway {
        get => this.get_Railway()
    }

    /**
     * @type {HSTRING} 
     */
    Trail {
        get => this.get_Trail()
    }

    /**
     * @type {HSTRING} 
     */
    WaterRoute {
        get => this.get_WaterRoute()
    }

    /**
     * @type {HSTRING} 
     */
    Water {
        get => this.get_Water()
    }

    /**
     * @type {HSTRING} 
     */
    River {
        get => this.get_River()
    }

    /**
     * @type {HSTRING} 
     */
    RouteLine {
        get => this.get_RouteLine()
    }

    /**
     * @type {HSTRING} 
     */
    WalkingRoute {
        get => this.get_WalkingRoute()
    }

    /**
     * @type {HSTRING} 
     */
    DrivingRoute {
        get => this.get_DrivingRoute()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Area() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Airport() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Cemetery() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Continent() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Education() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IndigenousPeoplesReserve() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Island() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Medical() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Military() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Nautical() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Neighborhood() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Runway() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Sand() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ShoppingCenter() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Stadium() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Vegetation() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Forest() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GolfCourse() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Park() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlayingField() {
        value := HSTRING()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Reserve() {
        value := HSTRING()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Point() {
        value := HSTRING()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NaturalPoint() {
        value := HSTRING()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Peak() {
        value := HSTRING()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VolcanicPeak() {
        value := HSTRING()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WaterPoint() {
        value := HSTRING()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PointOfInterest() {
        value := HSTRING()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Business() {
        value := HSTRING()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FoodPoint() {
        value := HSTRING()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PopulatedPlace() {
        value := HSTRING()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Capital() {
        value := HSTRING()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdminDistrictCapital() {
        value := HSTRING()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CountryRegionCapital() {
        value := HSTRING()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoadShield() {
        value := HSTRING()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoadExit() {
        value := HSTRING()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Transit() {
        value := HSTRING()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Political() {
        value := HSTRING()
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CountryRegion() {
        value := HSTRING()
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AdminDistrict() {
        value := HSTRING()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_District() {
        value := HSTRING()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Structure() {
        value := HSTRING()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Building() {
        value := HSTRING()
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EducationBuilding() {
        value := HSTRING()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MedicalBuilding() {
        value := HSTRING()
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TransitBuilding() {
        value := HSTRING()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Transportation() {
        value := HSTRING()
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Road() {
        value := HSTRING()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ControlledAccessHighway() {
        value := HSTRING()
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HighSpeedRamp() {
        value := HSTRING()
        result := ComCall(54, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Highway() {
        value := HSTRING()
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MajorRoad() {
        value := HSTRING()
        result := ComCall(56, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ArterialRoad() {
        value := HSTRING()
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Street() {
        value := HSTRING()
        result := ComCall(58, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Ramp() {
        value := HSTRING()
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnpavedStreet() {
        value := HSTRING()
        result := ComCall(60, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TollRoad() {
        value := HSTRING()
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Railway() {
        value := HSTRING()
        result := ComCall(62, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Trail() {
        value := HSTRING()
        result := ComCall(63, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WaterRoute() {
        value := HSTRING()
        result := ComCall(64, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Water() {
        value := HSTRING()
        result := ComCall(65, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_River() {
        value := HSTRING()
        result := ComCall(66, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RouteLine() {
        value := HSTRING()
        result := ComCall(67, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_WalkingRoute() {
        value := HSTRING()
        result := ComCall(68, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DrivingRoute() {
        value := HSTRING()
        result := ComCall(69, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
