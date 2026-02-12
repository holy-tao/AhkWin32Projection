#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpiConnectionSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiConnectionSettingsFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiConnectionSettingsFactory
     * @type {Guid}
     */
    static IID => Guid("{ff99081e-10c4-44b7-9fea-a748b5a46f31}")

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
     * @param {Integer} chipSelectLine 
     * @returns {SpiConnectionSettings} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(chipSelectLine) {
        result := ComCall(6, this, "int", chipSelectLine, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpiConnectionSettings(value)
    }
}
