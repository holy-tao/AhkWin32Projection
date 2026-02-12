#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiPitchBendChangeMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiPitchBendChangeMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiPitchBendChangeMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{f5eedf55-cfc8-4926-b30e-a3622393306c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiPitchBendChangeMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} bend 
     * @returns {MidiPitchBendChangeMessage} 
     */
    CreateMidiPitchBendChangeMessage(channel, bend) {
        result := ComCall(6, this, "char", channel, "ushort", bend, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiPitchBendChangeMessage(value)
    }
}
