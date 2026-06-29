#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEGENERATETONE structure contains information about a tone to be generated. This structure is used by the lineGenerateTone and TSPI_lineGenerateTone functions.
 * @remarks
 * This structure may not be extended.
 * 
 * This structure is used only for the generation of tones. It is not used for tone monitoring.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linegeneratetone
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEGENERATETONE {
    #StructPack 4

    /**
     * Frequency of this tone component, in hertz. A service provider may adjust (round up or down) the frequency specified by the application to fit its resolution.
     */
    dwFrequency : UInt32

    /**
     * Length of the "on" duration of the cadence of the custom tone to be generated, in milliseconds. Zero means no tone is generated.
     */
    dwCadenceOn : UInt32

    /**
     * Length of the "off" duration of the cadence of the custom tone to be generated, in milliseconds. Zero means no off time, that is, a constant tone.
     */
    dwCadenceOff : UInt32

    /**
     * Volume level at which the tone is to be generated. A value of 0x0000FFFF represents full volume, and a value of 0x00000000 is silence.
     */
    dwVolume : UInt32

}
