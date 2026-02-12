#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiNoteOnMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiNoteOnMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiNoteOnMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{9b4280a0-59c1-420e-b517-15a10aa9606b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiNoteOnMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} note 
     * @param {Integer} velocity 
     * @returns {MidiNoteOnMessage} 
     */
    CreateMidiNoteOnMessage(channel, note, velocity) {
        result := ComCall(6, this, "char", channel, "char", note, "char", velocity, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiNoteOnMessage(value)
    }
}
