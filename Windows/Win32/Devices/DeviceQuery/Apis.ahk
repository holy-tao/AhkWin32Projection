#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DeviceQuery {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQuery(ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext, phDevQuery) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQuery", "int", ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQueryEx(ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext, phDevQuery) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryEx", "int", ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQueryFromId(ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext, phDevQuery) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromId", "int", ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQueryFromIdEx(ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext, phDevQuery) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdEx", "int", ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszzObjectIds 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQueryFromIds(ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext, phDevQuery) {
        pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromIds", "int", ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszzObjectIds 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<HDEVQUERY>} phDevQuery 
     * @returns {HRESULT} 
     */
    static DevCreateObjectQueryFromIdsEx(ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext, phDevQuery) {
        pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdsEx", "int", ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr", phDevQuery, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HDEVQUERY} hDevQuery 
     * @returns {String} Nothing - always returns an empty string
     */
    static DevCloseObjectQuery(hDevQuery) {
        DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCloseObjectQuery", "ptr", hDevQuery)
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<Integer>} pcObjectCount 
     * @param {Pointer<Pointer<DEV_OBJECT>>} ppObjects 
     * @returns {HRESULT} 
     */
    static DevGetObjects(ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pcObjectCount, ppObjects) {
        pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
        ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjects", "int", ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<Integer>} pcObjectCount 
     * @param {Pointer<Pointer<DEV_OBJECT>>} ppObjects 
     * @returns {HRESULT} 
     */
    static DevGetObjectsEx(ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pcObjectCount, ppObjects) {
        pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
        ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectsEx", "int", ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cObjectCount 
     * @param {Pointer<DEV_OBJECT>} pObjects 
     * @returns {String} Nothing - always returns an empty string
     */
    static DevFreeObjects(cObjectCount, pObjects) {
        DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjects", "uint", cObjectCount, "ptr", pObjects)
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Pointer<Integer>} pcPropertyCount 
     * @param {Pointer<Pointer<DEVPROPERTY>>} ppProperties 
     * @returns {HRESULT} 
     */
    static DevGetObjectProperties(ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, pcPropertyCount, ppProperties) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
        ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjectProperties", "int", ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<Integer>} pcPropertyCount 
     * @param {Pointer<Pointer<DEVPROPERTY>>} ppProperties 
     * @returns {HRESULT} 
     */
    static DevGetObjectPropertiesEx(ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cExtendedParameterCount, pExtendedParameters, pcPropertyCount, ppProperties) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
        ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectPropertiesEx", "int", ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cPropertyCount 
     * @param {Pointer<DEVPROPERTY>} pProperties 
     * @returns {String} Nothing - always returns an empty string
     */
    static DevFreeObjectProperties(cPropertyCount, pProperties) {
        DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjectProperties", "uint", cPropertyCount, "ptr", pProperties)
    }

    /**
     * 
     * @param {Pointer<DEVPROPKEY>} pKey 
     * @param {Integer} Store 
     * @param {PWSTR} pszLocaleName 
     * @param {Integer} cProperties 
     * @param {Pointer<DEVPROPERTY>} pProperties 
     * @returns {Pointer<DEVPROPERTY>} 
     */
    static DevFindProperty(pKey, Store, pszLocaleName, cProperties, pProperties) {
        pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFindProperty", "ptr", pKey, "int", Store, "ptr", pszLocaleName, "uint", cProperties, "ptr", pProperties, "ptr")
        return result
    }

;@endregion Methods
}
