#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Enumeration\DeviceInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothDevice2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothDevice2
     * @type {Guid}
     */
    static IID => Guid("{0133f954-b156-4dd0-b1f5-c11bc31a5163}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceInformation"]

    /**
     * @type {DeviceInformation} 
     */
    DeviceInformation {
        get => this.get_DeviceInformation()
    }

    /**
     * 
     * @returns {DeviceInformation} 
     */
    get_DeviceInformation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceInformation(value)
    }
}
