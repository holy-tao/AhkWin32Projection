#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk
#Include .\SnapIn.ahk
#Include ..\Variant\VARIANT.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 */
class SnapIns extends IDispatch {

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
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-item
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &_SnapIn := 0, "HRESULT")
        return SnapIn(_SnapIn)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &Count := 0, "HRESULT")
        return Count
    }

    /**
     * 
     * @param {BSTR} SnapinNameOrCLSID 
     * @param {VARIANT} ParentSnapin 
     * @param {VARIANT} _Properties 
     * @returns {SnapIn} 
     */
    Add(SnapinNameOrCLSID, ParentSnapin, _Properties) {
        SnapinNameOrCLSID := SnapinNameOrCLSID is String ? BSTR.Alloc(SnapinNameOrCLSID).Value : SnapinNameOrCLSID

        result := ComCall(10, this, "ptr", SnapinNameOrCLSID, "ptr", ParentSnapin, "ptr", _Properties, "ptr*", &_SnapIn := 0, "HRESULT")
        return SnapIn(_SnapIn)
    }

    /**
     * 
     * @param {SnapIn} _SnapIn 
     * @returns {HRESULT} 
     */
    Remove(_SnapIn) {
        result := ComCall(11, this, "ptr", _SnapIn, "HRESULT")
        return result
    }
}
