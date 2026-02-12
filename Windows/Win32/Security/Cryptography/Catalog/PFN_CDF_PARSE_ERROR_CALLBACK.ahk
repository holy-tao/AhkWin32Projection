#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Called for Catalog Definition Function errors while parsing a catalog definition file (CDF).
 * @remarks
 * The <i>dwErrorArea</i> parameter can have the following possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_HEADER</td>
 * <td>The header section of the CDF</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_MEMBER</td>
 * <td>A member file entry in the CatalogFiles section of the CDF</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_AREA_ATTRIBUTE</td>
 * <td>An attribute entry in the CDF</td>
 * </tr>
 * </table>
 *  
 * 
 * The <i>dwLocalError</i> parameter can have the following possible values.
 * 
 * <table>
 * <tr>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_UNSUPPORTED</td>
 * <td>The function does not support the attribute.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_DUPLICATE</td>
 * <td>The file member already exists.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_TAGNOTFOUND</td>
 * <td>The CatalogHeader or Name tag is missing.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_FILE_PATH</td>
 * <td>The member file name or path is missing.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_INDIRECTDATA</td>
 * <td>The function failed to create a hash of the member subject.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_MEMBER_FILENOTFOUND</td>
 * <td>The function failed to find the member file.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_BAD_GUID_CONV</td>
 * <td>The function failed to convert the subject string to a GUID.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_ATTR_TOOFEWVALUES</td>
 * <td>The attribute line is missing one or more elements of its composition including type, <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifier</a> (OID) or name, or value.</td>
 * </tr>
 * <tr>
 * <td>CRYPTCAT_E_CDF_ATTR_TYPECOMBO</td>
 * <td>The attribute contains an invalid OID, or the combination of type, name or OID, and value is not valid.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/mscat/nc-mscat-pfn_cdf_parse_error_callback
 * @namespace Windows.Win32.Security.Cryptography.Catalog
 * @version v4.0.30319
 */
class PFN_CDF_PARSE_ERROR_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} dwErrorArea 
     * @param {Integer} dwLocalError 
     * @param {PWSTR} pwszLine 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwErrorArea, dwLocalError, pwszLine) {
        pwszLine := pwszLine is String ? StrPtr(pwszLine) : pwszLine

        ComCall(3, this, "uint", dwErrorArea, "uint", dwLocalError, "ptr", pwszLine)
    }
}
