#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiChannelPressureMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiChannelPressureMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies the channel pressure.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiChannelPressureMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiChannelPressureMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiChannelPressureMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiChannelPressureMessage](midichannelpressuremessage.md) object.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} pressure The pressure from 0-127.
     * @returns {MidiChannelPressureMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.#ctor
     */
    static CreateMidiChannelPressureMessage(channel, pressure) {
        if (!MidiChannelPressureMessage.HasProp("__IMidiChannelPressureMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiChannelPressureMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiChannelPressureMessageFactory.IID)
            MidiChannelPressureMessage.__IMidiChannelPressureMessageFactory := IMidiChannelPressureMessageFactory(factoryPtr)
        }

        return MidiChannelPressureMessage.__IMidiChannelPressureMessageFactory.CreateMidiChannelPressureMessage(channel, pressure)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets the pressure from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.pressure
     * @type {Integer} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midichannelpressuremessage.type
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
        if (!this.HasProp("__IMidiChannelPressureMessage")) {
            if ((queryResult := this.QueryInterface(IMidiChannelPressureMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiChannelPressureMessage := IMidiChannelPressureMessage(outPtr)
        }

        return this.__IMidiChannelPressureMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Pressure() {
        if (!this.HasProp("__IMidiChannelPressureMessage")) {
            if ((queryResult := this.QueryInterface(IMidiChannelPressureMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiChannelPressureMessage := IMidiChannelPressureMessage(outPtr)
        }

        return this.__IMidiChannelPressureMessage.get_Pressure()
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
