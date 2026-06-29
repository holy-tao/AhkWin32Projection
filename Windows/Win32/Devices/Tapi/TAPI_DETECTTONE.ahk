#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TAPI_DETECTTONE structure describes a tone to be monitored. This is used as an entry in an array.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/ns-tapi3if-tapi_detecttone
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct TAPI_DETECTTONE {
    #StructPack 4

    /**
     * Used by the application for tagging the tone. When this tone is detected, the value of the <b>dwAppSpecific</b> member is passed back to the application.
     */
    dwAppSpecific : UInt32

    /**
     * The duration, in milliseconds, during which the tone should be present before a detection is made.
     */
    dwDuration : UInt32

    /**
     * The frequency, in hertz, of a component of the tone.
     */
    dwFrequency1 : UInt32

    /**
     * The frequency, in hertz, of a component of the tone.
     */
    dwFrequency2 : UInt32

    /**
     * The frequency, in hertz, of a component of the tone. If fewer than three frequencies are needed in the tone, a value of zero should be used for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be used for silence detection.
     */
    dwFrequency3 : UInt32

}
