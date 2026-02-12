#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapActualCameraChangingEventArgs.ahk
#Include .\IMapActualCameraChangingEventArgs2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides data for the [ActualCameraChanging](mapcontrol_actualcamerachanging.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangingeventargs
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapActualCameraChangingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapActualCameraChangingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapActualCameraChangingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position of the map's camera before it started moving.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangingeventargs.camera
     * @type {MapCamera} 
     */
    Camera {
        get => this.get_Camera()
    }

    /**
     * Indicates the reason the [ActualCameraChanging](mapcontrol_actualcamerachanging.md) event was triggered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.mapactualcamerachangingeventargs.changereason
     * @type {Integer} 
     */
    ChangeReason {
        get => this.get_ChangeReason()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MapActualCameraChangingEventArgs](mapactualcamerachangingeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapActualCameraChangingEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {MapCamera} 
     */
    get_Camera() {
        if (!this.HasProp("__IMapActualCameraChangingEventArgs")) {
            if ((queryResult := this.QueryInterface(IMapActualCameraChangingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapActualCameraChangingEventArgs := IMapActualCameraChangingEventArgs(outPtr)
        }

        return this.__IMapActualCameraChangingEventArgs.get_Camera()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeReason() {
        if (!this.HasProp("__IMapActualCameraChangingEventArgs2")) {
            if ((queryResult := this.QueryInterface(IMapActualCameraChangingEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapActualCameraChangingEventArgs2 := IMapActualCameraChangingEventArgs2(outPtr)
        }

        return this.__IMapActualCameraChangingEventArgs2.get_ChangeReason()
    }

;@endregion Instance Methods
}
