#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiSongPositionPointerMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiSongPositionPointerMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a song position pointer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiSongPositionPointerMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiSongPositionPointerMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiSongPositionPointerMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiSongPositionPointerMessage](midisongpositionpointermessage.md) object.
     * @remarks
     * If any values passed into the constructor fo not adhere to the specified requirements, an InvalidArg exception will be thrown.
     * @param {Integer} beats The song position pointer encoded in a 14-bit value from 0-16383.
     * @returns {MidiSongPositionPointerMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage.#ctor
     */
    static CreateMidiSongPositionPointerMessage(beats) {
        if (!MidiSongPositionPointerMessage.HasProp("__IMidiSongPositionPointerMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiSongPositionPointerMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiSongPositionPointerMessageFactory.IID)
            MidiSongPositionPointerMessage.__IMidiSongPositionPointerMessageFactory := IMidiSongPositionPointerMessageFactory(factoryPtr)
        }

        return MidiSongPositionPointerMessage.__IMidiSongPositionPointerMessageFactory.CreateMidiSongPositionPointerMessage(beats)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the song position pointer encoded in a 14-bit value from 0-16383.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage.beats
     * @type {Integer} 
     */
    Beats {
        get => this.get_Beats()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongpositionpointermessage.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Beats() {
        if (!this.HasProp("__IMidiSongPositionPointerMessage")) {
            if ((queryResult := this.QueryInterface(IMidiSongPositionPointerMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiSongPositionPointerMessage := IMidiSongPositionPointerMessage(outPtr)
        }

        return this.__IMidiSongPositionPointerMessage.get_Beats()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IMidiMessage")) {
            if ((queryResult := this.QueryInterface(IMidiMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiMessage := IMidiMessage(outPtr)
        }

        return this.__IMidiMessage.get_Timestamp()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_RawData() {
        if (!this.HasProp("__IMidiMessage")) {
            if ((queryResult := this.QueryInterface(IMidiMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiMessage := IMidiMessage(outPtr)
        }

        return this.__IMidiMessage.get_RawData()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IMidiMessage")) {
            if ((queryResult := this.QueryInterface(IMidiMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiMessage := IMidiMessage(outPtr)
        }

        return this.__IMidiMessage.get_Type()
    }

;@endregion Instance Methods
}
