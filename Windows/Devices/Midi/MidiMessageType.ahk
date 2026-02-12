#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies constants used to map MIDI message types into their corresponding byte codes.
 * @remarks
 * Channel message values are put into the high nibble of the status byte of the Midi message.
 * 
 * System messages represent the entire status byte.
 * 
 * These values are pre-defined by the MIDI specification. The reserved system message bytes have been omitted.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midimessagetype
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiMessageType extends Win32Enum{

    /**
     * Specifies no message type.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * A [MidiNoteOffMessage](midinoteoffmessage.md).
     * @type {Integer (Int32)}
     */
    static NoteOff => 128

    /**
     * A [MidiNoteOnMessage](midinoteonmessage.md).
     * @type {Integer (Int32)}
     */
    static NoteOn => 144

    /**
     * A [MidiPolyphonicKeyPressureMessage](midipolyphonickeypressuremessage.md).
     * @type {Integer (Int32)}
     */
    static PolyphonicKeyPressure => 160

    /**
     * A [MidiControlChangeMessage](midicontrolchangemessage.md).
     * @type {Integer (Int32)}
     */
    static ControlChange => 176

    /**
     * A [MidiControlChangeMessage](midicontrolchangemessage.md).
     * @type {Integer (Int32)}
     */
    static ProgramChange => 192

    /**
     * A [MidiChannelPressureMessage](midichannelpressuremessage.md).
     * @type {Integer (Int32)}
     */
    static ChannelPressure => 208

    /**
     * A [MidiPitchBendChangeMessage](midipitchbendchangemessage.md).
     * @type {Integer (Int32)}
     */
    static PitchBendChange => 224

    /**
     * A [MidiSystemExclusiveMessage](midisystemexclusivemessage.md).
     * @type {Integer (Int32)}
     */
    static SystemExclusive => 240

    /**
     * A [MidiTimeCodeMessage](miditimecodemessage.md).
     * @type {Integer (Int32)}
     */
    static MidiTimeCode => 241

    /**
     * A [MidiSongPositionPointerMessage](midisongpositionpointermessage.md).
     * @type {Integer (Int32)}
     */
    static SongPositionPointer => 242

    /**
     * A [MidiSongSelectMessage](midisongselectmessage.md).
     * @type {Integer (Int32)}
     */
    static SongSelect => 243

    /**
     * A [MidiTuneRequestMessage](miditunerequestmessage.md).
     * @type {Integer (Int32)}
     */
    static TuneRequest => 246

    /**
     * A [MidiSystemExclusiveMessage](midisystemexclusivemessage.md).
     * @type {Integer (Int32)}
     */
    static EndSystemExclusive => 247

    /**
     * A [MidiTimingClockMessage](miditimingclockmessage.md).
     * @type {Integer (Int32)}
     */
    static TimingClock => 248

    /**
     * A [MidiStartMessage](midistartmessage.md).
     * @type {Integer (Int32)}
     */
    static Start => 250

    /**
     * A [MidiContinueMessage](midicontinuemessage.md).
     * @type {Integer (Int32)}
     */
    static Continue => 251

    /**
     * A [MidiStopMessage](midistopmessage.md).
     * @type {Integer (Int32)}
     */
    static Stop => 252

    /**
     * A [MidiActiveSensingMessage](midiactivesensingmessage.md).
     * @type {Integer (Int32)}
     */
    static ActiveSensing => 254

    /**
     * A [SystemResetMessage](midisystemresetmessage.md).
     * @type {Integer (Int32)}
     */
    static SystemReset => 255
}
