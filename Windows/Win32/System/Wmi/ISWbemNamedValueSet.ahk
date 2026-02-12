#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ISWbemNamedValue.ahk
#Include .\ISWbemNamedValueSet.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class ISWbemNamedValueSet extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISWbemNamedValueSet
     * @type {Guid}
     */
    static IID => Guid("{cf2376ea-ce8c-11d1-8b05-00600806d9b6}")

    /**
     * The class identifier for SWbemNamedValueSet
     * @type {Guid}
     */
    static CLSID => Guid("{9aed384e-ce8b-11d1-8b05-00600806d9b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count", "Add", "Remove", "Clone", "DeleteAll"]

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
     * @param {BSTR} strName 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(strName, iFlags) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(8, this, "ptr", strName, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemNamedValue(objWbemNamedValue)
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
     * @param {Pointer<VARIANT>} varValue 
     * @param {Integer} iFlags 
     * @returns {ISWbemNamedValue} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(strName, varValue, iFlags) {
        if(strName is String) {
            pin := BSTR.Alloc(strName)
            strName := pin.Value
        }

        result := ComCall(10, this, "ptr", strName, "ptr", varValue, "int", iFlags, "ptr*", &objWbemNamedValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemNamedValue(objWbemNamedValue)
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

    /**
     * Clone Method Example (VC++)
     * @returns {ISWbemNamedValueSet} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(12, this, "ptr*", &objWbemNamedValueSet := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISWbemNamedValueSet(objWbemNamedValueSet)
    }

    /**
     * The DeleteAllGPOLinks function deletes all GPO links for the specified site, domain, or organizational unit.
     * @returns {HRESULT} If the function succeeds, the return value is <b>S_OK</b>. Otherwise, the function returns one of the COM error codes defined in the header file WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpedit/nf-gpedit-deleteallgpolinks
     */
    DeleteAll() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
