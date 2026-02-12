#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\View.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Views Limitations
 * @see https://learn.microsoft.com/sql/ocs/docs/odbc/microsoft/views-limitations
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Views extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Views
     * @type {Guid}
     */
    static IID => Guid("{d6b8c29d-a1ff-4d72-aab0-e381e9b9338d}")

    /**
     * The class identifier for Views
     * @type {Guid}
     */
    static CLSID => Guid("{d6b8c29d-a1ff-4d72-aab0-e381e9b9338d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get_Count", "Add", "get__NewEnum"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * Windows Image Acquisition (WIA) hardware devices are represented as hierarchical trees of Item objects. The root item in this tree represents the device itself, while child items represent images, folders, or scanning beds.
     * @remarks
     * The **Item** object has these types of members:
     * 
     * -   [Methods](#methods)
     * -   [Properties](#properties)
     * @param {Integer} Index 
     * @returns {View} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &View_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return View(View_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &Count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Count
    }

    /**
     * You can add, show, hide, and delete sections in the ShapeSheet.
     * @param {Node} Node_ 
     * @param {Integer} viewOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/add-show-hide-or-delete-a-section
     */
    Add(Node_, viewOptions) {
        result := ComCall(9, this, "ptr", Node_, "int", viewOptions, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &retval := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(retval)
    }
}
