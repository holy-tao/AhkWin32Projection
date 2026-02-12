#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeviceInformation.ahk
#Include .\DeviceInformationUpdate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceWatcherEvent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceWatcherEvent
     * @type {Guid}
     */
    static IID => Guid("{74aa9c0b-1dbd-47fd-b635-3cc556d0ff8b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_DeviceInformation", "get_DeviceInformationUpdate"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * @type {DeviceInformationUpdate} 
     */
    DeviceInformationUpdate {
        get => this.get_DeviceInformationUpdate()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {DeviceInformationUpdate} 
     */
    get_DeviceInformationUpdate() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformationUpdate(value)
    }
}
