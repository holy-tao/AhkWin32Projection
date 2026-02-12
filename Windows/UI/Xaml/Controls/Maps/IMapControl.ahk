#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\DependencyObject.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\Foundation\POINT.ahk
#Include .\MapElement.ahk
#Include .\MapRouteView.ahk
#Include .\MapTileSource.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl
     * @type {Guid}
     */
    static IID => Guid("{42d0b851-5256-4747-9e6c-0d11e966141e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Center", "put_Center", "get_Children", "get_ColorScheme", "put_ColorScheme", "get_DesiredPitch", "put_DesiredPitch", "get_Heading", "put_Heading", "get_LandmarksVisible", "put_LandmarksVisible", "get_LoadingStatus", "get_MapServiceToken", "put_MapServiceToken", "get_MaxZoomLevel", "get_MinZoomLevel", "get_PedestrianFeaturesVisible", "put_PedestrianFeaturesVisible", "get_Pitch", "get_Style", "put_Style", "get_TrafficFlowVisible", "put_TrafficFlowVisible", "get_TransformOrigin", "put_TransformOrigin", "get_WatermarkMode", "put_WatermarkMode", "get_ZoomLevel", "put_ZoomLevel", "get_MapElements", "get_Routes", "get_TileSources", "add_CenterChanged", "remove_CenterChanged", "add_HeadingChanged", "remove_HeadingChanged", "add_LoadingStatusChanged", "remove_LoadingStatusChanged", "add_MapDoubleTapped", "remove_MapDoubleTapped", "add_MapHolding", "remove_MapHolding", "add_MapTapped", "remove_MapTapped", "add_PitchChanged", "remove_PitchChanged", "add_TransformOriginChanged", "remove_TransformOriginChanged", "add_ZoomLevelChanged", "remove_ZoomLevelChanged", "FindMapElementsAtOffset", "GetLocationFromOffset", "GetOffsetFromLocation", "IsLocationInView", "TrySetViewBoundsAsync", "TrySetViewWithCenterAsync", "TrySetViewWithCenterAndZoomAsync", "TrySetViewWithCenterZoomHeadingAndPitchAsync", "TrySetViewWithCenterZoomHeadingPitchAndAnimationAsync"]

    /**
     * @type {Geopoint} 
     */
    Center {
        get => this.get_Center()
        set => this.put_Center(value)
    }

    /**
     * @type {IVector<DependencyObject>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * @type {Integer} 
     */
    ColorScheme {
        get => this.get_ColorScheme()
        set => this.put_ColorScheme(value)
    }

    /**
     * @type {Float} 
     */
    DesiredPitch {
        get => this.get_DesiredPitch()
        set => this.put_DesiredPitch(value)
    }

    /**
     * @type {Float} 
     */
    Heading {
        get => this.get_Heading()
        set => this.put_Heading(value)
    }

    /**
     * @type {Boolean} 
     */
    LandmarksVisible {
        get => this.get_LandmarksVisible()
        set => this.put_LandmarksVisible(value)
    }

    /**
     * @type {Integer} 
     */
    LoadingStatus {
        get => this.get_LoadingStatus()
    }

    /**
     * @type {HSTRING} 
     */
    MapServiceToken {
        get => this.get_MapServiceToken()
        set => this.put_MapServiceToken(value)
    }

    /**
     * @type {Float} 
     */
    MaxZoomLevel {
        get => this.get_MaxZoomLevel()
    }

    /**
     * @type {Float} 
     */
    MinZoomLevel {
        get => this.get_MinZoomLevel()
    }

    /**
     * @type {Boolean} 
     */
    PedestrianFeaturesVisible {
        get => this.get_PedestrianFeaturesVisible()
        set => this.put_PedestrianFeaturesVisible(value)
    }

    /**
     * @type {Float} 
     */
    Pitch {
        get => this.get_Pitch()
    }

    /**
     * @type {Integer} 
     */
    Style {
        get => this.get_Style()
        set => this.put_Style(value)
    }

    /**
     * @type {Boolean} 
     */
    TrafficFlowVisible {
        get => this.get_TrafficFlowVisible()
        set => this.put_TrafficFlowVisible(value)
    }

    /**
     * @type {POINT} 
     */
    TransformOrigin {
        get => this.get_TransformOrigin()
        set => this.put_TransformOrigin(value)
    }

    /**
     * @type {Integer} 
     */
    WatermarkMode {
        get => this.get_WatermarkMode()
        set => this.put_WatermarkMode(value)
    }

    /**
     * @type {Float} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
        set => this.put_ZoomLevel(value)
    }

    /**
     * @type {IVector<MapElement>} 
     */
    MapElements {
        get => this.get_MapElements()
    }

    /**
     * @type {IVector<MapRouteView>} 
     */
    Routes {
        get => this.get_Routes()
    }

    /**
     * @type {IVector<MapTileSource>} 
     */
    TileSources {
        get => this.get_TileSources()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Center() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @param {Geopoint} value 
     * @returns {HRESULT} 
     */
    put_Center(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<DependencyObject>} 
     */
    get_Children() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(DependencyObject, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorScheme() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ColorScheme(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredPitch() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DesiredPitch(value) {
        result := ComCall(12, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Heading() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Heading(value) {
        result := ComCall(14, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LandmarksVisible() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LandmarksVisible(value) {
        result := ComCall(16, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LoadingStatus() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MapServiceToken() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_MapServiceToken(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoomLevel() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoomLevel() {
        result := ComCall(21, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PedestrianFeaturesVisible() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PedestrianFeaturesVisible(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pitch() {
        result := ComCall(24, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Style() {
        result := ComCall(25, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Style(value) {
        result := ComCall(26, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TrafficFlowVisible() {
        result := ComCall(27, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TrafficFlowVisible(value) {
        result := ComCall(28, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_TransformOrigin() {
        value := POINT()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_TransformOrigin(value) {
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WatermarkMode() {
        result := ComCall(31, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_WatermarkMode(value) {
        result := ComCall(32, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ZoomLevel() {
        result := ComCall(33, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ZoomLevel(value) {
        result := ComCall(34, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<MapElement>} 
     */
    get_MapElements() {
        result := ComCall(35, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MapElement, value)
    }

    /**
     * 
     * @returns {IVector<MapRouteView>} 
     */
    get_Routes() {
        result := ComCall(36, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MapRouteView, value)
    }

    /**
     * 
     * @returns {IVector<MapTileSource>} 
     */
    get_TileSources() {
        result := ComCall(37, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MapTileSource, value)
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CenterChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(38, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CenterChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(39, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HeadingChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(40, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HeadingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(41, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadingStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(42, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LoadingStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(43, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapDoubleTapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(44, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapDoubleTapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(45, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapHolding(handler) {
        token := EventRegistrationToken()
        result := ComCall(46, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapHolding(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(47, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapInputEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapTapped(handler) {
        token := EventRegistrationToken()
        result := ComCall(48, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapTapped(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(49, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PitchChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(50, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PitchChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(51, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TransformOriginChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(52, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_TransformOriginChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(53, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ZoomLevelChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(54, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ZoomLevelChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(55, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} offset 
     * @returns {IVectorView<MapElement>} 
     */
    FindMapElementsAtOffset(offset) {
        result := ComCall(56, this, "ptr", offset, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapElement, result_)
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Pointer<Geopoint>} location_ 
     * @returns {HRESULT} 
     */
    GetLocationFromOffset(offset, location_) {
        result := ComCall(57, this, "ptr", offset, "ptr", location_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Pointer<POINT>} offset 
     * @returns {HRESULT} 
     */
    GetOffsetFromLocation(location_, offset) {
        result := ComCall(58, this, "ptr", location_, "ptr", offset, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Geopoint} location_ 
     * @param {Pointer<Boolean>} isInView 
     * @returns {HRESULT} 
     */
    IsLocationInView(location_, isInView) {
        result := ComCall(59, this, "ptr", location_, "ptr", isInView, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {GeoboundingBox} bounds 
     * @param {IReference<Thickness>} margin 
     * @param {Integer} animation 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetViewBoundsAsync(bounds, margin, animation) {
        result := ComCall(60, this, "ptr", bounds, "ptr", margin, "int", animation, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Geopoint} center 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetViewWithCenterAsync(center) {
        result := ComCall(61, this, "ptr", center, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Geopoint} center 
     * @param {IReference<Float>} zoomLevel 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetViewWithCenterAndZoomAsync(center, zoomLevel) {
        result := ComCall(62, this, "ptr", center, "ptr", zoomLevel, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Geopoint} center 
     * @param {IReference<Float>} zoomLevel 
     * @param {IReference<Float>} heading 
     * @param {IReference<Float>} desiredPitch 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetViewWithCenterZoomHeadingAndPitchAsync(center, zoomLevel, heading, desiredPitch) {
        result := ComCall(63, this, "ptr", center, "ptr", zoomLevel, "ptr", heading, "ptr", desiredPitch, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Geopoint} center 
     * @param {IReference<Float>} zoomLevel 
     * @param {IReference<Float>} heading 
     * @param {IReference<Float>} desiredPitch 
     * @param {Integer} animation 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetViewWithCenterZoomHeadingPitchAndAnimationAsync(center, zoomLevel, heading, desiredPitch, animation) {
        result := ComCall(64, this, "ptr", center, "ptr", zoomLevel, "ptr", heading, "ptr", desiredPitch, "int", animation, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
