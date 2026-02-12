#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicSpaceCameraAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the HolographicSpace.CameraAdded event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspacecameraaddedeventargs
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicSpaceCameraAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicSpaceCameraAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicSpaceCameraAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the HolographicCamera that is being added. The app should set up any per-camera resources it may need for this camera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspacecameraaddedeventargs.camera
     * @type {HolographicCamera} 
     */
    Camera {
        get => this.get_Camera()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HolographicCamera} 
     */
    get_Camera() {
        if (!this.HasProp("__IHolographicSpaceCameraAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHolographicSpaceCameraAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpaceCameraAddedEventArgs := IHolographicSpaceCameraAddedEventArgs(outPtr)
        }

        return this.__IHolographicSpaceCameraAddedEventArgs.get_Camera()
    }

    /**
     * Requests that addition of this camera be delayed until the deferral is completed.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspacecameraaddedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IHolographicSpaceCameraAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHolographicSpaceCameraAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpaceCameraAddedEventArgs := IHolographicSpaceCameraAddedEventArgs(outPtr)
        }

        return this.__IHolographicSpaceCameraAddedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
