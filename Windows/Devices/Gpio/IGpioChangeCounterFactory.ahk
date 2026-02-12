#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\GpioChangeCounter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class IGpioChangeCounterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGpioChangeCounterFactory
     * @type {Guid}
     */
    static IID => Guid("{147d94b6-0a9e-410c-b4fa-f89f4052084d}")

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
     * @param {GpioPin} pin 
     * @returns {GpioChangeCounter} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(pin) {
        result := ComCall(6, this, "ptr", pin, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GpioChangeCounter(value)
    }
}
