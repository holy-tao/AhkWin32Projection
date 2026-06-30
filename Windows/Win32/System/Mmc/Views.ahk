#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk
#Include .\_ViewOptions.ahk
#Include .\View.ahk
#Include ..\Com\IUnknown.ahk
#Include .\Node.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class Views extends IDispatch {

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
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(7, this, "int", Index, "ptr*", &_View := 0, "HRESULT")
        return View(_View)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {Node} _Node 
     * @param {_ViewOptions} viewOptions 
     * @returns {HRESULT} 
     */
    Add(_Node, viewOptions) {
        result := ComCall(9, this, "ptr", _Node, "int", viewOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(10, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }
}
