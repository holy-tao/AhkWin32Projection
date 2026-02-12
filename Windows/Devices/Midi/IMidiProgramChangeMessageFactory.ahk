#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiProgramChangeMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiProgramChangeMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiProgramChangeMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{d6b04387-524b-4104-9c99-6572bfd2e261}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiProgramChangeMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} program 
     * @returns {MidiProgramChangeMessage} 
     */
    CreateMidiProgramChangeMessage(channel, program) {
        result := ComCall(6, this, "char", channel, "char", program, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiProgramChangeMessage(value)
    }
}
