#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\BluetoothDevice.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Rfcomm
 * @version WindowsRuntime 1.4
 */
class IRfcommDeviceService2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRfcommDeviceService2
     * @type {Guid}
     */
    static IID => Guid("{536ced14-ebcd-49fe-bf9f-40efc689b20d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Device"]

    /**
     * @type {BluetoothDevice} 
     */
    Device {
        get => this.get_Device()
    }

    /**
     * 
     * @returns {BluetoothDevice} 
     */
    get_Device() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothDevice(value)
    }
}
