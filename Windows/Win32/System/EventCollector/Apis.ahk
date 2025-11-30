#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.EventCollector
 * @version v4.0.30319
 */
class EventCollector {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VARIANT_TYPE_MASK => 127

    /**
     * @type {Integer (UInt32)}
     */
    static EC_VARIANT_TYPE_ARRAY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EC_READ_ACCESS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EC_WRITE_ACCESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EC_OPEN_ALWAYS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EC_CREATE_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EC_OPEN_EXISTING => 2
;@endregion Constants

;@region Methods
    /**
     * Creates a subscription enumerator to enumerate all registered subscriptions on the local machine.
     * @param {Integer} Flags Reserved. Must be 0.
     * @returns {Pointer} If the function succeeds, it returns an handle (<a href="/windows/desktop/WEC/windows-event-collector-data-types">EC_HANDLE</a>) to a new subscription enumerator object. Returns <b>NULL</b> otherwise, in which case use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain the error code.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecopensubscriptionenum
     * @since windows6.0.6000
     */
    static EcOpenSubscriptionEnum(Flags) {
        A_LastError := 0

        result := DllCall("WecApi.dll\EcOpenSubscriptionEnum", "uint", Flags, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
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
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecenumnextsubscription
     * @since windows6.0.6000
     */
    static EcEnumNextSubscription(SubscriptionEnum, SubscriptionNameBufferSize, SubscriptionNameBuffer, SubscriptionNameBufferUsed) {
        SubscriptionNameBuffer := SubscriptionNameBuffer is String ? StrPtr(SubscriptionNameBuffer) : SubscriptionNameBuffer

        SubscriptionNameBufferUsedMarshal := SubscriptionNameBufferUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("WecApi.dll\EcEnumNextSubscription", "ptr", SubscriptionEnum, "uint", SubscriptionNameBufferSize, "ptr", SubscriptionNameBuffer, SubscriptionNameBufferUsedMarshal, SubscriptionNameBufferUsed, "int")
        return result
    }

    /**
     * Opens an existing subscription or creates a new subscription.
     * @param {PWSTR} SubscriptionName Specifies the name of the subscription. The value provided for this parameter should be unique within the computer's scope.
     * @param {Integer} AccessMask An access mask that specifies the desired access rights to the subscription. Use the <a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-constants">EC_READ_ACCESS</a> or <a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-constants">EC_WRITE_ACCESS</a> constants to specify the access rights. The function fails if the security descriptor of the subscription does not permit the requested access for the calling process.
     * @param {Integer} Flags A value specifying whether a new or existing subscription will be opened. Use the <b>EC_CREATE_NEW</b>, <b>EC_OPEN_ALWAYS</b>, or <b>EC_OPEN_EXISTING</b> constants.
     * @returns {Pointer} If the function succeeds, it returns an handle (<a href="/windows/desktop/WEC/windows-event-collector-data-types">EC_HANDLE</a>) to a new subscription object. Returns <b>NULL</b> otherwise, in which case use the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain the error code.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecopensubscription
     * @since windows6.0.6000
     */
    static EcOpenSubscription(SubscriptionName, AccessMask, Flags) {
        SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName

        A_LastError := 0

        result := DllCall("WecApi.dll\EcOpenSubscription", "ptr", SubscriptionName, "uint", AccessMask, "uint", Flags, "ptr")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets new values or updates existing values of a subscription.
     * @param {Pointer} Subscription The handle to the subscription object.
     * @param {Integer} PropertyId A value from the  <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration that specifies which property of the subscription to set.
     * @param {Integer} Flags Reserved. Must be 0.
     * @param {Pointer<EC_VARIANT>} PropertyValue The value of the property to set for the indicated subscription property.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecsetsubscriptionproperty
     * @since windows6.0.6000
     */
    static EcSetSubscriptionProperty(Subscription, PropertyId, Flags, PropertyValue) {
        result := DllCall("WecApi.dll\EcSetSubscriptionProperty", "ptr", Subscription, "int", PropertyId, "uint", Flags, "ptr", PropertyValue, "int")
        return result
    }

    /**
     * Retrieves a property value from a subscription object.
     * @param {Pointer} Subscription The handle to the subscription object.
     * @param {Integer} PropertyId An identifier that specifies which property of the subscription to get. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. If you specify the <b>EcSubscriptionEventSources</b> value, then a handle to an array (<a href="https://docs.microsoft.com/windows/desktop/WEC/windows-event-collector-data-types">EC_OBJECT_ARRAY_PROPERTY_HANDLE</a>) will be returned. You can then use the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetobjectarrayproperty">EcGetObjectArrayProperty</a> and <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecsetobjectarrayproperty">EcSetObjectArrayProperty</a>  functions to get and set the Address, Enabled, UserName, and Password properties in the array.
     * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
     * @param {Integer} PropertyValueBufferSize The size of the user-supplied buffer to store the property value into.
     * @param {Pointer<EC_VARIANT>} PropertyValueBuffer The user-supplied buffer to store property value into.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size of the user-supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecgetsubscriptionproperty
     * @since windows6.0.6000
     */
    static EcGetSubscriptionProperty(Subscription, PropertyId, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        PropertyValueBufferUsedMarshal := PropertyValueBufferUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("WecApi.dll\EcGetSubscriptionProperty", "ptr", Subscription, "int", PropertyId, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, PropertyValueBufferUsedMarshal, PropertyValueBufferUsed, "int")
        return result
    }

    /**
     * Saves subscription configuration information.
     * @param {Pointer} Subscription The handle to the subscription object.
     * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecsavesubscription
     * @since windows6.0.6000
     */
    static EcSaveSubscription(Subscription, Flags) {
        result := DllCall("WecApi.dll\EcSaveSubscription", "ptr", Subscription, "uint", Flags, "int")
        return result
    }

    /**
     * Deletes an existing subscription.
     * @param {PWSTR} SubscriptionName The subscription to be deleted.
     * @param {Integer} Flags Reserved, must be 0.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecdeletesubscription
     * @since windows6.0.6000
     */
    static EcDeleteSubscription(SubscriptionName, Flags) {
        SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName

        result := DllCall("WecApi.dll\EcDeleteSubscription", "ptr", SubscriptionName, "uint", Flags, "int")
        return result
    }

    /**
     * Retrieves the number of indexes of the array of property values for the event sources of a subscription.
     * @param {Pointer} ObjectArray A handle to the array from which to get the size. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>PropertyId</i> parameter.
     * @param {Pointer<Integer>} ObjectArraySize The size of the array (the number of indexes).
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecgetobjectarraysize
     * @since windows6.0.6000
     */
    static EcGetObjectArraySize(ObjectArray, ObjectArraySize) {
        ObjectArraySizeMarshal := ObjectArraySize is VarRef ? "uint*" : "ptr"

        result := DllCall("WecApi.dll\EcGetObjectArraySize", "ptr", ObjectArray, ObjectArraySizeMarshal, ObjectArraySize, "int")
        return result
    }

    /**
     * Sets a property value in an array of property values for the event sources of a subscription.
     * @param {Pointer} ObjectArray A handle to the array that contains the property value to set. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
     * @param {Integer} PropertyId An identifier that specifies which property to set. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. Set  the Address, Enabled, UserName, and Password properties in the array by specifying the <b>EcSubscriptionEventSourceAddress</b>, <b>EcSubscriptionEventSourceEnabled</b>, <b>EcSubscriptionEventSourceUserName</b>, or <b>EcSubscriptionEventSourcePassword</b> values.
     * @param {Integer} ArrayIndex The index of the  object in the array to set a property value on.
     * @param {Integer} Flags Reserved. Must be 0.
     * @param {Pointer<EC_VARIANT>} PropertyValue The value of the property.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecsetobjectarrayproperty
     * @since windows6.0.6000
     */
    static EcSetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, PropertyValue) {
        result := DllCall("WecApi.dll\EcSetObjectArrayProperty", "ptr", ObjectArray, "int", PropertyId, "uint", ArrayIndex, "uint", Flags, "ptr", PropertyValue, "int")
        return result
    }

    /**
     * Retrieves property values for the event sources of a subscription.
     * @param {Pointer} ObjectArray A handle to an array of properties for the event sources for a subscription. An  array handle that is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>PropertyId</i> parameter.
     * @param {Integer} PropertyId The property identifier for properties in the array. Specify a value from the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ne-evcoll-ec_subscription_property_id">EC_SUBSCRIPTION_PROPERTY_ID</a> enumeration. Get  the <b>Address</b>, <b>Enabled</b>, <b>UserName</b>, and <b>Password</b> properties in the array by specifying the <b>EcSubscriptionEventSourceAddress</b>, <b>EcSubscriptionEventSourceEnabled</b>, <b>EcSubscriptionEventSourceUserName</b>, or <b>EcSubscriptionEventSourcePassword</b> values.
     * @param {Integer} ArrayIndex The index of the array that specifies which event source to get the property from.
     * @param {Integer} Flags Reserved. Must be 0.
     * @param {Integer} PropertyValueBufferSize The size of the buffer that contains the value of the property. The size must be at least the size of an <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/ns-evcoll-ec_variant">EC_VARIANT</a> value.
     * @param {Pointer<EC_VARIANT>} PropertyValueBuffer The user-supplied buffer to store property value into.
     * @param {Pointer<Integer>} PropertyValueBufferUsed The size of the user-supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when the function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecgetobjectarrayproperty
     * @since windows6.0.6000
     */
    static EcGetObjectArrayProperty(ObjectArray, PropertyId, ArrayIndex, Flags, PropertyValueBufferSize, PropertyValueBuffer, PropertyValueBufferUsed) {
        PropertyValueBufferUsedMarshal := PropertyValueBufferUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("WecApi.dll\EcGetObjectArrayProperty", "ptr", ObjectArray, "int", PropertyId, "uint", ArrayIndex, "uint", Flags, "uint", PropertyValueBufferSize, "ptr", PropertyValueBuffer, PropertyValueBufferUsedMarshal, PropertyValueBufferUsed, "int")
        return result
    }

    /**
     * Inserts an empty object into an array of property values for the event sources of a subscription.
     * @param {Pointer} ObjectArray A  handle to the array in which the object is inserted into. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
     * @param {Integer} ArrayIndex An array index indicating where to insert the object.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecinsertobjectarrayelement
     * @since windows6.0.6000
     */
    static EcInsertObjectArrayElement(ObjectArray, ArrayIndex) {
        result := DllCall("WecApi.dll\EcInsertObjectArrayElement", "ptr", ObjectArray, "uint", ArrayIndex, "int")
        return result
    }

    /**
     * Removes an element from an array of objects that contain property values for the event sources of a subscription.
     * @param {Pointer} ObjectArray A  handle to the array in which to remove the element. The array contains property values for the event sources of a subscription. The array handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/evcoll/nf-evcoll-ecgetsubscriptionproperty">EcGetSubscriptionProperty</a> method when the <b>EcSubscriptionEventSources</b> value is passed into the <i>Subscription</i> parameter.
     * @param {Integer} ArrayIndex The index of the element to remove from the array.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecremoveobjectarrayelement
     * @since windows6.0.6000
     */
    static EcRemoveObjectArrayElement(ObjectArray, ArrayIndex) {
        result := DllCall("WecApi.dll\EcRemoveObjectArrayElement", "ptr", ObjectArray, "uint", ArrayIndex, "int")
        return result
    }

    /**
     * Retrieves the run time status information for an event source of a subscription or the subscription itself.
     * @param {PWSTR} SubscriptionName The name of the subscription to get the run time status information from.
     * @param {Integer} StatusInfoId An identifier that specifies which run time status information to get from the subscription. Specify a value from the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_info_id">EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID</a> enumeration. The <b>EcSubscriptionRunTimeStatusEventSources</b> value can be used to obtain the list of event sources associated with a subscription.
     * @param {PWSTR} EventSourceName The name of the event source to get the status from. Each subscription can have multiple event sources.
     * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
     * @param {Integer} StatusValueBufferSize The size of the user-supplied buffer that will hold the run time status information.
     * @param {Pointer<EC_VARIANT>} StatusValueBuffer The user-supplied buffer that will hold the run time status information. The buffer will hold the appropriate value depending on the <a href="https://docs.microsoft.com/windows/win32/api/evcoll/ne-evcoll-ec_subscription_runtime_status_info_id">EC_SUBSCRIPTION_RUNTIME_STATUS_INFO_ID</a> value passed into the <i>StatusInfoId</i> parameter.
     * @param {Pointer<Integer>} StatusValueBufferUsed The size of the user supplied buffer that is used by the function on successful return, or the size that is necessary to store the property value when function fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecgetsubscriptionruntimestatus
     * @since windows6.0.6000
     */
    static EcGetSubscriptionRunTimeStatus(SubscriptionName, StatusInfoId, EventSourceName, Flags, StatusValueBufferSize, StatusValueBuffer, StatusValueBufferUsed) {
        SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName
        EventSourceName := EventSourceName is String ? StrPtr(EventSourceName) : EventSourceName

        StatusValueBufferUsedMarshal := StatusValueBufferUsed is VarRef ? "uint*" : "ptr"

        result := DllCall("WecApi.dll\EcGetSubscriptionRunTimeStatus", "ptr", SubscriptionName, "int", StatusInfoId, "ptr", EventSourceName, "uint", Flags, "uint", StatusValueBufferSize, "ptr", StatusValueBuffer, StatusValueBufferUsedMarshal, StatusValueBufferUsed, "int")
        return result
    }

    /**
     * Retries connecting to the event source of a subscription that is not connected.
     * @param {PWSTR} SubscriptionName The name of the subscription to which to connect.
     * @param {PWSTR} EventSourceName The name of the event source of the subscription. This parameter is optional and can be <b>NULL</b>. This parameter must be <b>NULL</b> when the subscription is source initiated.  If this parameter is <b>NULL</b>, the entire subscription will be retried.
     * @param {Integer} Flags Reserved. Must be <b>NULL</b>.
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecretrysubscription
     * @since windows6.0.6000
     */
    static EcRetrySubscription(SubscriptionName, EventSourceName, Flags) {
        SubscriptionName := SubscriptionName is String ? StrPtr(SubscriptionName) : SubscriptionName
        EventSourceName := EventSourceName is String ? StrPtr(EventSourceName) : EventSourceName

        result := DllCall("WecApi.dll\EcRetrySubscription", "ptr", SubscriptionName, "ptr", EventSourceName, "uint", Flags, "int")
        return result
    }

    /**
     * Closes a handle received from other Event Collector functions.
     * @param {Pointer} Object_R 
     * @returns {BOOL} This function returns BOOL.
     * @see https://docs.microsoft.com/windows/win32/api//evcoll/nf-evcoll-ecclose
     * @since windows6.0.6000
     */
    static EcClose(Object_R) {
        result := DllCall("WecApi.dll\EcClose", "ptr", Object_R, "int")
        return result
    }

;@endregion Methods
}
