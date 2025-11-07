#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEGENERATETONE structure contains information about a tone to be generated. This structure is used by the lineGenerateTone and TSPI_lineGenerateTone functions.
 * @remarks
 * 
 * This structure may not be extended.
 * 
 * This structure is used only for the generation of tones. It is not used for tone monitoring.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linegeneratetone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEGENERATETONE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Frequency of this tone component, in hertz. A service provider may adjust (round up or down) the frequency specified by the application to fit its resolution.
     * @type {Integer}
     */
    dwFrequency {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length of the "on" duration of the cadence of the custom tone to be generated, in milliseconds. Zero means no tone is generated.
     * @type {Integer}
     */
    dwCadenceOn {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Length of the "off" duration of the cadence of the custom tone to be generated, in milliseconds. Zero means no off time, that is, a constant tone.
     * @type {Integer}
     */
    dwCadenceOff {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Volume level at which the tone is to be generated. A value of 0x0000FFFF represents full volume, and a value of 0x00000000 is silence.
     * @type {Integer}
     */
    dwVolume {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
