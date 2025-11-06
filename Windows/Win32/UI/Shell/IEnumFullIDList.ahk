#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumFullIDList.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a standard set of methods that enumerate the pointers to item identifier lists (PIDLs) of the items in a Shell folder.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumfullidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumFullIDList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumFullIDList
     * @type {Guid}
     */
    static IID => Guid("{d0191542-7954-4908-bc06-b2360bbe45ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<Pointer<ITEMIDLIST>>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-next
     */
    Next(celt, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumFullIDList} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumfullidlist-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumFullIDList(ppenum)
    }
}
