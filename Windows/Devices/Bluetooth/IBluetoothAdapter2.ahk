#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothAdapter2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothAdapter2
     * @type {Guid}
     */
    static IID => Guid("{ac94cecc-24d5-41b3-916d-1097c50b102b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AreClassicSecureConnectionsSupported", "get_AreLowEnergySecureConnectionsSupported"]

    /**
     * @type {Boolean} 
     */
    AreClassicSecureConnectionsSupported {
        get => this.get_AreClassicSecureConnectionsSupported()
    }

    /**
     * @type {Boolean} 
     */
    AreLowEnergySecureConnectionsSupported {
        get => this.get_AreLowEnergySecureConnectionsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreClassicSecureConnectionsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreLowEnergySecureConnectionsSupported() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
