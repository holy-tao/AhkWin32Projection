#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiNoteOffMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiNoteOffMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiNoteOffMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{a6b240e0-a749-425f-8af4-a4d979cc15b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiNoteOffMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} note 
     * @param {Integer} velocity 
     * @returns {MidiNoteOffMessage} 
     */
    CreateMidiNoteOffMessage(channel, note, velocity) {
        result := ComCall(6, this, "char", channel, "char", note, "char", velocity, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiNoteOffMessage(value)
    }
}
