#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiPitchBendChangeMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiPitchBendChangeMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a pitch bend change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiPitchBendChangeMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiPitchBendChangeMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiPitchBendChangeMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiPitchBendChangeMessage](midipitchbendchangemessage.md) object.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} bend The pitch bend value which is specified as a 14-bit value from 0-16383.
     * @returns {MidiPitchBendChangeMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.#ctor
     */
    static CreateMidiPitchBendChangeMessage(channel, bend) {
        if (!MidiPitchBendChangeMessage.HasProp("__IMidiPitchBendChangeMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiPitchBendChangeMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiPitchBendChangeMessageFactory.IID)
            MidiPitchBendChangeMessage.__IMidiPitchBendChangeMessageFactory := IMidiPitchBendChangeMessageFactory(factoryPtr)
        }

        return MidiPitchBendChangeMessage.__IMidiPitchBendChangeMessageFactory.CreateMidiPitchBendChangeMessage(channel, bend)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the pitch bend value which is specified as a 14-bit value from 0-16383.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.bend
     * @type {Integer} 
     */
    Bend {
        get => this.get_Bend()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midipitchbendchangemessage.type
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
        if (!this.HasProp("__IMidiPitchBendChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiPitchBendChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiPitchBendChangeMessage := IMidiPitchBendChangeMessage(outPtr)
        }

        return this.__IMidiPitchBendChangeMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bend() {
        if (!this.HasProp("__IMidiPitchBendChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiPitchBendChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiPitchBendChangeMessage := IMidiPitchBendChangeMessage(outPtr)
        }

        return this.__IMidiPitchBendChangeMessage.get_Bend()
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
