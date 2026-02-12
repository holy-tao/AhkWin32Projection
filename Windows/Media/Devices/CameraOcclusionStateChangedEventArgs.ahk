#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICameraOcclusionStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [CameraOcclusionInfo.StateChanged](cameraocclusioninfo_statechanged.md) event, which is raised when the camera occlusion state for the camera device changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionstatechangedeventargs
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CameraOcclusionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICameraOcclusionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICameraOcclusionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the new occlusion state of the camera device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.devices.cameraocclusionstatechangedeventargs.state
     * @type {CameraOcclusionState} 
     */
    State {
        get => this.get_State()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CameraOcclusionState} 
     */
    get_State() {
        if (!this.HasProp("__ICameraOcclusionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICameraOcclusionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICameraOcclusionStateChangedEventArgs := ICameraOcclusionStateChangedEventArgs(outPtr)
        }

        return this.__ICameraOcclusionStateChangedEventArgs.get_State()
    }

;@endregion Instance Methods
}
