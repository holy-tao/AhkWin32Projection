#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 */
class ILogFileItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILogFileItem
     * @type {Guid}
     */
    static IID => Guid("{d6b518dd-05c7-418a-89e6-4f9ce8c6841e}")

    /**
     * The class identifier for LogFileItem
     * @type {Guid}
     */
    static CLSID => Guid("{16ec5be8-df93-4237-94e4-9ee918111d71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Path"]

    /**
     * 
     * @param {Pointer<BSTR>} pstrValue 
     * @returns {HRESULT} 
     */
    get_Path(pstrValue) {
        result := ComCall(3, this, "ptr", pstrValue, "HRESULT")
        return result
    }
}
