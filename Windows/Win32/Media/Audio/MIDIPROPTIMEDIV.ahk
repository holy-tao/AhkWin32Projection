#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MIDIPROPTIMEDIV structure contains the time division property for a stream.
 * @remarks
 * The time division property is read or written by the <a href="https://docs.microsoft.com/previous-versions/dd798490(v=vs.85)">midiStreamProperty</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midiproptimediv
 * @namespace Windows.Win32.Media.Audio
 */
export default struct MIDIPROPTIMEDIV {
    #StructPack 4

    /**
     * Length, in bytes, of this structure. This member must be filled in for both the MIDIPROP_SET and MIDIPROP_GET operations of the <a href="https://docs.microsoft.com/previous-versions/dd798490(v=vs.85)">midiStreamProperty</a> function.
     */
    cbStruct : UInt32

    /**
     * Time division for this stream, in the format specified in the <i>Standard MIDI Files 1.0</i> specification. The low 16 bits of this <b>DWORD</b> value contain the time division. This member is set in a MIDIPROP_SET operation and is filled on return from a MIDIPROP_GET operation.
     */
    dwTimeDiv : UInt32

}
