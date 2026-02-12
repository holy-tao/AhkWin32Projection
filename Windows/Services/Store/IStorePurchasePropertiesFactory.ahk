#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StorePurchaseProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStorePurchasePropertiesFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePurchasePropertiesFactory
     * @type {Guid}
     */
    static IID => Guid("{a768f59e-fefd-489f-9a17-22a593e68b9d}")

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
     * @param {HSTRING} name 
     * @returns {StorePurchaseProperties} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &storePurchaseProperties_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorePurchaseProperties(storePurchaseProperties_)
    }
}
