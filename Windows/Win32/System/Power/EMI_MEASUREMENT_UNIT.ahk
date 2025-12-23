#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The EMI_MEASUREMENT_UNIT enumeration represents the available units of energy measurements that can be retrieved from a device by using IOCTL_EMI_GET_MEASUREMENT.
 * @remarks
 * When a component calls [EMI_METADATA](./ns-emi-emi_metadata_v1.md) structure output parameter.
 * 
 * In devices that implement <b>EMI_VERSION_V1</b>, picowatt-hours is the only supported unit.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ne-emi-emi_measurement_unit
 * @namespace Windows.Win32.System.Power
 * @version v4.0.30319
 */
class EMI_MEASUREMENT_UNIT extends Win32Enum{

    /**
     * The energy measurement is returned in picowatt-hours.
     * @type {Integer (Int32)}
     */
    static EmiMeasurementUnitPicowattHours => 0
}
