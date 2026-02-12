#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHingeAngleReading.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the data exposed by the hinge angle sensor in a dual-screen device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglereading
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class HingeAngleReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHingeAngleReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHingeAngleReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time when the hinge angle reading was obtained.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglereading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the angle reported by the hinge angle sensor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglereading.angleindegrees
     * @type {Float} 
     */
    AngleInDegrees {
        get => this.get_AngleInDegrees()
    }

    /**
     * Gets a collection of key-value pairs that represent data properties reported by the sensor for the given reading.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.hingeanglereading.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IHingeAngleReading")) {
            if ((queryResult := this.QueryInterface(IHingeAngleReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleReading := IHingeAngleReading(outPtr)
        }

        return this.__IHingeAngleReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngleInDegrees() {
        if (!this.HasProp("__IHingeAngleReading")) {
            if ((queryResult := this.QueryInterface(IHingeAngleReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleReading := IHingeAngleReading(outPtr)
        }

        return this.__IHingeAngleReading.get_AngleInDegrees()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IHingeAngleReading")) {
            if ((queryResult := this.QueryInterface(IHingeAngleReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHingeAngleReading := IHingeAngleReading(outPtr)
        }

        return this.__IHingeAngleReading.get_Properties()
    }

;@endregion Instance Methods
}
