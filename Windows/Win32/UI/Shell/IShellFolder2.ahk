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
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, from which it inherits.
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * Implement <b>IShellFolder2</b> if your namespace extension provides services to clients beyond those in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>.
 * 
 * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
 * Call <b>IShellFolder2</b> when you need detailed information on items contained by a Shell folder. This interface supersedes <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishelldetails">IShellDetails</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nn-shobjidl_core-ishellfolder2
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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultsearchguid
     */
    GetDefaultSearchGUID() {
        pguid := Guid()
        result := ComCall(13, this, "ptr", pguid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pguid
    }

    /**
     * Requests a pointer to an interface that allows a client to enumerate the available search objects.
     * @returns {IEnumExtraSearch} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a>**</b>
     * 
     * The address of a pointer to an enumerator object's <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch">IEnumExtraSearch</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-enumsearches
     */
    EnumSearches() {
        result := ComCall(14, this, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumExtraSearch(ppenum)
    }

    /**
     * Gets the default sorting and display columns.
     * @remarks
     * <h3><a id="Notes_to_Users"></a><a id="notes_to_users"></a><a id="NOTES_TO_USERS"></a>Notes to Users</h3>
     * Both column indexes returned by this method are intended for use by an application that is presenting a folder view of this folder.
     * 
     * The column specified by 
     * 				<i>pSort</i> is the one that should be used for sorting the items in the folder. To determine the sorting order of any pair of items, pass their PIDLs to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder-compareids">CompareIDs</a>. Specify the column by setting the 
     * 				<i>lParam</i> parameter of <b>CompareIDs</b> to the value pointed to by 
     * 				<i>pSort</i>.
     * 
     * If a view will display only one string to represent an item, it should be taken from the column specified by 
     * 				<i>pDisplay</i>. Pass the column index and the item's PIDL to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof">IShellFolder2::GetDetailsOf</a> to retrieve the string.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method is part of a namespace extension's folder object implementation. It is typically called by a folder view object to ask the folder object which column in Microsoft Windows Explorer Details view should be used to sort the items in the folder. For example, a folder object that represents a transaction log might set 
     * 				<i>pSort</i> to the column that displays the transaction time. The items will then be sorted by the time the transaction took place, rather than by name.
     * 
     * Some clients might call this method to request the index of the column with the names that should be displayed in tree view. Set 
     * 				<i>pDisplay</i> to the appropriate column index. The client will then obtain the display names by calling <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof">IShellFolder2::GetDetailsOf</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumn
     */
    GetDefaultColumn(dwRes, pSort, pDisplay) {
        pSortMarshal := pSort is VarRef ? "uint*" : "ptr"
        pDisplayMarshal := pDisplay is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "uint", dwRes, pSortMarshal, pSort, pDisplayMarshal, pDisplay, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdefaultcolumnstate
     */
    GetDefaultColumnState(iColumn) {
        result := ComCall(16, this, "uint", iColumn, "int*", &pcsFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcsFlags
    }

    /**
     * Gets detailed information, identified by a property set identifier (FMTID) and a property identifier (PID), on an item in a Shell folder.
     * @remarks
     * This function is a more robust version of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof">IShellFolder2::GetDetailsOf</a>. It provides access to the information that is displayed in the Windows Explorer Details view of a Shell folder. The primary difference is that <b>GetDetailsEx</b> allows you to identify the column with an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">FMTID</a> and PID structure instead of having to first determine the column index.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * A PIDL of the item, relative to the parent folder. This method accepts only single-level PIDLs. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero. This value cannot be <b>NULL</b>.
     * @param {Pointer<PROPERTYKEY>} pscid Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that identifies the column.
     * @returns {VARIANT} Type: <b>VARIANT*</b>
     * 
     * A pointer to a <b>VARIANT</b> with the requested information. The value is fully typed. The value returned for properties from the property system must conform to the type specified in that property definition's <a href="https://docs.microsoft.com/windows/desktop/properties/propdesc-schema-typeinfo">typeInfo</a> as the <i>legacyType</i> attribute.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsex
     */
    GetDetailsEx(pidl, pscid) {
        pv := VARIANT()
        result := ComCall(17, this, "ptr", pidl, "ptr", pscid, "ptr", pv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pv
    }

    /**
     * Gets detailed information, identified by a column index, on an item in a Shell folder.
     * @remarks
     * The <b>IShellFolder2::GetDetailsOf</b> method is identical to <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nf-shlobj_core-ishelldetails-getdetailsof">GetDetailsOf</a>. For a more robust way to retrieve item information that does not require you to know the column index, use <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsex">IShellFolder2::GetDetailsEx</a>.
     * 
     * The <b>IShellFolder2::GetDetailsOf</b> method provides access to the information that is displayed in the Windows Explorer Details view of a Shell folder. The column numbers, headings, and information that you see in the Details view are identical to those of <b>IShellFolder2::GetDetailsOf</b>. Note that the available information fields and their column numbers vary depending on the particular folder. You can enumerate the available fields by calling this method with <i>pidl</i> set to <b>NULL</b>, and examining the title associated with each column index. Bear in mind that these titles can be localized and might not be the same for all locales.
     * 
     * File system folders have a large, standard set of information fields. The first four fields are standard for all file system folders.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Column index</th>
     * <th>Column title</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Name</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Size</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>Type</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>Date Modified</td>
     * </tr>
     * </table>
     *  
     * 
     * File system folders can support a number of additional fields. However, they are not required to do so, and the column indexes assigned to these fields might vary.
     * 
     * Each virtual folder has its own unique set of information fields. Normally, the item's display name is in column zero, but the order and content of the remaining fields depend on the implementation of the particular folder object.
     * @param {Pointer<ITEMIDLIST>} pidl Type: <b>PCUITEMID_CHILD</b>
     * 
     * PIDL of the item for which you are requesting information. This method accepts only single-level PIDLs. The structure must contain exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure followed by a terminating zero. If this parameter is set to <b>NULL</b>, the title of the information field specified by <i>iColumn</i> is returned.
     * @param {Integer} iColumn Type: <b>UINT</b>
     * 
     * The zero-based index of the desired information field. It is identical to the column number of the information as it is displayed in a Windows Explorer Details view.
     * @returns {SHELLDETAILS} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shelldetails">SHELLDETAILS</a> structure that contains the information.
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-getdetailsof
     */
    GetDetailsOf(pidl, iColumn) {
        psd := SHELLDETAILS()
        result := ComCall(18, this, "ptr", pidl, "uint", iColumn, "ptr", psd, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/shobjidl_core/nf-shobjidl_core-ishellfolder2-mapcolumntoscid
     */
    MapColumnToSCID(iColumn) {
        pscid := PROPERTYKEY()
        result := ComCall(19, this, "uint", iColumn, "ptr", pscid, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pscid
    }
}
