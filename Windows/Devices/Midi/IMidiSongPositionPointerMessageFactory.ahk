#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiSongPositionPointerMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiSongPositionPointerMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiSongPositionPointerMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{9c00e996-f10b-4fea-b395-f5d6cf80f64e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiSongPositionPointerMessage"]

    /**
     * 
     * @param {Integer} beats 
     * @returns {MidiSongPositionPointerMessage} 
     */
    CreateMidiSongPositionPointerMessage(beats) {
        result := ComCall(6, this, "ushort", beats, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiSongPositionPointerMessage(value)
    }
}
