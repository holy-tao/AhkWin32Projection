#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementPublisherTriggerDetails2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementPublisherTriggerDetails2
     * @type {Guid}
     */
    static IID => Guid("{d4a3d025-c601-42d6-9829-4ccb3f5cd77f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SelectedTransmitPowerLevelInDBm"]

    /**
     * @type {IReference<Integer>} 
     */
    SelectedTransmitPowerLevelInDBm {
        get => this.get_SelectedTransmitPowerLevelInDBm()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_SelectedTransmitPowerLevelInDBm() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt16(), value)
    }
}
