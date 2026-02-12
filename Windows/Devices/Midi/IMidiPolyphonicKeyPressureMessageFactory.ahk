#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiPolyphonicKeyPressureMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiPolyphonicKeyPressureMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiPolyphonicKeyPressureMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{e98f483e-c4b3-4dd2-917c-e349815a1b3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiPolyphonicKeyPressureMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} note 
     * @param {Integer} pressure 
     * @returns {MidiPolyphonicKeyPressureMessage} 
     */
    CreateMidiPolyphonicKeyPressureMessage(channel, note, pressure) {
        result := ComCall(6, this, "char", channel, "char", note, "char", pressure, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiPolyphonicKeyPressureMessage(value)
    }
}
