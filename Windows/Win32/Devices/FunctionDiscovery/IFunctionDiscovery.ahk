#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {BOOL} fIncludeAllSubCategories 
     * @param {Pointer<IFunctionInstanceCollection>} ppIFunctionInstanceCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-getinstancecollection
     */
    GetInstanceCollection(pszCategory, pszSubCategory, fIncludeAllSubCategories, ppIFunctionInstanceCollection) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(3, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr*", ppIFunctionInstanceCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFunctionInstanceIdentity 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-getinstance
     */
    GetInstance(pszFunctionInstanceIdentity, ppIFunctionInstance) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        result := ComCall(4, this, "ptr", pszFunctionInstanceIdentity, "ptr*", ppIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {BOOL} fIncludeAllSubCategories 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @param {Pointer<Integer>} pfdqcQueryContext 
     * @param {Pointer<IFunctionInstanceCollectionQuery>} ppIFunctionInstanceCollectionQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancecollectionquery
     */
    CreateInstanceCollectionQuery(pszCategory, pszSubCategory, fIncludeAllSubCategories, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceCollectionQuery) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        pfdqcQueryContextMarshal := pfdqcQueryContext is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr", pIFunctionDiscoveryNotification, pfdqcQueryContextMarshal, pfdqcQueryContext, "ptr*", ppIFunctionInstanceCollectionQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszFunctionInstanceIdentity 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @param {Pointer<Integer>} pfdqcQueryContext 
     * @param {Pointer<IFunctionInstanceQuery>} ppIFunctionInstanceQuery 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-createinstancequery
     */
    CreateInstanceQuery(pszFunctionInstanceIdentity, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceQuery) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        pfdqcQueryContextMarshal := pfdqcQueryContext is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszFunctionInstanceIdentity, "ptr", pIFunctionDiscoveryNotification, pfdqcQueryContextMarshal, pfdqcQueryContext, "ptr*", ppIFunctionInstanceQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumSystemVisibility 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszCategoryIdentity 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-addinstance
     */
    AddInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity, ppIFunctionInstance) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(7, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "ptr*", ppIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} enumSystemVisibility 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszCategoryIdentity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-removeinstance
     */
    RemoveInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(8, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "HRESULT")
        return result
    }
}
