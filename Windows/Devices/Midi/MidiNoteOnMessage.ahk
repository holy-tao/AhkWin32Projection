#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiNoteOnMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiNoteOnMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a MIDI note to turn on.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiNoteOnMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiNoteOnMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiNoteOnMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiNoteOnMessage](midinoteonmessage.md) object.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} note The note which is specified as a value from 0-127.
     * @param {Integer} velocity The velocity which is specified as a value from 0-127.
     * @returns {MidiNoteOnMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.#ctor
     */
    static CreateMidiNoteOnMessage(channel, note, velocity) {
        if (!MidiNoteOnMessage.HasProp("__IMidiNoteOnMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiNoteOnMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiNoteOnMessageFactory.IID)
            MidiNoteOnMessage.__IMidiNoteOnMessageFactory := IMidiNoteOnMessageFactory(factoryPtr)
        }

        return MidiNoteOnMessage.__IMidiNoteOnMessageFactory.CreateMidiNoteOnMessage(channel, note, velocity)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the note to turn on which is specified as a value from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.note
     * @type {Integer} 
     */
    Note {
        get => this.get_Note()
    }

    /**
     * Gets the value of the velocity from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.velocity
     * @type {Integer} 
     */
    Velocity {
        get => this.get_Velocity()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midinoteonmessage.type
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
    get_Channel() {
        if (!this.HasProp("__IMidiNoteOnMessage")) {
            if ((queryResult := this.QueryInterface(IMidiNoteOnMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiNoteOnMessage := IMidiNoteOnMessage(outPtr)
        }

        return this.__IMidiNoteOnMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Note() {
        if (!this.HasProp("__IMidiNoteOnMessage")) {
            if ((queryResult := this.QueryInterface(IMidiNoteOnMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiNoteOnMessage := IMidiNoteOnMessage(outPtr)
        }

        return this.__IMidiNoteOnMessage.get_Note()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Velocity() {
        if (!this.HasProp("__IMidiNoteOnMessage")) {
            if ((queryResult := this.QueryInterface(IMidiNoteOnMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiNoteOnMessage := IMidiNoteOnMessage(outPtr)
        }

        return this.__IMidiNoteOnMessage.get_Velocity()
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
