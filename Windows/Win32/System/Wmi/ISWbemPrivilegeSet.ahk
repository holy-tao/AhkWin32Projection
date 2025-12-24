#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemPrivilege.ahk
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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pUnk := 0, "HRESULT")
        return IUnknown(pUnk)
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @returns {ISWbemPrivilege} 
     */
    Item(iPrivilege) {
        result := ComCall(8, this, "int", iPrivilege, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "HRESULT")
        return iCount
    }

    /**
     * 
     * @param {Integer} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     */
    Add(iPrivilege, bIsEnabled) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
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
     * @returns {ISWbemPrivilege} 
     */
    AddAsString(strPrivilege, bIsEnabled) {
        strPrivilege := strPrivilege is String ? BSTR.Alloc(strPrivilege).Value : strPrivilege

        result := ComCall(13, this, "ptr", strPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }
}
