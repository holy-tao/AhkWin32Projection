#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BluetoothLEAdvertisementDataSection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Advertisement
 * @version WindowsRuntime 1.4
 */
class IBluetoothLEAdvertisementDataSectionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBluetoothLEAdvertisementDataSectionFactory
     * @type {Guid}
     */
    static IID => Guid("{e7a40942-a845-4045-bf7e-3e9971db8a6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Integer} dataType 
     * @param {IBuffer} data 
     * @returns {BluetoothLEAdvertisementDataSection} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(dataType, data) {
        result := ComCall(6, this, "char", dataType, "ptr", data, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BluetoothLEAdvertisementDataSection(value)
    }
}
