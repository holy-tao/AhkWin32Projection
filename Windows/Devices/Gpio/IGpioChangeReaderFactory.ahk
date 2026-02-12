#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GpioChangeReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class IGpioChangeReaderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioChangeReaderFactory
     * @type {Guid}
     */
    static IID => Guid("{a9598ef3-390e-441a-9d1c-e8de0b2df0df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithCapacity"]

    /**
     * Create Extended Stored Procedures
     * @param {GpioPin} pin 
     * @returns {GpioChangeReader} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(pin) {
        result := ComCall(6, this, "ptr", pin, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GpioChangeReader(value)
    }

    /**
     * 
     * @param {GpioPin} pin 
     * @param {Integer} minCapacity 
     * @returns {GpioChangeReader} 
     */
    CreateWithCapacity(pin, minCapacity) {
        result := ComCall(7, this, "ptr", pin, "int", minCapacity, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GpioChangeReader(value)
    }
}
