#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHeadOrientation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object that describes the orientation a user's head is facing relative to the human presence sensor, in terms of [roll](headorientation_rollindegrees.md), [pitch](headorientation_pitchindegrees.md), and [yaw](headorientation_yawindegrees.md).
 * @remarks
 * The X-axis is in the plane of the device screen. It is positive towards the right-hand side of the screen, from the perspective of a user facing the device. (For devices without a screen, the axes are defined relative to the front panel of the device.)
 * 
 * The Y-axis is in the plane of the screen. It is positive towards the top of the screen.
 * 
 * The Z-axis is perpendicular to the screen. It is positive towards the user facing the device.
 * 
 * The axes are fixed relative to the device and don't change with device rotation.
 * 
 * The following image shows how roll, pitch, and yaw are described by the human presence APIs.
 * 
 * :::image type="content" source="images/human-presence-roll-pitch-yaw.png" alt-text="Diagram depicting how roll, pitch, and yaw are described by the human presence APIs.":::
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headorientation
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HeadOrientation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHeadOrientation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHeadOrientation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the counterclockwise rotation of the user's head around the Z'-axis (or longitudinal axis), in degrees.
     * @remarks
     * Similar to tilting the motion of a wheel on a car or bike.
     * 
     * In the zero position, the Z'-axis is parallel to the device's Z-axis and points from the center of the person's face towards the device.
     * 
     * :::image type="content" source="images/human-presence-roll-pitch-yaw.png" alt-text="Diagram depicting how roll, pitch, and yaw are described by the human presence APIs.":::
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headorientation.rollindegrees
     * @type {IReference<Float>} 
     */
    RollInDegrees {
        get => this.get_RollInDegrees()
    }

    /**
     * Gets the counterclockwise rotation of the user's head around the X'-axis (or lateral axis), in degrees.
     * @remarks
     * Similar to tilting the nose of an aeroplane up or down.
     * 
     * In the zero position, the X'-axis is parallel to the device's X-axis and points from the center of the person's face towards the right, from the device perspective.
     * 
     * :::image type="content" source="images/human-presence-roll-pitch-yaw.png" alt-text="Diagram depicting how roll, pitch, and yaw are described by the human presence APIs.":::
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headorientation.pitchindegrees
     * @type {IReference<Float>} 
     */
    PitchInDegrees {
        get => this.get_PitchInDegrees()
    }

    /**
     * Gets the counterclockwise rotation of the user's head around the Y'-axis (or vertical axis), in degrees.
     * @remarks
     * Similar to turning your head left or right.
     * 
     * In the zero position, the Y'-axis is parallel to the device's Y-axis and points from the center of the person's face upwards.
     * 
     * :::image type="content" source="images/human-presence-roll-pitch-yaw.png" alt-text="Diagram depicting how roll, pitch, and yaw are described by the human presence APIs.":::
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.headorientation.yawindegrees
     * @type {IReference<Float>} 
     */
    YawInDegrees {
        get => this.get_YawInDegrees()
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
    get_RollInDegrees() {
        if (!this.HasProp("__IHeadOrientation")) {
            if ((queryResult := this.QueryInterface(IHeadOrientation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadOrientation := IHeadOrientation(outPtr)
        }

        return this.__IHeadOrientation.get_RollInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PitchInDegrees() {
        if (!this.HasProp("__IHeadOrientation")) {
            if ((queryResult := this.QueryInterface(IHeadOrientation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadOrientation := IHeadOrientation(outPtr)
        }

        return this.__IHeadOrientation.get_PitchInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_YawInDegrees() {
        if (!this.HasProp("__IHeadOrientation")) {
            if ((queryResult := this.QueryInterface(IHeadOrientation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHeadOrientation := IHeadOrientation(outPtr)
        }

        return this.__IHeadOrientation.get_YawInDegrees()
    }

;@endregion Instance Methods
}
