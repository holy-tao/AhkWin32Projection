#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TAPI_CUSTOMTONE structure contains the parameters that define a custom tone.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ns-tapi3if-tapi_customtone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class TAPI_CUSTOMTONE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The frequency, in hertz, of the tone.
     * @type {Integer}
     */
    dwFrequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The "on" duration, in milliseconds, of the cadence of a custom tone.
     * @type {Integer}
     */
    dwCadenceOn {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The "off" duration, in milliseconds, of the cadence of a custom tone.
     * @type {Integer}
     */
    dwCadenceOff {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The volume level at which to generate the tone.
     * @type {Integer}
     */
    dwVolume {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
