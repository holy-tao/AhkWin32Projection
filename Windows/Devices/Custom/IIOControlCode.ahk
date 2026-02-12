#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents IO control code.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode
 * @namespace Windows.Devices.Custom
 * @version WindowsRuntime 1.4
 */
class IIOControlCode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIOControlCode
     * @type {Guid}
     */
    static IID => Guid("{0e9559e7-60c8-4375-a761-7f8808066c60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccessMode", "get_BufferingMethod", "get_Function", "get_DeviceType", "get_ControlCode"]

    /**
     * The access mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode.accessmode
     * @type {Integer} 
     */
    AccessMode {
        get => this.get_AccessMode()
    }

    /**
     * The buffering method.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode.bufferingmethod
     * @type {Integer} 
     */
    BufferingMethod {
        get => this.get_BufferingMethod()
    }

    /**
     * The function.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode.function
     * @type {Integer} 
     */
    Function {
        get => this.get_Function()
    }

    /**
     * The device type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode.devicetype
     * @type {Integer} 
     */
    DeviceType {
        get => this.get_DeviceType()
    }

    /**
     * The control code.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.custom.iiocontrolcode.controlcode
     * @type {Integer} 
     */
    ControlCode {
        get => this.get_ControlCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccessMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferingMethod() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Function() {
        result := ComCall(8, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceType() {
        result := ComCall(9, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ControlCode() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
