#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTargetCameraChangedEventArgs.ahk
#Include .\IMapTargetCameraChangedEventArgs2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [TargetCameraChanged](mapcontrol_targetcamerachanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptargetcamerachangedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTargetCameraChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTargetCameraChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTargetCameraChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the camera position corresponding to the [TargetCameraChanged](mapcontrol_targetcamerachanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptargetcamerachangedeventargs.camera
     * @type {MapCamera} 
     */
    Camera {
        get => this.get_Camera()
    }

    /**
     * Gets or sets the camera change reason.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptargetcamerachangedeventargs.changereason
     * @type {Integer} 
     */
    ChangeReason {
        get => this.get_ChangeReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapTargetCameraChangedEventArgs](maptargetcamerachangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTargetCameraChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_Camera() {
        if (!this.HasProp("__IMapTargetCameraChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapTargetCameraChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTargetCameraChangedEventArgs := IMapTargetCameraChangedEventArgs(outPtr)
        }

        return this.__IMapTargetCameraChangedEventArgs.get_Camera()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeReason() {
        if (!this.HasProp("__IMapTargetCameraChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMapTargetCameraChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTargetCameraChangedEventArgs2 := IMapTargetCameraChangedEventArgs2(outPtr)
        }

        return this.__IMapTargetCameraChangedEventArgs2.get_ChangeReason()
    }

;@endregion Instance Methods
}
