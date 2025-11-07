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
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {SnapIn} 
     */
    Item(Index) {
        result := ComCall(8, this, "int", Index, "ptr*", &SnapIn := 0, "HRESULT")
        return SnapIn(SnapIn)
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
     * @param {VARIANT} Properties 
     * @returns {SnapIn} 
     */
    Add(SnapinNameOrCLSID, ParentSnapin, Properties) {
        SnapinNameOrCLSID := SnapinNameOrCLSID is String ? BSTR.Alloc(SnapinNameOrCLSID).Value : SnapinNameOrCLSID

        result := ComCall(10, this, "ptr", SnapinNameOrCLSID, "ptr", ParentSnapin, "ptr", Properties, "ptr*", &SnapIn := 0, "HRESULT")
        return SnapIn(SnapIn)
    }

    /**
     * 
     * @param {SnapIn} SnapIn 
     * @returns {HRESULT} 
     */
    Remove(SnapIn) {
        result := ComCall(11, this, "ptr", SnapIn, "HRESULT")
        return result
    }
}
