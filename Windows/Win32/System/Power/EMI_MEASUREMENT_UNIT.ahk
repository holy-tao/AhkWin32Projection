#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EMI_MEASUREMENT_UNIT enumeration represents the available units of energy measurements that can be retrieved from a device by using IOCTL_EMI_GET_MEASUREMENT.
 * @remarks
 * When a component calls [EMI_METADATA](./ns-emi-emi_metadata_v1.md) structure output parameter.
 * 
 * In devices that implement <b>EMI_VERSION_V1</b>, picowatt-hours is the only supported unit.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ne-emi-emi_measurement_unit
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_MEASUREMENT_UNIT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The energy measurement is returned in picowatt-hours.
     * @type {Integer (Int32)}
     */
    static EmiMeasurementUnitPicowattHours => 0
}
