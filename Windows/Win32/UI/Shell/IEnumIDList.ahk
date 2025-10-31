#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a standard set of methods used to enumerate the pointers to item identifier lists (PIDLs) of the items in a Shell folder.
 * @remarks
 * 
  * All Shell folder objects must be able to respond to a call to their <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method by creating an enumeration object that exports <b>IEnumIDList</b>. The Shell, in particular, uses these objects to enumerate the items in a folder.
  * 
  * Use this interface to enumerate the contents of a Shell folder object. Call the folder's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-enumobjects">IShellFolder::EnumObjects</a> method and use the returned <b>IEnumIDList</b> pointer to enumerate the PIDLs of the items in the folder.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumIDList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumIDList
     * @type {Guid}
     */
    static IID => Guid("{000214f2-0000-0000-c000-000000000046}")

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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-next
     */
    Next(celt, rgelt, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr*", rgelt, "uint*", pceltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-reset
     */
    Reset() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumIDList>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumidlist-clone
     */
    Clone(ppenum) {
        result := ComCall(6, this, "ptr*", ppenum, "int")
        return result
    }
}
