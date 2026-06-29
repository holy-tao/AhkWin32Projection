#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TAPI_CUSTOMTONE structure contains the parameters that define a custom tone.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ns-tapi3if-tapi_customtone
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TAPI_CUSTOMTONE {
    #StructPack 4

    /**
     * The frequency, in hertz, of the tone.
     */
    dwFrequency : UInt32

    /**
     * The "on" duration, in milliseconds, of the cadence of a custom tone.
     */
    dwCadenceOn : UInt32

    /**
     * The "off" duration, in milliseconds, of the cadence of a custom tone.
     */
    dwCadenceOff : UInt32

    /**
     * The volume level at which to generate the tone.
     */
    dwVolume : UInt32

}
