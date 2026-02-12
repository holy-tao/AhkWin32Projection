#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk
#Include .\SnapIn.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SnapIns extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SnapIns
     * @type {Guid}
     */
    static IID => Guid("{2ef3de1d-b12a-49d1-92c5-0b00798768f1}")

    /**
     * The class identifier for SnapIns
     * @type {Guid}
     */
    static CLSID => Guid("{2ef3de1d-b12a-49d1-92c5-0b00798768f1}")

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
        result := ComCall(7, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retval)
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} Index 
     * @returns {SnapIn} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &SnapIn_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SnapIn(SnapIn_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {BSTR} SnapinNameOrCLSID 
     * @param {VARIANT} ParentSnapin 
     * @param {VARIANT} Properties_ 
     * @returns {SnapIn} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(SnapinNameOrCLSID, ParentSnapin, Properties_) {
        if(SnapinNameOrCLSID is String) {
            pin := BSTR.Alloc(SnapinNameOrCLSID)
            SnapinNameOrCLSID := pin.Value
        }

        result := ComCall(10, this, "ptr", SnapinNameOrCLSID, "ptr", ParentSnapin, "ptr", Properties_, "ptr*", &SnapIn_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SnapIn(SnapIn_)
    }

    /**
     * Creating, Altering, and Removing Views
     * @param {SnapIn} SnapIn_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/server-management-objects-smo/tasks/creating-altering-and-removing-views
     */
    Remove(SnapIn_) {
        result := ComCall(11, this, "ptr", SnapIn_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
