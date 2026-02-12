#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiProgramChangeMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiProgramChangeMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a program change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiProgramChangeMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiProgramChangeMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiProgramChangeMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiProgramChangeMessage](midiprogramchangemessage.md) object.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} program The program to change from 0-127.
     * @returns {MidiProgramChangeMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.#ctor
     */
    static CreateMidiProgramChangeMessage(channel, program) {
        if (!MidiProgramChangeMessage.HasProp("__IMidiProgramChangeMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiProgramChangeMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiProgramChangeMessageFactory.IID)
            MidiProgramChangeMessage.__IMidiProgramChangeMessageFactory := IMidiProgramChangeMessageFactory(factoryPtr)
        }

        return MidiProgramChangeMessage.__IMidiProgramChangeMessageFactory.CreateMidiProgramChangeMessage(channel, program)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the program to change from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.program
     * @type {Integer} 
     */
    Program {
        get => this.get_Program()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiprogramchangemessage.type
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
        if (!this.HasProp("__IMidiProgramChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiProgramChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiProgramChangeMessage := IMidiProgramChangeMessage(outPtr)
        }

        return this.__IMidiProgramChangeMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Program() {
        if (!this.HasProp("__IMidiProgramChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiProgramChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiProgramChangeMessage := IMidiProgramChangeMessage(outPtr)
        }

        return this.__IMidiProgramChangeMessage.get_Program()
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
