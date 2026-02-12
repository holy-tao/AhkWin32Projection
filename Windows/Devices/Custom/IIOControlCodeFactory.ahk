#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IOControlCode.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IIOControlCodeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIOControlCodeFactory
     * @type {Guid}
     */
    static IID => Guid("{856a7cf0-4c11-44ae-afc6-b8d4a212788f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIOControlCode"]

    /**
     * 
     * @param {Integer} deviceType 
     * @param {Integer} function 
     * @param {Integer} accessMode 
     * @param {Integer} bufferingMethod 
     * @returns {IOControlCode} 
     */
    CreateIOControlCode(deviceType, function, accessMode, bufferingMethod) {
        result := ComCall(6, this, "ushort", deviceType, "ushort", function, "int", accessMode, "int", bufferingMethod, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOControlCode(instance)
    }
}
