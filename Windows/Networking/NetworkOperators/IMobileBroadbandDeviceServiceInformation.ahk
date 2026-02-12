#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceServiceInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceServiceInformation
     * @type {Guid}
     */
    static IID => Guid("{53d69b5b-c4ed-45f0-803a-d9417a6d9846}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceServiceId", "get_IsDataReadSupported", "get_IsDataWriteSupported"]

    /**
     * @type {Guid} 
     */
    DeviceServiceId {
        get => this.get_DeviceServiceId()
    }

    /**
     * @type {Boolean} 
     */
    IsDataReadSupported {
        get => this.get_IsDataReadSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsDataWriteSupported {
        get => this.get_IsDataWriteSupported()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DeviceServiceId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataReadSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDataWriteSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
