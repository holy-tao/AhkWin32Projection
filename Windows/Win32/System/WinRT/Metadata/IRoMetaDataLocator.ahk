#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Enables the RoGetParameterizedTypeInstanceIID function to access run-time metadata.
 * @see https://learn.microsoft.com/windows/win32/api/roparameterizediid/ns-roparameterizediid-irometadatalocator
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IRoMetaDataLocator extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Locate"]

    /**
     * Finds the catalog that indexes a directory.
     * @remarks
     * Use the <b>LocateCatalogs</b> function to determine catalogs that cover a specific scope. If the computer and catalog are known, it's more efficient to execute a query without calling the <b>LocateCatalogs</b> function.
     * 
     * 
     * 
     * The <b>LocateCatalogs</b> function does not verify that the computer and catalog returned are available. If an application fails to issue a query with the computer and catalog returned, it should increment <i>iBmk</i> and call <b>LocateCatalogs</b> again to get the next computer and catalog that index the specified scope.
     * 
     * If a computer-and-catalog match is found but the computer and catalog buffers are not large enough, <b>LocateCatalogs</b> returns S_OK, and fills the <i>pcCat</i> and <i>pcMachine</i> parameters with the wide character count required. Callers of <b>LocateCatalogs</b> must check the return code, <i>pcMachine</i>, and <i>pcCat</i> to determine whether the call was successful. 
     * 
     * 
     * 
     * <div class="alert"><b>Note</b>  If <b>LocateCatalogs</b> finds a catalog that includes the path in <i>pwszScope</i>, it does not determine whether the scope is excluded for that catalog.</div>
     * <div> </div>
     * @param {PWSTR} nameElement 
     * @param {IRoSimpleMetaDataBuilder} metaDataDestination 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No computer  and catalog can be found that index the scope, or <i>iBmk</i> is beyond the count of computers and catalogs that index the scope.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>QUERY_E_INVALID_DIRECTORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The function received an invalid scope.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ntquery/nf-ntquery-locatecatalogsw
     */
    Locate(nameElement, metaDataDestination) {
        nameElement := nameElement is String ? StrPtr(nameElement) : nameElement

        result := ComCall(0, this, "ptr", nameElement, "ptr", metaDataDestination, "HRESULT")
        return result
    }
}
