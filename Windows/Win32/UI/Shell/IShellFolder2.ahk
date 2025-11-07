#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumExtraSearch.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include Common\SHELLDETAILS.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include .\IShellFolder.ahk

/**
 * Extends the capabilities of IShellFolder. Its methods provide a variety of information about the contents of a Shell folder.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IShellFolder2</b> if your namespace extension provides services to clients beyond those in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Call <b>IShellFolder2</b> when you need detailed information on items contained by a Shell folder. This interface supersedes <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishelldetails">IShellDetails</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellfolder2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolder2 extends IShellFolder{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellFolder2
     * @type {Guid}
     */
    static IID => Guid("{93f2f68c-1d1b-11d3-a30e-00c04f79abd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultSearchGUID", "EnumSearches", "GetDefaultColumn", "GetDefaultColumnState", "GetDetailsEx", "GetDetailsOf", "MapColumnToSCID"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultsearchguid
     */
    GetDefaultSearchGUID() {
        pguid := Guid()
        result := ComCall(13, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * 
     * @returns {IEnumExtraSearch} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-enumsearches
     */
    EnumSearches() {
        result := ComCall(14, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExtraSearch(ppenum)
    }

    /**
     * 
     * @param {Integer} dwRes 
     * @param {Pointer<Integer>} pSort 
     * @param {Pointer<Integer>} pDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumn
     */
    GetDefaultColumn(dwRes, pSort, pDisplay) {
        pSortMarshal := pSort is VarRef ? "uint*" : "ptr"
        pDisplayMarshal := pDisplay is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRes, pSortMarshal, pSort, pDisplayMarshal, pDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iColumn 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumnstate
     */
    GetDefaultColumnState(iColumn) {
        result := ComCall(16, this, "uint", iColumn, "int*", &pcsFlags := 0, "HRESULT")
        return pcsFlags
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsex
     */
    GetDetailsEx(pidl, pscid) {
        pv := VARIANT()
        result := ComCall(17, this, "ptr", pidl, "ptr", pscid, "ptr", pv, "HRESULT")
        return pv
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} iColumn 
     * @returns {SHELLDETAILS} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof
     */
    GetDetailsOf(pidl, iColumn) {
        psd := SHELLDETAILS()
        result := ComCall(18, this, "ptr", pidl, "uint", iColumn, "ptr", psd, "HRESULT")
        return psd
    }

    /**
     * 
     * @param {Integer} iColumn 
     * @returns {PROPERTYKEY} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-mapcolumntoscid
     */
    MapColumnToSCID(iColumn) {
        pscid := PROPERTYKEY()
        result := ComCall(19, this, "uint", iColumn, "ptr", pscid, "HRESULT")
        return pscid
    }
}
