#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothDeviceId.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEDevice4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEDevice4
     * @type {Guid}
     */
    static IID => Guid("{2b605031-2248-4b2f-acf0-7cee36fc5870}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BluetoothDeviceId"]

    /**
     * @type {BluetoothDeviceId} 
     */
    BluetoothDeviceId {
        get => this.get_BluetoothDeviceId()
    }

    /**
     * 
     * @returns {BluetoothDeviceId} 
     */
    get_BluetoothDeviceId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothDeviceId(value)
    }
}
