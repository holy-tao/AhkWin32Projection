#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a single MIDI out port.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.imidioutport
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiOutPort extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiOutPort
     * @type {Guid}
     */
    static IID => Guid("{931d6d9f-57a2-4a3a-adb8-4640886f6693}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMessage", "SendBuffer", "get_DeviceId"]

    /**
     * Gets the ID of the device that contains the MIDI out port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.imidioutport.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Send the data in the specified MIDI message to the device associated with this [MidiOutPort](midioutport.md).
     * @param {IMidiMessage} midiMessage The MIDI message to send to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.imidioutport.sendmessage
     */
    SendMessage(midiMessage) {
        result := ComCall(6, this, "ptr", midiMessage, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sends the contents of the buffer through the MIDI out port.
     * @param {IBuffer} midiData The data to send to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.imidioutport.sendbuffer
     */
    SendBuffer(midiData) {
        result := ComCall(7, this, "ptr", midiData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
