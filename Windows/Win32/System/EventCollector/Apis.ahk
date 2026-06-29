#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EC_SUBSCRIPTION_PROPERTY_ID.ahk" { EC_SUBSCRIPTION_PROPERTY_ID }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EC_VARIANT.ahk" { EC_VARIANT }
#Import ".\EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID.ahk" { EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID }

/**
 * @namespace Windows.Win32.System.EventCollector
 */

;@region Functions
/**
 * Creates a subscription enumerator to enumerate all registered subscriptions on the local machine.
 * @param {Integer} Flags Reserved. Must be 0.
 * @returns {Pointer} If the function succeeds, it returns a handle (<a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-data-types">EC_HANDLE</a>) to a new subscription enumerator object. Returns <b>NULL</b> otherwise, in which case use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain the error code.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecopensubscriptionenum
 * @since windows6.0.6000
 */
export EcOpenSubscriptionEnum(Flags) {
    A_LastError := 0

    result := DllCall("WecApi.dll\EcOpenSubscriptionEnum", "uint", Flags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Continues the enumeration of the subscriptions registered on the local machine.
 * @param {Pointer} SubscriptionEnum The handle to the enumerator object that is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecopensubscriptionenum">EcOpenSubscriptionEnum</a> function.
 * @param {Integer} SubscriptionNameBufferSize The size of the user-supplied buffer (in chars) to store the subscription name.
 * @param {PWSTR} SubscriptionNameBuffer The user-supplied buffer to store the subscription name.
 * @param {Pointer<Integer>} SubscriptionNameBufferUsed The size of the user-supplied buffer that is used by the function on successful return, or the size that is necessary to store the subscription name when the function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecenumnextsubscription
 * @since windows6.0.6000
 */
export EcEnumNextSubscription(SubscriptionEnum, SubscriptionNameBufferSize, SubscriptionNameBuffer, SubscriptionNameBufferUsed) {
    SubscriptionNameBuffer := SubscriptionNameBuffer is String ? StrPtr(SubscriptionNameBuffer) : SubscriptionNameBuffer

    SubscriptionNameBufferUsedMarshal := SubscriptionNameBufferUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WecApi.dll\EcEnumNextSubscription", "ptr", SubscriptionEnum, "uint", SubscriptionNameBufferSize, "ptr", SubscriptionNameBuffer, SubscriptionNameBufferUsedMarshal, SubscriptionNameBufferUsed, BOOL)
    return result
}

/**
 * Opens an existing subscription or creates a new subscription.
 * @param {PWSTR} SubscriptionName Specifies the name of the subscription. The value provided for this parameter should be unique within the computer's scope.
 * @param {Integer} AccessMask An access mask that specifies the desired access rights to the subscription. Use the <a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-constants">EC_READ_ACCESS</a> or <a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-constants">EC_WRITE_ACCESS</a> constants to specify the access rights. The function fails if the security descriptor of the subscription does not permit the requested access for the calling process.
 * @param {Integer} Flags A value specifying whether a new or existing subscription will be opened. Use the <b>EC_CREATE_NEW</b>, <b>EC_OPEN_ALWAYS</b>, or <b>EC_OPEN_EXISTING</b> constants.
 * @returns {Pointer} If the function succeeds, it returns a handle (<a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-data-types">EC_HANDLE</a>) to a new subscription object. Returns <b>NULL</b> otherwise, in which case use the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain the error code.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecopensubscription
 * @since windows6.0.6000
 */
export EcOpenSubscription(SubscriptionName, AccessMask, Flags) {
    SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName

    A_LastError := 0

    result := DllCall("WecApi.dll\EcOpenSubscription", "ptr", SubscriptionName, "uint", AccessMask, "uint", Flags, IntPtr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets new values or updates existing values of a subscription.
 * @param {Pointer} Subscription The handle to the subscription object.
 * @param {EC_SUBSCRIPTION_PROPERTY_ID} PropertyId A value from the  <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration that specifies which property of the subscription to set.
 * @param {Integer} Flags Reserved. Must be 0.
 * @param {Pointer<EC_VARIANT>} _PropertyValue The value of the property to set for the indicated subscription property.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecsetsubscriptionproperty
 * @since windows6.0.6000
 */
export EcSetSubscriptionProperty(Subscription, PropertyId, Flags, _PropertyValue) {
    result := DllCall("WecApi.dll\EcSetSubscriptionProperty", "ptr", Subscription, EC_SUBSCRIPTION_PROPERTY_ID, PropertyId, "uint", Flags, EC_VARIANT.Ptr, _PropertyValue, BOOL)
    return result
}

/**
 * Retrieves a property value from a subscription object.
 * @param {Pointer} Subscription The handle to the subscription object.
 * @param {EC_SUBSCRIPTION_PROPERTY_ID} PropertyId An identifier that specifies which property of the subscription to get. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. If you specify the <b>EcSubscriptionEventSources</b> value, then a handle to an array (<a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-data-types">EC_OBJECT_ARRAY_PROPERTY_HANDLE</a>) will be returned. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetobjectarrayproperty">EcGetObjectArrayProperty</a> and <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecsetobjectarrayproperty">EcSetObjectArrayProperty</a>  functions to get and set the Address, Enabled, UserName, and Password properties in the array.
 * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
 * @param {Integer} PropertyValueBufferSize The size of the user-supplied buffer to store the property value into.
 * @param {Pointer<EC_VARIANT>} PropertyValueBuffer The user-supplied buffer to store property value into.
 * @param {Pointer<Integer>} PropertyValueBufferUsed The size of the user-supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecgetsubscriptionproperty
 * @since windows6.0.6000
 */
export EcGetSubscriptionProperty(Subscription, PropertyId, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
    PropertyValueBufferUsedMarshal := PropertyValueBufferUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WecApi.dll\EcGetSubscriptionProperty", "ptr", Subscription, EC_SUBSCRIPTION_PROPERTY_ID, PropertyId, "uint", Flags, "uint", PropertyValueBufferSize, EC_VARIANT.Ptr, PropertyValueBuffer, PropertyValueBufferUsedMarshal, PropertyValueBufferUsed, BOOL)
    return result
}

/**
 * Saves subscription configuration information.
 * @remarks
 * To retry a subscription for all the event sources of a subscription, use the <b>EcSaveSubscription</b> function instead of calling <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecretrysubscription">EcRetrySubscription</a> on each event source individually.
 * 
 * The subscription will be active only if the collector service is running. The service must be set to automatically start and run after the computer is booted.
 * @param {Pointer} Subscription The handle to the subscription object.
 * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecsavesubscription
 * @since windows6.0.6000
 */
export EcSaveSubscription(Subscription, Flags) {
    result := DllCall("WecApi.dll\EcSaveSubscription", "ptr", Subscription, "uint", Flags, BOOL)
    return result
}

/**
 * Deletes an existing subscription.
 * @param {PWSTR} SubscriptionName The subscription to be deleted.
 * @param {Integer} Flags Reserved, must be 0.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecdeletesubscription
 * @since windows6.0.6000
 */
export EcDeleteSubscription(SubscriptionName, Flags) {
    SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName

    result := DllCall("WecApi.dll\EcDeleteSubscription", "ptr", SubscriptionName, "uint", Flags, BOOL)
    return result
}

/**
 * Retrieves the number of indexes of the array of property values for the event sources of a subscription.
 * @remarks
 * Arrays are zero-based, so the index for the first item in the array is 0.
 * @param {Pointer} ObjectArray A handle to the array from which to get the size. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>PropertyId</i> parameter.
 * @param {Pointer<Integer>} ObjectArraySize The size of the array (the number of indexes).
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecgetobjectarraysize
 * @since windows6.0.6000
 */
export EcGetObjectArraySize(ObjectArray, ObjectArraySize) {
    ObjectArraySizeMarshal := ObjectArraySize is VarRef ? "uint*" : "ptr"

    result := DllCall("WecApi.dll\EcGetObjectArraySize", "ptr", ObjectArray, ObjectArraySizeMarshal, ObjectArraySize, BOOL)
    return result
}

/**
 * Sets a property value in an array of property values for the event sources of a subscription.
 * @remarks
 * Arrays are zero-based, so the index for the first item in the array is 0.
 * @param {Pointer} ObjectArray A handle to the array that contains the property value to set. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
 * @param {EC_SUBSCRIPTION_PROPERTY_ID} PropertyId An identifier that specifies which property to set. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. Set  the Address, Enabled, UserName, and Password properties in the array by specifying the <b>EcSubscriptionEventSourceAddress</b>, <b>EcSubscriptionEventSourceEnabled</b>, <b>EcSubscriptionEventSourceUserName</b>, or <b>EcSubscriptionEventSourcePassword</b> values.
 * @param {Integer} ArrayIndex The index of the  object in the array to set a property value on.
 * @param {Integer} Flags Reserved. Must be 0.
 * @param {Pointer<EC_VARIANT>} _PropertyValue The value of the property.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecsetobjectarrayproperty
 * @since windows6.0.6000
 */
export EcSetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, _PropertyValue) {
    result := DllCall("WecApi.dll\EcSetObjectArrayProperty", "ptr", ObjectArray, EC_SUBSCRIPTION_PROPERTY_ID, PropertyId, "uint", ArrayIndex, "uint", Flags, EC_VARIANT.Ptr, _PropertyValue, BOOL)
    return result
}

/**
 * Retrieves property values for the event sources of a subscription.
 * @remarks
 * Arrays are zero-based, so the index for the first item in the array is 0.
 * 
 * The Password property for an event source or the subscription cannot be retrieved. For security reasons, an empty string is returned for the property value and the last error will be set to <b>ERROR_ACCESS_DENIED</b>.
 * 
 * A subscription can have multiple event sources, and each source can have an <b>Address</b>, <b>Enabled</b>, <b>UserName</b>, and <b>Password</b> property.
 * @param {Pointer} ObjectArray A handle to an array of properties for the event sources for a subscription. An  array handle that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>PropertyId</i> parameter.
 * @param {EC_SUBSCRIPTION_PROPERTY_ID} PropertyId The property identifier for properties in the array. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. Get  the <b>Address</b>, <b>Enabled</b>, <b>UserName</b>, and <b>Password</b> properties in the array by specifying the <b>EcSubscriptionEventSourceAddress</b>, <b>EcSubscriptionEventSourceEnabled</b>, <b>EcSubscriptionEventSourceUserName</b>, or <b>EcSubscriptionEventSourcePassword</b> values.
 * @param {Integer} ArrayIndex The index of the array that specifies which event source to get the property from.
 * @param {Integer} Flags Reserved. Must be 0.
 * @param {Integer} PropertyValueBufferSize The size of the buffer that contains the value of the property. The size must be at least the size of an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EC_VARIANT</a> value.
 * @param {Pointer<EC_VARIANT>} PropertyValueBuffer The user-supplied buffer to store property value into.
 * @param {Pointer<Integer>} PropertyValueBufferUsed The size of the user-supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when the function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecgetobjectarrayproperty
 * @since windows6.0.6000
 */
export EcGetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
    PropertyValueBufferUsedMarshal := PropertyValueBufferUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WecApi.dll\EcGetObjectArrayProperty", "ptr", ObjectArray, EC_SUBSCRIPTION_PROPERTY_ID, PropertyId, "uint", ArrayIndex, "uint", Flags, "uint", PropertyValueBufferSize, EC_VARIANT.Ptr, PropertyValueBuffer, PropertyValueBufferUsedMarshal, PropertyValueBufferUsed, BOOL)
    return result
}

/**
 * Inserts an empty object into an array of property values for the event sources of a subscription.
 * @remarks
 * Arrays are zero-based, so the index for the first item in the array is 0.
 * 
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecsetobjectarrayproperty">EcSetObjectArrayProperty</a> to set individual properties of an empty object inserted into the array specified in the <i>ObjectArray</i> parameter.
 * @param {Pointer} ObjectArray A  handle to the array in which the object is inserted into. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
 * @param {Integer} ArrayIndex An array index indicating where to insert the object.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecinsertobjectarrayelement
 * @since windows6.0.6000
 */
export EcInsertObjectArrayElement(ObjectArray, ArrayIndex) {
    result := DllCall("WecApi.dll\EcInsertObjectArrayElement", "ptr", ObjectArray, "uint", ArrayIndex, BOOL)
    return result
}

/**
 * Removes an element from an array of objects that contain property values for the event sources of a subscription.
 * @remarks
 * Arrays are zero-based, so the index for the first item in the array is 0.
 * @param {Pointer} ObjectArray A  handle to the array in which to remove the element. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
 * @param {Integer} ArrayIndex The index of the element to remove from the array.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecremoveobjectarrayelement
 * @since windows6.0.6000
 */
export EcRemoveObjectArrayElement(ObjectArray, ArrayIndex) {
    result := DllCall("WecApi.dll\EcRemoveObjectArrayElement", "ptr", ObjectArray, "uint", ArrayIndex, BOOL)
    return result
}

/**
 * Retrieves the run time status information for an event source of a subscription or the subscription itself.
 * @param {PWSTR} SubscriptionName The name of the subscription to get the run time status information from.
 * @param {EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID} StatusInfoId An identifier that specifies which run time status information to get from the subscription. Specify a value from the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_info_id">EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID</a> enumeration. The <b>EcSubscriptionRunTimeStatusEventSources</b> value can be used to obtain the list of event sources associated with a subscription.
 * @param {PWSTR} EventSourceName The name of the event source to get the status from. Each subscription can have multiple event sources.
 * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
 * @param {Integer} StatusValueBufferSize The size of the user-supplied buffer that will hold the run time status information.
 * @param {Pointer<EC_VARIANT>} StatusValueBuffer The user-supplied buffer that will hold the run time status information. The buffer will hold the appropriate value depending on the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_info_id">EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID</a> value passed into the <i>StatusInfoId</i> parameter.
 * @param {Pointer<Integer>} StatusValueBufferUsed The size of the user supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecgetsubscriptionruntimestatus
 * @since windows6.0.6000
 */
export EcGetSubscriptionRunTimeStatus(SubscriptionName, StatusInfoId, EventSourceName, Flags, StatusValueBufferSize, StatusValueBuffer, StatusValueBufferUsed) {
    SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName
    EventSourceName := EventSourceName is String ? StrPtr(EventSourceName) : EventSourceName

    StatusValueBufferUsedMarshal := StatusValueBufferUsed is VarRef ? "uint*" : "ptr"

    result := DllCall("WecApi.dll\EcGetSubscriptionRunTimeStatus", "ptr", SubscriptionName, EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID, StatusInfoId, "ptr", EventSourceName, "uint", Flags, "uint", StatusValueBufferSize, EC_VARIANT.Ptr, StatusValueBuffer, StatusValueBufferUsedMarshal, StatusValueBufferUsed, BOOL)
    return result
}

/**
 * Retries connecting to the event source of a subscription that is not connected.
 * @remarks
 * To retry a subscription for all the event sources of a subscription, use the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecsavesubscription">EcSaveSubscription</a> function instead of calling <b>EcRetrySubscription</b> on each event source individually.
 * @param {PWSTR} SubscriptionName The name of the subscription to which to connect.
 * @param {PWSTR} EventSourceName The name of the event source of the subscription. This parameter is optional and can be <b>NULL</b>. This parameter must be <b>NULL</b> when the subscription is source initiated.  If this parameter is <b>NULL</b>, the entire subscription will be retried.
 * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecretrysubscription
 * @since windows6.0.6000
 */
export EcRetrySubscription(SubscriptionName, EventSourceName, Flags) {
    SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName
    EventSourceName := EventSourceName is String ? StrPtr(EventSourceName) : EventSourceName

    result := DllCall("WecApi.dll\EcRetrySubscription", "ptr", SubscriptionName, "ptr", EventSourceName, "uint", Flags, BOOL)
    return result
}

/**
 * Closes a handle received from other Event Collector functions.
 * @param {Pointer} _Object A valid open handle returned from an event collector management API call.
 * @returns {BOOL} This function returns BOOL.
 * @see https://learn.microsoft.com/windows/win32/api/evcoll/nf-evcoll-ecclose
 * @since windows6.0.6000
 */
export EcClose(_Object) {
    result := DllCall("WecApi.dll\EcClose", "ptr", _Object, BOOL)
    return result
}

;@endregion Functions
