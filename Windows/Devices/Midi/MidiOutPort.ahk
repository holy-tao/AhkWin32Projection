#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiOutPort.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMidiOutPortStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a port used to send MIDI messages to a MIDI device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiOutPort extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiOutPort

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiOutPort.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [MidiOutPort](midioutport.md) object for the specified device.
     * @remarks
     * To enumerate the [MidiOutPort](midioutport.md) objects on the system, pass the query string provided by [GetDeviceSelector](midiinport_getdeviceselector_838466080.md) to [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync).
     * 
     * Suggested times to attempt to create a **MidiInPort** are on any sort of app activation or user interaction. If a function call on a **MidiInPort** fails, or if a message received from a **MidiInPort** is invalid, do not try to recreate the port immediately.
     * @param {HSTRING} deviceId The device ID, which can be obtained by enumerating the devices on the system [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * @returns {IAsyncOperation<IMidiOutPort>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!MidiOutPort.HasProp("__IMidiOutPortStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiOutPort")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiOutPortStatics.IID)
            MidiOutPort.__IMidiOutPortStatics := IMidiOutPortStatics(factoryPtr)
        }

        return MidiOutPort.__IMidiOutPortStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets a query string that can be used to enumerate all [MidiOutPort](midioutport.md) objects on the system.
     * @remarks
     * To enumerate the [MidiOutPort](midioutport.md) objects on the system, pass the query string provided by this method to [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!MidiOutPort.HasProp("__IMidiOutPortStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiOutPort")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiOutPortStatics.IID)
            MidiOutPort.__IMidiOutPortStatics := IMidiOutPortStatics(factoryPtr)
        }

        return MidiOutPort.__IMidiOutPortStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the id of the device that was used to initialize the [MidiOutPort](midioutport.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.deviceid
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
     * Send the data in the specified MIDI message to the device associated with this [MidiOutPort](midioutport.md).
     * @param {IMidiMessage} midiMessage The MIDI message to send to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.sendmessage
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
     * Send the specified data buffer to the device associated with this [MidiOutPort](midioutport.md).
     * @remarks
     * If this method fails with **RO_E_CLOSED**, it can be assumed that the [MidiOutPort](midioutport.md) has been disconnected from the device.
     * 
     * See [Obtaining pointers to data buffers (C++/CX)](/cpp/cppcx/obtaining-pointers-to-data-buffers-c-cx) for more info.
     * @param {IBuffer} midiData The data to send to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.sendbuffer
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
     * Closes the [MidiOutPort](midioutport.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midioutport.close
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
