#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PerceptionVideoProfile.ahk
#Include ..\..\Media\Devices\Core\CameraIntrinsics.ahk
#Include .\PerceptionControlSession.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\PerceptionDepthCorrelatedCameraIntrinsics.ahk
#Include .\PerceptionDepthCorrelatedCoordinateMapper.ahk
#Include .\PerceptionFrameSourcePropertyChangeResult.ahk
#Include .\PerceptionInfraredFrameReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionInfraredFrameSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionInfraredFrameSource
     * @type {Guid}
     */
    static IID => Guid("{55b08742-1808-494e-9e30-9d2a7be8f700}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_AvailableChanged", "remove_AvailableChanged", "add_ActiveChanged", "remove_ActiveChanged", "add_PropertiesChanged", "remove_PropertiesChanged", "add_VideoProfileChanged", "remove_VideoProfileChanged", "add_CameraIntrinsicsChanged", "remove_CameraIntrinsicsChanged", "get_Id", "get_DisplayName", "get_DeviceKind", "get_Available", "get_Active", "get_IsControlled", "get_Properties", "get_SupportedVideoProfiles", "get_AvailableVideoProfiles", "get_VideoProfile", "get_CameraIntrinsics", "AcquireControlSession", "CanControlIndependentlyFrom", "IsCorrelatedWith", "TryGetTransformTo", "TryGetDepthCorrelatedCameraIntrinsicsAsync", "TryGetDepthCorrelatedCoordinateMapperAsync", "TrySetVideoProfileAsync", "OpenReader"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * @type {Boolean} 
     */
    Available {
        get => this.get_Available()
    }

    /**
     * @type {Boolean} 
     */
    Active {
        get => this.get_Active()
    }

    /**
     * @type {Boolean} 
     */
    IsControlled {
        get => this.get_IsControlled()
    }

    /**
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    SupportedVideoProfiles {
        get => this.get_SupportedVideoProfiles()
    }

    /**
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    AvailableVideoProfiles {
        get => this.get_AvailableVideoProfiles()
    }

    /**
     * @type {PerceptionVideoProfile} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
    }

    /**
     * @type {CameraIntrinsics} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailableChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
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
    remove_AvailableChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActiveChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_ActiveChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, PerceptionFrameSourcePropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertiesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_PropertiesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoProfileChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_VideoProfileChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraIntrinsicsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(14, this, "ptr", handler, "ptr", token, "int")
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
    remove_CameraIntrinsicsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(15, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
    get_DisplayName() {
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
    get_DeviceKind() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Available() {
        result := ComCall(19, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Active() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsControlled() {
        result := ComCall(21, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), IInspectable, value)
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_SupportedVideoProfiles() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PerceptionVideoProfile, value)
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_AvailableVideoProfiles() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PerceptionVideoProfile, value)
    }

    /**
     * 
     * @returns {PerceptionVideoProfile} 
     */
    get_VideoProfile() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionVideoProfile(value)
    }

    /**
     * 
     * @returns {CameraIntrinsics} 
     */
    get_CameraIntrinsics() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CameraIntrinsics(value)
    }

    /**
     * 
     * @returns {PerceptionControlSession} 
     */
    AcquireControlSession() {
        result := ComCall(27, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionControlSession(result_)
    }

    /**
     * 
     * @param {HSTRING} targetId 
     * @returns {Boolean} 
     */
    CanControlIndependentlyFrom(targetId) {
        if(targetId is String) {
            pin := HSTRING.Create(targetId)
            targetId := pin.Value
        }
        targetId := targetId is Win32Handle ? NumGet(targetId, "ptr") : targetId

        result := ComCall(28, this, "ptr", targetId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} targetId 
     * @returns {Boolean} 
     */
    IsCorrelatedWith(targetId) {
        if(targetId is String) {
            pin := HSTRING.Create(targetId)
            targetId := pin.Value
        }
        targetId := targetId is Win32Handle ? NumGet(targetId, "ptr") : targetId

        result := ComCall(29, this, "ptr", targetId, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {HSTRING} targetId 
     * @param {Pointer<Matrix4x4>} result_ 
     * @returns {Boolean} 
     */
    TryGetTransformTo(targetId, result_) {
        if(targetId is String) {
            pin := HSTRING.Create(targetId)
            targetId := pin.Value
        }
        targetId := targetId is Win32Handle ? NumGet(targetId, "ptr") : targetId

        result := ComCall(30, this, "ptr", targetId, "ptr", result_, "int*", &hasResult := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return hasResult
    }

    /**
     * 
     * @param {PerceptionDepthFrameSource} target 
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCameraIntrinsics>} 
     */
    TryGetDepthCorrelatedCameraIntrinsicsAsync(target) {
        result := ComCall(31, this, "ptr", target, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PerceptionDepthCorrelatedCameraIntrinsics, result_)
    }

    /**
     * 
     * @param {HSTRING} targetId 
     * @param {PerceptionDepthFrameSource} depthFrameSourceToMapWith 
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCoordinateMapper>} 
     */
    TryGetDepthCorrelatedCoordinateMapperAsync(targetId, depthFrameSourceToMapWith) {
        if(targetId is String) {
            pin := HSTRING.Create(targetId)
            targetId := pin.Value
        }
        targetId := targetId is Win32Handle ? NumGet(targetId, "ptr") : targetId

        result := ComCall(32, this, "ptr", targetId, "ptr", depthFrameSourceToMapWith, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PerceptionDepthCorrelatedCoordinateMapper, result_)
    }

    /**
     * 
     * @param {PerceptionControlSession} controlSession 
     * @param {PerceptionVideoProfile} profile_ 
     * @returns {IAsyncOperation<PerceptionFrameSourcePropertyChangeResult>} 
     */
    TrySetVideoProfileAsync(controlSession, profile_) {
        result := ComCall(33, this, "ptr", controlSession, "ptr", profile_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PerceptionFrameSourcePropertyChangeResult, result_)
    }

    /**
     * 
     * @returns {PerceptionInfraredFrameReader} 
     */
    OpenReader() {
        result := ComCall(34, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PerceptionInfraredFrameReader(result_)
    }
}
