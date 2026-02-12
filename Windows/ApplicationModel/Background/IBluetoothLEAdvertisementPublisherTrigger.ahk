#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Bluetooth\Advertisement\BluetoothLEAdvertisement.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementPublisherTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementPublisherTrigger
     * @type {Guid}
     */
    static IID => Guid("{ab3e2612-25d3-48ae-8724-d81877ae6129}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Advertisement"]

    /**
     * @type {BluetoothLEAdvertisement} 
     */
    Advertisement {
        get => this.get_Advertisement()
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
}
