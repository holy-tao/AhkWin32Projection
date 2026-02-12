#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapActualCameraChangedEventArgs.ahk
#Include .\IMapActualCameraChangedEventArgs2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [ActualCameraChanged](mapcontrol_actualcamerachanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangedeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapActualCameraChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapActualCameraChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapActualCameraChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current position of the map's camera.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangedeventargs.camera
     * @type {MapCamera} 
     */
    Camera {
        get => this.get_Camera()
    }

    /**
     * Indicates the reason the [ActualCameraChanged](mapcontrol_actualcamerachanged.md) event was triggered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangedeventargs.changereason
     * @type {Integer} 
     */
    ChangeReason {
        get => this.get_ChangeReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapActualCameraChangedEventArgs](mapactualcamerachangedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapActualCameraChangedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_Camera() {
        if (!this.HasProp("__IMapActualCameraChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapActualCameraChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapActualCameraChangedEventArgs := IMapActualCameraChangedEventArgs(outPtr)
        }

        return this.__IMapActualCameraChangedEventArgs.get_Camera()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeReason() {
        if (!this.HasProp("__IMapActualCameraChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMapActualCameraChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapActualCameraChangedEventArgs2 := IMapActualCameraChangedEventArgs2(outPtr)
        }

        return this.__IMapActualCameraChangedEventArgs2.get_ChangeReason()
    }

;@endregion Instance Methods
}
