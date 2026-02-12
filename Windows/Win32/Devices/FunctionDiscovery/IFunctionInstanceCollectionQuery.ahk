#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implements the asynchronous query for a collection of function instances based on category and subcategory.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-execute">Execute</a> method must be invoked by the client program before any data can be retrieved from the query object.
 * @see https://learn.microsoft.com/windows/win32/api//content/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollectionquery
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstanceCollectionQuery extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionInstanceCollectionQuery
     * @type {Guid}
     */
    static IID => Guid("{57cc6fd2-c09a-4289-bb72-25f04142058e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddQueryConstraint", "AddPropertyConstraint", "Execute"]

    /**
     * Adds a query constraint to the query.
     * @remarks
     * If multiple constraints are added, all constraints must be supported to satisfy the query.
     * 
     * <b>AddQueryConstraint</b> will fail with an error if the  <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollectionquery">IFunctionInstanceCollectionQuery</a> object includes all subcategories and the <b>AddQueryConstraint</b> method is called with the  <i>pszConstraintName</i> parameter set to <b>FD_QUERYCONSTRAINT_PROVIDERINSTANCEID</b>. To avoid this error, create a <b>IFunctionInstanceCollectionQuery</b> object that does not include all subcategories. You can create such an object by calling <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancecollectionquery">CreateInstanceCollectionQuery</a> with the <i>fIncludeAllSubCategories</i> parameter set to <b>false</b>.
     * @param {PWSTR} pszConstraintName The query constraint.
     * @param {PWSTR} pszConstraintValue The constraint value.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-addqueryconstraint
     */
    AddQueryConstraint(pszConstraintName, pszConstraintValue) {
        pszConstraintName := pszConstraintName is String ? StrPtr(pszConstraintName) : pszConstraintName
        pszConstraintValue := pszConstraintValue is String ? StrPtr(pszConstraintValue) : pszConstraintValue

        result := ComCall(3, this, "ptr", pszConstraintName, "ptr", pszConstraintValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a property constraint to the query.
     * @remarks
     * A function instance will only match a property constraint when the PROPVARIANT type of the function instance's PKEY matches the PROPVARIANT type of the constraint's  PKEY and the function instance's PKEY value matches the constraint's PKEY value using the comparison operator specified by <i>enumPropertyConstraint</i>.
     * 
     * If multiple constraints are added, all constraints must be supported to satisfy the query.
     * @param {Pointer<PROPERTYKEY>} Key The property key (PKEY) for the constraint. For more information about PKEYs, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/key-definitions">Key Definitions</a>.
     * @param {Pointer<PROPVARIANT>} pv A <b>PROPVARIANT</b> used for the constraint. This type must match the PROPVARIANT type associated with <i>Key</i>.
     * 
     * 
     * The following shows possible values. Note that only a subset of the PROPVARIANT types supported by the built-in providers can be used as a property constraint. 
     * 
     * 
     * 
     * <p class="indent">VT_BOOL
     * 
     * <p class="indent">VT_I2
     * 
     * <p class="indent">VT_I4
     * 
     * <p class="indent">VT_I8
     * 
     * <p class="indent">VT_INT
     * 
     * <p class="indent">VT_LPWSTR
     * 
     * <p class="indent">VT_LPWSTR|VT_VECTOR
     * 
     * <p class="indent">VT_UI2
     * 
     * <p class="indent">VT_UI4
     * 
     * <p class="indent">VT_UI8
     * 
     * <p class="indent">VT_UINT
     * @param {Integer} enumPropertyConstraint A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryconstraints/ne-functiondiscoveryconstraints-propertyconstraint">PropertyConstraint</a> value that specifies the type of comparison to use when comparing the constraint's PKEY to the function instance's PKEY.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_SUPPORTED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The constraint specified for the query is not supported.  Either the constraint is not supported for a specific <b>VARENUM</b> type, or the <b>VARENUM</b> type is not supported at all. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-addpropertyconstraint
     */
    AddPropertyConstraint(Key, pv, enumPropertyConstraint) {
        result := ComCall(4, this, "ptr", Key, "ptr", pv, "int", enumPropertyConstraint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs the query defined by IFunctionDiscovery::CreateInstanceCollectionQuery.
     * @remarks
     * This method must be must be invoked by the client program before any data can be retrieved from the query object. When called, this method performs the following: 
     * 
     * <ol>
     * <li>Retrieves the function instance collection object.</li>
     * <li>Queries the provider of the category that is passed into <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancecollectionquery">IFunctionDiscovery::CreateInstanceCollectionQuery</a>.</li>
     * <li>Retrieves the category provider.</li>
     * <li>Queries the category provider  using the subcategory data to generate the collection using query constraints.</li>
     * <li>Initiates the update notification mechanism if the address of the client program's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> callback routine is provided to <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancecollectionquery">IFunctionDiscovery::CreateInstanceCollectionQuery</a>.</li>
     * <li>Caches the collection data and returns.</li>
     * </ol>
     * Function Discovery network providers only return function instances through the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface.  They return no function instances directly when this method is invoked. Instead, <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancequery-execute">Execute</a> simply initiates an entirely asynchronous retrieval operation and returns <b>E_PENDING</b> to indicate that the results will be returned asynchronously.   Notifications must be used to retrieve function instances from Function Discovery network providers.
     * @returns {IFunctionInstanceCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> interface pointer that receives the requested function instance collection.
     * @see https://learn.microsoft.com/windows/win32/api//content/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstancecollectionquery-execute
     */
    Execute() {
        result := ComCall(5, this, "ptr*", &ppIFunctionInstanceCollection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }
}
