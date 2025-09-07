#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDIPROPTEMPO structure contains the tempo property for a stream.
 * @remarks
 * The tempo property is read or written by the <a href="https://docs.microsoft.com/previous-versions/dd798490(v=vs.85)">midiStreamProperty</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midiproptempo
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIDIPROPTEMPO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * Length, in bytes, of this structure. This member must be filled in for both the MIDIPROP_SET and MIDIPROP_GET operations of the <a href="https://docs.microsoft.com/previous-versions/dd798490(v=vs.85)">midiStreamProperty</a> function.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Tempo of the stream, in microseconds per quarter note. The tempo is honored only if the time division for the stream is specified in quarter note format. This member is set in a MIDIPROP_SET operation and is filled on return from a MIDIPROP_GET operation.
     * @type {Integer}
     */
    dwTempo {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
