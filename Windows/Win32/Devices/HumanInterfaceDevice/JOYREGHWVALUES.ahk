#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\JOYRANGE.ahk" { JOYRANGE }
#Import ".\JOYPOS.ahk" { JOYPOS }

/**
 * The JOYREGHWVALUES (dinputd.h) structure contains the range of values returned by the hardware (filled in by calibration).
 * @see https://learn.microsoft.com/windows/win32/api/dinputd/ns-dinputd-joyreghwvalues
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct JOYREGHWVALUES {
    #StructPack 4

    /**
     * The values returned by the hardware.
     */
    jrvHardware : JOYRANGE

    /**
     * The point-of-view (POV) values returned by the hardware.
     */
    dwPOVValues : UInt32[4]

    /**
     * What has been calibrated.
     */
    dwCalFlags : UInt32

}
