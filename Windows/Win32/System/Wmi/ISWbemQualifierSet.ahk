#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemQualifier.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemQualifierSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemQualifierSet
     * @type {Guid}
     */
    static IID => Guid("{9b16ed16-d3df-11d1-8b08-00600806d9b6}")

    /**
     * The class identifier for SWbemQualifierSet
     * @type {Guid}
     */
    static CLSID => Guid("{04b83d5e-21ae-11d2-8b33-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove"]

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
     * @param {BSTR} name 
     * @param {Integer} iFlags 
     * @returns {ISWbemQualifier} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(name, iFlags) {
        if(name is String) {
            pin := BSTR.Alloc(name)
            name := pin.Value
        }

        result := ComCall(8, this, "ptr", name, "int", iFlags, "ptr*", &objWbemQualifier := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemQualifier(objWbemQualifier)
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
     * @param {BSTR} strName 
     * @param {Pointer<VARIANT>} varVal 
     * @param {VARIANT_BOOL} bPropagatesToSubclass 
     * @param {VARIANT_BOOL} bPropagatesToInstance 
     * @param {VARIANT_BOOL} bIsOverridable 
     * @param {Integer} iFlags 
     * @returns {ISWbemQualifier} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(strName, varVal, bPropagatesToSubclass, bPropagatesToInstance, bIsOverridable, iFlags) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(10, this, "ptr", strName, "ptr", varVal, "short", bPropagatesToSubclass, "short", bPropagatesToInstance, "short", bIsOverridable, "int", iFlags, "ptr*", &objWbemQualifier := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemQualifier(objWbemQualifier)
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(strName, iFlags) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(11, this, "ptr", strName, "int", iFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
