#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\CO_SAP.ahk" { CO_SAP }
#Import ".\NDIS_CONFIGURATION_PARAMETER.ahk" { NDIS_CONFIGURATION_PARAMETER }
#Import ".\NDIS_TIMER.ahk" { NDIS_TIMER }
#Import ".\LOCK_STATE.ahk" { LOCK_STATE }
#Import ".\NDIS_DMA_DESCRIPTION.ahk" { NDIS_DMA_DESCRIPTION }
#Import ".\VAR_STRING.ahk" { VAR_STRING }
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import ".\NDIS_MINIPORT_TIMER.ahk" { NDIS_MINIPORT_TIMER }
#Import ".\NDIS_PARAMETER_TYPE.ahk" { NDIS_PARAMETER_TYPE }
#Import ".\CO_CALL_PARAMETERS.ahk" { CO_CALL_PARAMETERS }
#Import ".\CO_ADDRESS_FAMILY.ahk" { CO_ADDRESS_FAMILY }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\NDIS_EVENT.ahk" { NDIS_EVENT }
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\NDIS_CALL_MANAGER_CHARACTERISTICS.ahk" { NDIS_CALL_MANAGER_CHARACTERISTICS }
#Import ".\NDIS_RW_LOCK.ahk" { NDIS_RW_LOCK }
#Import "..\..\System\SystemServices\CM_RESOURCE_LIST.ahk" { CM_RESOURCE_LIST }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */

;@region Functions
/**
 * 
 * @param {Pointer<NDIS_RW_LOCK>} Lock 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisInitializeReadWriteLock(Lock) {
    DllCall("NDIS.sys\NdisInitializeReadWriteLock", NDIS_RW_LOCK.Ptr, Lock)
}

/**
 * 
 * @param {Pointer<NDIS_RW_LOCK>} Lock 
 * @param {BOOLEAN} fWrite 
 * @param {Pointer<LOCK_STATE>} LockState 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisAcquireReadWriteLock(Lock, fWrite, LockState) {
    DllCall("NDIS.sys\NdisAcquireReadWriteLock", NDIS_RW_LOCK.Ptr, Lock, BOOLEAN, fWrite, LOCK_STATE.Ptr, LockState)
}

/**
 * 
 * @param {Pointer<NDIS_RW_LOCK>} Lock 
 * @param {Pointer<LOCK_STATE>} LockState 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisReleaseReadWriteLock(Lock, LockState) {
    DllCall("NDIS.sys\NdisReleaseReadWriteLock", NDIS_RW_LOCK.Ptr, Lock, LOCK_STATE.Ptr, LockState)
}

/**
 * 
 * @param {Pointer<Integer>} pCpuUsage 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisGetCurrentProcessorCpuUsage(pCpuUsage) {
    pCpuUsageMarshal := pCpuUsage is VarRef ? "uint*" : "ptr"

    DllCall("NDIS.sys\NdisGetCurrentProcessorCpuUsage", pCpuUsageMarshal, pCpuUsage)
}

/**
 * 
 * @param {Pointer<Integer>} pIdleCount 
 * @param {Pointer<Integer>} pKernelAndUser 
 * @param {Pointer<Integer>} pIndex 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisGetCurrentProcessorCounts(pIdleCount, pKernelAndUser, pIndex) {
    pIdleCountMarshal := pIdleCount is VarRef ? "uint*" : "ptr"
    pKernelAndUserMarshal := pKernelAndUser is VarRef ? "uint*" : "ptr"
    pIndexMarshal := pIndex is VarRef ? "uint*" : "ptr"

    DllCall("NDIS.sys\NdisGetCurrentProcessorCounts", pIdleCountMarshal, pIdleCount, pKernelAndUserMarshal, pKernelAndUser, pIndexMarshal, pIndex)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @param {Pointer<UNICODE_STRING>} SubKeyName 
 * @param {Pointer<Pointer<Void>>} SubKeyHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisOpenConfigurationKeyByName(_Status, ConfigurationHandle, SubKeyName, SubKeyHandle) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"
    SubKeyHandleMarshal := SubKeyHandle is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisOpenConfigurationKeyByName", _StatusMarshal, _Status, ConfigurationHandleMarshal, ConfigurationHandle, UNICODE_STRING.Ptr, SubKeyName, SubKeyHandleMarshal, SubKeyHandle)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @param {Integer} Index 
 * @param {Pointer<UNICODE_STRING>} KeyName 
 * @param {Pointer<Pointer<Void>>} KeyHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisOpenConfigurationKeyByIndex(_Status, ConfigurationHandle, Index, KeyName, KeyHandle) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"
    KeyHandleMarshal := KeyHandle is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisOpenConfigurationKeyByIndex", _StatusMarshal, _Status, ConfigurationHandleMarshal, ConfigurationHandle, "uint", Index, UNICODE_STRING.Ptr, KeyName, KeyHandleMarshal, KeyHandle)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Pointer<NDIS_CONFIGURATION_PARAMETER>>} ParameterValue 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @param {Pointer<UNICODE_STRING>} Keyword 
 * @param {NDIS_PARAMETER_TYPE} ParameterType 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisReadConfiguration(_Status, ParameterValue, ConfigurationHandle, Keyword, ParameterType) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    ParameterValueMarshal := ParameterValue is VarRef ? "ptr*" : "ptr"
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisReadConfiguration", _StatusMarshal, _Status, ParameterValueMarshal, ParameterValue, ConfigurationHandleMarshal, ConfigurationHandle, UNICODE_STRING.Ptr, Keyword, NDIS_PARAMETER_TYPE, ParameterType)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @param {Pointer<UNICODE_STRING>} Keyword 
 * @param {Pointer<NDIS_CONFIGURATION_PARAMETER>} ParameterValue 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisWriteConfiguration(_Status, ConfigurationHandle, Keyword, ParameterValue) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisWriteConfiguration", _StatusMarshal, _Status, ConfigurationHandleMarshal, ConfigurationHandle, UNICODE_STRING.Ptr, Keyword, NDIS_CONFIGURATION_PARAMETER.Ptr, ParameterValue)
}

/**
 * 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCloseConfiguration(ConfigurationHandle) {
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCloseConfiguration", ConfigurationHandleMarshal, ConfigurationHandle)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Pointer<Void>>} NetworkAddress 
 * @param {Pointer<Integer>} NetworkAddressLength 
 * @param {Pointer<Void>} ConfigurationHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisReadNetworkAddress(_Status, NetworkAddress, NetworkAddressLength, ConfigurationHandle) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    NetworkAddressMarshal := NetworkAddress is VarRef ? "ptr*" : "ptr"
    NetworkAddressLengthMarshal := NetworkAddressLength is VarRef ? "uint*" : "ptr"
    ConfigurationHandleMarshal := ConfigurationHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisReadNetworkAddress", _StatusMarshal, _Status, NetworkAddressMarshal, NetworkAddress, NetworkAddressLengthMarshal, NetworkAddressLength, ConfigurationHandleMarshal, ConfigurationHandle)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Pointer<MDL>>} _Buffer 
 * @param {Pointer<Void>} PoolHandle 
 * @param {Pointer<Void>} MemoryDescriptor 
 * @param {Integer} Offset 
 * @param {Integer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCopyBuffer(_Status, _Buffer, PoolHandle, MemoryDescriptor, Offset, Length) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    _BufferMarshal := _Buffer is VarRef ? "ptr*" : "ptr"
    PoolHandleMarshal := PoolHandle is VarRef ? "ptr" : "ptr"
    MemoryDescriptorMarshal := MemoryDescriptor is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCopyBuffer", _StatusMarshal, _Status, _BufferMarshal, _Buffer, PoolHandleMarshal, PoolHandle, MemoryDescriptorMarshal, MemoryDescriptor, "uint", Offset, "uint", Length)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} VirtualAddress 
 * @param {Integer} Length 
 * @param {Integer} Tag 
 * @returns {Integer} 
 */
export NdisAllocateMemoryWithTag(VirtualAddress, Length, Tag) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisAllocateMemoryWithTag", VirtualAddressMarshal, VirtualAddress, "uint", Length, "uint", Tag, Int32)
    return result
}

/**
 * 
 * @param {Integer} VirtualAddress 
 * @param {Integer} Length 
 * @param {Integer} MemoryFlags 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisFreeMemory(VirtualAddress, Length, MemoryFlags) {
    DllCall("NDIS.sys\NdisFreeMemory", "ptr", VirtualAddress, "uint", Length, "uint", MemoryFlags)
}

/**
 * 
 * @param {Pointer<NDIS_EVENT>} Event 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisInitializeEvent(Event) {
    DllCall("NDIS.sys\NdisInitializeEvent", NDIS_EVENT.Ptr, Event)
}

/**
 * 
 * @param {Pointer<NDIS_EVENT>} Event 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisSetEvent(Event) {
    DllCall("NDIS.sys\NdisSetEvent", NDIS_EVENT.Ptr, Event)
}

/**
 * 
 * @param {Pointer<NDIS_EVENT>} Event 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisResetEvent(Event) {
    DllCall("NDIS.sys\NdisResetEvent", NDIS_EVENT.Ptr, Event)
}

/**
 * 
 * @param {Pointer<NDIS_EVENT>} Event 
 * @param {Integer} MsToWait 
 * @returns {BOOLEAN} 
 */
export NdisWaitEvent(Event, MsToWait) {
    result := DllCall("NDIS.sys\NdisWaitEvent", NDIS_EVENT.Ptr, Event, "uint", MsToWait, BOOLEAN)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Pointer<Void>>} FileHandle 
 * @param {Pointer<Integer>} FileLength 
 * @param {Pointer<UNICODE_STRING>} FileName 
 * @param {Integer} HighestAcceptableAddress 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisOpenFile(_Status, FileHandle, FileLength, FileName, HighestAcceptableAddress) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    FileHandleMarshal := FileHandle is VarRef ? "ptr*" : "ptr"
    FileLengthMarshal := FileLength is VarRef ? "uint*" : "ptr"

    DllCall("NDIS.sys\NdisOpenFile", _StatusMarshal, _Status, FileHandleMarshal, FileHandle, FileLengthMarshal, FileLength, UNICODE_STRING.Ptr, FileName, "int64", HighestAcceptableAddress)
}

/**
 * 
 * @param {Pointer<Void>} FileHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCloseFile(FileHandle) {
    FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCloseFile", FileHandleMarshal, FileHandle)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Pointer<Void>>} MappedBuffer 
 * @param {Pointer<Void>} FileHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMapFile(_Status, MappedBuffer, FileHandle) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    MappedBufferMarshal := MappedBuffer is VarRef ? "ptr*" : "ptr"
    FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMapFile", _StatusMarshal, _Status, MappedBufferMarshal, MappedBuffer, FileHandleMarshal, FileHandle)
}

/**
 * 
 * @param {Pointer<Void>} FileHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisUnmapFile(FileHandle) {
    FileHandleMarshal := FileHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisUnmapFile", FileHandleMarshal, FileHandle)
}

/**
 * 
 * @returns {Integer} 
 */
export NdisGetSharedDataAlignment() {
    result := DllCall("NDIS.sys\NdisGetSharedDataAlignment", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisAdapterHandle 
 * @param {Integer} ErrorCode 
 * @param {Integer} NumberOfErrorValues 
 * @param {Any} args* Additional arguments as alternating DllCall type/value pairs (e.g., "int", 42, "str", "hello")
 * @returns {String} Nothing - always returns an empty string
 */
export NdisWriteErrorLogEntry(NdisAdapterHandle, ErrorCode, NumberOfErrorValues, args*) {
    NdisAdapterHandleMarshal := NdisAdapterHandle is VarRef ? "ptr" : "ptr"

    varArgs := [args*]

    DllCall("NDIS.sys\NdisWriteErrorLogEntry", NdisAdapterHandleMarshal, NdisAdapterHandle, "uint", ErrorCode, "uint", NumberOfErrorValues, varArgs*)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} Destination 
 * @param {Pointer<Integer>} Source 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisInitializeString(Destination, Source) {
    SourceMarshal := Source is VarRef ? "char*" : "ptr"

    DllCall("NDIS.sys\NdisInitializeString", UNICODE_STRING.Ptr, Destination, SourceMarshal, Source)
}

/**
 * 
 * @param {Pointer<NDIS_TIMER>} Timer 
 * @param {Pointer<PNDIS_TIMER_FUNCTION>} TimerFunction 
 * @param {Pointer<Void>} FunctionContext 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisInitializeTimer(Timer, TimerFunction, FunctionContext) {
    FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisInitializeTimer", NDIS_TIMER.Ptr, Timer, "ptr", TimerFunction, FunctionContextMarshal, FunctionContext)
}

/**
 * 
 * @param {Pointer<NDIS_TIMER>} Timer 
 * @param {Pointer<BOOLEAN>} TimerCancelled 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCancelTimer(Timer, TimerCancelled) {
    TimerCancelledMarshal := TimerCancelled is VarRef ? "char*" : "ptr"

    DllCall("NDIS.sys\NdisCancelTimer", NDIS_TIMER.Ptr, Timer, TimerCancelledMarshal, TimerCancelled)
}

/**
 * 
 * @param {Pointer<NDIS_TIMER>} Timer 
 * @param {Integer} MillisecondsToDelay 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisSetTimer(Timer, MillisecondsToDelay) {
    DllCall("NDIS.sys\NdisSetTimer", NDIS_TIMER.Ptr, Timer, "uint", MillisecondsToDelay)
}

/**
 * 
 * @param {Pointer<NDIS_TIMER>} NdisTimer 
 * @param {Integer} MillisecondsPeriod 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisSetPeriodicTimer(NdisTimer, MillisecondsPeriod) {
    DllCall("NDIS.sys\NdisSetPeriodicTimer", NDIS_TIMER.Ptr, NdisTimer, "uint", MillisecondsPeriod)
}

/**
 * 
 * @param {Pointer<NDIS_TIMER>} NdisTimer 
 * @param {Integer} MillisecondsToDelay 
 * @param {Pointer<Void>} FunctionContext 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisSetTimerEx(NdisTimer, MillisecondsToDelay, FunctionContext) {
    FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisSetTimerEx", NDIS_TIMER.Ptr, NdisTimer, "uint", MillisecondsToDelay, FunctionContextMarshal, FunctionContext)
}

/**
 * 
 * @returns {Integer} 
 */
export NdisSystemProcessorCount() {
    result := DllCall("NDIS.sys\NdisSystemProcessorCount", Int8)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} NdisRoutineName 
 * @returns {Pointer<Void>} 
 */
export NdisGetRoutineAddress(NdisRoutineName) {
    result := DllCall("NDIS.sys\NdisGetRoutineAddress", UNICODE_STRING.Ptr, NdisRoutineName, IntPtr)
    return result
}

/**
 * 
 * @returns {Integer} 
 */
export NdisGetVersion() {
    result := DllCall("NDIS.sys\NdisGetVersion", UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisProtocolHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisReEnumerateProtocolBindings(NdisProtocolHandle) {
    NdisProtocolHandleMarshal := NdisProtocolHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisReEnumerateProtocolBindings", NdisProtocolHandleMarshal, NdisProtocolHandle)
}

/**
 * 
 * @param {Pointer<Void>} LogHandle 
 * @param {Integer} EventCode 
 * @param {Integer} UniqueEventValue 
 * @param {Integer} NumStrings 
 * @param {Pointer<Void>} StringsList 
 * @param {Integer} DataSize 
 * @param {Integer} Data 
 * @returns {Integer} 
 */
export NdisWriteEventLogEntry(LogHandle, EventCode, UniqueEventValue, NumStrings, StringsList, DataSize, Data) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"
    StringsListMarshal := StringsList is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisWriteEventLogEntry", LogHandleMarshal, LogHandle, "int", EventCode, "uint", UniqueEventValue, "ushort", NumStrings, StringsListMarshal, StringsList, "uint", DataSize, "ptr", Data, Int32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
 * @param {Pointer<Void>} NdisBindingHandle 
 * @returns {Integer} 
 */
export NdisQueryAdapterInstanceName(pAdapterInstanceName, NdisBindingHandle) {
    NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisQueryAdapterInstanceName", UNICODE_STRING.Ptr, pAdapterInstanceName, NdisBindingHandleMarshal, NdisBindingHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
 * @param {Pointer<Void>} BindingContext 
 * @returns {Integer} 
 */
export NdisQueryBindInstanceName(pAdapterInstanceName, BindingContext) {
    BindingContextMarshal := BindingContext is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisQueryBindInstanceName", UNICODE_STRING.Ptr, pAdapterInstanceName, BindingContextMarshal, BindingContext, Int32)
    return result
}

/**
 * 
 * @param {Pointer<TDI_REGISTER_CALLBACK>} RegisterCallback 
 * @param {Pointer<TDI_PNP_HANDLER>} PnPHandler 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisRegisterTdiCallBack(RegisterCallback, PnPHandler) {
    DllCall("NDIS.sys\NdisRegisterTdiCallBack", "ptr", RegisterCallback, "ptr", PnPHandler)
}

/**
 * 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisDeregisterTdiCallBack() {
    DllCall("NDIS.sys\NdisDeregisterTdiCallBack")
}

/**
 * 
 * @returns {Integer} 
 */
export NdisGeneratePartialCancelId() {
    result := DllCall("NDIS.sys\NdisGeneratePartialCancelId", Int8)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} Length 
 * @param {BOOLEAN} Cached 
 * @param {Pointer<Void>} _Context 
 * @returns {Integer} 
 */
export NdisMAllocateSharedMemoryAsync(MiniportAdapterHandle, Length, Cached, _Context) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMAllocateSharedMemoryAsync", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, BOOLEAN, Cached, _ContextMarshal, _Context, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Void>} NdisDmaHandle 
 * @param {Pointer<MDL>} _Buffer 
 * @param {Integer} Offset 
 * @param {Integer} Length 
 * @param {BOOLEAN} WriteToDevice 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisSetupDmaTransfer(_Status, NdisDmaHandle, _Buffer, Offset, Length, WriteToDevice) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    NdisDmaHandleMarshal := NdisDmaHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisSetupDmaTransfer", _StatusMarshal, _Status, NdisDmaHandleMarshal, NdisDmaHandle, MDL.Ptr, _Buffer, "uint", Offset, "uint", Length, BOOLEAN, WriteToDevice)
}

/**
 * 
 * @param {Pointer<Integer>} _Status 
 * @param {Pointer<Void>} NdisDmaHandle 
 * @param {Pointer<MDL>} _Buffer 
 * @param {Integer} Offset 
 * @param {Integer} Length 
 * @param {BOOLEAN} WriteToDevice 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCompleteDmaTransfer(_Status, NdisDmaHandle, _Buffer, Offset, Length, WriteToDevice) {
    _StatusMarshal := _Status is VarRef ? "int*" : "ptr"
    NdisDmaHandleMarshal := NdisDmaHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCompleteDmaTransfer", _StatusMarshal, _Status, NdisDmaHandleMarshal, NdisDmaHandle, MDL.Ptr, _Buffer, "uint", Offset, "uint", Length, BOOLEAN, WriteToDevice)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} MiniportDmaHandle 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} DmaChannel 
 * @param {BOOLEAN} Dma32BitAddresses 
 * @param {Pointer<NDIS_DMA_DESCRIPTION>} DmaDescription 
 * @param {Integer} MaximumLength 
 * @returns {Integer} 
 */
export NdisMRegisterDmaChannel(MiniportDmaHandle, MiniportAdapterHandle, DmaChannel, Dma32BitAddresses, DmaDescription, MaximumLength) {
    MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr*" : "ptr"
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMRegisterDmaChannel", MiniportDmaHandleMarshal, MiniportDmaHandle, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", DmaChannel, BOOLEAN, Dma32BitAddresses, NDIS_DMA_DESCRIPTION.Ptr, DmaDescription, "uint", MaximumLength, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportDmaHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMDeregisterDmaChannel(MiniportDmaHandle) {
    MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMDeregisterDmaChannel", MiniportDmaHandleMarshal, MiniportDmaHandle)
}

/**
 * 
 * @param {Pointer<Void>} MiniportDmaHandle 
 * @returns {Integer} 
 */
export NdisMReadDmaCounter(MiniportDmaHandle) {
    MiniportDmaHandleMarshal := MiniportDmaHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMReadDmaCounter", MiniportDmaHandleMarshal, MiniportDmaHandle, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisAdapterHandle 
 * @param {Integer} Length 
 * @param {Pointer<Void>} VirtualAddress 
 * @param {Integer} PhysicalAddress 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisUpdateSharedMemory(NdisAdapterHandle, Length, VirtualAddress, PhysicalAddress) {
    NdisAdapterHandleMarshal := NdisAdapterHandle is VarRef ? "ptr" : "ptr"
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisUpdateSharedMemory", NdisAdapterHandleMarshal, NdisAdapterHandle, "uint", Length, VirtualAddressMarshal, VirtualAddress, "int64", PhysicalAddress)
}

/**
 * 
 * @param {Pointer<Void>} DriverHandle 
 * @param {Pointer<Void>} ProtocolHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisIMAssociateMiniport(DriverHandle, ProtocolHandle) {
    DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"
    ProtocolHandleMarshal := ProtocolHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisIMAssociateMiniport", DriverHandleMarshal, DriverHandle, ProtocolHandleMarshal, ProtocolHandle)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} PortOffset 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} InitialPort 
 * @param {Integer} NumberOfPorts 
 * @returns {Integer} 
 */
export NdisMRegisterIoPortRange(PortOffset, MiniportAdapterHandle, InitialPort, NumberOfPorts) {
    PortOffsetMarshal := PortOffset is VarRef ? "ptr*" : "ptr"
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMRegisterIoPortRange", PortOffsetMarshal, PortOffset, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", InitialPort, "uint", NumberOfPorts, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} InitialPort 
 * @param {Integer} NumberOfPorts 
 * @param {Pointer<Void>} PortOffset 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMDeregisterIoPortRange(MiniportAdapterHandle, InitialPort, NumberOfPorts, PortOffset) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    PortOffsetMarshal := PortOffset is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMDeregisterIoPortRange", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", InitialPort, "uint", NumberOfPorts, PortOffsetMarshal, PortOffset)
}

/**
 * 
 * @param {Pointer<Pointer<Void>>} VirtualAddress 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} PhysicalAddress 
 * @param {Integer} Length 
 * @returns {Integer} 
 */
export NdisMMapIoSpace(VirtualAddress, MiniportAdapterHandle, PhysicalAddress, Length) {
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMMapIoSpace", VirtualAddressMarshal, VirtualAddress, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "int64", PhysicalAddress, "uint", Length, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} VirtualAddress 
 * @param {Integer} Length 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMUnmapIoSpace(MiniportAdapterHandle, VirtualAddress, Length) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMUnmapIoSpace", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "ptr", VirtualAddress, "uint", Length)
}

/**
 * 
 * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
 * @param {Integer} MillisecondPeriod 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMSetPeriodicTimer(Timer, MillisecondPeriod) {
    DllCall("NDIS.sys\NdisMSetPeriodicTimer", NDIS_MINIPORT_TIMER.Ptr, Timer, "uint", MillisecondPeriod)
}

/**
 * 
 * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Pointer<PNDIS_TIMER_FUNCTION>} TimerFunction 
 * @param {Pointer<Void>} FunctionContext 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMInitializeTimer(Timer, MiniportAdapterHandle, TimerFunction, FunctionContext) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    FunctionContextMarshal := FunctionContext is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMInitializeTimer", NDIS_MINIPORT_TIMER.Ptr, Timer, MiniportAdapterHandleMarshal, MiniportAdapterHandle, "ptr", TimerFunction, FunctionContextMarshal, FunctionContext)
}

/**
 * 
 * @param {Pointer<NDIS_MINIPORT_TIMER>} Timer 
 * @param {Pointer<BOOLEAN>} TimerCancelled 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMCancelTimer(Timer, TimerCancelled) {
    TimerCancelledMarshal := TimerCancelled is VarRef ? "char*" : "ptr"

    DllCall("NDIS.sys\NdisMCancelTimer", NDIS_MINIPORT_TIMER.Ptr, Timer, TimerCancelledMarshal, TimerCancelled)
}

/**
 * 
 * @param {Integer} MicrosecondsToSleep 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMSleep(MicrosecondsToSleep) {
    DllCall("NDIS.sys\NdisMSleep", "uint", MicrosecondsToSleep)
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @returns {Integer} 
 */
export NdisMGetDmaAlignment(MiniportAdapterHandle) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMGetDmaAlignment", MiniportAdapterHandleMarshal, MiniportAdapterHandle, UInt32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} Length 
 * @param {BOOLEAN} Cached 
 * @param {Pointer<Pointer<Void>>} VirtualAddress 
 * @param {Pointer<Integer>} PhysicalAddress 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMAllocateSharedMemory(MiniportAdapterHandle, Length, Cached, VirtualAddress, PhysicalAddress) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr*" : "ptr"
    PhysicalAddressMarshal := PhysicalAddress is VarRef ? "int64*" : "ptr"

    DllCall("NDIS.sys\NdisMAllocateSharedMemory", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, BOOLEAN, Cached, VirtualAddressMarshal, VirtualAddress, PhysicalAddressMarshal, PhysicalAddress)
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} Length 
 * @param {BOOLEAN} Cached 
 * @param {Integer} VirtualAddress 
 * @param {Integer} PhysicalAddress 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMFreeSharedMemory(MiniportAdapterHandle, Length, Cached, VirtualAddress, PhysicalAddress) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMFreeSharedMemory", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", Length, BOOLEAN, Cached, "ptr", VirtualAddress, "int64", PhysicalAddress)
}

/**
 * 
 * @param {Pointer<Void>} DriverHandle 
 * @param {Pointer<UNICODE_STRING>} DriverInstance 
 * @param {Pointer<Void>} DeviceContext 
 * @returns {Integer} 
 */
export NdisIMInitializeDeviceInstanceEx(DriverHandle, DriverInstance, DeviceContext) {
    DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"
    DeviceContextMarshal := DeviceContext is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisIMInitializeDeviceInstanceEx", DriverHandleMarshal, DriverHandle, UNICODE_STRING.Ptr, DriverInstance, DeviceContextMarshal, DeviceContext, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} DriverHandle 
 * @param {Pointer<UNICODE_STRING>} DeviceInstance 
 * @returns {Integer} 
 */
export NdisIMCancelInitializeDeviceInstance(DriverHandle, DeviceInstance) {
    DriverHandleMarshal := DriverHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisIMCancelInitializeDeviceInstance", DriverHandleMarshal, DriverHandle, UNICODE_STRING.Ptr, DeviceInstance, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisBindingHandle 
 * @returns {Pointer<Void>} 
 */
export NdisIMGetBindingContext(NdisBindingHandle) {
    NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisIMGetBindingContext", NdisBindingHandleMarshal, NdisBindingHandle, IntPtr)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisMiniportHandle 
 * @returns {Integer} 
 */
export NdisIMDeInitializeDeviceInstance(NdisMiniportHandle) {
    NdisMiniportHandleMarshal := NdisMiniportHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisIMDeInitializeDeviceInstance", NdisMiniportHandleMarshal, NdisMiniportHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportHandle 
 * @returns {Integer} 
 */
export NdisMRemoveMiniport(MiniportHandle) {
    MiniportHandleMarshal := MiniportHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMRemoveMiniport", MiniportHandleMarshal, MiniportHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Integer} _Size 
 * @param {Pointer<Pointer<Void>>} LogHandle 
 * @returns {Integer} 
 */
export NdisMCreateLog(MiniportAdapterHandle, _Size, LogHandle) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    LogHandleMarshal := LogHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisMCreateLog", MiniportAdapterHandleMarshal, MiniportAdapterHandle, "uint", _Size, LogHandleMarshal, LogHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} LogHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMCloseLog(LogHandle) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMCloseLog", LogHandleMarshal, LogHandle)
}

/**
 * 
 * @param {Pointer<Void>} LogHandle 
 * @param {Integer} LogBuffer 
 * @param {Integer} LogBufferSize 
 * @returns {Integer} 
 */
export NdisMWriteLogData(LogHandle, LogBuffer, LogBufferSize) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMWriteLogData", LogHandleMarshal, LogHandle, "ptr", LogBuffer, "uint", LogBufferSize, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} LogHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMFlushLog(LogHandle) {
    LogHandleMarshal := LogHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMFlushLog", LogHandleMarshal, LogHandle)
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} PhysicalDeviceObject 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} FunctionalDeviceObject 
 * @param {Pointer<Pointer<DEVICE_OBJECT>>} NextDeviceObject 
 * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResources 
 * @param {Pointer<Pointer<CM_RESOURCE_LIST>>} AllocatedResourcesTranslated 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMGetDeviceProperty(MiniportAdapterHandle, PhysicalDeviceObject, FunctionalDeviceObject, NextDeviceObject, AllocatedResources, AllocatedResourcesTranslated) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    PhysicalDeviceObjectMarshal := PhysicalDeviceObject is VarRef ? "ptr*" : "ptr"
    FunctionalDeviceObjectMarshal := FunctionalDeviceObject is VarRef ? "ptr*" : "ptr"
    NextDeviceObjectMarshal := NextDeviceObject is VarRef ? "ptr*" : "ptr"
    AllocatedResourcesMarshal := AllocatedResources is VarRef ? "ptr*" : "ptr"
    AllocatedResourcesTranslatedMarshal := AllocatedResourcesTranslated is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisMGetDeviceProperty", MiniportAdapterHandleMarshal, MiniportAdapterHandle, PhysicalDeviceObjectMarshal, PhysicalDeviceObject, FunctionalDeviceObjectMarshal, FunctionalDeviceObject, NextDeviceObjectMarshal, NextDeviceObject, AllocatedResourcesMarshal, AllocatedResources, AllocatedResourcesTranslatedMarshal, AllocatedResourcesTranslated)
}

/**
 * 
 * @param {Pointer<UNICODE_STRING>} pAdapterInstanceName 
 * @param {Pointer<Void>} MiniportHandle 
 * @returns {Integer} 
 */
export NdisMQueryAdapterInstanceName(pAdapterInstanceName, MiniportHandle) {
    MiniportHandleMarshal := MiniportHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMQueryAdapterInstanceName", UNICODE_STRING.Ptr, pAdapterInstanceName, MiniportHandleMarshal, MiniportHandle, Int32)
    return result
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMCoActivateVcComplete(_Status, NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisMCoActivateVcComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisMCoDeactivateVcComplete(_Status, NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisMCoDeactivateVcComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle)
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Pointer<CO_ADDRESS_FAMILY>} AddressFamily 
 * @param {Pointer<NDIS_CALL_MANAGER_CHARACTERISTICS>} CmCharacteristics 
 * @param {Integer} SizeOfCmCharacteristics 
 * @returns {Integer} 
 */
export NdisMCmRegisterAddressFamily(MiniportAdapterHandle, AddressFamily, CmCharacteristics, SizeOfCmCharacteristics) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    CmCharacteristicsMarshal := CmCharacteristics is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisMCmRegisterAddressFamily", MiniportAdapterHandleMarshal, MiniportAdapterHandle, CO_ADDRESS_FAMILY.Ptr, AddressFamily, CmCharacteristicsMarshal, CmCharacteristics, "uint", SizeOfCmCharacteristics, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} MiniportAdapterHandle 
 * @param {Pointer<Void>} NdisAfHandle 
 * @param {Pointer<Void>} MiniportVcContext 
 * @param {Pointer<Pointer<Void>>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisMCmCreateVc(MiniportAdapterHandle, NdisAfHandle, MiniportVcContext, NdisVcHandle) {
    MiniportAdapterHandleMarshal := MiniportAdapterHandle is VarRef ? "ptr" : "ptr"
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
    MiniportVcContextMarshal := MiniportVcContext is VarRef ? "ptr" : "ptr"
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisMCmCreateVc", MiniportAdapterHandleMarshal, MiniportAdapterHandle, NdisAfHandleMarshal, NdisAfHandle, MiniportVcContextMarshal, MiniportVcContext, NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisMCmDeleteVc(NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMCmDeleteVc", NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {Integer} 
 */
export NdisMCmActivateVc(NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisMCmActivateVc", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisMCmDeactivateVc(NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisMCmDeactivateVc", NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<UNICODE_STRING>} BaseInstanceName 
 * @param {Pointer<UNICODE_STRING>} VcInstanceName 
 * @returns {Integer} 
 */
export NdisCoAssignInstanceName(NdisVcHandle, BaseInstanceName, VcInstanceName) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisCoAssignInstanceName", NdisVcHandleMarshal, NdisVcHandle, UNICODE_STRING.Ptr, BaseInstanceName, UNICODE_STRING.Ptr, VcInstanceName, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisBindingHandle 
 * @param {Pointer<Void>} NdisAfHandle 
 * @param {Pointer<Void>} ProtocolVcContext 
 * @param {Pointer<Pointer<Void>>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisCoCreateVc(NdisBindingHandle, NdisAfHandle, ProtocolVcContext, NdisVcHandle) {
    NdisBindingHandleMarshal := NdisBindingHandle is VarRef ? "ptr" : "ptr"
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
    ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr" : "ptr"
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisCoCreateVc", NdisBindingHandleMarshal, NdisBindingHandle, NdisAfHandleMarshal, NdisAfHandle, ProtocolVcContextMarshal, ProtocolVcContext, NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisCoDeleteVc(NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisCoDeleteVc", NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<VAR_STRING>} TapiCallId 
 * @returns {Integer} 
 */
export NdisCoGetTapiCallId(NdisVcHandle, TapiCallId) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisCoGetTapiCallId", NdisVcHandleMarshal, NdisVcHandle, VAR_STRING.Ptr, TapiCallId, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisAfHandle 
 * @returns {Integer} 
 */
export NdisClCloseAddressFamily(NdisAfHandle) {
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisClCloseAddressFamily", NdisAfHandleMarshal, NdisAfHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisAfHandle 
 * @param {Pointer<Void>} ProtocolSapContext 
 * @param {Pointer<CO_SAP>} Sap 
 * @param {Pointer<Pointer<Void>>} NdisSapHandle 
 * @returns {Integer} 
 */
export NdisClRegisterSap(NdisAfHandle, ProtocolSapContext, Sap, NdisSapHandle) {
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
    ProtocolSapContextMarshal := ProtocolSapContext is VarRef ? "ptr" : "ptr"
    NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisClRegisterSap", NdisAfHandleMarshal, NdisAfHandle, ProtocolSapContextMarshal, ProtocolSapContext, CO_SAP.Ptr, Sap, NdisSapHandleMarshal, NdisSapHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisSapHandle 
 * @returns {Integer} 
 */
export NdisClDeregisterSap(NdisSapHandle) {
    NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisClDeregisterSap", NdisSapHandleMarshal, NdisSapHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @param {Pointer<Void>} ProtocolPartyContext 
 * @param {Pointer<Pointer<Void>>} NdisPartyHandle 
 * @returns {Integer} 
 */
export NdisClMakeCall(NdisVcHandle, CallParameters, ProtocolPartyContext, NdisPartyHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"
    ProtocolPartyContextMarshal := ProtocolPartyContext is VarRef ? "ptr" : "ptr"
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisClMakeCall", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, ProtocolPartyContextMarshal, ProtocolPartyContext, NdisPartyHandleMarshal, NdisPartyHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @param {Integer} _Buffer 
 * @param {Integer} _Size 
 * @returns {Integer} 
 */
export NdisClCloseCall(NdisVcHandle, NdisPartyHandle, _Buffer, _Size) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisClCloseCall", NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle, "ptr", _Buffer, "uint", _Size, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {Integer} 
 */
export NdisClModifyCallQoS(NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisClModifyCallQoS", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, Int32)
    return result
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisClIncomingCallComplete(_Status, NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisClIncomingCallComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<Void>} ProtocolPartyContext 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @param {Pointer<Pointer<Void>>} NdisPartyHandle 
 * @returns {Integer} 
 */
export NdisClAddParty(NdisVcHandle, ProtocolPartyContext, CallParameters, NdisPartyHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    ProtocolPartyContextMarshal := ProtocolPartyContext is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisClAddParty", NdisVcHandleMarshal, NdisVcHandle, ProtocolPartyContextMarshal, ProtocolPartyContext, CallParametersMarshal, CallParameters, NdisPartyHandleMarshal, NdisPartyHandle, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @param {Integer} _Buffer 
 * @param {Integer} _Size 
 * @returns {Integer} 
 */
export NdisClDropParty(NdisPartyHandle, _Buffer, _Size) {
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisClDropParty", NdisPartyHandleMarshal, NdisPartyHandle, "ptr", _Buffer, "uint", _Size, Int32)
    return result
}

/**
 * 
 * @param {UNICODE_STRING} TapiCallId 
 * @param {Pointer<Pointer<Void>>} ProtocolVcContext 
 * @returns {Integer} 
 */
export NdisClGetProtocolVcContextFromTapiCallId(TapiCallId, ProtocolVcContext) {
    ProtocolVcContextMarshal := ProtocolVcContext is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisClGetProtocolVcContextFromTapiCallId", UNICODE_STRING, TapiCallId, ProtocolVcContextMarshal, ProtocolVcContext, Int32)
    return result
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisAfHandle 
 * @param {Pointer<Void>} CallMgrAfContext 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmOpenAddressFamilyComplete(_Status, NdisAfHandle, CallMgrAfContext) {
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"
    CallMgrAfContextMarshal := CallMgrAfContext is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmOpenAddressFamilyComplete", "int", _Status, NdisAfHandleMarshal, NdisAfHandle, CallMgrAfContextMarshal, CallMgrAfContext)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisAfHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmCloseAddressFamilyComplete(_Status, NdisAfHandle) {
    NdisAfHandleMarshal := NdisAfHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmCloseAddressFamilyComplete", "int", _Status, NdisAfHandleMarshal, NdisAfHandle)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisSapHandle 
 * @param {Pointer<Void>} CallMgrSapContext 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmRegisterSapComplete(_Status, NdisSapHandle, CallMgrSapContext) {
    NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"
    CallMgrSapContextMarshal := CallMgrSapContext is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmRegisterSapComplete", "int", _Status, NdisSapHandleMarshal, NdisSapHandle, CallMgrSapContextMarshal, CallMgrSapContext)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisSapHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDeregisterSapComplete(_Status, NdisSapHandle) {
    NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmDeregisterSapComplete", "int", _Status, NdisSapHandleMarshal, NdisSapHandle)
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {Integer} 
 */
export NdisCmActivateVc(NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisCmActivateVc", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {Integer} 
 */
export NdisCmDeactivateVc(NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("NDIS.sys\NdisCmDeactivateVc", NdisVcHandleMarshal, NdisVcHandle, Int32)
    return result
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @param {Pointer<Void>} CallMgrPartyContext 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmMakeCallComplete(_Status, NdisVcHandle, NdisPartyHandle, CallMgrPartyContext, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"
    CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisCmMakeCallComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle, CallMgrPartyContextMarshal, CallMgrPartyContext, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmCloseCallComplete(_Status, NdisVcHandle, NdisPartyHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmCloseCallComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle, NdisPartyHandleMarshal, NdisPartyHandle)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @param {Pointer<Void>} CallMgrPartyContext 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmAddPartyComplete(_Status, NdisPartyHandle, CallMgrPartyContext, CallParameters) {
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"
    CallMgrPartyContextMarshal := CallMgrPartyContext is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisCmAddPartyComplete", "int", _Status, NdisPartyHandleMarshal, NdisPartyHandle, CallMgrPartyContextMarshal, CallMgrPartyContext, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDropPartyComplete(_Status, NdisPartyHandle) {
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmDropPartyComplete", "int", _Status, NdisPartyHandleMarshal, NdisPartyHandle)
}

/**
 * 
 * @param {Pointer<Void>} NdisSapHandle 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {Integer} 
 */
export NdisCmDispatchIncomingCall(NdisSapHandle, NdisVcHandle, CallParameters) {
    NdisSapHandleMarshal := NdisSapHandle is VarRef ? "ptr" : "ptr"
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    result := DllCall("NDIS.sys\NdisCmDispatchIncomingCall", NdisSapHandleMarshal, NdisSapHandle, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters, Int32)
    return result
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDispatchCallConnected(NdisVcHandle) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmDispatchCallConnected", NdisVcHandleMarshal, NdisVcHandle)
}

/**
 * 
 * @param {Integer} _Status 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmModifyCallQoSComplete(_Status, NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisCmModifyCallQoSComplete", "int", _Status, NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Pointer<CO_CALL_PARAMETERS>} CallParameters 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDispatchIncomingCallQoSChange(NdisVcHandle, CallParameters) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"
    CallParametersMarshal := CallParameters is VarRef ? "ptr*" : "ptr"

    DllCall("NDIS.sys\NdisCmDispatchIncomingCallQoSChange", NdisVcHandleMarshal, NdisVcHandle, CallParametersMarshal, CallParameters)
}

/**
 * 
 * @param {Integer} CloseStatus 
 * @param {Pointer<Void>} NdisVcHandle 
 * @param {Integer} _Buffer 
 * @param {Integer} _Size 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDispatchIncomingCloseCall(CloseStatus, NdisVcHandle, _Buffer, _Size) {
    NdisVcHandleMarshal := NdisVcHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmDispatchIncomingCloseCall", "int", CloseStatus, NdisVcHandleMarshal, NdisVcHandle, "ptr", _Buffer, "uint", _Size)
}

/**
 * 
 * @param {Integer} DropStatus 
 * @param {Pointer<Void>} NdisPartyHandle 
 * @param {Integer} _Buffer 
 * @param {Integer} _Size 
 * @returns {String} Nothing - always returns an empty string
 */
export NdisCmDispatchIncomingDropParty(DropStatus, NdisPartyHandle, _Buffer, _Size) {
    NdisPartyHandleMarshal := NdisPartyHandle is VarRef ? "ptr" : "ptr"

    DllCall("NDIS.sys\NdisCmDispatchIncomingDropParty", "int", DropStatus, NdisPartyHandleMarshal, NdisPartyHandle, "ptr", _Buffer, "uint", _Size)
}

;@endregion Functions
