#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICLRHostProtectionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICLRHostProtectionManager
     * @type {Guid}
     */
    static IID => Guid("{89f25f5c-ceef-43e1-9cfa-a68ce863aaac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProtectedCategories", "SetEagerSerializeGrantSets"]

    /**
     * 
     * @param {Integer} categories 
     * @returns {HRESULT} 
     */
    SetProtectedCategories(categories) {
        result := ComCall(3, this, "int", categories, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetEagerSerializeGrantSets() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
