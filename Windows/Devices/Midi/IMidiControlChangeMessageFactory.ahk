#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiControlChangeMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiControlChangeMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiControlChangeMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{2ab14321-956c-46ad-9752-f87f55052fe3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiControlChangeMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} controller 
     * @param {Integer} controlValue 
     * @returns {MidiControlChangeMessage} 
     */
    CreateMidiControlChangeMessage(channel, controller, controlValue) {
        result := ComCall(6, this, "char", channel, "char", controller, "char", controlValue, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiControlChangeMessage(value)
    }
}
