#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemMethodSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemMethodSet
     * @type {Guid}
     */
    static IID => Guid("{c93ba292-d955-11d1-8b09-00600806d9b6}")

    /**
     * The class identifier for SWbemMethodSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5a-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} pUnk 
     * @returns {HRESULT} 
     */
    get__NewEnum(pUnk) {
        result := ComCall(7, this, "ptr*", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemMethod>} objWbemMethod 
     * @returns {HRESULT} 
     */
    Item(strName, iFlags, objWbemMethod) {
        strName := strName is String ? BSTR.Alloc(strName).Value : strName

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", objWbemMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iCount 
     * @returns {HRESULT} 
     */
    get_Count(iCount) {
        iCountMarshal := iCount is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, iCountMarshal, iCount, "HRESULT")
        return result
    }
}
