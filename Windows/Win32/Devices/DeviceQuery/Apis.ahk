#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\DEVPROP_FILTER_EXPRESSION.ahk" { DEVPROP_FILTER_EXPRESSION }
#Import ".\DEV_OBJECT.ahk" { DEV_OBJECT }
#Import ".\DEV_OBJECT_TYPE.ahk" { DEV_OBJECT_TYPE }
#Import ".\DEV_QUERY_PARAMETER.ahk" { DEV_QUERY_PARAMETER }
#Import ".\HDEVQUERY.ahk" { HDEVQUERY }
#Import ".\PDEV_QUERY_RESULT_CALLBACK.ahk" { PDEV_QUERY_RESULT_CALLBACK }
#Import "..\Properties\DEVPROPCOMPKEY.ahk" { DEVPROPCOMPKEY }
#Import "..\Properties\DEVPROPERTY.ahk" { DEVPROPERTY }
#Import "..\Properties\DEVPROPSTORE.ahk" { DEVPROPSTORE }
#Import "..\..\Foundation\DEVPROPKEY.ahk" { DEVPROPKEY }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */

;@region Functions
/**
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
    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQuery", DEV_OBJECT_TYPE, _ObjectType, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
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
    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pExtendedParametersMarshal := pExtendedParameters == 0 ? IntPtr : DEV_QUERY_PARAMETER.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryEx", DEV_OBJECT_TYPE, _ObjectType, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, UInt32, cExtendedParameterCount, pExtendedParametersMarshal, pExtendedParameters, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
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

    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromId", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
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

    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pExtendedParametersMarshal := pExtendedParameters == 0 ? IntPtr : DEV_QUERY_PARAMETER.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, UInt32, cExtendedParameterCount, pExtendedParametersMarshal, pExtendedParameters, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
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

    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCreateObjectQueryFromIds", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszzObjectIds, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
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

    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pExtendedParametersMarshal := pExtendedParameters == 0 ? IntPtr : DEV_QUERY_PARAMETER.Ptr
    pContextMarshal := pContext is VarRef ? "ptr" : IntPtr
    pContextMarshal := pContext == 0 ? IntPtr : "ptr"

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevCreateObjectQueryFromIdsEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszzObjectIds, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, UInt32, cExtendedParameterCount, pExtendedParametersMarshal, pExtendedParameters, PDEV_QUERY_RESULT_CALLBACK, pCallback, pContextMarshal, pContext, HDEVQUERY.Ptr, &phDevQuery := 0, "HRESULT")
    return phDevQuery
}

/**
 * @param {HDEVQUERY} _hDevQuery 
 * @returns {String} Nothing - always returns an empty string
 */
export DevCloseObjectQuery(_hDevQuery) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevCloseObjectQuery", HDEVQUERY, _hDevQuery)
}

/**
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
    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : IntPtr
    ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : IntPtr

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjects", DEV_OBJECT_TYPE, _ObjectType, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
    return result
}

/**
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
    pRequestedPropertiesMarshal := pRequestedProperties == 0 ? IntPtr : DEVPROPCOMPKEY.Ptr
    pFilterMarshal := pFilter == 0 ? IntPtr : DEVPROP_FILTER_EXPRESSION.Ptr
    pExtendedParametersMarshal := pExtendedParameters == 0 ? IntPtr : DEV_QUERY_PARAMETER.Ptr
    pcObjectCountMarshal := pcObjectCount is VarRef ? "uint*" : IntPtr
    ppObjectsMarshal := ppObjects is VarRef ? "ptr*" : IntPtr

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectsEx", DEV_OBJECT_TYPE, _ObjectType, UInt32, QueryFlags, UInt32, cRequestedProperties, pRequestedPropertiesMarshal, pRequestedProperties, UInt32, cFilterExpressionCount, pFilterMarshal, pFilter, UInt32, cExtendedParameterCount, pExtendedParametersMarshal, pExtendedParameters, pcObjectCountMarshal, pcObjectCount, ppObjectsMarshal, ppObjects, "HRESULT")
    return result
}

/**
 * @param {Integer} cObjectCount 
 * @param {Pointer<DEV_OBJECT>} pObjects 
 * @returns {String} Nothing - always returns an empty string
 */
export DevFreeObjects(cObjectCount, pObjects) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjects", UInt32, cObjectCount, DEV_OBJECT.Ptr, pObjects)
}

/**
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

    pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : IntPtr
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : IntPtr

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevGetObjectProperties", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, UInt32, QueryFlags, UInt32, cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
    return result
}

/**
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

    pExtendedParametersMarshal := pExtendedParameters == 0 ? IntPtr : DEV_QUERY_PARAMETER.Ptr
    pcPropertyCountMarshal := pcPropertyCount is VarRef ? "uint*" : IntPtr
    ppPropertiesMarshal := ppProperties is VarRef ? "ptr*" : IntPtr

    result := DllCall("api-ms-win-devices-query-l1-1-1.dll\DevGetObjectPropertiesEx", DEV_OBJECT_TYPE, _ObjectType, "ptr", pszObjectId, UInt32, QueryFlags, UInt32, cRequestedProperties, DEVPROPCOMPKEY.Ptr, pRequestedProperties, UInt32, cExtendedParameterCount, pExtendedParametersMarshal, pExtendedParameters, pcPropertyCountMarshal, pcPropertyCount, ppPropertiesMarshal, ppProperties, "HRESULT")
    return result
}

/**
 * @param {Integer} cPropertyCount 
 * @param {Pointer<DEVPROPERTY>} pProperties 
 * @returns {String} Nothing - always returns an empty string
 */
export DevFreeObjectProperties(cPropertyCount, pProperties) {
    DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFreeObjectProperties", UInt32, cPropertyCount, DEVPROPERTY.Ptr, pProperties)
}

/**
 * @param {Pointer<DEVPROPKEY>} pKey 
 * @param {DEVPROPSTORE} Store 
 * @param {PWSTR} pszLocaleName 
 * @param {Integer} cProperties 
 * @param {Pointer<DEVPROPERTY>} pProperties 
 * @returns {Pointer<DEVPROPERTY>} 
 */
export DevFindProperty(pKey, Store, pszLocaleName, cProperties, pProperties) {
    pszLocaleName := pszLocaleName is String ? StrPtr(pszLocaleName) : pszLocaleName

    pPropertiesMarshal := pProperties == 0 ? IntPtr : DEVPROPERTY.Ptr

    result := DllCall("api-ms-win-devices-query-l1-1-0.dll\DevFindProperty", DEVPROPKEY.Ptr, pKey, DEVPROPSTORE, Store, "ptr", pszLocaleName, UInt32, cProperties, pPropertiesMarshal, pProperties, DEVPROPERTY.Ptr)
    return result
}

;@endregion Functions
