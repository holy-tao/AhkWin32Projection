#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TAPI_DETECTTONE structure describes a tone to be monitored. This is used as an entry in an array.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ns-tapi3if-tapi_detecttone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_DETECTTONE extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Used by the application for tagging the tone. When this tone is detected, the value of the <b>dwAppSpecific</b> member is passed back to the application.
     * @type {Integer}
     */
    dwAppSpecific {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The duration, in milliseconds, during which the tone should be present before a detection is made.
     * @type {Integer}
     */
    dwDuration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The frequency, in hertz, of a component of the tone.
     * @type {Integer}
     */
    dwFrequency1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The frequency, in hertz, of a component of the tone.
     * @type {Integer}
     */
    dwFrequency2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The frequency, in hertz, of a component of the tone. If fewer than three frequencies are needed in the tone, a value of zero should be used for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be used for silence detection.
     * @type {Integer}
     */
    dwFrequency3 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
