#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeviceInformationPairing.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformation2
     * @type {Guid}
     */
    static IID => Guid("{f156a638-7997-48d9-a10c-269d46533f48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_Pairing"]

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {DeviceInformationPairing} 
     */
    Pairing {
        get => this.get_Pairing()
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
     * @returns {DeviceInformationPairing} 
     */
    get_Pairing() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformationPairing(value)
    }
}
