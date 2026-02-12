#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapScene.ahk
#Include .\MapCamera.ahk
#Include .\MapCustomExperience.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl2
     * @type {Guid}
     */
    static IID => Guid("{e1fd644d-96ec-4065-b0f0-75281da3654d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BusinessLandmarksVisible", "put_BusinessLandmarksVisible", "get_TransitFeaturesVisible", "put_TransitFeaturesVisible", "get_PanInteractionMode", "put_PanInteractionMode", "get_RotateInteractionMode", "put_RotateInteractionMode", "get_TiltInteractionMode", "put_TiltInteractionMode", "get_ZoomInteractionMode", "put_ZoomInteractionMode", "get_Is3DSupported", "get_IsStreetsideSupported", "get_Scene", "put_Scene", "get_ActualCamera", "get_TargetCamera", "get_CustomExperience", "put_CustomExperience", "add_MapElementClick", "remove_MapElementClick", "add_MapElementPointerEntered", "remove_MapElementPointerEntered", "add_MapElementPointerExited", "remove_MapElementPointerExited", "add_ActualCameraChanged", "remove_ActualCameraChanged", "add_ActualCameraChanging", "remove_ActualCameraChanging", "add_TargetCameraChanged", "remove_TargetCameraChanged", "add_CustomExperienceChanged", "remove_CustomExperienceChanged", "StartContinuousRotate", "StopContinuousRotate", "StartContinuousTilt", "StopContinuousTilt", "StartContinuousZoom", "StopContinuousZoom", "TryRotateAsync", "TryRotateToAsync", "TryTiltAsync", "TryTiltToAsync", "TryZoomInAsync", "TryZoomOutAsync", "TryZoomToAsync", "TrySetSceneAsync", "TrySetSceneWithAnimationAsync"]

    /**
     * @type {Boolean} 
     */
    BusinessLandmarksVisible {
        get => this.get_BusinessLandmarksVisible()
        set => this.put_BusinessLandmarksVisible(value)
    }

    /**
     * @type {Boolean} 
     */
    TransitFeaturesVisible {
        get => this.get_TransitFeaturesVisible()
        set => this.put_TransitFeaturesVisible(value)
    }

    /**
     * @type {Integer} 
     */
    PanInteractionMode {
        get => this.get_PanInteractionMode()
        set => this.put_PanInteractionMode(value)
    }

    /**
     * @type {Integer} 
     */
    RotateInteractionMode {
        get => this.get_RotateInteractionMode()
        set => this.put_RotateInteractionMode(value)
    }

    /**
     * @type {Integer} 
     */
    TiltInteractionMode {
        get => this.get_TiltInteractionMode()
        set => this.put_TiltInteractionMode(value)
    }

    /**
     * @type {Integer} 
     */
    ZoomInteractionMode {
        get => this.get_ZoomInteractionMode()
        set => this.put_ZoomInteractionMode(value)
    }

    /**
     * @type {Boolean} 
     */
    Is3DSupported {
        get => this.get_Is3DSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsStreetsideSupported {
        get => this.get_IsStreetsideSupported()
    }

    /**
     * @type {MapScene} 
     */
    Scene {
        get => this.get_Scene()
        set => this.put_Scene(value)
    }

    /**
     * @type {MapCamera} 
     */
    ActualCamera {
        get => this.get_ActualCamera()
    }

    /**
     * @type {MapCamera} 
     */
    TargetCamera {
        get => this.get_TargetCamera()
    }

    /**
     * @type {MapCustomExperience} 
     */
    CustomExperience {
        get => this.get_CustomExperience()
        set => this.put_CustomExperience(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BusinessLandmarksVisible() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_BusinessLandmarksVisible(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransitFeaturesVisible() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_TransitFeaturesVisible(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PanInteractionMode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_PanInteractionMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RotateInteractionMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_RotateInteractionMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TiltInteractionMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_TiltInteractionMode(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZoomInteractionMode() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_ZoomInteractionMode(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is3DSupported() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStreetsideSupported() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {MapScene} 
     */
    get_Scene() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapScene(value)
    }

    /**
     * 
     * @param {MapScene} value 
     * @returns {HRESULT} 
     */
    put_Scene(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_ActualCamera() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_TargetCamera() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCamera(value)
    }

    /**
     * 
     * @returns {MapCustomExperience} 
     */
    get_CustomExperience() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapCustomExperience(value)
    }

    /**
     * 
     * @param {MapCustomExperience} value 
     * @returns {HRESULT} 
     */
    put_CustomExperience(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementClickEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementClick(handler) {
        token := EventRegistrationToken()
        result := ComCall(26, this, "ptr", handler, "ptr", token, "int")
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
    remove_MapElementClick(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(27, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementPointerEnteredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerEntered(handler) {
        token := EventRegistrationToken()
        result := ComCall(28, this, "ptr", handler, "ptr", token, "int")
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
    remove_MapElementPointerEntered(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(29, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapElementPointerExitedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MapElementPointerExited(handler) {
        token := EventRegistrationToken()
        result := ComCall(30, this, "ptr", handler, "ptr", token, "int")
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
    remove_MapElementPointerExited(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(31, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapActualCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualCameraChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(32, this, "ptr", handler, "ptr", token, "int")
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
    remove_ActualCameraChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(33, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapActualCameraChangingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActualCameraChanging(handler) {
        token := EventRegistrationToken()
        result := ComCall(34, this, "ptr", handler, "ptr", token, "int")
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
    remove_ActualCameraChanging(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(35, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapTargetCameraChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_TargetCameraChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(36, this, "ptr", handler, "ptr", token, "int")
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
    remove_TargetCameraChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(37, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MapControl, MapCustomExperienceChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CustomExperienceChanged(handler) {
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
    remove_CustomExperienceChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(39, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} rateInDegreesPerSecond 
     * @returns {HRESULT} 
     */
    StartContinuousRotate(rateInDegreesPerSecond) {
        result := ComCall(40, this, "double", rateInDegreesPerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopContinuousRotate() {
        result := ComCall(41, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} rateInDegreesPerSecond 
     * @returns {HRESULT} 
     */
    StartContinuousTilt(rateInDegreesPerSecond) {
        result := ComCall(42, this, "double", rateInDegreesPerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopContinuousTilt() {
        result := ComCall(43, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} rateOfChangePerSecond 
     * @returns {HRESULT} 
     */
    StartContinuousZoom(rateOfChangePerSecond) {
        result := ComCall(44, this, "double", rateOfChangePerSecond, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopContinuousZoom() {
        result := ComCall(45, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Float} degrees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRotateAsync(degrees) {
        result := ComCall(46, this, "double", degrees, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Float} angleInDegrees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryRotateToAsync(angleInDegrees) {
        result := ComCall(47, this, "double", angleInDegrees, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Float} degrees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryTiltAsync(degrees) {
        result := ComCall(48, this, "double", degrees, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Float} angleInDegrees 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryTiltToAsync(angleInDegrees) {
        result := ComCall(49, this, "double", angleInDegrees, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryZoomInAsync() {
        result := ComCall(50, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryZoomOutAsync() {
        result := ComCall(51, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {Float} zoomLevel 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryZoomToAsync(zoomLevel) {
        result := ComCall(52, this, "double", zoomLevel, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {MapScene} scene 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetSceneAsync(scene) {
        result := ComCall(53, this, "ptr", scene, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {MapScene} scene 
     * @param {Integer} animationKind 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySetSceneWithAnimationAsync(scene, animationKind) {
        result := ComCall(54, this, "ptr", scene, "int", animationKind, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
