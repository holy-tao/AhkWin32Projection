#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WbemPrivilegeEnum.ahk
#Include ..\..\Foundation\VARIANT_BOOL.ahk
#Include ..\..\Foundation\HRESULT.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\ISWbemPrivilege.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 */
class ISWbemPrivilegeSet extends IDispatch {

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
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {WbemPrivilegeEnum} iPrivilege 
     * @returns {ISWbemPrivilege} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
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
     * @param {WbemPrivilegeEnum} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     */
    Add(iPrivilege, bIsEnabled) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "HRESULT")
        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * 
     * @param {WbemPrivilegeEnum} iPrivilege 
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
