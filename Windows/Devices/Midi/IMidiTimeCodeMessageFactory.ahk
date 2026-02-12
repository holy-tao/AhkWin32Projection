#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiTimeCodeMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiTimeCodeMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiTimeCodeMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{eb3099c5-771c-40de-b961-175a7489a85e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiTimeCodeMessage"]

    /**
     * 
     * @param {Integer} frameType 
     * @param {Integer} values 
     * @returns {MidiTimeCodeMessage} 
     */
    CreateMidiTimeCodeMessage(frameType, values) {
        result := ComCall(6, this, "char", frameType, "char", values, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiTimeCodeMessage(value)
    }
}
