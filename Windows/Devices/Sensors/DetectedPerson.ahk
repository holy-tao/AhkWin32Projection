#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDetectedPerson.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a detected person as detected by the human presence sensor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class DetectedPerson extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDetectedPerson

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDetectedPerson.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets how the detected person is engaged with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson.engagement
     * @type {Integer} 
     */
    Engagement {
        get => this.get_Engagement()
    }

    /**
     * Gets the distance in millimeters the detected person is from the human presence sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson.distanceinmillimeters
     * @type {IReference<Integer>} 
     */
    DistanceInMillimeters {
        get => this.get_DistanceInMillimeters()
    }

    /**
     * Gets the orientation of the detected person's head relative to the human presence sensor, in terms of [roll](headorientation_rollindegrees.md), [pitch](headorientation_pitchindegrees.md), and [yaw](headorientation_yawindegrees.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson.headorientation
     * @type {HeadOrientation} 
     */
    HeadOrientation {
        get => this.get_HeadOrientation()
    }

    /**
     * Gets the location of a user's head relative to the human presence sensor, in terms of [azimuth](headposition_azimuthindegrees.md) and [altitude](headposition_altitudeindegrees.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson.headposition
     * @type {HeadPosition} 
     */
    HeadPosition {
        get => this.get_HeadPosition()
    }

    /**
     * Gets the unique ID assigned to the detected person.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.detectedperson.personid
     * @type {IReference<Integer>} 
     */
    PersonId {
        get => this.get_PersonId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Engagement() {
        if (!this.HasProp("__IDetectedPerson")) {
            if ((queryResult := this.QueryInterface(IDetectedPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedPerson := IDetectedPerson(outPtr)
        }

        return this.__IDetectedPerson.get_Engagement()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_DistanceInMillimeters() {
        if (!this.HasProp("__IDetectedPerson")) {
            if ((queryResult := this.QueryInterface(IDetectedPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedPerson := IDetectedPerson(outPtr)
        }

        return this.__IDetectedPerson.get_DistanceInMillimeters()
    }

    /**
     * 
     * @returns {HeadOrientation} 
     */
    get_HeadOrientation() {
        if (!this.HasProp("__IDetectedPerson")) {
            if ((queryResult := this.QueryInterface(IDetectedPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedPerson := IDetectedPerson(outPtr)
        }

        return this.__IDetectedPerson.get_HeadOrientation()
    }

    /**
     * 
     * @returns {HeadPosition} 
     */
    get_HeadPosition() {
        if (!this.HasProp("__IDetectedPerson")) {
            if ((queryResult := this.QueryInterface(IDetectedPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedPerson := IDetectedPerson(outPtr)
        }

        return this.__IDetectedPerson.get_HeadPosition()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PersonId() {
        if (!this.HasProp("__IDetectedPerson")) {
            if ((queryResult := this.QueryInterface(IDetectedPerson.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDetectedPerson := IDetectedPerson(outPtr)
        }

        return this.__IDetectedPerson.get_PersonId()
    }

;@endregion Instance Methods
}
