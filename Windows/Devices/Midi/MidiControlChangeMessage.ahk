#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiControlChangeMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiControlChangeMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies a control change.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiControlChangeMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiControlChangeMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiControlChangeMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiControlChangeMessage](midicontrolchangemessage.md) object.
     * @param {Integer} channel The channel from 0-15 that this message applies to.
     * @param {Integer} controller The controller from 0-127 to receive this message.
     * @param {Integer} controlValue The value from 0-127 to apply to the [controller](midicontrolchangemessage_controller.md).
     * @returns {MidiControlChangeMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.#ctor
     */
    static CreateMidiControlChangeMessage(channel, controller, controlValue) {
        if (!MidiControlChangeMessage.HasProp("__IMidiControlChangeMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiControlChangeMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiControlChangeMessageFactory.IID)
            MidiControlChangeMessage.__IMidiControlChangeMessageFactory := IMidiControlChangeMessageFactory(factoryPtr)
        }

        return MidiControlChangeMessage.__IMidiControlChangeMessageFactory.CreateMidiControlChangeMessage(channel, controller, controlValue)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the channel from 0-15 that this message applies to.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.channel
     * @type {Integer} 
     */
    Channel {
        get => this.get_Channel()
    }

    /**
     * Gets controller from 0-127 to receive this message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.controller
     * @type {Integer} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * Gets the value from 0-127 to apply to the [controller](midicontrolchangemessage_controller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.controlvalue
     * @type {Integer} 
     */
    ControlValue {
        get => this.get_ControlValue()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midicontrolchangemessage.type
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
        if (!this.HasProp("__IMidiControlChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiControlChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiControlChangeMessage := IMidiControlChangeMessage(outPtr)
        }

        return this.__IMidiControlChangeMessage.get_Channel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Controller() {
        if (!this.HasProp("__IMidiControlChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiControlChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiControlChangeMessage := IMidiControlChangeMessage(outPtr)
        }

        return this.__IMidiControlChangeMessage.get_Controller()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlValue() {
        if (!this.HasProp("__IMidiControlChangeMessage")) {
            if ((queryResult := this.QueryInterface(IMidiControlChangeMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiControlChangeMessage := IMidiControlChangeMessage(outPtr)
        }

        return this.__IMidiControlChangeMessage.get_ControlValue()
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
