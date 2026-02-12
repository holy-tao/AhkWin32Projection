#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BluetoothLEConnectionPhyInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEConnectionPhy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEConnectionPhy
     * @type {Guid}
     */
    static IID => Guid("{781e5e48-621e-5a7e-8be6-1b9561ff63c9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransmitInfo", "get_ReceiveInfo"]

    /**
     * @type {BluetoothLEConnectionPhyInfo} 
     */
    TransmitInfo {
        get => this.get_TransmitInfo()
    }

    /**
     * @type {BluetoothLEConnectionPhyInfo} 
     */
    ReceiveInfo {
        get => this.get_ReceiveInfo()
    }

    /**
     * 
     * @returns {BluetoothLEConnectionPhyInfo} 
     */
    get_TransmitInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEConnectionPhyInfo(value)
    }

    /**
     * 
     * @returns {BluetoothLEConnectionPhyInfo} 
     */
    get_ReceiveInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEConnectionPhyInfo(value)
    }
}
