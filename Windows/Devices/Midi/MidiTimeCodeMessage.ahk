#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiTimeCodeMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiTimeCodeMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a time code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiTimeCodeMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiTimeCodeMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiTimeCodeMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiTimeCodeMessage](miditimecodemessage.md) object.
     * @remarks
     * If any values passed into the constructor fo not adhere to the specified requirements, an invalid argument exception will be thrown.
     * @param {Integer} frameType The frame type from 0-7.
     * @param {Integer} values The time code from 0-15.
     * @returns {MidiTimeCodeMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.#ctor
     */
    static CreateMidiTimeCodeMessage(frameType, values) {
        if (!MidiTimeCodeMessage.HasProp("__IMidiTimeCodeMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiTimeCodeMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiTimeCodeMessageFactory.IID)
            MidiTimeCodeMessage.__IMidiTimeCodeMessageFactory := IMidiTimeCodeMessageFactory(factoryPtr)
        }

        return MidiTimeCodeMessage.__IMidiTimeCodeMessageFactory.CreateMidiTimeCodeMessage(frameType, values)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the value of the frame type from 0-7.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.frametype
     * @type {Integer} 
     */
    FrameType {
        get => this.get_FrameType()
    }

    /**
     * Gets the time code value from 0-15.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.values
     * @type {Integer} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.miditimecodemessage.type
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
    get_FrameType() {
        if (!this.HasProp("__IMidiTimeCodeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiTimeCodeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiTimeCodeMessage := IMidiTimeCodeMessage(outPtr)
        }

        return this.__IMidiTimeCodeMessage.get_FrameType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Values() {
        if (!this.HasProp("__IMidiTimeCodeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiTimeCodeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiTimeCodeMessage := IMidiTimeCodeMessage(outPtr)
        }

        return this.__IMidiTimeCodeMessage.get_Values()
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
