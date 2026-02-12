#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiSynthesizer.ahk
#Include .\IMidiOutPort.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMidiSynthesizerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the Microsoft GS wavetable software synthesizer, included in Windows. This synthesizer provides a Roland GS sound set, which includes and extends the General MIDI sound set.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiSynthesizer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiSynthesizer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiSynthesizer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the Microsoft MIDI synthesizer with a specified audio output device.
     * @returns {IAsyncOperation<MidiSynthesizer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.createasync
     */
    static CreateAsync() {
        if (!MidiSynthesizer.HasProp("__IMidiSynthesizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiSynthesizerStatics.IID)
            MidiSynthesizer.__IMidiSynthesizerStatics := IMidiSynthesizerStatics(factoryPtr)
        }

        return MidiSynthesizer.__IMidiSynthesizerStatics.CreateAsync()
    }

    /**
     * Creates a new instance of the Microsoft MIDI synthesizer that uses the system's default audio output device.
     * @param {DeviceInformation} audioDevice 
     * @returns {IAsyncOperation<MidiSynthesizer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.createasync
     */
    static CreateFromAudioDeviceAsync(audioDevice) {
        if (!MidiSynthesizer.HasProp("__IMidiSynthesizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiSynthesizerStatics.IID)
            MidiSynthesizer.__IMidiSynthesizerStatics := IMidiSynthesizerStatics(factoryPtr)
        }

        return MidiSynthesizer.__IMidiSynthesizerStatics.CreateFromAudioDeviceAsync(audioDevice)
    }

    /**
     * Determines whether a particular device is an instance of the Microsoft MIDI synthesizer. When all MIDI out ports on the system are enumerated, this method can be used to identify which of them is the Microsoft MIDI synthesizer.
     * @param {DeviceInformation} midiDevice An object that represents the device in question.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.issynthesizer
     */
    static IsSynthesizer(midiDevice) {
        if (!MidiSynthesizer.HasProp("__IMidiSynthesizerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiSynthesizer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiSynthesizerStatics.IID)
            MidiSynthesizer.__IMidiSynthesizerStatics := IMidiSynthesizerStatics(factoryPtr)
        }

        return MidiSynthesizer.__IMidiSynthesizerStatics.IsSynthesizer(midiDevice)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the audio output device being used by this instance of the Microsoft MIDI synthesizer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.audiodevice
     * @type {DeviceInformation} 
     */
    AudioDevice {
        get => this.get_AudioDevice()
    }

    /**
     * Gets or sets the output volume of this instance of the Microsoft MIDI synthesizer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * Gets the device ID of the Microsoft MIDI synthesizer. Note that all instances of the synthesizer have the same ID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_AudioDevice() {
        if (!this.HasProp("__IMidiSynthesizer")) {
            if ((queryResult := this.QueryInterface(IMidiSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiSynthesizer := IMidiSynthesizer(outPtr)
        }

        return this.__IMidiSynthesizer.get_AudioDevice()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        if (!this.HasProp("__IMidiSynthesizer")) {
            if ((queryResult := this.QueryInterface(IMidiSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiSynthesizer := IMidiSynthesizer(outPtr)
        }

        return this.__IMidiSynthesizer.get_Volume()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        if (!this.HasProp("__IMidiSynthesizer")) {
            if ((queryResult := this.QueryInterface(IMidiSynthesizer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiSynthesizer := IMidiSynthesizer(outPtr)
        }

        return this.__IMidiSynthesizer.put_Volume(value)
    }

    /**
     * Sends a MIDI message through the Microsoft MIDI synthesizer's [out port](midioutport.md).
     * @param {IMidiMessage} midiMessage The MIDI message to send.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.sendmessage
     */
    SendMessage(midiMessage) {
        if (!this.HasProp("__IMidiOutPort")) {
            if ((queryResult := this.QueryInterface(IMidiOutPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiOutPort := IMidiOutPort(outPtr)
        }

        return this.__IMidiOutPort.SendMessage(midiMessage)
    }

    /**
     * Sends an array of bytes through the synthesizer's [out port](midioutport.md). This enables you to send your data as a byte array instead of as a defined MIDI message.
     * @param {IBuffer} midiData The array of bytes to send.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.sendbuffer
     */
    SendBuffer(midiData) {
        if (!this.HasProp("__IMidiOutPort")) {
            if ((queryResult := this.QueryInterface(IMidiOutPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiOutPort := IMidiOutPort(outPtr)
        }

        return this.__IMidiOutPort.SendBuffer(midiData)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMidiOutPort")) {
            if ((queryResult := this.QueryInterface(IMidiOutPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiOutPort := IMidiOutPort(outPtr)
        }

        return this.__IMidiOutPort.get_DeviceId()
    }

    /**
     * Closes this instance of the Microsoft MIDI synthesizer. It is a best practice for the caller to use this method to clear resources used by the MIDI object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midisynthesizer.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
