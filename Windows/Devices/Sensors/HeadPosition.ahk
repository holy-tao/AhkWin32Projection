#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHeadPosition.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that describes the location of a user's head relative to the human presence sensor, in terms of [azimuth](headposition_azimuthindegrees.md) and [altitude](headposition_altitudeindegrees.md).
 * @remarks
 * The X-axis is in the plane of the device screen. It is positive towards the right-hand side of the screen, from the perspective of a user facing the device. (For devices without a screen, the axes are defined relative to the front panel of the device.)
 * 
 * The Y-axis is in the plane of the screen. It is positive towards the top of the screen.
 * 
 * The Z-axis is perpendicular to the screen. It is positive towards the user facing the device.
 * 
 * The axes are fixed relative to the device and don't change with device rotation.
 * 
 * The following image shows how azimuth and altitude are described by the human presence APIs.
 * 
 * :::image type="content" source="images/human-presence-azimuth-altitude.png" alt-text="t":::
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headposition
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HeadPosition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHeadPosition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHeadPosition.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the direction of the user's head relative to the horizontal plane of the human presence sensor, in degrees.
     * @remarks
     * The angle between Z-axis and XZ-projection of the vector pointing from the sensor device to the center of the user's head. Range is constrained by the maximum and minimum azimuth sensor properties.
     * 
     * The following image shows how azimuth and altitude are described by the human presence APIs.
     * 
     * :::image type="content" source="images/human-presence-azimuth-altitude.png" alt-text="t":::
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headposition.azimuthindegrees
     * @type {IReference<Float>} 
     */
    AzimuthInDegrees {
        get => this.get_AzimuthInDegrees()
    }

    /**
     * Gets the elevation of the user's head relative to the horizontal plane of the human presence sensor, in degrees.
     * @remarks
     * The angle between Z-axis and XZ-projection of the vector pointing from the sensor device to the center of the user's head and its XZ-projection. Range is constrained by the maximum and minimum altitude sensor properties.
     * 
     * The following image shows how azimuth and altitude are described by the human presence APIs.
     * 
     * :::image type="content" source="images/human-presence-azimuth-altitude.png" alt-text="t":::
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headposition.altitudeindegrees
     * @type {IReference<Float>} 
     */
    AltitudeInDegrees {
        get => this.get_AltitudeInDegrees()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_AzimuthInDegrees() {
        if (!this.HasProp("__IHeadPosition")) {
            if ((queryResult := this.QueryInterface(IHeadPosition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadPosition := IHeadPosition(outPtr)
        }

        return this.__IHeadPosition.get_AzimuthInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_AltitudeInDegrees() {
        if (!this.HasProp("__IHeadPosition")) {
            if ((queryResult := this.QueryInterface(IHeadPosition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadPosition := IHeadPosition(outPtr)
        }

        return this.__IHeadPosition.get_AltitudeInDegrees()
    }

;@endregion Instance Methods
}
