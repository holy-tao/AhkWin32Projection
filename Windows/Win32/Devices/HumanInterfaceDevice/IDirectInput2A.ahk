#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectInputA.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class IDirectInput2A extends IDirectInputA{
    /**
     * The interface identifier for IDirectInput2A
     * @type {Guid}
     */
    static IID => Guid("{5944e662-aa8a-11cf-bfc7-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {PSTR} param1 
     * @param {Pointer<Guid>} param2 
     * @returns {HRESULT} 
     */
    FindDevice(param0, param1, param2) {
        result := ComCall(8, this, "ptr", param0, "ptr", param1, "ptr", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
