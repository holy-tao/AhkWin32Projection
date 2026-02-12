#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\DependencyProperty.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControlStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControlStatics
     * @type {Guid}
     */
    static IID => Guid("{c2c61795-2147-4f0a-942a-5493a85de807}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CenterProperty", "get_ChildrenProperty", "get_ColorSchemeProperty", "get_DesiredPitchProperty", "get_HeadingProperty", "get_LandmarksVisibleProperty", "get_LoadingStatusProperty", "get_MapServiceTokenProperty", "get_PedestrianFeaturesVisibleProperty", "get_PitchProperty", "get_StyleProperty", "get_TrafficFlowVisibleProperty", "get_TransformOriginProperty", "get_WatermarkModeProperty", "get_ZoomLevelProperty", "get_MapElementsProperty", "get_RoutesProperty", "get_TileSourcesProperty", "get_LocationProperty", "GetLocation", "SetLocation", "get_NormalizedAnchorPointProperty", "GetNormalizedAnchorPoint", "SetNormalizedAnchorPoint"]

    /**
     * @type {DependencyProperty} 
     */
    CenterProperty {
        get => this.get_CenterProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ChildrenProperty {
        get => this.get_ChildrenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ColorSchemeProperty {
        get => this.get_ColorSchemeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    DesiredPitchProperty {
        get => this.get_DesiredPitchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HeadingProperty {
        get => this.get_HeadingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LandmarksVisibleProperty {
        get => this.get_LandmarksVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LoadingStatusProperty {
        get => this.get_LoadingStatusProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MapServiceTokenProperty {
        get => this.get_MapServiceTokenProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PedestrianFeaturesVisibleProperty {
        get => this.get_PedestrianFeaturesVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PitchProperty {
        get => this.get_PitchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    StyleProperty {
        get => this.get_StyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TrafficFlowVisibleProperty {
        get => this.get_TrafficFlowVisibleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TransformOriginProperty {
        get => this.get_TransformOriginProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    WatermarkModeProperty {
        get => this.get_WatermarkModeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ZoomLevelProperty {
        get => this.get_ZoomLevelProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    MapElementsProperty {
        get => this.get_MapElementsProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    RoutesProperty {
        get => this.get_RoutesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TileSourcesProperty {
        get => this.get_TileSourcesProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LocationProperty {
        get => this.get_LocationProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    NormalizedAnchorPointProperty {
        get => this.get_NormalizedAnchorPointProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CenterProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ChildrenProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ColorSchemeProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_DesiredPitchProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HeadingProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LandmarksVisibleProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LoadingStatusProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapServiceTokenProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PedestrianFeaturesVisibleProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PitchProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_StyleProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TrafficFlowVisibleProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TransformOriginProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_WatermarkModeProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ZoomLevelProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_MapElementsProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_RoutesProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TileSourcesProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LocationProperty() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {Geopoint} 
     */
    GetLocation(element) {
        result := ComCall(25, this, "ptr", element, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(result_)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    SetLocation(element, value) {
        result := ComCall(26, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_NormalizedAnchorPointProperty() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @returns {POINT} 
     */
    GetNormalizedAnchorPoint(element) {
        result_ := POINT()
        result := ComCall(28, this, "ptr", element, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {DependencyObject} element 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    SetNormalizedAnchorPoint(element, value) {
        result := ComCall(29, this, "ptr", element, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
