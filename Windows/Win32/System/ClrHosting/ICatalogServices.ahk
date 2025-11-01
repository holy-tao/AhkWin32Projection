#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class ICatalogServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatalogServices
     * @type {Guid}
     */
    static IID => Guid("{04c6be1e-1db1-4058-ab7a-700cccfbf254}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Autodone", "NotAutodone"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Autodone() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    NotAutodone() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
