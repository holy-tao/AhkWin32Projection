#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MIDISTRMBUFFVER structure contains version information for a long MIDI event of the MEVT_VERSION type.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midistrmbuffver
 * @namespace Windows.Win32.Media.Audio
 */
export default struct MIDISTRMBUFFVER {
    #StructPack 4

    /**
     * Version of the stream. The high 16 bits contain the major version, and the low 16 bits contain the minor version. The version number for the first implementation of MIDI streams should be 1.0.
     */
    dwVersion : UInt32

    /**
     * Manufacturer identifier. Manufacturer identifiers are defined in Manufacturer and Product Identifiers.
     */
    dwMid : UInt32

    /**
     * OEM version of the stream. Original equipment manufacturers can use this field to version-stamp any custom events they have specified. If a custom event is specified, it must be the first event sent after the stream is opened.
     */
    dwOEMVersion : UInt32

}
