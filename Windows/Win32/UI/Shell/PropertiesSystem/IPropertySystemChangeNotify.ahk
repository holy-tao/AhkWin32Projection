#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class IPropertySystemChangeNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPropertySystemChangeNotify
     * @type {Guid}
     */
    static IID => Guid("{fa955fd9-38be-4879-a6ce-824cf52d609f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SchemaRefreshed"]

    /**
     * 
     * @returns {HRESULT} 
     */
    SchemaRefreshed() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
