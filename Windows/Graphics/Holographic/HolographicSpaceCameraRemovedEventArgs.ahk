#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicSpaceCameraRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the HolographicSpace.CameraRemoved event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspacecameraremovedeventargs
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicSpaceCameraRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicSpaceCameraRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicSpaceCameraRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the HolographicCamera that was removed. The app should dispose of any per-camera resources it may have set up for this camera.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspacecameraremovedeventargs.camera
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
        if (!this.HasProp("__IHolographicSpaceCameraRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHolographicSpaceCameraRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpaceCameraRemovedEventArgs := IHolographicSpaceCameraRemovedEventArgs(outPtr)
        }

        return this.__IHolographicSpaceCameraRemovedEventArgs.get_Camera()
    }

;@endregion Instance Methods
}
