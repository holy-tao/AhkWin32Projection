#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMSearchCriteria interface allows you to define the criteria to use for search operations when using the Group Policy Management Console (GPMC) interfaces. To create a GPMSearchCriteria object, call the IGPM::CreateSearchCriteria method.
 * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nn-gpmgmt-igpmsearchcriteria
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMSearchCriteria extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMSearchCriteria
     * @type {Guid}
     */
    static IID => Guid("{d6f11c42-829b-48d4-83f5-3615b67dfc22}")

    /**
     * The class identifier for GPMSearchCriteria
     * @type {Guid}
     */
    static CLSID => Guid("{17aaca26-5ce0-44fa-8cc0-5259e6483566}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add"]

    /**
     * Adds a criterion for search operations.
     * @remarks
     * Following is a table that contains the valid combinations for the <i>searchProperty</i>, <i>searchOperation</i>, and <i>varValue</i> parameters.
     * 
     * <div class="alert"><b>Note</b>  Multiple calls to <b>IGPMSearchCriteria::Add</b> will result in a logical <b>And</b> operation of search criteria. This call does not support the <b>Or</b> logical operation functionality. Also, you can perform a <b>Not</b> of an individual criteria, but cannot perform a <b>Not</b> of a search result.</div>
     * <div> </div>
     * <table>
     * <tr>
     * <th>Search Property</th>
     * <th>Search Operator</th>
     * <th>Value</th>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoPermissions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * GPMPermission
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoEffectivePermissions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * GPMPermission
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoID</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * opNotEquals
     * 
     * </td>
     * <td>
     * <b>GUID</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>somLinks</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * </td>
     * <td>
     * GPMGPO
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoDomain</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * </td>
     * <td>
     * GPMDomain
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>backupMostRecent</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * </td>
     * <td>
     * TRUE
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoWMIFilter</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * </td>
     * <td>
     * GPMWMIFilter
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>backupDomain</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * </td>
     * <td>
     * String containing the domain name
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoComputerExtensions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * <b>GUID</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoUserExtensions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * <b>GUID</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>gpoDisplayName</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * User-friendly GPO display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>starterGPOPermissions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * GPMPermission
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>starterGPOEffectivePermissions</b>
     * 
     * </td>
     * <td>
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * GPMPermission
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>starterGPODisplayName</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * opContains
     * 
     * opNotContains
     * 
     * </td>
     * <td>
     * User-friendly Starter GPO display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>starterGPOID</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * opNotEquals
     * 
     * </td>
     * <td>
     * <b>GUID</b>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * <b>starterGPODomain</b>
     * 
     * </td>
     * <td>
     * opEquals
     * 
     * </td>
     * <td>
     * GPMDomain
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} searchProperty The search property to evaluate. For a valid combination of search properties, search operations, and values, see the  Remarks section.
     * @param {Integer} searchOperation The operation to use to evaluate <i>searchProperty</i> using the value specified by <i>varValue</i>.
     * @param {VARIANT} varValue The value to evaluate <i>searchProperty</i> against.
     * @returns {HRESULT} <h3>JScript</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * 
     * <h3>VB</h3>
     * Returns <b>S_OK</b> if successful. Returns a failure code if an error occurs.
     * @see https://learn.microsoft.com/windows/win32/api//content/gpmgmt/nf-gpmgmt-igpmsearchcriteria-add
     */
    Add(searchProperty, searchOperation, varValue) {
        result := ComCall(7, this, "int", searchProperty, "int", searchOperation, "ptr", varValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
