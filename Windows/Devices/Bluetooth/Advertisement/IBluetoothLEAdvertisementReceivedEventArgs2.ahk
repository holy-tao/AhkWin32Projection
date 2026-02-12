#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementReceivedEventArgs2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementReceivedEventArgs2
     * @type {Guid}
     */
    static IID => Guid("{12d9c87b-0399-5f0e-a348-53b02b6b162e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BluetoothAddressType", "get_TransmitPowerLevelInDBm", "get_IsAnonymous", "get_IsConnectable", "get_IsScannable", "get_IsDirected", "get_IsScanResponse"]

    /**
     * @type {Integer} 
     */
    BluetoothAddressType {
        get => this.get_BluetoothAddressType()
    }

    /**
     * @type {IReference<Integer>} 
     */
    TransmitPowerLevelInDBm {
        get => this.get_TransmitPowerLevelInDBm()
    }

    /**
     * @type {Boolean} 
     */
    IsAnonymous {
        get => this.get_IsAnonymous()
    }

    /**
     * @type {Boolean} 
     */
    IsConnectable {
        get => this.get_IsConnectable()
    }

    /**
     * @type {Boolean} 
     */
    IsScannable {
        get => this.get_IsScannable()
    }

    /**
     * @type {Boolean} 
     */
    IsDirected {
        get => this.get_IsDirected()
    }

    /**
     * @type {Boolean} 
     */
    IsScanResponse {
        get => this.get_IsScanResponse()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BluetoothAddressType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_TransmitPowerLevelInDBm() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt16(), value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnonymous() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScannable() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDirected() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScanResponse() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
