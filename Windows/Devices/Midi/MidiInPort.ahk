#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiInPort.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IMidiInPortStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MidiInPort.ahk
#Include .\MidiMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a port used to receive MIDI messages from a MIDI device.
 * @remarks
 * If the MidiInPort becomes disconnected for any reason, it should be disposed and a new one created to continue receiving messages.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiinport
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiInPort extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiInPort

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiInPort.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [MidiInPort](midiinport.md) object for the specified device.
     * @remarks
     * To enumerate the [MidiInPort](midiinport.md) objects on the system, pass the query string provided by [GetDeviceSelector](midiinport_getdeviceselector_838466080.md) to [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync).
     * 
     * Suggested times to attempt to create a **MidiInPort** are on any sort of app activation or user interaction. If a function call on a **MidiInPort** fails, or if a message received from a **MidiInPort** is invalid, do not try to recreate the port immediately.
     * @param {HSTRING} deviceId The device ID, which can be obtained by enumerating the devices on the system [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](../windows.devices.enumeration/deviceinformation_findallasync_1257462890.md).
     * @returns {IAsyncOperation<MidiInPort>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiinport.fromidasync
     */
    static FromIdAsync(deviceId) {
        if (!MidiInPort.HasProp("__IMidiInPortStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiInPort")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiInPortStatics.IID)
            MidiInPort.__IMidiInPortStatics := IMidiInPortStatics(factoryPtr)
        }

        return MidiInPort.__IMidiInPortStatics.FromIdAsync(deviceId)
    }

    /**
     * Gets a query string that can be used to enumerate all [MidiInPort](midiinport.md) objects on the system.
     * @remarks
     * To enumerate the [MidiInPort](midiinport.md) objects on the system, pass the query string provided by this method to [Windows.Devices.Enumeration.DeviceInformation.FindAllAsync](/uwp/api/windows.devices.enumeration.deviceinformation.findallasync).
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiinport.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!MidiInPort.HasProp("__IMidiInPortStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Midi.MidiInPort")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMidiInPortStatics.IID)
            MidiInPort.__IMidiInPortStatics := IMidiInPortStatics(factoryPtr)
        }

        return MidiInPort.__IMidiInPortStatics.GetDeviceSelector()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the id of the device that was used to initialize the [MidiInPort](midiinport.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiinport.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Occurs when the [MidiInPort](midiinport.md) receives data.
     * @remarks
     * Apps should subscribe to this event to handle the input messages.
     * 
     * If accessing any part of the message results in an exception, it can be assumed that the [MidiInPort](midiinport.md) has been disconnected from the device.
     * @type {TypedEventHandler<MidiInPort, MidiMessageReceivedEventArgs>}
    */
    OnMessageReceived {
        get {
            if(!this.HasProp("__OnMessageReceived")){
                this.__OnMessageReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{50017240-cc39-5775-8a6b-f6f22386bfca}"),
                    MidiInPort,
                    MidiMessageReceivedEventArgs
                )
                this.__OnMessageReceivedToken := this.add_MessageReceived(this.__OnMessageReceived.iface)
            }
            return this.__OnMessageReceived
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMessageReceivedToken")) {
            this.remove_MessageReceived(this.__OnMessageReceivedToken)
            this.__OnMessageReceived.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MidiInPort, MidiMessageReceivedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(handler) {
        if (!this.HasProp("__IMidiInPort")) {
            if ((queryResult := this.QueryInterface(IMidiInPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiInPort := IMidiInPort(outPtr)
        }

        return this.__IMidiInPort.add_MessageReceived(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MessageReceived(token) {
        if (!this.HasProp("__IMidiInPort")) {
            if ((queryResult := this.QueryInterface(IMidiInPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiInPort := IMidiInPort(outPtr)
        }

        return this.__IMidiInPort.remove_MessageReceived(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IMidiInPort")) {
            if ((queryResult := this.QueryInterface(IMidiInPort.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiInPort := IMidiInPort(outPtr)
        }

        return this.__IMidiInPort.get_DeviceId()
    }

    /**
     * Closes the [MidiInPort](midiinport.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midiinport.close
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
