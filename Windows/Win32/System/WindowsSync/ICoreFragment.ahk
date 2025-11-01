#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents knowledge of all items in the scope for a specific set of change units.
 * @remarks
 * 
  * An <b>ISyncKnowledge2</b> object contains one or more <b>ICoreFragment</b> objects, each of which contains knowledge that applies to a specific set of change units. Typically, one of the <b>ICoreFragment</b> objects contains no change unit IDs. The knowledge that is contained in the <b>ICoreFragment</b> object that contains no change unit IDs applies to all change unit IDs that are not otherwise contained in another <b>ICoreFragment</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-icorefragment
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ICoreFragment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFragment
     * @type {Guid}
     */
    static IID => Guid("{613b2ab5-b304-47d9-9c31-ce6c54401a15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NextColumn", "NextRange", "Reset", "GetColumnCount", "GetRangeCount"]

    /**
     * 
     * @param {Pointer<Integer>} pChangeUnitId 
     * @param {Pointer<Integer>} pChangeUnitIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-nextcolumn
     */
    NextColumn(pChangeUnitId, pChangeUnitIdSize) {
        result := ComCall(3, this, "char*", pChangeUnitId, "uint*", pChangeUnitIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pItemId 
     * @param {Pointer<Integer>} pItemIdSize 
     * @param {Pointer<IClockVector>} piClockVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-nextrange
     */
    NextRange(pItemId, pItemIdSize, piClockVector) {
        result := ComCall(4, this, "char*", pItemId, "uint*", pItemIdSize, "ptr*", piClockVector, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pColumnCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-getcolumncount
     */
    GetColumnCount(pColumnCount) {
        result := ComCall(6, this, "uint*", pColumnCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRangeCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-icorefragment-getrangecount
     */
    GetRangeCount(pRangeCount) {
        result := ComCall(7, this, "uint*", pRangeCount, "HRESULT")
        return result
    }
}
