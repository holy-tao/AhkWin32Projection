#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiSongSelectMessage.ahk
#Include .\IMidiMessage.ahk
#Include .\IMidiSongSelectMessageFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a MIDI message that specifies the selected song.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiSongSelectMessage extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiSongSelectMessage

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiSongSelectMessage.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [MidiSongSelectMessage](midisongselectmessage.md) object.
     * @remarks
     * If any values passed into the constructor do not adhere to the specified requirements, an invalid argument exception will be thrown.
     * @param {Integer} song The song to select from 0-127.
     * @returns {MidiSongSelectMessage} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage.#ctor
     */
    static CreateMidiSongSelectMessage(song) {
        if (!MidiSongSelectMessage.HasProp("__IMidiSongSelectMessageFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiSongSelectMessage")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiSongSelectMessageFactory.IID)
            MidiSongSelectMessage.__IMidiSongSelectMessageFactory := IMidiSongSelectMessageFactory(factoryPtr)
        }

        return MidiSongSelectMessage.__IMidiSongSelectMessageFactory.CreateMidiSongSelectMessage(song)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the song to select from 0-127.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage.song
     * @type {Integer} 
     */
    Song {
        get => this.get_Song()
    }

    /**
     * Gets the duration from when the [MidiInPort](midiinport.md) was created to the time the message was received. For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @remarks
     * For messages being sent to a [MidiOutPort](midioutport.md), this value has no meaning.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the array of bytes associated with the MIDI message, including status byte.
     * @remarks
     * This property is immutable after initialization.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage.rawdata
     * @type {IBuffer} 
     */
    RawData {
        get => this.get_RawData()
    }

    /**
     * Gets the type of this MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisongselectmessage.type
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
    get_Song() {
        if (!this.HasProp("__IMidiSongSelectMessage")) {
            if ((queryResult := this.QueryInterface(IMidiSongSelectMessage.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiSongSelectMessage := IMidiSongSelectMessage(outPtr)
        }

        return this.__IMidiSongSelectMessage.get_Song()
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
