#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Provides methods for registering and unregistering component category information in the registry. This includes both the human-readable names of categories and the categories implemented/required by a given component or class.
 * @see https://docs.microsoft.com/windows/win32/api//comcat/nn-comcat-icatregister
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ICatRegister extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatRegister
     * @type {Guid}
     */
    static IID => Guid("{0002e012-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterCategories", "UnRegisterCategories", "RegisterClassImplCategories", "UnRegisterClassImplCategories", "RegisterClassReqCategories", "UnRegisterClassReqCategories"]

    /**
     * Registers one or more component categories. Each component category consists of a CATID and a list of locale-dependent description strings.
     * @param {Integer} cCategories The number of component categories to be registered.
     * @param {Pointer<CATEGORYINFO>} rgCategoryInfo An array of <a href="https://docs.microsoft.com/windows/desktop/api/comcat/ns-comcat-categoryinfo">CATEGORYINFO</a> structures, one for each category to be registered. By providing the same CATID for multiple <b>CATEGORYINFO</b> structures, multiple locales can be registered for the same component category.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-registercategories
     */
    RegisterCategories(cCategories, rgCategoryInfo) {
        result := ComCall(3, this, "uint", cCategories, "ptr", rgCategoryInfo, "HRESULT")
        return result
    }

    /**
     * Removes the registration of one or more component categories. Each component category consists of a CATID and a list of locale-dependent description strings.
     * @param {Integer} cCategories The number of categories to be removed.
     * @param {Pointer<Guid>} rgcatid The CATIDs of the categories to be removed.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-unregistercategories
     */
    UnRegisterCategories(cCategories, rgcatid) {
        result := ComCall(4, this, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * Registers the class as implementing one or more component categories.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of categories to be associated as category identifiers for the class.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs to associate as category identifiers for the class.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-registerclassimplcategories
     */
    RegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(5, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * Removes one or more implemented category identifiers from a class.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be removed.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs that are to be removed. Only the category IDs specified in this array are removed.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-unregisterclassimplcategories
     */
    UnRegisterClassImplCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(6, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * Registers the class as requiring one or more component categories.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be associated as category identifiers for the class.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs to be associated as category identifiers for the class.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-registerclassreqcategories
     */
    RegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(7, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }

    /**
     * Removes one or more required category identifiers from a class.
     * @param {Pointer<Guid>} rclsid The class identifier.
     * @param {Integer} cCategories The number of category CATIDs to be removed.
     * @param {Pointer<Guid>} rgcatid An array of CATIDs that are to be removed. Only the category IDs specified in this array are removed.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
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
     * One or more arguments are incorrect.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//comcat/nf-comcat-icatregister-unregisterclassreqcategories
     */
    UnRegisterClassReqCategories(rclsid, cCategories, rgcatid) {
        result := ComCall(8, this, "ptr", rclsid, "uint", cCategories, "ptr", rgcatid, "HRESULT")
        return result
    }
}
