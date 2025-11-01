#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemObjectSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemObjectSet
     * @type {Guid}
     */
    static IID => Guid("{76a6415f-cb41-11d1-8b02-00600806d9b6}")

    /**
     * The class identifier for SWbemObjectSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d61-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "get_Security_", "ItemIndex"]

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
     * @param {BSTR} strObjectPath 
     * @param {Integer} iFlags 
     * @param {Pointer<ISWbemObject>} objWbemObject 
     * @returns {HRESULT} 
     */
    Item(strObjectPath, iFlags, objWbemObject) {
        strObjectPath := strObjectPath is String ? BSTR.Alloc(strObjectPath).Value : strObjectPath

        result := ComCall(8, this, "ptr", strObjectPath, "int", iFlags, "ptr*", objWbemObject, "HRESULT")
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

    /**
     * 
     * @param {Pointer<ISWbemSecurity>} objWbemSecurity 
     * @returns {HRESULT} 
     */
    get_Security_(objWbemSecurity) {
        result := ComCall(10, this, "ptr*", objWbemSecurity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @param {Pointer<ISWbemObject>} objWbemObject 
     * @returns {HRESULT} 
     */
    ItemIndex(lIndex, objWbemObject) {
        result := ComCall(11, this, "int", lIndex, "ptr*", objWbemObject, "HRESULT")
        return result
    }
}
