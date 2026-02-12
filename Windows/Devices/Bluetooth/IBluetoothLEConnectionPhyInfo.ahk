#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEConnectionPhyInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEConnectionPhyInfo
     * @type {Guid}
     */
    static IID => Guid("{9a100bdd-602e-5c27-a1ae-b230015a6394}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsUncoded1MPhy", "get_IsUncoded2MPhy", "get_IsCodedPhy"]

    /**
     * @type {Boolean} 
     */
    IsUncoded1MPhy {
        get => this.get_IsUncoded1MPhy()
    }

    /**
     * @type {Boolean} 
     */
    IsUncoded2MPhy {
        get => this.get_IsUncoded2MPhy()
    }

    /**
     * @type {Boolean} 
     */
    IsCodedPhy {
        get => this.get_IsCodedPhy()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUncoded1MPhy() {
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
    get_IsUncoded2MPhy() {
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
    get_IsCodedPhy() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
