#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SENSOR_PROPERTY_LIST.ahk" { SENSOR_PROPERTY_LIST }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\Properties\DEVPROPTYPE.ahk" { DEVPROPTYPE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SENSOR_COLLECTION_LIST.ahk" { SENSOR_COLLECTION_LIST }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * @namespace Windows.Win32.Devices.Sensors
 */

;@region Functions
/**
 * 
 * @param {Pointer<Integer>} TimeMs 
 * @returns {NTSTATUS} 
 */
export GetPerformanceTime(TimeMs) {
    TimeMsMarshal := TimeMs is VarRef ? "uint*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\GetPerformanceTime", TimeMsMarshal, TimeMs, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Float} fltVal 
 * @param {Pointer<PROPVARIANT>} ppropvar 
 * @returns {HRESULT} 
 */
export InitPropVariantFromFloat(fltVal, ppropvar) {
    result := DllCall("SensorsUtilsV2.dll\InitPropVariantFromFloat", "float", fltVal, PROPVARIANT.Ptr, ppropvar, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {BOOLEAN} TypeCheck 
 * @param {Pointer<PROPVARIANT>} pValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetPropVariant(pList, pKey, TypeCheck, pValue) {
    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetPropVariant", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, BOOLEAN, TypeCheck, PROPVARIANT.Ptr, pValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {BOOLEAN} TypeCheck 
 * @param {Pointer<PROPVARIANT>} pValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeySetPropVariant(pList, pKey, TypeCheck, pValue) {
    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeySetPropVariant", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, BOOLEAN, TypeCheck, PROPVARIANT.Ptr, pValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<FILETIME>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetFileTime(pList, pKey, pRetValue) {
    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetFileTime", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, FILETIME.Ptr, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Guid>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetGuid(pList, pKey, pRetValue) {
    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetGuid", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, Guid.Ptr, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<BOOL>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetBool(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "int*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetBool", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetUlong(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "uint*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUlong", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetUshort(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "ushort*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetUshort", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Float>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetFloat(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "float*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetFloat", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Float>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetDouble(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "double*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetDouble", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetInt32(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "int*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt32", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetInt64(pList, pKey, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "int64*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetInt64", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Integer} Occurrence 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetNthUlong(pList, pKey, Occurrence, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "uint*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUlong", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Integer} Occurrence 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetNthUshort(pList, pKey, Occurrence, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "ushort*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthUshort", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Integer} Occurrence 
 * @param {Pointer<Integer>} pRetValue 
 * @returns {NTSTATUS} 
 */
export PropKeyFindKeyGetNthInt64(pList, pKey, Occurrence, pRetValue) {
    pRetValueMarshal := pRetValue is VarRef ? "int64*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropKeyFindKeyGetNthInt64", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, "uint", Occurrence, pRetValueMarshal, pRetValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_PROPERTY_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @returns {BOOLEAN} 
 */
export IsKeyPresentInPropertyList(pList, pKey) {
    result := DllCall("SensorsUtilsV2.dll\IsKeyPresentInPropertyList", SENSOR_PROPERTY_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @returns {BOOLEAN} 
 */
export IsKeyPresentInCollectionList(pList, pKey) {
    result := DllCall("SensorsUtilsV2.dll\IsKeyPresentInCollectionList", SENSOR_COLLECTION_LIST.Ptr, pList, PROPERTYKEY.Ptr, pKey, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} ListA 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} ListB 
 * @returns {BOOLEAN} 
 */
export IsCollectionListSame(ListA, ListB) {
    result := DllCall("SensorsUtilsV2.dll\IsCollectionListSame", SENSOR_COLLECTION_LIST.Ptr, ListA, SENSOR_COLLECTION_LIST.Ptr, ListB, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<PROPVARIANT>} PropVariantValue 
 * @param {Pointer<Integer>} PropVariantOffset 
 * @param {Pointer<Integer>} PropVariantSize 
 * @param {Pointer<Pointer<Void>>} PropVariantPointer 
 * @param {Pointer<DEVPROPTYPE>} RemappedType 
 * @returns {NTSTATUS} 
 */
export PropVariantGetInformation(PropVariantValue, PropVariantOffset, PropVariantSize, PropVariantPointer, RemappedType) {
    PropVariantOffsetMarshal := PropVariantOffset is VarRef ? "uint*" : "ptr"
    PropVariantSizeMarshal := PropVariantSize is VarRef ? "uint*" : "ptr"
    PropVariantPointerMarshal := PropVariantPointer is VarRef ? "ptr*" : "ptr"
    RemappedTypeMarshal := RemappedType is VarRef ? "uint*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\PropVariantGetInformation", PROPVARIANT.Ptr, PropVariantValue, PropVariantOffsetMarshal, PropVariantOffset, PropVariantSizeMarshal, PropVariantSize, PropVariantPointerMarshal, PropVariantPointer, RemappedTypeMarshal, RemappedType, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_PROPERTY_LIST>} Target 
 * @param {Pointer<SENSOR_PROPERTY_LIST>} Source 
 * @returns {NTSTATUS} 
 */
export PropertiesListCopy(Target, Source) {
    result := DllCall("SensorsUtilsV2.dll\PropertiesListCopy", SENSOR_PROPERTY_LIST.Ptr, Target, SENSOR_PROPERTY_LIST.Ptr, Source, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} BufferSizeBytes 
 * @returns {Integer} 
 */
export PropertiesListGetFillableCount(BufferSizeBytes) {
    result := DllCall("SensorsUtilsV2.dll\PropertiesListGetFillableCount", "uint", BufferSizeBytes, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
 * @returns {Integer} 
 */
export CollectionsListGetMarshalledSize(Collection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListGetMarshalledSize", SENSOR_COLLECTION_LIST.Ptr, Collection, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Target 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Source 
 * @returns {NTSTATUS} 
 */
export CollectionsListCopyAndMarshall(Target, Source) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListCopyAndMarshall", SENSOR_COLLECTION_LIST.Ptr, Target, SENSOR_COLLECTION_LIST.Ptr, Source, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Target 
 * @returns {NTSTATUS} 
 */
export CollectionsListMarshall(Target) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListMarshall", SENSOR_COLLECTION_LIST.Ptr, Target, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
 * @returns {Integer} 
 */
export CollectionsListGetMarshalledSizeWithoutSerialization(Collection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListGetMarshalledSizeWithoutSerialization", SENSOR_COLLECTION_LIST.Ptr, Collection, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
 * @returns {NTSTATUS} 
 */
export CollectionsListUpdateMarshalledPointer(Collection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListUpdateMarshalledPointer", SENSOR_COLLECTION_LIST.Ptr, Collection, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} SizeInBytes 
 * @param {Pointer<Pointer<Integer>>} pBuffer 
 * @returns {NTSTATUS} 
 */
export SerializationBufferAllocate(SizeInBytes, pBuffer) {
    pBufferMarshal := pBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\SerializationBufferAllocate", "uint", SizeInBytes, pBufferMarshal, pBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} _Buffer 
 * @returns {String} Nothing - always returns an empty string
 */
export SerializationBufferFree(_Buffer) {
    _BufferMarshal := _Buffer is VarRef ? "char*" : "ptr"

    DllCall("SensorsUtilsV2.dll\SerializationBufferFree", _BufferMarshal, _Buffer)
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} Collection 
 * @returns {Integer} 
 */
export CollectionsListGetSerializedSize(Collection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListGetSerializedSize", SENSOR_COLLECTION_LIST.Ptr, Collection, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} SourceCollection 
 * @param {Integer} TargetBufferSizeInBytes 
 * @param {Integer} TargetBuffer 
 * @returns {NTSTATUS} 
 */
export CollectionsListSerializeToBuffer(SourceCollection, TargetBufferSizeInBytes, TargetBuffer) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListSerializeToBuffer", SENSOR_COLLECTION_LIST.Ptr, SourceCollection, "uint", TargetBufferSizeInBytes, "ptr", TargetBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} SourceCollection 
 * @param {Pointer<Integer>} pTargetBufferSizeInBytes 
 * @param {Pointer<Pointer<Integer>>} pTargetBuffer 
 * @returns {NTSTATUS} 
 */
export CollectionsListAllocateBufferAndSerialize(SourceCollection, pTargetBufferSizeInBytes, pTargetBuffer) {
    pTargetBufferSizeInBytesMarshal := pTargetBufferSizeInBytes is VarRef ? "uint*" : "ptr"
    pTargetBufferMarshal := pTargetBuffer is VarRef ? "ptr*" : "ptr"

    result := DllCall("SensorsUtilsV2.dll\CollectionsListAllocateBufferAndSerialize", SENSOR_COLLECTION_LIST.Ptr, SourceCollection, pTargetBufferSizeInBytesMarshal, pTargetBufferSizeInBytes, pTargetBufferMarshal, pTargetBuffer, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} SourceBufferSizeInBytes 
 * @param {Integer} SourceBuffer 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} TargetCollection 
 * @returns {NTSTATUS} 
 */
export CollectionsListDeserializeFromBuffer(SourceBufferSizeInBytes, SourceBuffer, TargetCollection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListDeserializeFromBuffer", "uint", SourceBufferSizeInBytes, "ptr", SourceBuffer, SENSOR_COLLECTION_LIST.Ptr, TargetCollection, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} Index 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pSensorsList 
 * @param {Pointer<PROPERTYKEY>} pKey 
 * @param {Pointer<PROPVARIANT>} pValue 
 * @returns {NTSTATUS} 
 */
export SensorCollectionGetAt(Index, pSensorsList, pKey, pValue) {
    result := DllCall("SensorsUtilsV2.dll\SensorCollectionGetAt", "uint", Index, SENSOR_COLLECTION_LIST.Ptr, pSensorsList, PROPERTYKEY.Ptr, pKey, PROPVARIANT.Ptr, pValue, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Integer} BufferSizeBytes 
 * @returns {Integer} 
 */
export CollectionsListGetFillableCount(BufferSizeBytes) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListGetFillableCount", "uint", BufferSizeBytes, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} newSample 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} oldSample 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} thresholds 
 * @returns {BOOLEAN} 
 */
export EvaluateActivityThresholds(newSample, oldSample, thresholds) {
    result := DllCall("SensorsUtilsV2.dll\EvaluateActivityThresholds", SENSOR_COLLECTION_LIST.Ptr, newSample, SENSOR_COLLECTION_LIST.Ptr, oldSample, SENSOR_COLLECTION_LIST.Ptr, thresholds, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} thresholds 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} pCollection 
 * @returns {NTSTATUS} 
 */
export CollectionsListSortSubscribedActivitiesByConfidence(thresholds, pCollection) {
    result := DllCall("SensorsUtilsV2.dll\CollectionsListSortSubscribedActivitiesByConfidence", SENSOR_COLLECTION_LIST.Ptr, thresholds, SENSOR_COLLECTION_LIST.Ptr, pCollection, NTSTATUS)
    NTSTATUS.ThrowIfError(result)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} members 
 * @param {Integer} _size 
 * @param {Pointer<PROPVARIANT>} ppropvar 
 * @returns {HRESULT} 
 */
export InitPropVariantFromCLSIDArray(members, _size, ppropvar) {
    result := DllCall("SensorsUtilsV2.dll\InitPropVariantFromCLSIDArray", Guid.Ptr, members, "uint", _size, PROPVARIANT.Ptr, ppropvar, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<SENSOR_COLLECTION_LIST>} subscriptionList 
 * @param {Guid} currentType 
 * @returns {BOOLEAN} 
 */
export IsSensorSubscribed(subscriptionList, currentType) {
    result := DllCall("SensorsUtilsV2.dll\IsSensorSubscribed", SENSOR_COLLECTION_LIST.Ptr, subscriptionList, Guid, currentType, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Guid>} guidArray 
 * @param {Integer} arrayLength 
 * @param {Pointer<Guid>} guidElem 
 * @returns {BOOLEAN} 
 */
export IsGUIDPresentInList(guidArray, arrayLength, guidElem) {
    result := DllCall("SensorsUtilsV2.dll\IsGUIDPresentInList", Guid.Ptr, guidArray, "uint", arrayLength, Guid.Ptr, guidElem, BOOLEAN)
    return result
}

;@endregion Functions
