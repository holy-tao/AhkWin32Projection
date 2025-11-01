#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemPrivilegeSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemPrivilegeSet
     * @type {Guid}
     */
    static IID => Guid("{26ee67bf-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The class identifier for SWbemPrivilegeSet
     * @type {Guid}
     */
    static CLSID => Guid("{26ee67be-5804-11d2-8b4a-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove", "DeleteAll", "AddAsString"]

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
     * @param {Integer} iPrivilege 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    Item(iPrivilege, objWbemPrivilege) {
        result := ComCall(8, this, "int", iPrivilege, "ptr*", objWbemPrivilege, "HRESULT")
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
     * @param {Integer} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    Add(iPrivilege, bIsEnabled, objWbemPrivilege) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr*", objWbemPrivilege, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @returns {HRESULT} 
     */
    Remove(iPrivilege) {
        result := ComCall(11, this, "int", iPrivilege, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeleteAll() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @param {Pointer<ISWbemPrivilege>} objWbemPrivilege 
     * @returns {HRESULT} 
     */
    AddAsString(strPrivilege, bIsEnabled, objWbemPrivilege) {
        strPrivilege := strPrivilege is String ? BSTR.Alloc(strPrivilege).Value : strPrivilege

        result := ComCall(13, this, "ptr", strPrivilege, "short", bIsEnabled, "ptr*", objWbemPrivilege, "HRESULT")
        return result
    }
}
