#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Properties\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import ".\DEVPROP_FILTER_EXPRESSION.ahk" { DEVPROP_FILTER_EXPRESSION }
#Import "..\Properties\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import ".\DEV_QUERY_PARAMETER.ahk" { DEV_QUERY_PARAMETER }
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import ".\HDEVQUERY.ahk" { HDEVQUERY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEV_OBJECT.ahk" { DEV_OBJECT }
#Import ".\DEV_OBJECT_TYPE.ahk" { DEV_OBJECT_TYPE }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */

;@region Functions
/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
 * @param {Integer} QueryFlags 
 * @param {Integer} cRequestedProperties 
 * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
 * @param {Integer} cFilterExpressionCount 
 * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
 * @param {Pointer<PDEV_QUERY_RESULT_CALLBACK>} pCallback 
 * @param {Pointer<Void>} pContext 
 * @returns {HDEVQUERY} 
 */
export DevCreateObjectQuery(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQuery", DEV_OBJECT_TYPE, _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevCreateObjectQueryEx(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryEx", DEV_OBJECT_TYPE, _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "uint", cExtendedParameterCount, DEV_QUERY_PARAMETER.Ptr, pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevCreateObjectQueryFromId(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
    pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromId", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevCreateObjectQueryFromIdEx(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
    pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "uint", cExtendedParameterCount, DEV_QUERY_PARAMETER.Ptr, pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevCreateObjectQueryFromIds(_ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pCallback, pContext) {
    pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromIds", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevCreateObjectQueryFromIdsEx(_ObjectType, pszzObjectIds, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pCallback, pContext) {
    pszzObjectIds := pszzObjectIds is String ? StrPtr(pszzObjectIds) : pszzObjectIds

    pContextMarshal := pContext is VarRef ? "ptr" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdsEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszzObjectIds, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "uint", cExtendedParameterCount, DEV_QUERY_PARAMETER.Ptr, pExtendedParameters, "ptr", pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * 
 * @param {HDEVQUERY} _hDevQuery 
 * @returns {String} Nothing - always returns an empty string
 */
export DevCloseObjectQuery(_hDevQuery) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCloseObjectQuery", HDEVQUERY, _hDevQuery)
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
 * @param {Integer} QueryFlags 
 * @param {Integer} cRequestedProperties 
 * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
 * @param {Integer} cFilterExpressionCount 
 * @param {Pointer<DEVPROP_FILTER_EXPRESSION>} pFilter 
 * @param {Pointer<Integer>} pcObjectCount 
 * @param {Pointer<Pointer<DEV_OBJECT>>} ppObjects 
 * @returns {HRESULT} 
 */
export DevGetObjects(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, pcObjectCount, ppObjects) {
    pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
    ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjects", DEV_OBJECT_TYPE, _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
    return result
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevGetObjectsEx(_ObjectType, QueryFlags, cRequestedProperties, pRequestedProperties, cFilterExpressionCount, pFilter, cExtendedParameterCount, pExtendedParameters, pcObjectCount, ppObjects) {
    pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : "ptr"
    ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectsEx", DEV_OBJECT_TYPE, _ObjectType, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cFilterExpressionCount, DEVPROP_FILTER_EXPRESSION.Ptr, pFilter, "uint", cExtendedParameterCount, DEV_QUERY_PARAMETER.Ptr, pExtendedParameters, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} cObjectCount 
 * @param {Pointer<DEV_OBJECT>} pObjects 
 * @returns {String} Nothing - always returns an empty string
 */
export DevFreeObjects(cObjectCount, pObjects) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjects", "uint", cObjectCount, DEV_OBJECT.Ptr, pObjects)
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
 * @param {PWSTR} pszObjectId 
 * @param {Integer} QueryFlags 
 * @param {Integer} cRequestedProperties 
 * @param {Pointer<DEVPROPCOMPKEY>} pRequestedProperties 
 * @param {Pointer<Integer>} pcPropertyCount 
 * @param {Pointer<Pointer<DEVPROPERTY>>} ppProperties 
 * @returns {HRESULT} 
 */
export DevGetObjectProperties(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, pcPropertyCount, ppProperties) {
    pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

    pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjectProperties", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
    return result
}

/**
 * 
 * @param {DEV_OBJECT_TYPE} _ObjectType 
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
export DevGetObjectPropertiesEx(_ObjectType, pszObjectId, QueryFlags, cRequestedProperties, pRequestedProperties, cExtendedParameterCount, pExtendedParameters, pcPropertyCount, ppProperties) {
    pszObjectId := pszObjectId is String ? StrPtr(pszObjectId) : pszObjectId

    pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : "ptr"
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectPropertiesEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, "uint", QueryFlags, "uint", cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, "uint", cExtendedParameterCount, DEV_QUERY_PARAMETER.Ptr, pExtendedParameters, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
    return result
}

/**
 * 
 * @param {Integer} cPropertyCount 
 * @param {Pointer<DEVPROPERTY>} pProperties 
 * @returns {String} Nothing - always returns an empty string
 */
export DevFreeObjectProperties(cPropertyCount, pProperties) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjectProperties", "uint", cPropertyCount, DEVPROPERTY.Ptr, pProperties)
}

/**
 * 
 * @param {Pointer<DEVPROPKEY>} pKey 
 * @param {DEVPROPSTORE} Store 
 * @param {PWSTR} pszLocaleName 
 * @param {Integer} cProperties 
 * @param {Pointer<DEVPROPERTY>} pProperties 
 * @returns {Pointer<DEVPROPERTY>} 
 */
export DevFindProperty(pKey, Store, pszLocaleName, cProperties, pProperties) {
    pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFindProperty", DEVPROPKEY.Ptr, pKey, DEVPROPSTORE, Store, "ptr", pszLocaleName, "uint", cProperties, DEVPROPERTY.Ptr, pProperties, DEVPROPERTY.Ptr)
    return result
}

;@endregion Functions
