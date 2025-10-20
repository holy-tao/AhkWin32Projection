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
     * 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {BOOL} fIncludeAllSubCategories 
     * @param {Pointer<IFunctionInstanceCollection>} ppIFunctionInstanceCollection 
     * @returns {HRESULT} 
     */
    GetInstanceCollection(pszCategory, pszSubCategory, fIncludeAllSubCategories, ppIFunctionInstanceCollection) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(3, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr", ppIFunctionInstanceCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFunctionInstanceIdentity 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     */
    GetInstance(pszFunctionInstanceIdentity, ppIFunctionInstance) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        result := ComCall(4, this, "ptr", pszFunctionInstanceIdentity, "ptr", ppIFunctionInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {BOOL} fIncludeAllSubCategories 
     * @param {Pointer<IFunctionDiscoveryNotification>} pIFunctionDiscoveryNotification 
     * @param {Pointer<UInt64>} pfdqcQueryContext 
     * @param {Pointer<IFunctionInstanceCollectionQuery>} ppIFunctionInstanceCollectionQuery 
     * @returns {HRESULT} 
     */
    CreateInstanceCollectionQuery(pszCategory, pszSubCategory, fIncludeAllSubCategories, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceCollectionQuery) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory

        result := ComCall(5, this, "ptr", pszCategory, "ptr", pszSubCategory, "int", fIncludeAllSubCategories, "ptr", pIFunctionDiscoveryNotification, "uint*", pfdqcQueryContext, "ptr", ppIFunctionInstanceCollectionQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszFunctionInstanceIdentity 
     * @param {Pointer<IFunctionDiscoveryNotification>} pIFunctionDiscoveryNotification 
     * @param {Pointer<UInt64>} pfdqcQueryContext 
     * @param {Pointer<IFunctionInstanceQuery>} ppIFunctionInstanceQuery 
     * @returns {HRESULT} 
     */
    CreateInstanceQuery(pszFunctionInstanceIdentity, pIFunctionDiscoveryNotification, pfdqcQueryContext, ppIFunctionInstanceQuery) {
        pszFunctionInstanceIdentity := pszFunctionInstanceIdentity is String ? StrPtr(pszFunctionInstanceIdentity) : pszFunctionInstanceIdentity

        result := ComCall(6, this, "ptr", pszFunctionInstanceIdentity, "ptr", pIFunctionDiscoveryNotification, "uint*", pfdqcQueryContext, "ptr", ppIFunctionInstanceQuery, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    AddInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity, ppIFunctionInstance) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(7, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "ptr", ppIFunctionInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumSystemVisibility 
     * @param {PWSTR} pszCategory 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszCategoryIdentity 
     * @returns {HRESULT} 
     */
    RemoveInstance(enumSystemVisibility, pszCategory, pszSubCategory, pszCategoryIdentity) {
        pszCategory := pszCategory is String ? StrPtr(pszCategory) : pszCategory
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszCategoryIdentity := pszCategoryIdentity is String ? StrPtr(pszCategoryIdentity) : pszCategoryIdentity

        result := ComCall(8, this, "int", enumSystemVisibility, "ptr", pszCategory, "ptr", pszSubCategory, "ptr", pszCategoryIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
