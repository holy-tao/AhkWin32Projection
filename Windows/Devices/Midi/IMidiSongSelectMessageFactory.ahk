#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiSongSelectMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiSongSelectMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiSongSelectMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{848878e4-8748-4129-a66c-a05493f75daa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiSongSelectMessage"]

    /**
     * 
     * @param {Integer} song 
     * @returns {MidiSongSelectMessage} 
     */
    CreateMidiSongSelectMessage(song) {
        result := ComCall(6, this, "char", song, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiSongSelectMessage(value)
    }
}
