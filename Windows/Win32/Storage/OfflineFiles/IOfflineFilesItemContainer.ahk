#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumOfflineFilesItems.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to access item enumeration functionality in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilesitemcontainer
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesItemContainer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesItemContainer
     * @type {Guid}
     */
    static IID => Guid("{3836f049-9413-45dd-bf46-b5aaa82dc310}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumItems", "EnumItemsEx"]

    /**
     * Returns an enumerator of child items for the cache item implementing this method. (IOfflineFilesItemContainer.EnumItems)
     * @remarks
     * To begin a top-down enumeration of the entire cache, perform the following steps:
     * 
     * <ol>
     * <li>Create an instance of <b>CLSID_OfflineFilesCache</b> and obtain its <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> interface.</li>
     * <li>Call the <b>EnumItems</b> method to obtain an enumerator for the server entries.</li>
     * <li>For each entry returned, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a>.</li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> succeeds, the item supports children.  If so, enumerate each child, calling <b>QueryInterface</b> for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> on each.  This pattern may be recursively applied to enumerate the entire cache.</li>
     * </ol>
     * @param {Integer} dwQueryFlags Flags affecting the amount of query activity at the time of enumeration.  The parameter may contain one or more of the following bit flags.
     * @returns {IEnumOfflineFilesItems} Enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitems
     */
    EnumItems(dwQueryFlags) {
        result := ComCall(3, this, "uint", dwQueryFlags, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumOfflineFilesItems(ppenum)
    }

    /**
     * Returns an enumerator of child items for the cache item implementing this method. (IOfflineFilesItemContainer.EnumItemsEx)
     * @remarks
     * To begin a top-down enumeration of the entire cache, perform the following steps:
     * 
     * <ol>
     * <li>Create an instance of <b>CLSID_OfflineFilesCache</b> and obtain its 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> interface.</li>
     * <li>Call the <b>EnumItemsEx</b> method to obtain an enumerator for the server entries.</li>
     * <li>For each entry returned, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a>.</li>
     * <li>If <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> succeeds, the item supports children.  If so, enumerate each child, calling <b>QueryInterface</b> for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitemcontainer">IOfflineFilesItemContainer</a> on each.  This pattern may be recursively applied to enumerate the entire cache.</li>
     * </ol>
     * It is possible to provide both inclusion and exclusion filters to the same enumeration. In such a case, the results are as follows for any particular item being evaluated.
     * 
     * <table>
     * <tr>
     * <th></th>
     * <th>Inclusion Match</th>
     * <th>Inclusion No Match</th>
     * </tr>
     * <tr>
     * <th>Exclusion Match</th>
     * <td>Excluded</td>
     * <td>Excluded</td>
     * </tr>
     * <tr>
     * <th>Exclusion No Match</th>
     * <td>Included</td>
     * <td>Excluded</td>
     * </tr>
     * </table>
     *  
     * 
     * As the table illustrates, if the exclusion filter matches or the inclusion filter does not match, the item is excluded from enumeration.  For an item to be included in the enumeration, the exclusion filter must not match and the inclusion filter must match.
     * @param {IOfflineFilesItemFilter} pIncludeFileFilter If provided, references the filter applied to the decision to include files.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pIncludeDirFilter If provided, references the filter applied to the decision to include directories.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pExcludeFileFilter If provided, references the filter applied to the decision to exclude files.  This parameter is optional and can be <b>NULL</b>.
     * @param {IOfflineFilesItemFilter} pExcludeDirFilter If provided, references the filter applied to the decision to exclude directories.  This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} dwEnumFlags Flags affecting the type of enumeration performed.  The parameter may contain one or more of the following flag bits.
     * @param {Integer} dwQueryFlags Flags affecting the amount of query activity at the time of enumeration.  The parameter can contain one or more of the following bit flags.
     * @returns {IEnumOfflineFilesItems} Enumerator of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nn-cscobj-iofflinefilesitem">IOfflineFilesItem</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilesitemcontainer-enumitemsex
     */
    EnumItemsEx(pIncludeFileFilter, pIncludeDirFilter, pExcludeFileFilter, pExcludeDirFilter, dwEnumFlags, dwQueryFlags) {
        result := ComCall(4, this, "ptr", pIncludeFileFilter, "ptr", pIncludeDirFilter, "ptr", pExcludeFileFilter, "ptr", pExcludeDirFilter, "uint", dwEnumFlags, "uint", dwQueryFlags, "ptr*", &ppenum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumOfflineFilesItems(ppenum)
    }
}
