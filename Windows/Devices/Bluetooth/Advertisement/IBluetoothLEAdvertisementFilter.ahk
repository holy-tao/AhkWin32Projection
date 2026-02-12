#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BluetoothLEAdvertisement.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\BluetoothLEAdvertisementBytePattern.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementFilter
     * @type {Guid}
     */
    static IID => Guid("{131eb0d3-d04e-47b1-837e-49405bf6f80f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Advertisement", "put_Advertisement", "get_BytePatterns"]

    /**
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
        set => this.put_Advertisement(value)
    }

    /**
     * @type {IVector<BluetoothLEAdvertisementBytePattern>} 
     */
    BytePatterns {
        get => this.get_BytePatterns()
    }

    /**
     * 
     * @returns {BluetoothLEAdvertisement} 
     */
    get_Advertisement() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisement(value)
    }

    /**
     * 
     * @param {BluetoothLEAdvertisement} value 
     * @returns {HRESULT} 
     */
    put_Advertisement(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<BluetoothLEAdvertisementBytePattern>} 
     */
    get_BytePatterns() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(BluetoothLEAdvertisementBytePattern, value)
    }
}
