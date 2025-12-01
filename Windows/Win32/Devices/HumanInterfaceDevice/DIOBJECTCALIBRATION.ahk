#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DIOBJECTCALIBRATION structure describes the information contained in the &quot;Calibration&quot; value of the registry key for each axis on a device.
 * @remarks
 * If the "Calibration" value is absent, then the calibration information is taken from the joystick [JOYREGHWVALUES](../mmddk/ns-mmddk-joyreghwvalues.md) configuration structure.
 * 
 * Only HID joysticks have a "Calibration" value.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diobjectcalibration
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIOBJECTCALIBRATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the logical value for the axis minimum position.
     * @type {Integer}
     */
    lMin {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the logical value for the axis center position.
     * @type {Integer}
     */
    lCenter {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Specifies the logical value for the axis maximum position.
     * @type {Integer}
     */
    lMax {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
