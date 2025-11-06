#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumExtraSearch.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A standard OLE enumerator used by a client to determine the available search objects for a folder.
 * @remarks
 * 
  * Implement <b>IEnumExtraSearch</b> if your namespace extension supports one or more search objects.
  * 
  * You do not call this interface directly. An <b>IEnumExtraSearch</b> interface is requested by a client only after it has determined that the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder2">IShellFolder2</a> interface is exposed. Clients retrieve a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-enumsearches">IShellFolder2::EnumSearches</a>.
  * 
  * <b>IEnumExtraSearch</b> implements <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> and the standard OLE enumeration methods.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ienumextrasearch
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumExtraSearch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumExtraSearch
     * @type {Guid}
     */
    static IID => Guid("{0e700be1-9db6-11d1-a1ce-00c04fd75d13}")

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
     * @param {Pointer<EXTRASEARCH>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumExtraSearch} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumextrasearch-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExtraSearch(ppenum)
    }
}
