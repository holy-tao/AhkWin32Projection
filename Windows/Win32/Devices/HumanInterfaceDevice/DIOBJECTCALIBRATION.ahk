#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DIOBJECTCALIBRATION structure describes the information contained in the &quot;Calibration&quot; value of the registry key for each axis on a device.
 * @remarks
 * If the "Calibration" value is absent, then the calibration information is taken from the joystick [JOYREGHWVALUES](../mmddk/ns-mmddk-joyreghwvalues.md) configuration structure.
 * 
 * Only HID joysticks have a "Calibration" value.
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-diobjectcalibration
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DIOBJECTCALIBRATION {
    #StructPack 4

    /**
     * Specifies the logical value for the axis minimum position.
     */
    lMin : Int32

    /**
     * Specifies the logical value for the axis center position.
     */
    lCenter : Int32

    /**
     * Specifies the logical value for the axis maximum position.
     */
    lMax : Int32

}
