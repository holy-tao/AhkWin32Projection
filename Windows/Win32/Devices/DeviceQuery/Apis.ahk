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
     * @param {Integer} _ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQuery(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQuery", "int", _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {Integer} _ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Integer} cExtendedParameterCount 
     * @param {Pointer<DEV_QUERY_PARAMETER>} pExtendedParameters 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQueryEx(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryEx", "int", _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {Integer} _ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQueryFromId(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromId", "int", _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {Integer} _ObjectType 
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
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQueryFromIdEx(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdEx", "int", _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {Integer} _ObjectType 
     * @param {PWSTR} pszzObjectIds 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pContext 
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQueryFromIds(_ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
        pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromIds", "int", _ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {Integer} _ObjectType 
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
     * @returns {HDEVQUERY} 
     */
    static DevCreateObjectQueryFromIdsEx(_ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
        pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdsEx", "int", _ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, "ptr*", &phDevQuery := 0, "HRESULT")
        return phDevQuery
    }

    /**
     * 
     * @param {HDEVQUERY} _hDevQuery 
     * @returns {String} Nothing - always returns an empty string
     */
    static DevCloseObjectQuery(_hDevQuery) {
        DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCloseObjectQuery", "ptr", _hDevQuery)
    }

    /**
     * 
     * @param {Integer} _ObjectType 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Integer} cFilterExpressionCount 
     * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
     * @param {Pointer<Integer>} pcObjectCount 
     * @param {Pointer<Pointer<DEV_OBJECT>>} ppObjects 
     * @returns {HRESULT} 
     */
    static DevGetObjects(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pcObjectCount, ppObjects) {
        pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
        ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjects", "int", _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _ObjectType 
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
    static DevGetObjectsEx(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pcObjectCount, ppObjects) {
        pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
        ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectsEx", "int", _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cFilterExpressionCount, "ptr", pFilter, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
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
     * @param {Integer} _ObjectType 
     * @param {PWSTR} pszObjectId 
     * @param {Integer} QueryFlags 
     * @param {Integer} cRequestedProperties 
     * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
     * @param {Pointer<Integer>} pcPropertyCount 
     * @param {Pointer<Pointer<DEVPROPERTY>>} ppProperties 
     * @returns {HRESULT} 
     */
    static DevGetObjectProperties(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, pcPropertyCount, ppProperties) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
        ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjectProperties", "int", _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _ObjectType 
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
    static DevGetObjectPropertiesEx(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cExtendedParameterCount, pExtendedParameters, pcPropertyCount, ppProperties) {
        pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

        pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
        ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

        result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectPropertiesEx", "int", _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, "ptr", pRequestedProperties, "uint", cExtendedParameterCount, "ptr", pExtendedParameters, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
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
