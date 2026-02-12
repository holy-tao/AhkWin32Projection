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
        result := ComCall(7, this, "ptr*", &pUnk := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(pUnk)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} iPrivilege 
     * @returns {ISWbemPrivilege} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(iPrivilege) {
        result := ComCall(8, this, "int", iPrivilege, "ptr*", &objWbemPrivilege := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &iCount := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return iCount
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {Integer} iPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(iPrivilege, bIsEnabled) {
        result := ComCall(10, this, "int", iPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemPrivilege(objWbemPrivilege)
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {Integer} iPrivilege 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(iPrivilege) {
        result := ComCall(11, this, "int", iPrivilege, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} strPrivilege 
     * @param {VARIANT_BOOL} bIsEnabled 
     * @returns {ISWbemPrivilege} 
     */
    AddAsString(strPrivilege, bIsEnabled) {
        if(strPrivilege is String) {
            pin := BSTR.Alloc(strPrivilege)
            strPrivilege := pin.Value
        }

        result := ComCall(13, this, "ptr", strPrivilege, "short", bIsEnabled, "ptr*", &objWbemPrivilege := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemPrivilege(objWbemPrivilege)
    }
}
