#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiChannelPressureMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiChannelPressureMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiChannelPressureMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{6218ed2f-2284-412a-94cf-10fb04842c6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiChannelPressureMessage"]

    /**
     * 
     * @param {Integer} channel 
     * @param {Integer} pressure 
     * @returns {MidiChannelPressureMessage} 
     */
    CreateMidiChannelPressureMessage(channel, pressure) {
        result := ComCall(6, this, "char", channel, "char", pressure, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiChannelPressureMessage(value)
    }
}
