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
     * Returns the globally unique identifier (GUID) of the default search object for the folder.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * The GUID of the default search object.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultsearchguid
     */
    GetDefaultSearchGUID() {
        pguid := Guid()
        result := ComCall(13, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * Requests a pointer to an interface that allows a client to enumerate the available search objects.
     * @returns {IEnumExtraSearch} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a>**</b>
     * 
     * The address of a pointer to an enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-enumsearches
     */
    EnumSearches() {
        result := ComCall(14, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumExtraSearch(ppenum)
    }

    /**
     * Gets the default sorting and display columns.
     * @param {Integer} dwRes Type: <b>DWORD</b>
     * 
     * Reserved. Set to zero.
     * @param {Pointer<Integer>} pSort Type: <b>ULONG*</b>
     * 
     * A pointer to a value that receives the index of the default sorted column.
     * @param {Pointer<Integer>} pDisplay Type: <b>ULONG*</b>
     * 
     * A pointer to a value that receives the index of the default display column.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or a COM error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumn
     */
    GetDefaultColumn(dwRes, pSort, pDisplay) {
        pSortMarshal := pSort is VarRef ? "uint*" : "ptr"
        pDisplayMarshal := pDisplay is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRes, pSortMarshal, pSort, pDisplayMarshal, pDisplay, "HRESULT")
        return result
    }

    /**
     * Gets the default state for a specified column.
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * An integer that specifies the column number.
     * @returns {Integer} Type: <b>SHCOLSTATEF*</b>
     * 
     * A pointer to a value that contains flags that indicate the default column state. This parameter can include a combination of the following flags.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumnstate
     */
    GetDefaultColumnState(iColumn) {
        result := ComCall(16, this, "uint", iColumn, "int*", &pcsFlags := 0, "HRESULT")
        return pcsFlags
    }

    /**
     * Gets detailed information, identified by a property set identifier (FMTID) and a property identifier (PID), on an item in a Shell folder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL of the item, relative to the parent folder. This method accepts only single-level PIDLs. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero. This value cannot be <b>NULL</b>.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that identifies the column.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * A pointer to a <b>VARIANT</b> with the requested information. The value is fully typed. The value returned for properties from the property system must conform to the type specified in that property definition's <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> as the <i>legacyType</i> attribute.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsex
     */
    GetDetailsEx(pidl, pscid) {
        pv := VARIANT()
        result := ComCall(17, this, "ptr", pidl, "ptr", pscid, "ptr", pv, "HRESULT")
        return pv
    }

    /**
     * Gets detailed information, identified by a column index, on an item in a Shell folder.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * PIDL of the item for which you are requesting information. This method accepts only single-level PIDLs. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero. If this parameter is set to <b>NULL</b>, the title of the information field specified by <i>iColumn</i> is returned.
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * The zero-based index of the desired information field. It is identical to the column number of the information as it is displayed in a Windows Explorer Details view.
     * @returns {SHELLDETAILS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a> structure that contains the information.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof
     */
    GetDetailsOf(pidl, iColumn) {
        psd := SHELLDETAILS()
        result := ComCall(18, this, "ptr", pidl, "uint", iColumn, "ptr", psd, "HRESULT")
        return psd
    }

    /**
     * Converts a column to the appropriate property set ID (FMTID) and property ID (PID).
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * The column ID.
     * @returns {PROPERTYKEY} Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure containing the FMTID and PID.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-ishellfolder2-mapcolumntoscid
     */
    MapColumnToSCID(iColumn) {
        pscid := PROPERTYKEY()
        result := ComCall(19, this, "uint", iColumn, "ptr", pscid, "HRESULT")
        return pscid
    }
}
