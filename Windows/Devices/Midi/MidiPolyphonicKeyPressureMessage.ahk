#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiPolyphonicKeyPressureMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiPolyphonicKeyPressureMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies the polyphonic key pressure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiPolyphonicKeyPressureMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiPolyphonicKeyPressureMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiPolyphonicKeyPressureMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiPolyphonicKeyPressureMessage](midipolyphonickeypressuremessage.md) object.
     * @remarks
     * If any of the values passed in to the constructor do not adhere to the specified requirements, an ArgumentException will be thrown.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} note The note which is specified as a value from 0-127.
     * @param {Integer} pressure The polyphonic key pressure which is specified as a value from 0-127.
     * @returns {MidiPolyphonicKeyPressureMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.#ctor
     */
    static CreateMidiPolyphonicKeyPressureMessage(channel, note, pressure) {
        if (!MidiPolyphonicKeyPressureMessage.HasProp("__IMidiPolyphonicKeyPressureMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiPolyphonicKeyPressureMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiPolyphonicKeyPressureMessageFactory.IID)
            MidiPolyphonicKeyPressureMessage.__IMidiPolyphonicKeyPressureMessageFactory := IMidiPolyphonicKeyPressureMessageFactory(factoryPtr)
        }

        return MidiPolyphonicKeyPressureMessage.__IMidiPolyphonicKeyPressureMessageFactory.CreateMidiPolyphonicKeyPressureMessage(channel, note, pressure)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the note which is specified as a value from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.note
     * @type {Integer} 
     */
    Note {
        get => this.get_Note()
    }

    /**
     * Gets the polyphonic key pressure which is specified as a value from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.pressure
     * @type {Integer} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipolyphonickeypressuremessage.type
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
        if (!this.HasProp("__IMidiPolyphonicKeyPressureMessage")) {
            if ((queryResult := this.QueryInterface(IMidiPolyphonicKeyPressureMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiPolyphonicKeyPressureMessage := IMidiPolyphonicKeyPressureMessage(outPtr)
        }

        return this.__IMidiPolyphonicKeyPressureMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Note() {
        if (!this.HasProp("__IMidiPolyphonicKeyPressureMessage")) {
            if ((queryResult := this.QueryInterface(IMidiPolyphonicKeyPressureMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiPolyphonicKeyPressureMessage := IMidiPolyphonicKeyPressureMessage(outPtr)
        }

        return this.__IMidiPolyphonicKeyPressureMessage.get_Note()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Pressure() {
        if (!this.HasProp("__IMidiPolyphonicKeyPressureMessage")) {
            if ((queryResult := this.QueryInterface(IMidiPolyphonicKeyPressureMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiPolyphonicKeyPressureMessage := IMidiPolyphonicKeyPressureMessage(outPtr)
        }

        return this.__IMidiPolyphonicKeyPressureMessage.get_Pressure()
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
