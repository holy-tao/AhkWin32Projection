#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraOcclusionInfo.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CameraOcclusionInfo.ahk
#Include .\CameraOcclusionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about the occlusion state of a camera device.
 * @remarks
 * Many devices provide mechanisms, such as a mechanical shutter, that allow the user to occlude the camera device for privacy. Other devices may occlude the camera in certain postures. This interface allows applications to receive notifications when the occlusion state of the camera changes so they can disable or modify their camera capture behavior when the camera is occluded.
 * 
 * Get an instance of this class by accessing the [CameraOcclusionInfo](videodevicecontroller_cameraocclusioninfo.md) property of the [VideoDeviceController](videodevicecontroller.md) associated with the camera.
 * 
 * You should only use the shutter state data represented by this class while the camera is actively streaming. Apps should respond in a logical manner when they detect that the shutter is closed. This should include an in-app message to open the shutter. Applications must not automatically take an action (e.g., turn the camera off) or block the user from doing an action (e.g., turning on the camera) based on the shutter state, as not every camera will reliably report the shutter state when not streaming. Applications must not treat the reported shutter state as an absolute privacy indicator – it is only a notification that the camera believes the shutter is closed.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusioninfo
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CameraOcclusionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraOcclusionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraOcclusionInfo.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStateChangedToken")) {
            this.remove_StateChanged(this.__OnStateChangedToken)
            this.__OnStateChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets the current occlusion state of the camera device.
     * @returns {CameraOcclusionState} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusioninfo.getstate
     */
    GetState() {
        if (!this.HasProp("__ICameraOcclusionInfo")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionInfo := ICameraOcclusionInfo(outPtr)
        }

        return this.__ICameraOcclusionInfo.GetState()
    }

    /**
     * Gets a boolean value indicating whether the specified occlusion kind is supported by the camera device.
     * @remarks
     * A device may not support any or all occlusion types. If an occlusion type is unsupported, [CameraOcclusionState.IsOcclusionKind](cameraocclusionstate_isocclusionkind_495098314.md) will never return true for that occlusion type.
     * @param {Integer} occlusionKind A member of the [CameraOcclusionKind](cameraocclusionkind.md) enumeration specifying the occlusion kind for which support is being queried.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusioninfo.isocclusionkindsupported
     */
    IsOcclusionKindSupported(occlusionKind) {
        if (!this.HasProp("__ICameraOcclusionInfo")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionInfo := ICameraOcclusionInfo(outPtr)
        }

        return this.__ICameraOcclusionInfo.IsOcclusionKindSupported(occlusionKind)
    }

    /**
     * 
     * @param {TypedEventHandler<CameraOcclusionInfo, CameraOcclusionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StateChanged(handler) {
        if (!this.HasProp("__ICameraOcclusionInfo")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionInfo := ICameraOcclusionInfo(outPtr)
        }

        return this.__ICameraOcclusionInfo.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StateChanged(token) {
        if (!this.HasProp("__ICameraOcclusionInfo")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionInfo := ICameraOcclusionInfo(outPtr)
        }

        return this.__ICameraOcclusionInfo.remove_StateChanged(token)
    }

;@endregion Instance Methods
}
