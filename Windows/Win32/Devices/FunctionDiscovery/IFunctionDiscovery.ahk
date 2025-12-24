#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include .\IFunctionInstance.ahk
#Include .\IFunctionInstanceCollectionQuery.ahk
#Include .\IFunctionInstanceQuery.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is used by client programs to discover function instances, get the default function instance for a category, and create advanced Function Discovery query objects that enable registering Function Discovery defaults, among other things.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscovery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscovery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscovery
     * @type {Guid}
     */
    static IID => Guid("{4df99b70-e148-4432-b004-4c9eeb535a5e}")

    /**
     * The class identifier for FunctionDiscovery
     * @type {Guid}
     */
    static CLSID => Guid("{c72be2ec-8e90-452c-b29a-ab8ff1c071fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInstanceCollection", "GetInstance", "CreateInstanceCollectionQuery", "CreateInstanceQuery", "AddInstance", "RemoveInstance"]

    /**
     * Gets the specified collection of function instances, based on category and subcategory.
     * @param {PWSTR} pszCategory The identifier of the category to be enumerated. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/category-definitions">Category Definitions</a>.
     * @param {PWSTR} pszSubCategory The identifier of the subcategory to be enumerated. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/subcategory-definitions">Subcategory Definitions</a>. This parameter can be <b>NULL</b>.
     * @param {BOOL} fIncludeAllSubCategories If <b>TRUE</b>, this method recursively enumerates all the subcategories of the category specified in <i>pszCategory</i>, returning a collection containing function instances from all the subcategories of <i>pszCategory</i>. 
     * 
     * 
     * 
     * If <b>FALSE</b>, this method restricts itself to returning function instances in the category specified by <i>pszCategory</i> and the subcategory specified by <i>pszSubCategory</i>.
     * @returns {IFunctionInstanceCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> interface pointer that receives the function instance collection containing the requested function instances. The collection is empty if no qualifying function instances are found.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-getinstancecollection
     */
    GetInstanceCollection(pszCategory, pszSubCategory, fIncludeAllSubCategories) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(3, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }

    /**
     * Gets the specified function instance, based on identifier.
     * @param {PWSTR} pszFunctionInstanceIdentity The identifier of the function instance (see <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getid">GetID</a>).
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer used to return the interface.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-getinstance
     */
    GetInstance(pszFunctionInstanceIdentity) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        result := ComCall(4, this, "ptr", pszFunctionInstanceIdentity, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Creates a query for a collection of specific function instances.
     * @param {PWSTR} pszCategory The category for the query. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/category-definitions">Category Definitions</a>.
     * @param {PWSTR} pszSubCategory The subcategory for the query. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/subcategory-definitions">Subcategory Definitions</a>. This parameter can be <b>NULL</b>.
     * 
     * Subcategory queries are only supported for layered categories and some provider categories. The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/registry-provider">Registry Provider</a>, the PnP-X association provider, and the publication provider support subcategory queries. Custom providers can be explicitly designed to support subcategory queries. This means the  <i>pszSubCategory</i> parameter should be set to a non-<b>NULL</b> value only when the <i>pszCategory</i> parameter is set to <b>FCTN_CATEGORY_REGISTRY</b>, <b>FCTN_CATEGORY_PUBLICATION</b>, <b>FCTN_CATEGORY_PNPXASSOCIATION</b>, or a custom category value defined for either a layered category or a custom provider supporting subcategory queries.
     * @param {BOOL} fIncludeAllSubCategories If <b>TRUE</b>, this method recursively creates a query for all the subcategories of the category specified in <i>pszCategory</i>, returning a collection containing function instances from all the subcategories of <i>pszCategory</i>. 
     * 
     * 
     * 
     * If <b>FALSE</b>, this method restricts the created query to returning function instances in the category specified by <i>pszCategory</i> and the subcategory specified by <i>pszSubCategory</i>.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface implemented by the calling application. This parameter can be <b>NULL</b>. This pointer is valid until the returned query object is released.
     * @param {Pointer<Integer>} pfdqcQueryContext A pointer to the context in which the query was created. The type <b>FDQUERYCONTEXT</b> is defined as a DWORDLONG.
     * @returns {IFunctionInstanceCollectionQuery} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollectionquery">IFunctionInstanceCollectionQuery</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancecollectionquery
     */
    CreateInstanceCollectionQuery(pszCategory, pszSubCategory, fIncludeAllSubCategories, pIFunctionDiscoveryNotification, pfdqcQueryContext) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        pfdqcQueryContextMarshal := pfdqcQueryContext is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr", pIFunctionDiscoveryNotification, pfdqcQueryContextMarshal, pfdqcQueryContext, "ptr*", &ppIFunctionInstanceCollectionQuery := 0, "HRESULT")
        return IFunctionInstanceCollectionQuery(ppIFunctionInstanceCollectionQuery)
    }

    /**
     * Creates a query for a specific function instance.
     * @param {PWSTR} pszFunctionInstanceIdentity The identifier of the function instance.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface implemented by the calling application. If specified, it enables the Function Discovery change notification process. This parameter can be <b>NULL</b>; however it is required for network providers.
     * @param {Pointer<Integer>} pfdqcQueryContext A pointer to the context in which the query was created. The type <b>FDQUERYCONTEXT</b> is defined as a DWORDLONG.
     * @returns {IFunctionInstanceQuery} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancequery">IFunctionInstanceQuery</a> interface pointer used to return the generated query.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancequery
     */
    CreateInstanceQuery(pszFunctionInstanceIdentity, pIFunctionDiscoveryNotification, pfdqcQueryContext) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        pfdqcQueryContextMarshal := pfdqcQueryContext is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszFunctionInstanceIdentity, "ptr", pIFunctionDiscoveryNotification, pfdqcQueryContextMarshal, pfdqcQueryContext, "ptr*", &ppIFunctionInstanceQuery := 0, "HRESULT")
        return IFunctionInstanceQuery(ppIFunctionInstanceQuery)
    }

    /**
     * Creates or modifies a function instance.
     * @param {Integer} enumSystemVisibility A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-systemvisibilityflags">SystemVisibilityFlags</a> value that specifies whether the created function instance is visible system wide or only to the current user. 
     * 
     * <div class="alert"><b>Note</b>  The function instance is stored in HKEY_LOCAL_MACHINE regardless  of the <i>enumSystemVisibility</i> value. The user must have Administrator access to add a function instance.</div>
     * <div> </div>
     * @param {PWSTR} pszCategory The category of the created function instance. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/category-definitions">Category Definitions</a>.
     * @param {PWSTR} pszSubCategory The subcategory of the created function instance. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/subcategory-definitions">Subcategory Definitions</a>. The maximum length of this string is MAX_PATH.
     * @param {PWSTR} pszCategoryIdentity The provider instance identifier string. This string is returned from <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getproviderinstanceid">GetProviderInstanceID</a>.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a>  interface pointer that receives the function instance.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-addinstance
     */
    AddInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(7, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Removes the specified function instance, based on category and subcategory.
     * @param {Integer} enumSystemVisibility A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-systemvisibilityflags">SystemVisibilityFlags</a> value that specifies whether the function instance is removed system-wide or only for the current user.
     * @param {PWSTR} pszCategory The category of the function instance. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/category-definitions">Category Definitions</a>.
     * @param {PWSTR} pszSubCategory The subcategory of the function instance to be removed.  See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/subcategory-definitions">Subcategory Definitions</a>. This parameter can be <b>NULL</b>.
     * @param {PWSTR} pszCategoryIdentity The provider instance identifier string. This string is returned from <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getproviderinstanceid">GetProviderInstanceID</a>.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
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
     * The value of <i>pszCategoryIdentity</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user has insufficient access permission to perform the requested action.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * <dt>0x80070002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of <i>pszCategory</i> or <i>pszSubCategory</i> is unknown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-removeinstance
     */
    RemoveInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(8, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "HRESULT")
        return result
    }
}
