#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\VIRTUAL_PROCESSOR_REGISTER.ahk" { VIRTUAL_PROCESSOR_REGISTER }
#Import ".\WHV_INTERRUPT_DESTINATION_MODE.ahk" { WHV_INTERRUPT_DESTINATION_MODE }
#Import ".\WHV_VPCI_DEVICE_REGISTER.ahk" { WHV_VPCI_DEVICE_REGISTER }
#Import ".\WHV_CREATE_VPCI_DEVICE_FLAGS.ahk" { WHV_CREATE_VPCI_DEVICE_FLAGS }
#Import ".\WHV_VPCI_DEVICE_PROPERTY_CODE.ahk" { WHV_VPCI_DEVICE_PROPERTY_CODE }
#Import ".\VIRTUAL_PROCESSOR_ARCH.ahk" { VIRTUAL_PROCESSOR_ARCH }
#Import ".\WHV_PARTITION_COUNTER_SET.ahk" { WHV_PARTITION_COUNTER_SET }
#Import ".\HDV_PCI_BAR_SELECTOR.ahk" { HDV_PCI_BAR_SELECTOR }
#Import ".\WHV_ALLOCATE_VPCI_RESOURCE_FLAGS.ahk" { WHV_ALLOCATE_VPCI_RESOURCE_FLAGS }
#Import ".\WHV_ADVISE_GPA_RANGE_CODE.ahk" { WHV_ADVISE_GPA_RANGE_CODE }
#Import ".\HDV_DEVICE_TYPE.ahk" { HDV_DEVICE_TYPE }
#Import ".\WHV_TRANSLATE_GVA_FLAGS.ahk" { WHV_TRANSLATE_GVA_FLAGS }
#Import ".\GPA_MEMORY_CHUNK.ahk" { GPA_MEMORY_CHUNK }
#Import ".\PAGING_MODE.ahk" { PAGING_MODE }
#Import ".\WHV_REGISTER_NAME.ahk" { WHV_REGISTER_NAME }
#Import ".\WHV_TRANSLATE_GVA_RESULT.ahk" { WHV_TRANSLATE_GVA_RESULT }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WHV_REGISTER_VALUE.ahk" { WHV_REGISTER_VALUE }
#Import ".\WHV_VIRTUAL_PROCESSOR_STATE_TYPE.ahk" { WHV_VIRTUAL_PROCESSOR_STATE_TYPE }
#Import ".\WHV_EMULATOR_CALLBACKS.ahk" { WHV_EMULATOR_CALLBACKS }
#Import ".\WHV_X64_IO_PORT_ACCESS_CONTEXT.ahk" { WHV_X64_IO_PORT_ACCESS_CONTEXT }
#Import ".\WHV_EMULATOR_STATUS.ahk" { WHV_EMULATOR_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WHV_NOTIFICATION_PORT_PARAMETERS.ahk" { WHV_NOTIFICATION_PORT_PARAMETERS }
#Import ".\WHV_SYNIC_EVENT_PARAMETERS.ahk" { WHV_SYNIC_EVENT_PARAMETERS }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MODULE_INFO.ahk" { MODULE_INFO }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\WHV_TRIGGER_PARAMETERS.ahk" { WHV_TRIGGER_PARAMETERS }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WHV_MEMORY_ACCESS_CONTEXT.ahk" { WHV_MEMORY_ACCESS_CONTEXT }
#Import ".\WHV_CPUID_OUTPUT.ahk" { WHV_CPUID_OUTPUT }
#Import ".\WHV_MAP_GPA_RANGE_FLAGS.ahk" { WHV_MAP_GPA_RANGE_FLAGS }
#Import ".\HDV_MMIO_MAPPING_FLAGS.ahk" { HDV_MMIO_MAPPING_FLAGS }
#Import ".\WHV_VPCI_INTERRUPT_TARGET.ahk" { WHV_VPCI_INTERRUPT_TARGET }
#Import ".\GUEST_OS_INFO.ahk" { GUEST_OS_INFO }
#Import "..\Power\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }
#Import ".\WHV_CAPABILITY_CODE.ahk" { WHV_CAPABILITY_CODE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WHV_VIRTUAL_PROCESSOR_PROPERTY.ahk" { WHV_VIRTUAL_PROCESSOR_PROPERTY }
#Import ".\WHV_PARTITION_HANDLE.ahk" { WHV_PARTITION_HANDLE }
#Import ".\HDV_DEVICE_HOST_FLAGS.ahk" { HDV_DEVICE_HOST_FLAGS }
#Import ".\WHV_MEMORY_RANGE_ENTRY.ahk" { WHV_MEMORY_RANGE_ENTRY }
#Import ".\WHV_ACCESS_GPA_CONTROLS.ahk" { WHV_ACCESS_GPA_CONTROLS }
#Import ".\WHV_NOTIFICATION_PORT_PROPERTY_CODE.ahk" { WHV_NOTIFICATION_PORT_PROPERTY_CODE }
#Import ".\WHV_DOORBELL_MATCH_DATA.ahk" { WHV_DOORBELL_MATCH_DATA }
#Import ".\WHV_VP_EXIT_CONTEXT.ahk" { WHV_VP_EXIT_CONTEXT }
#Import ".\WHV_INTERRUPT_CONTROL.ahk" { WHV_INTERRUPT_CONTROL }
#Import ".\WHV_VPCI_MMIO_MAPPING.ahk" { WHV_VPCI_MMIO_MAPPING }
#Import ".\WHV_PARTITION_PROPERTY_CODE.ahk" { WHV_PARTITION_PROPERTY_CODE }
#Import "..\HostComputeSystem\HCS_SYSTEM.ahk" { HCS_SYSTEM }
#Import ".\WHV_PROCESSOR_COUNTER_SET.ahk" { WHV_PROCESSOR_COUNTER_SET }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */

;@region Functions
/**
 * 
 * @param {WHV_CAPABILITY_CODE} CapabilityCode 
 * @param {Integer} CapabilityBuffer 
 * @param {Integer} CapabilityBufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetCapability(CapabilityCode, CapabilityBuffer, CapabilityBufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetCapability", WHV_CAPABILITY_CODE, CapabilityCode, "ptr", CapabilityBuffer, "uint", CapabilityBufferSizeInBytes, "uint*", &WrittenSizeInBytes := 0, "HRESULT")
    return WrittenSizeInBytes
}

/**
 * 
 * @returns {WHV_PARTITION_HANDLE} 
 */
export WHvCreatePartition() {
    Partition := WHV_PARTITION_HANDLE.Owned()
    result := DllCall("WinHvPlatform.dll\WHvCreatePartition", WHV_PARTITION_HANDLE.Ptr, Partition, "HRESULT")
    return Partition
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvSetupPartition(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvSetupPartition", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvResetPartition(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvResetPartition", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvDeletePartition(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvDeletePartition", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {WHV_PARTITION_PROPERTY_CODE} PropertyCode 
 * @param {Integer} PropertyBuffer 
 * @param {Integer} PropertyBufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetPartitionProperty", WHV_PARTITION_HANDLE, Partition, WHV_PARTITION_PROPERTY_CODE, PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", &WrittenSizeInBytes := 0, "HRESULT")
    return WrittenSizeInBytes
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {WHV_PARTITION_PROPERTY_CODE} PropertyCode 
 * @param {Integer} PropertyBuffer 
 * @param {Integer} PropertyBufferSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvSetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvSetPartitionProperty", WHV_PARTITION_HANDLE, Partition, WHV_PARTITION_PROPERTY_CODE, PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvSuspendPartitionTime(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvSuspendPartitionTime", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvResumePartitionTime(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvResumePartitionTime", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<Void>} SourceAddress 
 * @param {Integer} GuestAddress 
 * @param {Integer} SizeInBytes 
 * @param {WHV_MAP_GPA_RANGE_FLAGS} Flags 
 * @returns {HRESULT} 
 */
export WHvMapGpaRange(Partition, SourceAddress, GuestAddress, SizeInBytes, Flags) {
    SourceAddressMarshal := SourceAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvMapGpaRange", WHV_PARTITION_HANDLE, Partition, SourceAddressMarshal, SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, WHV_MAP_GPA_RANGE_FLAGS, Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {HANDLE} Process 
 * @param {Pointer<Void>} SourceAddress 
 * @param {Integer} GuestAddress 
 * @param {Integer} SizeInBytes 
 * @param {WHV_MAP_GPA_RANGE_FLAGS} Flags 
 * @returns {HRESULT} 
 */
export WHvMapGpaRange2(Partition, Process, SourceAddress, GuestAddress, SizeInBytes, Flags) {
    SourceAddressMarshal := SourceAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvMapGpaRange2", WHV_PARTITION_HANDLE, Partition, HANDLE, Process, SourceAddressMarshal, SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, WHV_MAP_GPA_RANGE_FLAGS, Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} GuestAddress 
 * @param {Integer} SizeInBytes 
 * @returns {HRESULT} 
 */
export WHvUnmapGpaRange(Partition, GuestAddress, SizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvUnmapGpaRange", WHV_PARTITION_HANDLE, Partition, "uint", GuestAddress, "uint", SizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} Gva 
 * @param {WHV_TRANSLATE_GVA_FLAGS} TranslateFlags 
 * @param {Pointer<WHV_TRANSLATE_GVA_RESULT>} TranslationResult 
 * @returns {Integer} 
 */
export WHvTranslateGva(Partition, VpIndex, Gva, TranslateFlags, TranslationResult) {
    result := DllCall("WinHvPlatform.dll\WHvTranslateGva", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", Gva, WHV_TRANSLATE_GVA_FLAGS, TranslateFlags, WHV_TRANSLATE_GVA_RESULT.Ptr, TranslationResult, "uint*", &Gpa := 0, "HRESULT")
    return Gpa
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} Flags 
 * @returns {HRESULT} 
 */
export WHvCreateVirtualProcessor(Partition, VpIndex, Flags) {
    result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Pointer<WHV_VIRTUAL_PROCESSOR_PROPERTY>} _Properties 
 * @param {Integer} PropertyCount 
 * @returns {HRESULT} 
 */
export WHvCreateVirtualProcessor2(Partition, VpIndex, _Properties, PropertyCount) {
    result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor2", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, WHV_VIRTUAL_PROCESSOR_PROPERTY.Ptr, _Properties, "uint", PropertyCount, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @returns {HRESULT} 
 */
export WHvDeleteVirtualProcessor(Partition, VpIndex) {
    result := DllCall("WinHvPlatform.dll\WHvDeleteVirtualProcessor", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} ExitContext 
 * @param {Integer} ExitContextSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvRunVirtualProcessor(Partition, VpIndex, ExitContext, ExitContextSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvRunVirtualProcessor", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", ExitContext, "uint", ExitContextSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} Flags 
 * @returns {HRESULT} 
 */
export WHvCancelRunVirtualProcessor(Partition, VpIndex, Flags) {
    result := DllCall("WinHvPlatform.dll\WHvCancelRunVirtualProcessor", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Pointer<WHV_REGISTER_NAME>} RegisterNames 
 * @param {Integer} RegisterCount 
 * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
 * @returns {HRESULT} 
 */
export WHvGetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
    RegisterNamesMarshal := RegisterNames is VarRef ? "int*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorRegisters", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, RegisterNamesMarshal, RegisterNames, "uint", RegisterCount, WHV_REGISTER_VALUE.Ptr, RegisterValues, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Pointer<WHV_REGISTER_NAME>} RegisterNames 
 * @param {Integer} RegisterCount 
 * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
 * @returns {HRESULT} 
 */
export WHvSetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
    RegisterNamesMarshal := RegisterNames is VarRef ? "int*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorRegisters", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, RegisterNamesMarshal, RegisterNames, "uint", RegisterCount, WHV_REGISTER_VALUE.Ptr, RegisterValues, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} State 
 * @param {Integer} StateSize 
 * @returns {Integer} 
 */
export WHvGetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", &WrittenSize := 0, "HRESULT")
    return WrittenSize
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} State 
 * @param {Integer} StateSize 
 * @returns {HRESULT} 
 */
export WHvSetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize) {
    result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_INTERRUPT_CONTROL>} Interrupt 
 * @param {Integer} InterruptControlSize 
 * @returns {HRESULT} 
 */
export WHvRequestInterrupt(Partition, Interrupt, InterruptControlSize) {
    result := DllCall("WinHvPlatform.dll\WHvRequestInterrupt", WHV_PARTITION_HANDLE, Partition, WHV_INTERRUPT_CONTROL.Ptr, Interrupt, "uint", InterruptControlSize, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetVirtualProcessorXsaveState(Partition, VpIndex, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorXsaveState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", _Buffer, "uint", BufferSizeInBytes, "uint*", &BytesWritten := 0, "HRESULT")
    return BytesWritten
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvSetVirtualProcessorXsaveState(Partition, VpIndex, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorXsaveState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", _Buffer, "uint", BufferSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} GuestAddress 
 * @param {Integer} RangeSizeInBytes 
 * @param {Integer} _Bitmap 
 * @param {Integer} BitmapSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvQueryGpaRangeDirtyBitmap(Partition, GuestAddress, RangeSizeInBytes, _Bitmap, BitmapSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvQueryGpaRangeDirtyBitmap", WHV_PARTITION_HANDLE, Partition, "uint", GuestAddress, "uint", RangeSizeInBytes, "ptr", _Bitmap, "uint", BitmapSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {WHV_PARTITION_COUNTER_SET} CounterSet 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetPartitionCounters(Partition, CounterSet, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetPartitionCounters", WHV_PARTITION_HANDLE, Partition, WHV_PARTITION_COUNTER_SET, CounterSet, "ptr", _Buffer, "uint", BufferSizeInBytes, "uint*", &BytesWritten := 0, "HRESULT")
    return BytesWritten
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {WHV_PROCESSOR_COUNTER_SET} CounterSet 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetVirtualProcessorCounters(Partition, VpIndex, CounterSet, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCounters", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, WHV_PROCESSOR_COUNTER_SET, CounterSet, "ptr", _Buffer, "uint", BufferSizeInBytes, "uint*", &BytesWritten := 0, "HRESULT")
    return BytesWritten
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} State 
 * @param {Integer} StateSize 
 * @returns {Integer} 
 */
export WHvGetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState2", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", &WrittenSize := 0, "HRESULT")
    return WrittenSize
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} State 
 * @param {Integer} StateSize 
 * @returns {HRESULT} 
 */
export WHvSetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize) {
    result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState2", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
 * @param {HANDLE} EventHandle 
 * @returns {HRESULT} 
 */
export WHvRegisterPartitionDoorbellEvent(Partition, MatchData, EventHandle) {
    result := DllCall("WinHvPlatform.dll\WHvRegisterPartitionDoorbellEvent", WHV_PARTITION_HANDLE, Partition, WHV_DOORBELL_MATCH_DATA.Ptr, MatchData, HANDLE, EventHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
 * @returns {HRESULT} 
 */
export WHvUnregisterPartitionDoorbellEvent(Partition, MatchData) {
    result := DllCall("WinHvPlatform.dll\WHvUnregisterPartitionDoorbellEvent", WHV_PARTITION_HANDLE, Partition, WHV_DOORBELL_MATCH_DATA.Ptr, MatchData, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_MEMORY_RANGE_ENTRY>} GpaRanges 
 * @param {Integer} GpaRangesCount 
 * @param {WHV_ADVISE_GPA_RANGE_CODE} Advice 
 * @param {Integer} AdviceBuffer 
 * @param {Integer} AdviceBufferSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvAdviseGpaRange(Partition, GpaRanges, GpaRangesCount, Advice, AdviceBuffer, AdviceBufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvAdviseGpaRange", WHV_PARTITION_HANDLE, Partition, WHV_MEMORY_RANGE_ENTRY.Ptr, GpaRanges, "uint", GpaRangesCount, WHV_ADVISE_GPA_RANGE_CODE, Advice, "ptr", AdviceBuffer, "uint", AdviceBufferSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} GuestAddress 
 * @param {WHV_ACCESS_GPA_CONTROLS} Controls 
 * @param {Integer} Data 
 * @param {Integer} DataSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvReadGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvReadGpaRange", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", GuestAddress, WHV_ACCESS_GPA_CONTROLS, Controls, "ptr", Data, "uint", DataSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} GuestAddress 
 * @param {WHV_ACCESS_GPA_CONTROLS} Controls 
 * @param {Integer} Data 
 * @param {Integer} DataSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvWriteGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvWriteGpaRange", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", GuestAddress, WHV_ACCESS_GPA_CONTROLS, Controls, "ptr", Data, "uint", DataSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {WHV_SYNIC_EVENT_PARAMETERS} SynicEvent 
 * @returns {BOOL} 
 */
export WHvSignalVirtualProcessorSynicEvent(Partition, SynicEvent) {
    result := DllCall("WinHvPlatform.dll\WHvSignalVirtualProcessorSynicEvent", WHV_PARTITION_HANDLE, Partition, WHV_SYNIC_EVENT_PARAMETERS, SynicEvent, BOOL.Ptr, &NewlySignaled := 0, "HRESULT")
    return NewlySignaled
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {WHV_VIRTUAL_PROCESSOR_STATE_TYPE} StateType 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetVirtualProcessorState(Partition, VpIndex, StateType, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, WHV_VIRTUAL_PROCESSOR_STATE_TYPE, StateType, "ptr", _Buffer, "uint", BufferSizeInBytes, "uint*", &BytesWritten := 0, "HRESULT")
    return BytesWritten
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {WHV_VIRTUAL_PROCESSOR_STATE_TYPE} StateType 
 * @param {Integer} _Buffer 
 * @param {Integer} BufferSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvSetVirtualProcessorState(Partition, VpIndex, StateType, _Buffer, BufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorState", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, WHV_VIRTUAL_PROCESSOR_STATE_TYPE, StateType, "ptr", _Buffer, "uint", BufferSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Guid>} ProviderId 
 * @param {WHV_ALLOCATE_VPCI_RESOURCE_FLAGS} Flags 
 * @param {Pointer<Void>} ResourceDescriptor 
 * @param {Integer} ResourceDescriptorSizeInBytes 
 * @returns {HANDLE} 
 */
export WHvAllocateVpciResource(ProviderId, Flags, ResourceDescriptor, ResourceDescriptorSizeInBytes) {
    ResourceDescriptorMarshal := ResourceDescriptor is VarRef ? "ptr" : "ptr"

    VpciResource := HANDLE.Owned()
    result := DllCall("WinHvPlatform.dll\WHvAllocateVpciResource", Guid.Ptr, ProviderId, WHV_ALLOCATE_VPCI_RESOURCE_FLAGS, Flags, ResourceDescriptorMarshal, ResourceDescriptor, "uint", ResourceDescriptorSizeInBytes, HANDLE.Ptr, VpciResource, "HRESULT")
    return VpciResource
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {HANDLE} VpciResource 
 * @param {WHV_CREATE_VPCI_DEVICE_FLAGS} Flags 
 * @param {HANDLE} NotificationEventHandle 
 * @returns {HRESULT} 
 */
export WHvCreateVpciDevice(Partition, LogicalDeviceId, VpciResource, Flags, NotificationEventHandle) {
    result := DllCall("WinHvPlatform.dll\WHvCreateVpciDevice", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, HANDLE, VpciResource, WHV_CREATE_VPCI_DEVICE_FLAGS, Flags, HANDLE, NotificationEventHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @returns {HRESULT} 
 */
export WHvDeleteVpciDevice(Partition, LogicalDeviceId) {
    result := DllCall("WinHvPlatform.dll\WHvDeleteVpciDevice", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {WHV_VPCI_DEVICE_PROPERTY_CODE} PropertyCode 
 * @param {Integer} PropertyBuffer 
 * @param {Integer} PropertyBufferSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetVpciDeviceProperty(Partition, LogicalDeviceId, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceProperty", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, WHV_VPCI_DEVICE_PROPERTY_CODE, PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", &WrittenSizeInBytes := 0, "HRESULT")
    return WrittenSizeInBytes
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} _Notification 
 * @param {Integer} NotificationSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvGetVpciDeviceNotification(Partition, LogicalDeviceId, _Notification, NotificationSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceNotification", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "ptr", _Notification, "uint", NotificationSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Pointer<Integer>} MappingCount 
 * @param {Pointer<Pointer<WHV_VPCI_MMIO_MAPPING>>} Mappings 
 * @returns {HRESULT} 
 */
export WHvMapVpciDeviceMmioRanges(Partition, LogicalDeviceId, MappingCount, Mappings) {
    MappingCountMarshal := MappingCount is VarRef ? "uint*" : "ptr"
    MappingsMarshal := Mappings is VarRef ? "ptr*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceMmioRanges", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, MappingCountMarshal, MappingCount, MappingsMarshal, Mappings, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @returns {HRESULT} 
 */
export WHvUnmapVpciDeviceMmioRanges(Partition, LogicalDeviceId) {
    result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceMmioRanges", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {DEVICE_POWER_STATE} PowerState 
 * @returns {HRESULT} 
 */
export WHvSetVpciDevicePowerState(Partition, LogicalDeviceId, PowerState) {
    result := DllCall("WinHvPlatform.dll\WHvSetVpciDevicePowerState", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, DEVICE_POWER_STATE, PowerState, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
 * @returns {Void} 
 */
export WHvReadVpciDeviceRegister(Partition, LogicalDeviceId, Register) {
    result := DllCall("WinHvPlatform.dll\WHvReadVpciDeviceRegister", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, WHV_VPCI_DEVICE_REGISTER.Ptr, Register, "ptr", &Data := 0, "HRESULT")
    return Data
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
 * @param {Pointer<Void>} Data 
 * @returns {HRESULT} 
 */
export WHvWriteVpciDeviceRegister(Partition, LogicalDeviceId, Register, Data) {
    DataMarshal := Data is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvWriteVpciDeviceRegister", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, WHV_VPCI_DEVICE_REGISTER.Ptr, Register, DataMarshal, Data, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} Index 
 * @param {Integer} MessageCount 
 * @param {Pointer<WHV_VPCI_INTERRUPT_TARGET>} Target 
 * @param {Pointer<Integer>} MsiAddress 
 * @param {Pointer<Integer>} MsiData 
 * @returns {HRESULT} 
 */
export WHvMapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index, MessageCount, Target, MsiAddress, MsiData) {
    MsiAddressMarshal := MsiAddress is VarRef ? "uint*" : "ptr"
    MsiDataMarshal := MsiData is VarRef ? "uint*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceInterrupt", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MessageCount, WHV_VPCI_INTERRUPT_TARGET.Ptr, Target, MsiAddressMarshal, MsiAddress, MsiDataMarshal, MsiData, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} Index 
 * @returns {HRESULT} 
 */
export WHvUnmapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index) {
    result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceInterrupt", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "uint", Index, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} MsiAddress 
 * @param {Integer} MsiData 
 * @param {Pointer<WHV_VPCI_INTERRUPT_TARGET>} Target 
 * @returns {HRESULT} 
 */
export WHvRetargetVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData, Target) {
    result := DllCall("WinHvPlatform.dll\WHvRetargetVpciDeviceInterrupt", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, WHV_VPCI_INTERRUPT_TARGET.Ptr, Target, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} MsiAddress 
 * @param {Integer} MsiData 
 * @returns {HRESULT} 
 */
export WHvRequestVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData) {
    result := DllCall("WinHvPlatform.dll\WHvRequestVpciDeviceInterrupt", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} LogicalDeviceId 
 * @param {Integer} Index 
 * @param {Integer} MultiMessageNumber 
 * @param {Integer} Target 
 * @param {Integer} TargetSizeInBytes 
 * @returns {Integer} 
 */
export WHvGetVpciDeviceInterruptTarget(Partition, LogicalDeviceId, Index, MultiMessageNumber, Target, TargetSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceInterruptTarget", WHV_PARTITION_HANDLE, Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MultiMessageNumber, "ptr", Target, "uint", TargetSizeInBytes, "uint*", &BytesWritten := 0, "HRESULT")
    return BytesWritten
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
 * @param {Pointer<Pointer<Void>>} TriggerHandle 
 * @param {Pointer<HANDLE>} EventHandle 
 * @returns {HRESULT} 
 */
export WHvCreateTrigger(Partition, Parameters, TriggerHandle, EventHandle) {
    TriggerHandleMarshal := TriggerHandle is VarRef ? "ptr*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvCreateTrigger", WHV_PARTITION_HANDLE, Partition, WHV_TRIGGER_PARAMETERS.Ptr, Parameters, TriggerHandleMarshal, TriggerHandle, HANDLE.Ptr, EventHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
 * @param {Pointer<Void>} TriggerHandle 
 * @returns {HRESULT} 
 */
export WHvUpdateTriggerParameters(Partition, Parameters, TriggerHandle) {
    TriggerHandleMarshal := TriggerHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvUpdateTriggerParameters", WHV_PARTITION_HANDLE, Partition, WHV_TRIGGER_PARAMETERS.Ptr, Parameters, TriggerHandleMarshal, TriggerHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<Void>} TriggerHandle 
 * @returns {HRESULT} 
 */
export WHvDeleteTrigger(Partition, TriggerHandle) {
    TriggerHandleMarshal := TriggerHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvDeleteTrigger", WHV_PARTITION_HANDLE, Partition, TriggerHandleMarshal, TriggerHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<WHV_NOTIFICATION_PORT_PARAMETERS>} Parameters 
 * @param {HANDLE} EventHandle 
 * @returns {Pointer<Void>} 
 */
export WHvCreateNotificationPort(Partition, Parameters, EventHandle) {
    result := DllCall("WinHvPlatform.dll\WHvCreateNotificationPort", WHV_PARTITION_HANDLE, Partition, WHV_NOTIFICATION_PORT_PARAMETERS.Ptr, Parameters, HANDLE, EventHandle, "ptr*", &PortHandle := 0, "HRESULT")
    return PortHandle
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<Void>} PortHandle 
 * @param {WHV_NOTIFICATION_PORT_PROPERTY_CODE} PropertyCode 
 * @param {Integer} _PropertyValue 
 * @returns {HRESULT} 
 */
export WHvSetNotificationPortProperty(Partition, PortHandle, PropertyCode, _PropertyValue) {
    PortHandleMarshal := PortHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvSetNotificationPortProperty", WHV_PARTITION_HANDLE, Partition, PortHandleMarshal, PortHandle, WHV_NOTIFICATION_PORT_PROPERTY_CODE, PropertyCode, "uint", _PropertyValue, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Pointer<Void>} PortHandle 
 * @returns {HRESULT} 
 */
export WHvDeleteNotificationPort(Partition, PortHandle) {
    PortHandleMarshal := PortHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvDeleteNotificationPort", WHV_PARTITION_HANDLE, Partition, PortHandleMarshal, PortHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} SintIndex 
 * @param {Integer} Message 
 * @param {Integer} MessageSizeInBytes 
 * @returns {HRESULT} 
 */
export WHvPostVirtualProcessorSynicMessage(Partition, VpIndex, SintIndex, Message, MessageSizeInBytes) {
    result := DllCall("WinHvPlatform.dll\WHvPostVirtualProcessorSynicMessage", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", SintIndex, "ptr", Message, "uint", MessageSizeInBytes, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} VpIndex 
 * @param {Integer} Eax 
 * @param {Integer} Ecx 
 * @param {Pointer<WHV_CPUID_OUTPUT>} CpuidOutput 
 * @returns {HRESULT} 
 */
export WHvGetVirtualProcessorCpuidOutput(Partition, VpIndex, Eax, Ecx, CpuidOutput) {
    result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCpuidOutput", WHV_PARTITION_HANDLE, Partition, "uint", VpIndex, "uint", Eax, "uint", Ecx, WHV_CPUID_OUTPUT.Ptr, CpuidOutput, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @param {Integer} Destination 
 * @param {WHV_INTERRUPT_DESTINATION_MODE} DestinationMode 
 * @param {Pointer<Integer>} TargetVps 
 * @param {Integer} VpCount 
 * @param {Pointer<Integer>} TargetVpCount 
 * @returns {HRESULT} 
 */
export WHvGetInterruptTargetVpSet(Partition, Destination, DestinationMode, TargetVps, VpCount, TargetVpCount) {
    TargetVpsMarshal := TargetVps is VarRef ? "uint*" : "ptr"
    TargetVpCountMarshal := TargetVpCount is VarRef ? "uint*" : "ptr"

    result := DllCall("WinHvPlatform.dll\WHvGetInterruptTargetVpSet", WHV_PARTITION_HANDLE, Partition, "uint", Destination, WHV_INTERRUPT_DESTINATION_MODE, DestinationMode, TargetVpsMarshal, TargetVps, "uint", VpCount, TargetVpCountMarshal, TargetVpCount, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HANDLE} 
 */
export WHvStartPartitionMigration(Partition) {
    MigrationHandle := HANDLE.Owned()
    result := DllCall("WinHvPlatform.dll\WHvStartPartitionMigration", WHV_PARTITION_HANDLE, Partition, HANDLE.Ptr, MigrationHandle, "HRESULT")
    return MigrationHandle
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvCancelPartitionMigration(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvCancelPartitionMigration", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {WHV_PARTITION_HANDLE} Partition 
 * @returns {HRESULT} 
 */
export WHvCompletePartitionMigration(Partition) {
    result := DllCall("WinHvPlatform.dll\WHvCompletePartitionMigration", WHV_PARTITION_HANDLE, Partition, "HRESULT")
    return result
}

/**
 * 
 * @param {HANDLE} MigrationHandle 
 * @returns {WHV_PARTITION_HANDLE} 
 */
export WHvAcceptPartitionMigration(MigrationHandle) {
    Partition := WHV_PARTITION_HANDLE.Owned()
    result := DllCall("WinHvPlatform.dll\WHvAcceptPartitionMigration", HANDLE, MigrationHandle, WHV_PARTITION_HANDLE.Ptr, Partition, "HRESULT")
    return Partition
}

/**
 * 
 * @param {Pointer<WHV_EMULATOR_CALLBACKS>} Callbacks 
 * @returns {Pointer<Void>} 
 */
export WHvEmulatorCreateEmulator(Callbacks) {
    result := DllCall("WinHvEmulation.dll\WHvEmulatorCreateEmulator", WHV_EMULATOR_CALLBACKS.Ptr, Callbacks, "ptr*", &Emulator := 0, "HRESULT")
    return Emulator
}

/**
 * 
 * @param {Pointer<Void>} Emulator 
 * @returns {HRESULT} 
 */
export WHvEmulatorDestroyEmulator(Emulator) {
    EmulatorMarshal := Emulator is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvEmulation.dll\WHvEmulatorDestroyEmulator", EmulatorMarshal, Emulator, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} Emulator 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
 * @param {Pointer<WHV_X64_IO_PORT_ACCESS_CONTEXT>} IoInstructionContext 
 * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
 * @returns {HRESULT} 
 */
export WHvEmulatorTryIoEmulation(Emulator, _Context, VpContext, IoInstructionContext, EmulatorReturnStatus) {
    EmulatorMarshal := Emulator is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvEmulation.dll\WHvEmulatorTryIoEmulation", EmulatorMarshal, Emulator, _ContextMarshal, _Context, WHV_VP_EXIT_CONTEXT.Ptr, VpContext, WHV_X64_IO_PORT_ACCESS_CONTEXT.Ptr, IoInstructionContext, WHV_EMULATOR_STATUS.Ptr, EmulatorReturnStatus, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} Emulator 
 * @param {Pointer<Void>} _Context 
 * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
 * @param {Pointer<WHV_MEMORY_ACCESS_CONTEXT>} MmioInstructionContext 
 * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
 * @returns {HRESULT} 
 */
export WHvEmulatorTryMmioEmulation(Emulator, _Context, VpContext, MmioInstructionContext, EmulatorReturnStatus) {
    EmulatorMarshal := Emulator is VarRef ? "ptr" : "ptr"
    _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

    result := DllCall("WinHvEmulation.dll\WHvEmulatorTryMmioEmulation", EmulatorMarshal, Emulator, _ContextMarshal, _Context, WHV_VP_EXIT_CONTEXT.Ptr, VpContext, WHV_MEMORY_ACCESS_CONTEXT.Ptr, MmioInstructionContext, WHV_EMULATOR_STATUS.Ptr, EmulatorReturnStatus, "HRESULT")
    return result
}

/**
 * HdvInitializeDeviceHost function
 * @param {HCS_SYSTEM} computeSystem 
 * @returns {Pointer<Void>} 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvInitializeDeviceHost
 */
export HdvInitializeDeviceHost(computeSystem) {
    result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHost", HCS_SYSTEM, computeSystem, "ptr*", &deviceHostHandle := 0, "HRESULT")
    return deviceHostHandle
}

/**
 * 
 * @param {HCS_SYSTEM} computeSystem 
 * @param {HDV_DEVICE_HOST_FLAGS} flags 
 * @returns {Pointer<Void>} 
 */
export HdvInitializeDeviceHostEx(computeSystem, flags) {
    result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHostEx", HCS_SYSTEM, computeSystem, HDV_DEVICE_HOST_FLAGS, flags, "ptr*", &deviceHostHandle := 0, "HRESULT")
    return deviceHostHandle
}

/**
 * HdvTeardownDeviceHost
 * @param {Pointer<Void>} deviceHostHandle 
 * @returns {HRESULT} |Parameter|Description|
 * |---|---|---|---|---|---|---|---|
 * |`DeviceHost` |Handle to the device host to tear down.|
 * |    |    |
 * 
 * 
 * |Return Value     |Description|
 * |---|---|
 * |`S_OK` | Returned if function succeeds.|
 * |`HRESULT` | An error code is returned if the function fails.
 * |     |     |
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvTeardownDeviceHost
 */
export HdvTeardownDeviceHost(deviceHostHandle) {
    deviceHostHandleMarshal := deviceHostHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvTeardownDeviceHost", deviceHostHandleMarshal, deviceHostHandle, "HRESULT")
    return result
}

/**
 * HdvCreateDeviceInstance
 * @param {Pointer<Void>} deviceHostHandle 
 * @param {HDV_DEVICE_TYPE} deviceType 
 * @param {Pointer<Guid>} deviceClassId 
 * @param {Pointer<Guid>} deviceInstanceId 
 * @param {Pointer<Void>} deviceInterface 
 * @param {Pointer<Void>} deviceContext 
 * @returns {Pointer<Void>} 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvCreateDeviceInstance
 */
export HdvCreateDeviceInstance(deviceHostHandle, deviceType, deviceClassId, deviceInstanceId, deviceInterface, deviceContext) {
    deviceHostHandleMarshal := deviceHostHandle is VarRef ? "ptr" : "ptr"
    deviceInterfaceMarshal := deviceInterface is VarRef ? "ptr" : "ptr"
    deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvCreateDeviceInstance", deviceHostHandleMarshal, deviceHostHandle, HDV_DEVICE_TYPE, deviceType, Guid.Ptr, deviceClassId, Guid.Ptr, deviceInstanceId, deviceInterfaceMarshal, deviceInterface, deviceContextMarshal, deviceContext, "ptr*", &deviceHandle := 0, "HRESULT")
    return deviceHandle
}

/**
 * HdvReadGuestMemory
 * @param {Pointer<Void>} requestor 
 * @param {Integer} guestPhysicalAddress 
 * @param {Integer} byteCount 
 * @returns {Integer} 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvReadGuestMemory
 */
export HdvReadGuestMemory(requestor, guestPhysicalAddress, byteCount) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvReadGuestMemory", requestorMarshal, requestor, "uint", guestPhysicalAddress, "uint", byteCount, "char*", &_buffer := 0, "HRESULT")
    return _buffer
}

/**
 * HdvWriteGuestMemory
 * @param {Pointer<Void>} requestor 
 * @param {Integer} guestPhysicalAddress 
 * @param {Integer} byteCount 
 * @param {Pointer<Integer>} _buffer 
 * @returns {HRESULT} |Parameter|Description|
 * |---|---|---|---|---|---|---|---|
 * |`Requestor` |Handle to the device requesting memory access.|
 * |`GuestPhysicalAddress` |Guest physical address at which the write operation starts.|
 * |`ByteCount` |Number of bytes to write.|
 * |`Buffer` |Source buffer for the write operation.|
 * 
 * 
 * |Return Value     |Description|
 * |---|---|
 * |`S_OK` | Returned if function succeeds.|
 * |`HRESULT` | An error code is returned if the function fails.
 * |     |     |
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvWriteGuestMemory
 */
export HdvWriteGuestMemory(requestor, guestPhysicalAddress, byteCount, _buffer) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"
    _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvWriteGuestMemory", requestorMarshal, requestor, "uint", guestPhysicalAddress, "uint", byteCount, _bufferMarshal, _buffer, "HRESULT")
    return result
}

/**
 * HdvCreateGuestMemoryAperture
 * @param {Pointer<Void>} requestor 
 * @param {Integer} guestPhysicalAddress 
 * @param {Integer} byteCount 
 * @param {BOOL} writeProtected 
 * @returns {Pointer<Void>} 
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvCreateGuestMemoryAperture
 */
export HdvCreateGuestMemoryAperture(requestor, guestPhysicalAddress, byteCount, writeProtected) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvCreateGuestMemoryAperture", requestorMarshal, requestor, "uint", guestPhysicalAddress, "uint", byteCount, BOOL, writeProtected, "ptr*", &mappedAddress := 0, "HRESULT")
    return mappedAddress
}

/**
 * 
 * @param {Pointer<Void>} requestor 
 * @param {Pointer<Void>} mappedAddress 
 * @returns {HRESULT} 
 */
export HdvDestroyGuestMemoryAperture(requestor, mappedAddress) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"
    mappedAddressMarshal := mappedAddress is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvDestroyGuestMemoryAperture", requestorMarshal, requestor, mappedAddressMarshal, mappedAddress, "HRESULT")
    return result
}

/**
 * HdvDeliverGuestInterrupt
 * @param {Pointer<Void>} requestor 
 * @param {Integer} msiAddress 
 * @param {Integer} msiData 
 * @returns {HRESULT} |Parameter|Description|
 * |---|---|---|---|---|---|---|---|
 * |`Requestor` |Handle to the device requesting the interrupt.|
 * |`MsiAddress` |The guest address to which the interrupt message is written.|
 * |`MsiData`|The data to write at MsiAddress.|
 * |    |    |
 * 
 * 
 * |Return Value     |Description|
 * |---|---|
 * |`S_OK` | Returned if function succeeds.|
 * |`HRESULT` | An error code is returned if the function fails.
 * |     |     |
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvDeliverGuestInterrupt
 */
export HdvDeliverGuestInterrupt(requestor, msiAddress, msiData) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvDeliverGuestInterrupt", requestorMarshal, requestor, "uint", msiAddress, "uint", msiData, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} requestor 
 * @param {HDV_PCI_BAR_SELECTOR} BarIndex 
 * @param {Integer} BarOffset 
 * @param {Integer} TriggerValue 
 * @param {Integer} Flags 
 * @param {HANDLE} DoorbellEvent 
 * @returns {HRESULT} 
 */
export HdvRegisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags, DoorbellEvent) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvRegisterDoorbell", requestorMarshal, requestor, HDV_PCI_BAR_SELECTOR, BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, HANDLE, DoorbellEvent, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} requestor 
 * @param {HDV_PCI_BAR_SELECTOR} BarIndex 
 * @param {Integer} BarOffset 
 * @param {Integer} TriggerValue 
 * @param {Integer} Flags 
 * @returns {HRESULT} 
 */
export HdvUnregisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvUnregisterDoorbell", requestorMarshal, requestor, HDV_PCI_BAR_SELECTOR, BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} requestor 
 * @param {HDV_PCI_BAR_SELECTOR} barIndex 
 * @param {Integer} offsetInPages 
 * @param {Integer} lengthInPages 
 * @param {HDV_MMIO_MAPPING_FLAGS} MappingFlags 
 * @param {HANDLE} sectionHandle 
 * @param {Integer} sectionOffsetInPages 
 * @returns {HRESULT} 
 */
export HdvCreateSectionBackedMmioRange(requestor, barIndex, offsetInPages, lengthInPages, MappingFlags, sectionHandle, sectionOffsetInPages) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvCreateSectionBackedMmioRange", requestorMarshal, requestor, HDV_PCI_BAR_SELECTOR, barIndex, "uint", offsetInPages, "uint", lengthInPages, HDV_MMIO_MAPPING_FLAGS, MappingFlags, HANDLE, sectionHandle, "uint", sectionOffsetInPages, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} requestor 
 * @param {HDV_PCI_BAR_SELECTOR} barIndex 
 * @param {Integer} offsetInPages 
 * @returns {HRESULT} 
 */
export HdvDestroySectionBackedMmioRange(requestor, barIndex, offsetInPages) {
    requestorMarshal := requestor is VarRef ? "ptr" : "ptr"

    result := DllCall("vmdevicehost.dll\HdvDestroySectionBackedMmioRange", requestorMarshal, requestor, HDV_PCI_BAR_SELECTOR, barIndex, "uint", offsetInPages, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} vmName 
 * @param {PWSTR} snapshotName 
 * @param {Pointer<PWSTR>} binPath 
 * @param {Pointer<PWSTR>} vsvPath 
 * @param {Pointer<PWSTR>} vmrsPath 
 * @returns {HRESULT} 
 */
export LocateSavedStateFiles(vmName, snapshotName, binPath, vsvPath, vmrsPath) {
    vmName := vmName is String ? StrPtr(vmName) : vmName
    snapshotName := snapshotName is String ? StrPtr(snapshotName) : snapshotName

    binPathMarshal := binPath is VarRef ? "ptr*" : "ptr"
    vsvPathMarshal := vsvPath is VarRef ? "ptr*" : "ptr"
    vmrsPathMarshal := vmrsPath is VarRef ? "ptr*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\LocateSavedStateFiles", "ptr", vmName, "ptr", snapshotName, binPathMarshal, binPath, vsvPathMarshal, vsvPath, vmrsPathMarshal, vmrsPath, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} vmrsFile 
 * @returns {Pointer<Void>} 
 */
export LoadSavedStateFile(vmrsFile) {
    vmrsFile := vmrsFile is String ? StrPtr(vmrsFile) : vmrsFile

    result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFile", "ptr", vmrsFile, "ptr*", &vmSavedStateDumpHandle := 0, "HRESULT")
    return vmSavedStateDumpHandle
}

/**
 * 
 * @param {PWSTR} vmrsFile 
 * @returns {HRESULT} 
 */
export ApplyPendingSavedStateFileReplayLog(vmrsFile) {
    vmrsFile := vmrsFile is String ? StrPtr(vmrsFile) : vmrsFile

    result := DllCall("VmSavedStateDumpProvider.dll\ApplyPendingSavedStateFileReplayLog", "ptr", vmrsFile, "HRESULT")
    return result
}

/**
 * 
 * @param {PWSTR} binFile 
 * @param {PWSTR} vsvFile 
 * @returns {Pointer<Void>} 
 */
export LoadSavedStateFiles(binFile, vsvFile) {
    binFile := binFile is String ? StrPtr(binFile) : binFile
    vsvFile := vsvFile is String ? StrPtr(vsvFile) : vsvFile

    result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFiles", "ptr", binFile, "ptr", vsvFile, "ptr*", &vmSavedStateDumpHandle := 0, "HRESULT")
    return vmSavedStateDumpHandle
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {HRESULT} 
 */
export ReleaseSavedStateFiles(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateFiles", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {Integer} 
 */
export GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetGuestEnabledVirtualTrustLevels", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint*", &virtualTrustLevels := 0, "HRESULT")
    return virtualTrustLevels
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} virtualTrustLevel 
 * @param {Pointer<GUEST_OS_INFO>} guestOsInfo 
 * @returns {HRESULT} 
 */
export GetGuestOsInfo(vmSavedStateDumpHandle, virtualTrustLevel, guestOsInfo) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetGuestOsInfo", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "char", virtualTrustLevel, GUEST_OS_INFO.Ptr, guestOsInfo, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {Integer} 
 */
export GetVpCount(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetVpCount", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint*", &vpCount := 0, "HRESULT")
    return vpCount
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {VIRTUAL_PROCESSOR_ARCH} 
 */
export GetArchitecture(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetArchitecture", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "int*", &_architecture := 0, "HRESULT")
    return _architecture
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {VIRTUAL_PROCESSOR_ARCH} _architecture 
 * @returns {HRESULT} 
 */
export ForceArchitecture(vmSavedStateDumpHandle, vpId, _architecture) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ForceArchitecture", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, VIRTUAL_PROCESSOR_ARCH, _architecture, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {Integer} 
 */
export GetActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetActiveVirtualTrustLevel", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "char*", &virtualTrustLevel := 0, "HRESULT")
    return virtualTrustLevel
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Pointer<Integer>} virtualTrustLevels 
 * @returns {HRESULT} 
 */
export GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle, vpId, virtualTrustLevels) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    virtualTrustLevelsMarshal := virtualTrustLevels is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetEnabledVirtualTrustLevels", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, virtualTrustLevelsMarshal, virtualTrustLevels, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Integer} virtualTrustLevel 
 * @returns {HRESULT} 
 */
export ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ForceActiveVirtualTrustLevel", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "char", virtualTrustLevel, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {BOOL} 
 */
export IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\IsActiveVirtualTrustLevelEnabled", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, BOOL.Ptr, &activeVirtualTrustLevelEnabled := 0, "HRESULT")
    return activeVirtualTrustLevelEnabled
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {BOOL} 
 */
export IsNestedVirtualizationEnabled(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\IsNestedVirtualizationEnabled", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, BOOL.Ptr, &enabled := 0, "HRESULT")
    return enabled
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {BOOL} 
 */
export GetNestedVirtualizationMode(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetNestedVirtualizationMode", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, BOOL.Ptr, &enabled := 0, "HRESULT")
    return enabled
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {BOOL} hostMode 
 * @returns {BOOL} 
 */
export ForceNestedHostMode(vmSavedStateDumpHandle, vpId, hostMode) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ForceNestedHostMode", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, BOOL, hostMode, BOOL.Ptr, &oldMode := 0, "HRESULT")
    return oldMode
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {BOOL} 
 */
export InKernelSpace(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\InKernelSpace", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, BOOL.Ptr, &inKernelSpace := 0, "HRESULT")
    return inKernelSpace
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Integer} registerId 
 * @param {Pointer<VIRTUAL_PROCESSOR_REGISTER>} registerValue 
 * @returns {HRESULT} 
 */
export GetRegisterValue(vmSavedStateDumpHandle, vpId, registerId, registerValue) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetRegisterValue", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "uint", registerId, VIRTUAL_PROCESSOR_REGISTER.Ptr, registerValue, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @returns {PAGING_MODE} 
 */
export GetPagingMode(vmSavedStateDumpHandle, vpId) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetPagingMode", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "int*", &pagingMode := 0, "HRESULT")
    return pagingMode
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PAGING_MODE} pagingMode 
 * @returns {HRESULT} 
 */
export ForcePagingMode(vmSavedStateDumpHandle, vpId, pagingMode) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ForcePagingMode", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, PAGING_MODE, pagingMode, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} physicalAddress 
 * @param {Integer} _buffer 
 * @param {Integer} bufferSize 
 * @returns {Integer} 
 */
export ReadGuestPhysicalAddress(vmSavedStateDumpHandle, physicalAddress, _buffer, bufferSize) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestPhysicalAddress", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", physicalAddress, "ptr", _buffer, "uint", bufferSize, "uint*", &bytesRead := 0, "HRESULT")
    return bytesRead
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Integer} virtualAddress 
 * @param {Pointer<Integer>} physicalAddress 
 * @param {Pointer<Integer>} unmappedRegionSize 
 * @returns {HRESULT} 
 */
export GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle, vpId, virtualAddress, physicalAddress, unmappedRegionSize) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    physicalAddressMarshal := physicalAddress is VarRef ? "uint*" : "ptr"
    unmappedRegionSizeMarshal := unmappedRegionSize is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GuestVirtualAddressToPhysicalAddress", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, physicalAddressMarshal, physicalAddress, unmappedRegionSizeMarshal, unmappedRegionSize, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Pointer<GPA_MEMORY_CHUNK>} memoryChunks 
 * @param {Pointer<Integer>} memoryChunkCount 
 * @returns {Integer} 
 */
export GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle, memoryChunks, memoryChunkCount) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    memoryChunkCountMarshal := memoryChunkCount is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetGuestPhysicalMemoryChunks", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint*", &memoryChunkPageSize := 0, GPA_MEMORY_CHUNK.Ptr, memoryChunks, memoryChunkCountMarshal, memoryChunkCount, "HRESULT")
    return memoryChunkPageSize
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} physicalAddress 
 * @returns {Integer} 
 */
export GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle, physicalAddress) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GuestPhysicalAddressToRawSavedMemoryOffset", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", physicalAddress, "uint*", &rawSavedMemoryOffset := 0, "HRESULT")
    return rawSavedMemoryOffset
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} rawSavedMemoryOffset 
 * @param {Integer} _buffer 
 * @param {Integer} bufferSize 
 * @returns {Integer} 
 */
export ReadGuestRawSavedMemory(vmSavedStateDumpHandle, rawSavedMemoryOffset, _buffer, bufferSize) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestRawSavedMemory", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", rawSavedMemoryOffset, "ptr", _buffer, "uint", bufferSize, "uint*", &bytesRead := 0, "HRESULT")
    return bytesRead
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {Integer} 
 */
export GetGuestRawSavedMemorySize(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetGuestRawSavedMemorySize", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint*", &guestRawSavedMemorySize := 0, "HRESULT")
    return guestRawSavedMemorySize
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} memoryBlockCacheLimit 
 * @returns {HRESULT} 
 */
export SetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\SetMemoryBlockCacheLimit", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", memoryBlockCacheLimit, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {Integer} 
 */
export GetMemoryBlockCacheLimit(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetMemoryBlockCacheLimit", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint*", &memoryBlockCacheLimit := 0, "HRESULT")
    return memoryBlockCacheLimit
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Integer} virtualAddress 
 * @param {Pointer<Void>} fixBuffer 
 * @param {Integer} fixBufferSize 
 * @returns {HRESULT} 
 */
export ApplyGuestMemoryFix(vmSavedStateDumpHandle, vpId, virtualAddress, fixBuffer, fixBufferSize) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    fixBufferMarshal := fixBuffer is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ApplyGuestMemoryFix", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, fixBufferMarshal, fixBuffer, "uint", fixBufferSize, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {PWSTR} userSymbols 
 * @param {BOOL} force 
 * @returns {HRESULT} 
 */
export LoadSavedStateSymbolProvider(vmSavedStateDumpHandle, userSymbols, force) {
    userSymbols := userSymbols is String ? StrPtr(userSymbols) : userSymbols

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateSymbolProvider", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "ptr", userSymbols, BOOL, force, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {HRESULT} 
 */
export ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateSymbolProvider", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @returns {HANDLE} 
 */
export GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolProviderHandle", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, HANDLE.Owned)
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Pointer<GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK>} Callback 
 * @returns {HRESULT} 
 */
export SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle, Callback) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\SetSavedStateSymbolProviderDebugInfoCallback", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "ptr", Callback, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {PSTR} imageName 
 * @param {PSTR} moduleName 
 * @param {Integer} baseAddress 
 * @param {Integer} sizeOfBase 
 * @returns {HRESULT} 
 */
export LoadSavedStateModuleSymbols(vmSavedStateDumpHandle, imageName, moduleName, baseAddress, sizeOfBase) {
    imageName := imageName is String ? StrPtr(imageName) : imageName
    moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbols", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "ptr", imageName, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {PSTR} imageName 
 * @param {Integer} imageTimestamp 
 * @param {PSTR} moduleName 
 * @param {Integer} baseAddress 
 * @param {Integer} sizeOfBase 
 * @returns {HRESULT} 
 */
export LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle, imageName, imageTimestamp, moduleName, baseAddress, sizeOfBase) {
    imageName := imageName is String ? StrPtr(imageName) : imageName
    moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbolsEx", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "ptr", imageName, "uint", imageTimestamp, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PSTR} globalName 
 * @param {Pointer<Integer>} virtualAddress 
 * @returns {Integer} 
 */
export ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle, vpId, globalName, virtualAddress) {
    globalName := globalName is String ? StrPtr(globalName) : globalName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    virtualAddressMarshal := virtualAddress is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ResolveSavedStateGlobalVariableAddress", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, virtualAddressMarshal, virtualAddress, "uint*", &_size := 0, "HRESULT")
    return _size
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PSTR} globalName 
 * @param {Integer} bufferSize 
 * @returns {Void} 
 */
export ReadSavedStateGlobalVariable(vmSavedStateDumpHandle, vpId, globalName, bufferSize) {
    globalName := globalName is String ? StrPtr(globalName) : globalName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ReadSavedStateGlobalVariable", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, "ptr", &_buffer := 0, "uint", bufferSize, "HRESULT")
    return _buffer
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PSTR} typeName 
 * @param {Pointer<Integer>} _size 
 * @returns {HRESULT} 
 */
export GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle, vpId, typeName, _size) {
    typeName := typeName is String ? StrPtr(typeName) : typeName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    _sizeMarshal := _size is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolTypeSize", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, _sizeMarshal, _size, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PSTR} typeName 
 * @param {PWSTR} fieldName 
 * @param {Pointer<Integer>} offset 
 * @param {Pointer<BOOL>} found 
 * @returns {HRESULT} 
 */
export FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle, vpId, typeName, fieldName, offset, found) {
    typeName := typeName is String ? StrPtr(typeName) : typeName
    fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    offsetMarshal := offset is VarRef ? "uint*" : "ptr"
    foundMarshal := found is VarRef ? "int*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\FindSavedStateSymbolFieldInType", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "ptr", fieldName, offsetMarshal, offset, foundMarshal, found, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {PSTR} typeName 
 * @param {Pointer<PWSTR>} typeFieldInfoMap 
 * @returns {HRESULT} 
 */
export GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle, vpId, typeName, typeFieldInfoMap) {
    typeName := typeName is String ? StrPtr(typeName) : typeName

    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    typeFieldInfoMapMarshal := typeFieldInfoMap is VarRef ? "ptr*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolFieldInfo", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, typeFieldInfoMapMarshal, typeFieldInfoMap, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Integer} startAddress 
 * @param {Integer} endAddress 
 * @param {Pointer<Void>} callbackContext 
 * @param {Pointer<FOUND_IMAGE_CALLBACK>} foundImageCallback 
 * @param {Pointer<Integer>} standaloneAddress 
 * @param {Integer} standaloneAddressCount 
 * @returns {HRESULT} 
 */
export ScanMemoryForDosImages(vmSavedStateDumpHandle, vpId, startAddress, endAddress, callbackContext, foundImageCallback, standaloneAddress, standaloneAddressCount) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    callbackContextMarshal := callbackContext is VarRef ? "ptr" : "ptr"
    standaloneAddressMarshal := standaloneAddress is VarRef ? "uint*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\ScanMemoryForDosImages", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, "uint", startAddress, "uint", endAddress, callbackContextMarshal, callbackContext, "ptr", foundImageCallback, standaloneAddressMarshal, standaloneAddress, "uint", standaloneAddressCount, "HRESULT")
    return result
}

/**
 * 
 * @param {Pointer<Void>} vmSavedStateDumpHandle 
 * @param {Integer} vpId 
 * @param {Pointer<MODULE_INFO>} _imageInfo 
 * @param {Integer} imageInfoCount 
 * @param {Integer} frameCount 
 * @param {Pointer<PWSTR>} callStack 
 * @returns {HRESULT} 
 */
export CallStackUnwind(vmSavedStateDumpHandle, vpId, _imageInfo, imageInfoCount, frameCount, callStack) {
    vmSavedStateDumpHandleMarshal := vmSavedStateDumpHandle is VarRef ? "ptr" : "ptr"
    callStackMarshal := callStack is VarRef ? "ptr*" : "ptr"

    result := DllCall("VmSavedStateDumpProvider.dll\CallStackUnwind", vmSavedStateDumpHandleMarshal, vmSavedStateDumpHandle, "uint", vpId, MODULE_INFO.Ptr, _imageInfo, "uint", imageInfoCount, "uint", frameCount, callStackMarshal, callStack, "HRESULT")
    return result
}

;@endregion Functions
