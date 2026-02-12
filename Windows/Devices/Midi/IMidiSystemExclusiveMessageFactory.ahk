#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MidiSystemExclusiveMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Midi
 * @version WindowsRuntime 1.4
 */
class IMidiSystemExclusiveMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMidiSystemExclusiveMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{083de222-3b74-4320-9b42-0ca8545f8a24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMidiSystemExclusiveMessage"]

    /**
     * 
     * @param {IBuffer} rawData 
     * @returns {MidiSystemExclusiveMessage} 
     */
    CreateMidiSystemExclusiveMessage(rawData) {
        result := ComCall(6, this, "ptr", rawData, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MidiSystemExclusiveMessage(value)
    }
}
