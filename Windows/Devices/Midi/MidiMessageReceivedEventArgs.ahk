#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMidiMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [MessageReceived](midiinport_messagereceived.md) event.
 * @remarks
 * This object is not instantiated directly; it is returned by the [MidiInPort.MessageReceived](midiinport_messagereceived.md) event when that event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midimessagereceivedeventargs
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class MidiMessageReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMidiMessageReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMidiMessageReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The MIDI message.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.midi.midimessagereceivedeventargs.message
     * @type {IMidiMessage} 
     */
    Message {
        get => this.get_Message()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IMidiMessage} 
     */
    get_Message() {
        if (!this.HasProp("__IMidiMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IMidiMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMidiMessageReceivedEventArgs := IMidiMessageReceivedEventArgs(outPtr)
        }

        return this.__IMidiMessageReceivedEventArgs.get_Message()
    }

;@endregion Instance Methods
}
