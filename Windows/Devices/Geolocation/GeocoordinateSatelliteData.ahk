#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeocoordinateSatelliteData.ahk
#Include .\IGeocoordinateSatelliteData2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides additional information about a [Geocoordinate](geocoordinate.md). This information is only applicable to position
  * estimates obtained using satellite signals.
 * @remarks
 * You can use the [Geocoordinate.PositionSource](geocoordinate_positionsource.md) property to receive the
 * GeocoordinateSatelliteData information.
 * 
 * The properties of this class convey information about the satellite geometry with which the position was obtained. Their
 * values indicate the level of confidence that the position provided is precise. Lower values for dilution of precision
 * (DOP) indicate high confidence on the precision of the position obtained. Positions with a DOP of 5 or less are
 * considered reliable. Positions with a DOP higher than 10 are low confidence and should generally be discarded other than
 * for a rough position estimation. Positions with a DOP higher than 20 should always be discarded.
 * 
 * > [!NOTE]
 * > If the GNSS receiver returns a zero for any of the dilution of precision (DOP) values, the corresponding properties will return `null`.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeocoordinateSatelliteData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeocoordinateSatelliteData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeocoordinateSatelliteData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the position dilution of precision (PDOP) of a [Geocoordinate](geocoordinate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata.positiondilutionofprecision
     * @type {IReference<Float>} 
     */
    PositionDilutionOfPrecision {
        get => this.get_PositionDilutionOfPrecision()
    }

    /**
     * Gets the horizontal dilution of precision (HDOP) of a [Geocoordinate](geocoordinate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata.horizontaldilutionofprecision
     * @type {IReference<Float>} 
     */
    HorizontalDilutionOfPrecision {
        get => this.get_HorizontalDilutionOfPrecision()
    }

    /**
     * Gets the vertical dilution of precision (VDOP) of a [Geocoordinate](geocoordinate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata.verticaldilutionofprecision
     * @type {IReference<Float>} 
     */
    VerticalDilutionOfPrecision {
        get => this.get_VerticalDilutionOfPrecision()
    }

    /**
     * Gets the geometric dilution of precision (GDOP) of a [Geocoordinate](geocoordinate.md).
     * @remarks
     * Geometric dilution of precision (GDOP) indicates the overall satellite geometry quality for position determination. GDOP
     * combines the effects of satellite positioning on horizontal, vertical, and time accuracy into a single metric that
     * reflects positioning confidence.
     * 
     * GDOP is a unitless multiplier; the approximate position error equals the GDOP value multiplied by the underlying range error
     * from satellite measurements. For interpretation ranges and contributing factors (satellite geometry, satellite count and
     * distribution, elevation, constellation changes), consult standard GNSS references. This API exposes the raw value so
     * applications can apply scenario-appropriate thresholds without duplicating broadly available GNSS domain material.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata.geometricdilutionofprecision
     * @type {IReference<Float>} 
     */
    GeometricDilutionOfPrecision {
        get => this.get_GeometricDilutionOfPrecision()
    }

    /**
     * Gets the time dilution of precision (TDOP) of a [Geocoordinate](geocoordinate.md).
     * @remarks
     * Time dilution of precision indicates how satellite geometry affects the accuracy of time measurements used in GNSS position
     * calculations. TDOP specifically measures the effect of satellite positioning on clock bias estimation.
     * 
     * > [!NOTE]
     * > Lower TDOP values indicate more accurate time synchronization with GNSS satellites, which directly impacts position
     * > accuracy. Values of 5 or less are considered reliable, while values higher than 10 indicate low confidence and should
     * > generally be used only for rough position estimation.
     * 
     * > [!IMPORTANT]
     * > This property returns `null` if the GNSS receiver returns a zero value for TDOP, indicating the measurement is not
     * > available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geocoordinatesatellitedata.timedilutionofprecision
     * @type {IReference<Float>} 
     */
    TimeDilutionOfPrecision {
        get => this.get_TimeDilutionOfPrecision()
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
    get_PositionDilutionOfPrecision() {
        if (!this.HasProp("__IGeocoordinateSatelliteData")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateSatelliteData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateSatelliteData := IGeocoordinateSatelliteData(outPtr)
        }

        return this.__IGeocoordinateSatelliteData.get_PositionDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_HorizontalDilutionOfPrecision() {
        if (!this.HasProp("__IGeocoordinateSatelliteData")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateSatelliteData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateSatelliteData := IGeocoordinateSatelliteData(outPtr)
        }

        return this.__IGeocoordinateSatelliteData.get_HorizontalDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_VerticalDilutionOfPrecision() {
        if (!this.HasProp("__IGeocoordinateSatelliteData")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateSatelliteData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateSatelliteData := IGeocoordinateSatelliteData(outPtr)
        }

        return this.__IGeocoordinateSatelliteData.get_VerticalDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_GeometricDilutionOfPrecision() {
        if (!this.HasProp("__IGeocoordinateSatelliteData2")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateSatelliteData2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateSatelliteData2 := IGeocoordinateSatelliteData2(outPtr)
        }

        return this.__IGeocoordinateSatelliteData2.get_GeometricDilutionOfPrecision()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_TimeDilutionOfPrecision() {
        if (!this.HasProp("__IGeocoordinateSatelliteData2")) {
            if ((queryResult := this.QueryInterface(IGeocoordinateSatelliteData2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeocoordinateSatelliteData2 := IGeocoordinateSatelliteData2(outPtr)
        }

        return this.__IGeocoordinateSatelliteData2.get_TimeDilutionOfPrecision()
    }

;@endregion Instance Methods
}
