#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\I2cConnectionSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class II2cConnectionSettingsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cConnectionSettingsFactory
     * @type {Guid}
     */
    static IID => Guid("{81b586b3-9693-41b1-a243-ded4f6e66926}")

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
     * @param {Integer} slaveAddress 
     * @returns {I2cConnectionSettings} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(slaveAddress) {
        result := ComCall(6, this, "int", slaveAddress, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return I2cConnectionSettings(value)
    }
}
