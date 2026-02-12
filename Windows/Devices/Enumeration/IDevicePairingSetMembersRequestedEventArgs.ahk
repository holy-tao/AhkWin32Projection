#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DeviceInformation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDevicePairingSetMembersRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDevicePairingSetMembersRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7fb42cff-ecac-5012-8d7d-a1894680a349}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_ParentDeviceInformation", "get_PairingSetMembers"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {DeviceInformation} 
     */
    ParentDeviceInformation {
        get => this.get_ParentDeviceInformation()
    }

    /**
     * @type {IVectorView<DeviceInformation>} 
     */
    PairingSetMembers {
        get => this.get_PairingSetMembers()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
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
    get_ParentDeviceInformation() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }

    /**
     * 
     * @returns {IVectorView<DeviceInformation>} 
     */
    get_PairingSetMembers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DeviceInformation, value)
    }
}
