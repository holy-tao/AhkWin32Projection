#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraOcclusionState.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the occlusion state of a camera device.
 * @remarks
 * Get an instance of this class by implementing a handler for the [CameraOcclusionInfo.StateChanged](cameraocclusioninfo_statechanged.md) event and accessing the [State](cameraocclusionstatechangedeventargs_state.md) property of the [CameraOcclusionStateChangedEventArgs](cameraocclusionstatechangedeventargs.md).
 * 
 * You should only use the shutter state data represented by this class while the camera is actively streaming. Apps should respond in a logical manner when they detect that the shutter is closed. This should include an in-app message to open the shutter. Applications must not automatically take an action (e.g., turning the camera off) or block the user from doing an action (e.g., turning on the camera) based on the shutter state, as not every camera will reliably report the shutter state when not streaming. Applications must not treat the reported shutter state as an absolute privacy indicator – it is only a notification that the camera believes the shutter is closed.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionstate
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CameraOcclusionState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraOcclusionState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraOcclusionState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a boolean value that indicates whether the camera device is occluded.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionstate.isoccluded
     * @type {Boolean} 
     */
    IsOccluded {
        get => this.get_IsOccluded()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOccluded() {
        if (!this.HasProp("__ICameraOcclusionState")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionState := ICameraOcclusionState(outPtr)
        }

        return this.__ICameraOcclusionState.get_IsOccluded()
    }

    /**
     * Gets a value than indicates whether the current occlusion state is of the specified kind.
     * @remarks
     * A device may not support any or all occlusion types. If an occlusion type is unsupported, **IsOcclusionKind** will never return true for that occlusion type. Determine if an occlusion kind is supported by the camera device by calling [IsOcclusionKindSupported](cameraocclusioninfo_isocclusionkindsupported_1486521484.md).
     * @param {Integer} occlusionKind A member of the [CameraOcclusionKind](cameraocclusionkind.md) enumeration specifying the kind of occlusion being queried.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionstate.isocclusionkind
     */
    IsOcclusionKind(occlusionKind) {
        if (!this.HasProp("__ICameraOcclusionState")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionState := ICameraOcclusionState(outPtr)
        }

        return this.__ICameraOcclusionState.IsOcclusionKind(occlusionKind)
    }

;@endregion Instance Methods
}
