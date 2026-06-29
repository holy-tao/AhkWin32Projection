#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The GAMMARAMP structure is used by DrvIcmSetDeviceGammaRamp to set the hardware gamma ramp of a particular display device.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-gammaramp
 * @namespace Windows.Win32.Devices.Display
 */
export default struct GAMMARAMP {
    #StructPack 2

    /**
     * Is the 256-entry ramp for the red color channel.
     */
    Red : UInt16[256]

    /**
     * Is the 256-entry ramp for the green color channel.
     */
    Green : UInt16[256]

    /**
     * Is the 256-entry ramp for the blue color channel.
     */
    Blue : UInt16[256]

}
