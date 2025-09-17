#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class Hypervisor {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static HVSOCKET_CONNECT_TIMEOUT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HVSOCKET_CONNECT_TIMEOUT_MAX => 300000

    /**
     * @type {Integer (UInt32)}
     */
    static HVSOCKET_CONNECTED_SUSPEND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static HVSOCKET_HIGH_VTL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static HV_PROTOCOL_RAW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static HVSOCKET_ADDRESS_FLAG_PASSTHRU => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_PROCESSOR_FEATURES_BANKS_COUNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_READ_WRITE_GPA_RANGE_MAX_SIZE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_MAX_DEVICE_ID_SIZE_IN_CHARS => 200

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_VPCI_TYPE0_BAR_COUNT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_ANY_VP => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static WHV_SYNIC_MESSAGE_SIZE => 256

    /**
     * @type {String}
     */
    static VM_GENCOUNTER_SYMBOLIC_LINK_NAME => "\VmGenerationCounter"

    /**
     * @type {Integer (UInt32)}
     */
    static IOCTL_VMGENCOUNTER_READ => 3325956

    /**
     * @type {Integer (UInt32)}
     */
    static HDV_PCI_BAR_COUNT => 6

    /**
     * @type {String}
     */
    static HV_GUID_ZERO => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static HV_GUID_BROADCAST => "{ffffffff-ffff-ffff-ffff-ffffffffffff}"

    /**
     * @type {String}
     */
    static HV_GUID_CHILDREN => "{90db8b89-0d35-4f79-8ce9-49ea0ac8b7cd}"

    /**
     * @type {String}
     */
    static HV_GUID_LOOPBACK => "{e0e16197-dd56-4a10-9195-5ee7a155a838}"

    /**
     * @type {String}
     */
    static HV_GUID_PARENT => "{a42e7cda-d03f-480c-9cc2-a4de20abb878}"

    /**
     * @type {String}
     */
    static HV_GUID_SILOHOST => "{36bd0c5c-7276-4223-88ba-7d03b654c568}"

    /**
     * @type {String}
     */
    static HV_GUID_VSOCK_TEMPLATE => "{00000000-facb-11e6-bd58-64006a7986d3}"

    /**
     * @type {String}
     */
    static GUID_DEVINTERFACE_VM_GENCOUNTER => "{3ff2c92b-6598-4e60-8e1c-0ccf4927e319}"
;@endregion Constants

;@region Methods
    /**
     * 
     * @param {Integer} CapabilityCode 
     * @param {Pointer} CapabilityBuffer 
     * @param {Integer} CapabilityBufferSizeInBytes 
     * @param {Pointer<UInt32>} WrittenSizeInBytes 
     * @returns {Integer} 
     */
    static WHvGetCapability(CapabilityCode, CapabilityBuffer, CapabilityBufferSizeInBytes, WrittenSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvGetCapability", "int", CapabilityCode, "ptr", CapabilityBuffer, "uint", CapabilityBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IntPtr>} Partition 
     * @returns {Integer} 
     */
    static WHvCreatePartition(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvCreatePartition", "ptr*", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvSetupPartition(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvSetupPartition", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvResetPartition(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvResetPartition", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvDeletePartition(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvDeletePartition", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @param {Pointer<UInt32>} WrittenSizeInBytes 
     * @returns {Integer} 
     */
    static WHvGetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes, WrittenSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvGetPartitionProperty", "ptr", Partition, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @returns {Integer} 
     */
    static WHvSetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvSetPartitionProperty", "ptr", Partition, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvSuspendPartitionTime(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvSuspendPartitionTime", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvResumePartitionTime(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvResumePartitionTime", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} SourceAddress 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WHvMapGpaRange(Partition, SourceAddress, GuestAddress, SizeInBytes, Flags) {
        result := DllCall("WinHvPlatform.dll\WHvMapGpaRange", "ptr", Partition, "ptr", SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, "int", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} Process 
     * @param {Pointer<Void>} SourceAddress 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WHvMapGpaRange2(Partition, Process, SourceAddress, GuestAddress, SizeInBytes, Flags) {
        result := DllCall("WinHvPlatform.dll\WHvMapGpaRange2", "ptr", Partition, "ptr", Process, "ptr", SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, "int", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @returns {Integer} 
     */
    static WHvUnmapGpaRange(Partition, GuestAddress, SizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvUnmapGpaRange", "ptr", Partition, "uint", GuestAddress, "uint", SizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Gva 
     * @param {Integer} TranslateFlags 
     * @param {Pointer<WHV_TRANSLATE_GVA_RESULT>} TranslationResult 
     * @param {Pointer<UInt64>} Gpa 
     * @returns {Integer} 
     */
    static WHvTranslateGva(Partition, VpIndex, Gva, TranslateFlags, TranslationResult, Gpa) {
        result := DllCall("WinHvPlatform.dll\WHvTranslateGva", "ptr", Partition, "uint", VpIndex, "uint", Gva, "int", TranslateFlags, "ptr", TranslationResult, "uint*", Gpa, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WHvCreateVirtualProcessor(Partition, VpIndex, Flags) {
        result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor", "ptr", Partition, "uint", VpIndex, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<WHV_VIRTUAL_PROCESSOR_PROPERTY>} Properties 
     * @param {Integer} PropertyCount 
     * @returns {Integer} 
     */
    static WHvCreateVirtualProcessor2(Partition, VpIndex, Properties, PropertyCount) {
        result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor2", "ptr", Partition, "uint", VpIndex, "ptr", Properties, "uint", PropertyCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @returns {Integer} 
     */
    static WHvDeleteVirtualProcessor(Partition, VpIndex) {
        result := DllCall("WinHvPlatform.dll\WHvDeleteVirtualProcessor", "ptr", Partition, "uint", VpIndex, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} ExitContext 
     * @param {Integer} ExitContextSizeInBytes 
     * @returns {Integer} 
     */
    static WHvRunVirtualProcessor(Partition, VpIndex, ExitContext, ExitContextSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvRunVirtualProcessor", "ptr", Partition, "uint", VpIndex, "ptr", ExitContext, "uint", ExitContextSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static WHvCancelRunVirtualProcessor(Partition, VpIndex, Flags) {
        result := DllCall("WinHvPlatform.dll\WHvCancelRunVirtualProcessor", "ptr", Partition, "uint", VpIndex, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<Int32>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorRegisters", "ptr", Partition, "uint", VpIndex, "int*", RegisterNames, "uint", RegisterCount, "ptr", RegisterValues, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<Int32>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
     * @returns {Integer} 
     */
    static WHvSetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorRegisters", "ptr", Partition, "uint", VpIndex, "int*", RegisterNames, "uint", RegisterCount, "ptr", RegisterValues, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @param {Pointer<UInt32>} WrittenSize 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize, WrittenSize) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", WrittenSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @returns {Integer} 
     */
    static WHvSetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize) {
        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_INTERRUPT_CONTROL>} Interrupt 
     * @param {Integer} InterruptControlSize 
     * @returns {Integer} 
     */
    static WHvRequestInterrupt(Partition, Interrupt, InterruptControlSize) {
        result := DllCall("WinHvPlatform.dll\WHvRequestInterrupt", "ptr", Partition, "ptr", Interrupt, "uint", InterruptControlSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorXsaveState(Partition, VpIndex, Buffer, BufferSizeInBytes, BytesWritten) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorXsaveState", "ptr", Partition, "uint", VpIndex, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @returns {Integer} 
     */
    static WHvSetVirtualProcessorXsaveState(Partition, VpIndex, Buffer, BufferSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorXsaveState", "ptr", Partition, "uint", VpIndex, "ptr", Buffer, "uint", BufferSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} GuestAddress 
     * @param {Integer} RangeSizeInBytes 
     * @param {Pointer} Bitmap 
     * @param {Integer} BitmapSizeInBytes 
     * @returns {Integer} 
     */
    static WHvQueryGpaRangeDirtyBitmap(Partition, GuestAddress, RangeSizeInBytes, Bitmap, BitmapSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvQueryGpaRangeDirtyBitmap", "ptr", Partition, "uint", GuestAddress, "uint", RangeSizeInBytes, "ptr", Bitmap, "uint", BitmapSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} CounterSet 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {Integer} 
     */
    static WHvGetPartitionCounters(Partition, CounterSet, Buffer, BufferSizeInBytes, BytesWritten) {
        result := DllCall("WinHvPlatform.dll\WHvGetPartitionCounters", "ptr", Partition, "int", CounterSet, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} CounterSet 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorCounters(Partition, VpIndex, CounterSet, Buffer, BufferSizeInBytes, BytesWritten) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCounters", "ptr", Partition, "uint", VpIndex, "int", CounterSet, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @param {Pointer<UInt32>} WrittenSize 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize, WrittenSize) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState2", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", WrittenSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @returns {Integer} 
     */
    static WHvSetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize) {
        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState2", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
     * @param {Pointer<Void>} EventHandle 
     * @returns {Integer} 
     */
    static WHvRegisterPartitionDoorbellEvent(Partition, MatchData, EventHandle) {
        result := DllCall("WinHvPlatform.dll\WHvRegisterPartitionDoorbellEvent", "ptr", Partition, "ptr", MatchData, "ptr", EventHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
     * @returns {Integer} 
     */
    static WHvUnregisterPartitionDoorbellEvent(Partition, MatchData) {
        result := DllCall("WinHvPlatform.dll\WHvUnregisterPartitionDoorbellEvent", "ptr", Partition, "ptr", MatchData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_MEMORY_RANGE_ENTRY>} GpaRanges 
     * @param {Integer} GpaRangesCount 
     * @param {Integer} Advice 
     * @param {Pointer} AdviceBuffer 
     * @param {Integer} AdviceBufferSizeInBytes 
     * @returns {Integer} 
     */
    static WHvAdviseGpaRange(Partition, GpaRanges, GpaRangesCount, Advice, AdviceBuffer, AdviceBufferSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvAdviseGpaRange", "ptr", Partition, "ptr", GpaRanges, "uint", GpaRangesCount, "int", Advice, "ptr", AdviceBuffer, "uint", AdviceBufferSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} GuestAddress 
     * @param {Pointer} Controls 
     * @param {Pointer} Data 
     * @param {Integer} DataSizeInBytes 
     * @returns {Integer} 
     */
    static WHvReadGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvReadGpaRange", "ptr", Partition, "uint", VpIndex, "uint", GuestAddress, "ptr", Controls, "ptr", Data, "uint", DataSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} GuestAddress 
     * @param {Pointer} Controls 
     * @param {Pointer} Data 
     * @param {Integer} DataSizeInBytes 
     * @returns {Integer} 
     */
    static WHvWriteGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvWriteGpaRange", "ptr", Partition, "uint", VpIndex, "uint", GuestAddress, "ptr", Controls, "ptr", Data, "uint", DataSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer} SynicEvent 
     * @param {Pointer<Int32>} NewlySignaled 
     * @returns {Integer} 
     */
    static WHvSignalVirtualProcessorSynicEvent(Partition, SynicEvent, NewlySignaled) {
        result := DllCall("WinHvPlatform.dll\WHvSignalVirtualProcessorSynicEvent", "ptr", Partition, "ptr", SynicEvent, "int*", NewlySignaled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} StateType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorState(Partition, VpIndex, StateType, Buffer, BufferSizeInBytes, BytesWritten) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorState", "ptr", Partition, "uint", VpIndex, "int", StateType, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} StateType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @returns {Integer} 
     */
    static WHvSetVirtualProcessorState(Partition, VpIndex, StateType, Buffer, BufferSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorState", "ptr", Partition, "uint", VpIndex, "int", StateType, "ptr", Buffer, "uint", BufferSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} ResourceDescriptor 
     * @param {Integer} ResourceDescriptorSizeInBytes 
     * @param {Pointer<Void>} VpciResource 
     * @returns {Integer} 
     */
    static WHvAllocateVpciResource(ProviderId, Flags, ResourceDescriptor, ResourceDescriptorSizeInBytes, VpciResource) {
        result := DllCall("WinHvPlatform.dll\WHvAllocateVpciResource", "ptr", ProviderId, "int", Flags, "ptr", ResourceDescriptor, "uint", ResourceDescriptorSizeInBytes, "ptr", VpciResource, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<Void>} VpciResource 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} NotificationEventHandle 
     * @returns {Integer} 
     */
    static WHvCreateVpciDevice(Partition, LogicalDeviceId, VpciResource, Flags, NotificationEventHandle) {
        result := DllCall("WinHvPlatform.dll\WHvCreateVpciDevice", "ptr", Partition, "uint", LogicalDeviceId, "ptr", VpciResource, "int", Flags, "ptr", NotificationEventHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @returns {Integer} 
     */
    static WHvDeleteVpciDevice(Partition, LogicalDeviceId) {
        result := DllCall("WinHvPlatform.dll\WHvDeleteVpciDevice", "ptr", Partition, "uint", LogicalDeviceId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @param {Pointer<UInt32>} WrittenSizeInBytes 
     * @returns {Integer} 
     */
    static WHvGetVpciDeviceProperty(Partition, LogicalDeviceId, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes, WrittenSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceProperty", "ptr", Partition, "uint", LogicalDeviceId, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer} Notification 
     * @param {Integer} NotificationSizeInBytes 
     * @returns {Integer} 
     */
    static WHvGetVpciDeviceNotification(Partition, LogicalDeviceId, Notification, NotificationSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceNotification", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Notification, "uint", NotificationSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<UInt32>} MappingCount 
     * @param {Pointer<WHV_VPCI_MMIO_MAPPING>} Mappings 
     * @returns {Integer} 
     */
    static WHvMapVpciDeviceMmioRanges(Partition, LogicalDeviceId, MappingCount, Mappings) {
        result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceMmioRanges", "ptr", Partition, "uint", LogicalDeviceId, "uint*", MappingCount, "ptr", Mappings, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @returns {Integer} 
     */
    static WHvUnmapVpciDeviceMmioRanges(Partition, LogicalDeviceId) {
        result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceMmioRanges", "ptr", Partition, "uint", LogicalDeviceId, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} PowerState 
     * @returns {Integer} 
     */
    static WHvSetVpciDevicePowerState(Partition, LogicalDeviceId, PowerState) {
        result := DllCall("WinHvPlatform.dll\WHvSetVpciDevicePowerState", "ptr", Partition, "uint", LogicalDeviceId, "int", PowerState, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
     * @param {Pointer<Void>} Data 
     * @returns {Integer} 
     */
    static WHvReadVpciDeviceRegister(Partition, LogicalDeviceId, Register, Data) {
        result := DllCall("WinHvPlatform.dll\WHvReadVpciDeviceRegister", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Register, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
     * @param {Pointer<Void>} Data 
     * @returns {Integer} 
     */
    static WHvWriteVpciDeviceRegister(Partition, LogicalDeviceId, Register, Data) {
        result := DllCall("WinHvPlatform.dll\WHvWriteVpciDeviceRegister", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Register, "ptr", Data, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @param {Integer} MessageCount 
     * @param {Pointer<WHV_VPCI_INTERRUPT_TARGET>} Target 
     * @param {Pointer<UInt64>} MsiAddress 
     * @param {Pointer<UInt32>} MsiData 
     * @returns {Integer} 
     */
    static WHvMapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index, MessageCount, Target, MsiAddress, MsiData) {
        result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MessageCount, "ptr", Target, "uint*", MsiAddress, "uint*", MsiData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @returns {Integer} 
     */
    static WHvUnmapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index) {
        result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} MsiAddress 
     * @param {Integer} MsiData 
     * @param {Pointer<WHV_VPCI_INTERRUPT_TARGET>} Target 
     * @returns {Integer} 
     */
    static WHvRetargetVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData, Target) {
        result := DllCall("WinHvPlatform.dll\WHvRetargetVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, "ptr", Target, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} MsiAddress 
     * @param {Integer} MsiData 
     * @returns {Integer} 
     */
    static WHvRequestVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData) {
        result := DllCall("WinHvPlatform.dll\WHvRequestVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @param {Integer} MultiMessageNumber 
     * @param {Pointer} Target 
     * @param {Integer} TargetSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {Integer} 
     */
    static WHvGetVpciDeviceInterruptTarget(Partition, LogicalDeviceId, Index, MultiMessageNumber, Target, TargetSizeInBytes, BytesWritten) {
        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceInterruptTarget", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MultiMessageNumber, "ptr", Target, "uint", TargetSizeInBytes, "uint*", BytesWritten, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
     * @param {Pointer<Void>} TriggerHandle 
     * @param {Pointer<Void>} EventHandle 
     * @returns {Integer} 
     */
    static WHvCreateTrigger(Partition, Parameters, TriggerHandle, EventHandle) {
        result := DllCall("WinHvPlatform.dll\WHvCreateTrigger", "ptr", Partition, "ptr", Parameters, "ptr", TriggerHandle, "ptr", EventHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
     * @param {Pointer<Void>} TriggerHandle 
     * @returns {Integer} 
     */
    static WHvUpdateTriggerParameters(Partition, Parameters, TriggerHandle) {
        result := DllCall("WinHvPlatform.dll\WHvUpdateTriggerParameters", "ptr", Partition, "ptr", Parameters, "ptr", TriggerHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} TriggerHandle 
     * @returns {Integer} 
     */
    static WHvDeleteTrigger(Partition, TriggerHandle) {
        result := DllCall("WinHvPlatform.dll\WHvDeleteTrigger", "ptr", Partition, "ptr", TriggerHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<WHV_NOTIFICATION_PORT_PARAMETERS>} Parameters 
     * @param {Pointer<Void>} EventHandle 
     * @param {Pointer<Void>} PortHandle 
     * @returns {Integer} 
     */
    static WHvCreateNotificationPort(Partition, Parameters, EventHandle, PortHandle) {
        result := DllCall("WinHvPlatform.dll\WHvCreateNotificationPort", "ptr", Partition, "ptr", Parameters, "ptr", EventHandle, "ptr", PortHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} PortHandle 
     * @param {Integer} PropertyCode 
     * @param {Integer} PropertyValue 
     * @returns {Integer} 
     */
    static WHvSetNotificationPortProperty(Partition, PortHandle, PropertyCode, PropertyValue) {
        result := DllCall("WinHvPlatform.dll\WHvSetNotificationPortProperty", "ptr", Partition, "ptr", PortHandle, "int", PropertyCode, "uint", PropertyValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} PortHandle 
     * @returns {Integer} 
     */
    static WHvDeleteNotificationPort(Partition, PortHandle) {
        result := DllCall("WinHvPlatform.dll\WHvDeleteNotificationPort", "ptr", Partition, "ptr", PortHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} SintIndex 
     * @param {Pointer} Message 
     * @param {Integer} MessageSizeInBytes 
     * @returns {Integer} 
     */
    static WHvPostVirtualProcessorSynicMessage(Partition, VpIndex, SintIndex, Message, MessageSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvPostVirtualProcessorSynicMessage", "ptr", Partition, "uint", VpIndex, "uint", SintIndex, "ptr", Message, "uint", MessageSizeInBytes, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Eax 
     * @param {Integer} Ecx 
     * @param {Pointer<WHV_CPUID_OUTPUT>} CpuidOutput 
     * @returns {Integer} 
     */
    static WHvGetVirtualProcessorCpuidOutput(Partition, VpIndex, Eax, Ecx, CpuidOutput) {
        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCpuidOutput", "ptr", Partition, "uint", VpIndex, "uint", Eax, "uint", Ecx, "ptr", CpuidOutput, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Integer} Destination 
     * @param {Integer} DestinationMode 
     * @param {Pointer<UInt32>} TargetVps 
     * @param {Integer} VpCount 
     * @param {Pointer<UInt32>} TargetVpCount 
     * @returns {Integer} 
     */
    static WHvGetInterruptTargetVpSet(Partition, Destination, DestinationMode, TargetVps, VpCount, TargetVpCount) {
        result := DllCall("WinHvPlatform.dll\WHvGetInterruptTargetVpSet", "ptr", Partition, "uint", Destination, "int", DestinationMode, "uint*", TargetVps, "uint", VpCount, "uint*", TargetVpCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @param {Pointer<Void>} MigrationHandle 
     * @returns {Integer} 
     */
    static WHvStartPartitionMigration(Partition, MigrationHandle) {
        result := DllCall("WinHvPlatform.dll\WHvStartPartitionMigration", "ptr", Partition, "ptr", MigrationHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvCancelPartitionMigration(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvCancelPartitionMigration", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer} Partition 
     * @returns {Integer} 
     */
    static WHvCompletePartitionMigration(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvCompletePartitionMigration", "ptr", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} MigrationHandle 
     * @param {Pointer<IntPtr>} Partition 
     * @returns {Integer} 
     */
    static WHvAcceptPartitionMigration(MigrationHandle, Partition) {
        result := DllCall("WinHvPlatform.dll\WHvAcceptPartitionMigration", "ptr", MigrationHandle, "ptr*", Partition, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<WHV_EMULATOR_CALLBACKS>} Callbacks 
     * @param {Pointer<Void>} Emulator 
     * @returns {Integer} 
     */
    static WHvEmulatorCreateEmulator(Callbacks, Emulator) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorCreateEmulator", "ptr", Callbacks, "ptr", Emulator, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @returns {Integer} 
     */
    static WHvEmulatorDestroyEmulator(Emulator) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorDestroyEmulator", "ptr", Emulator, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
     * @param {Pointer<WHV_X64_IO_PORT_ACCESS_CONTEXT>} IoInstructionContext 
     * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
     * @returns {Integer} 
     */
    static WHvEmulatorTryIoEmulation(Emulator, Context, VpContext, IoInstructionContext, EmulatorReturnStatus) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorTryIoEmulation", "ptr", Emulator, "ptr", Context, "ptr", VpContext, "ptr", IoInstructionContext, "ptr", EmulatorReturnStatus, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
     * @param {Pointer<WHV_MEMORY_ACCESS_CONTEXT>} MmioInstructionContext 
     * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
     * @returns {Integer} 
     */
    static WHvEmulatorTryMmioEmulation(Emulator, Context, VpContext, MmioInstructionContext, EmulatorReturnStatus) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorTryMmioEmulation", "ptr", Emulator, "ptr", Context, "ptr", VpContext, "ptr", MmioInstructionContext, "ptr", EmulatorReturnStatus, "int")
        return result
    }

    /**
     * HdvInitializeDeviceHost function
     * @param {Pointer<Void>} computeSystem 
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {Integer} If the function succeeds, the return value is `S_OK`.
     * 
     * If the function fails, the return value is an  `HRESULT` error code.
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvInitializeDeviceHost
     */
    static HdvInitializeDeviceHost(computeSystem, deviceHostHandle) {
        result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHost", "ptr", computeSystem, "ptr", deviceHostHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} computeSystem 
     * @param {Integer} flags 
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {Integer} 
     */
    static HdvInitializeDeviceHostEx(computeSystem, flags, deviceHostHandle) {
        result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHostEx", "ptr", computeSystem, "int", flags, "ptr", deviceHostHandle, "int")
        return result
    }

    /**
     * HdvTeardownDeviceHost
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {Integer} |Parameter|Description|
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
    static HdvTeardownDeviceHost(deviceHostHandle) {
        result := DllCall("vmdevicehost.dll\HdvTeardownDeviceHost", "ptr", deviceHostHandle, "int")
        return result
    }

    /**
     * HdvCreateDeviceInstance
     * @param {Pointer<Void>} deviceHostHandle 
     * @param {Integer} deviceType 
     * @param {Pointer<Guid>} deviceClassId 
     * @param {Pointer<Guid>} deviceInstanceId 
     * @param {Pointer<Void>} deviceInterface 
     * @param {Pointer<Void>} deviceContext 
     * @param {Pointer<Void>} deviceHandle 
     * @returns {Integer} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`DeviceHost` | Handle to the device host in which to create the new device.|
     * |`DeviceType` | Specifies the [HDV_DEVICE_TYPE](HdvDeviceType.md) type of the device instance to create.|
     * |`DeviceClassId` | Supplies the client-defined class ID of the device instance to create.|
     * |`DeviceInterface` | Supplies the client-defined instance ID of the device instance to create.|
     * |`DeviceInterface` | Supplies a function table representing the interface exposed by the device instance. The actual type of this parameter is implied by the DeviceType parameter.|
     * |`DeviceContext` | An optional opaque context pointer that will be supplied to the device instance callbacks.|
     * |`DeviceHandle` | Receives a handle to the created device instance.|
     * |     |     |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvCreateDeviceInstance
     */
    static HdvCreateDeviceInstance(deviceHostHandle, deviceType, deviceClassId, deviceInstanceId, deviceInterface, deviceContext, deviceHandle) {
        result := DllCall("vmdevicehost.dll\HdvCreateDeviceInstance", "ptr", deviceHostHandle, "int", deviceType, "ptr", deviceClassId, "ptr", deviceInstanceId, "ptr", deviceInterface, "ptr", deviceContext, "ptr", deviceHandle, "int")
        return result
    }

    /**
     * HdvReadGuestMemory
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {Pointer<Byte>} buffer 
     * @returns {Integer} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`Requestor` |Handle to the device requesting memory access.|
     * |`GuestPhysicalAddress`|Guest physical address at which the read operation starts.|
     * |`ByteCount`|Number of bytes to read.|
     * |`Buffer`|Target buffer for the read operation. |
     * |    |    |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvReadGuestMemory
     */
    static HdvReadGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer) {
        result := DllCall("vmdevicehost.dll\HdvReadGuestMemory", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "char*", buffer, "int")
        return result
    }

    /**
     * HdvWriteGuestMemory
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {Pointer<Byte>} buffer 
     * @returns {Integer} |Parameter|Description|
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
    static HdvWriteGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer) {
        result := DllCall("vmdevicehost.dll\HdvWriteGuestMemory", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "char*", buffer, "int")
        return result
    }

    /**
     * HdvCreateGuestMemoryAperture
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {Integer} writeProtected 
     * @param {Pointer<Void>} mappedAddress 
     * @returns {Integer} |Parameter|Description|
     * |---|---|---|---|---|---|---|---|
     * |`Requestor` | Handle to the device requesting memory access.|
     * |`GuestPhysicalAddress` | Base physical address at which the aperture starts.|
     * |`ByteCount` | Size of the aperture in bytes.|
     * |`WriteProtected` | If TRUE, the process is only granted read access to the mapped memory.|
     * |`MappedAddress` | Receives the virtual address (in the calling process) at which the requested guest memory region has been mapped.|
     * |    |    |
     * 
     * 
     * |Return Value     |Description|
     * |---|---|
     * |`S_OK` | Returned if function succeeds.|
     * |`HRESULT` | An error code is returned if the function fails.
     * |     |     |
     * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvCreateGuestMemoryAperture
     */
    static HdvCreateGuestMemoryAperture(requestor, guestPhysicalAddress, byteCount, writeProtected, mappedAddress) {
        result := DllCall("vmdevicehost.dll\HdvCreateGuestMemoryAperture", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "int", writeProtected, "ptr", mappedAddress, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Pointer<Void>} mappedAddress 
     * @returns {Integer} 
     */
    static HdvDestroyGuestMemoryAperture(requestor, mappedAddress) {
        result := DllCall("vmdevicehost.dll\HdvDestroyGuestMemoryAperture", "ptr", requestor, "ptr", mappedAddress, "int")
        return result
    }

    /**
     * HdvDeliverGuestInterrupt
     * @param {Pointer<Void>} requestor 
     * @param {Integer} msiAddress 
     * @param {Integer} msiData 
     * @returns {Integer} |Parameter|Description|
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
    static HdvDeliverGuestInterrupt(requestor, msiAddress, msiData) {
        result := DllCall("vmdevicehost.dll\HdvDeliverGuestInterrupt", "ptr", requestor, "uint", msiAddress, "uint", msiData, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} BarIndex 
     * @param {Integer} BarOffset 
     * @param {Integer} TriggerValue 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} DoorbellEvent 
     * @returns {Integer} 
     */
    static HdvRegisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags, DoorbellEvent) {
        result := DllCall("vmdevicehost.dll\HdvRegisterDoorbell", "ptr", requestor, "int", BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, "ptr", DoorbellEvent, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} BarIndex 
     * @param {Integer} BarOffset 
     * @param {Integer} TriggerValue 
     * @param {Integer} Flags 
     * @returns {Integer} 
     */
    static HdvUnregisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags) {
        result := DllCall("vmdevicehost.dll\HdvUnregisterDoorbell", "ptr", requestor, "int", BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} barIndex 
     * @param {Integer} offsetInPages 
     * @param {Integer} lengthInPages 
     * @param {Integer} MappingFlags 
     * @param {Pointer<Void>} sectionHandle 
     * @param {Integer} sectionOffsetInPages 
     * @returns {Integer} 
     */
    static HdvCreateSectionBackedMmioRange(requestor, barIndex, offsetInPages, lengthInPages, MappingFlags, sectionHandle, sectionOffsetInPages) {
        result := DllCall("vmdevicehost.dll\HdvCreateSectionBackedMmioRange", "ptr", requestor, "int", barIndex, "uint", offsetInPages, "uint", lengthInPages, "int", MappingFlags, "ptr", sectionHandle, "uint", sectionOffsetInPages, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} barIndex 
     * @param {Integer} offsetInPages 
     * @returns {Integer} 
     */
    static HdvDestroySectionBackedMmioRange(requestor, barIndex, offsetInPages) {
        result := DllCall("vmdevicehost.dll\HdvDestroySectionBackedMmioRange", "ptr", requestor, "int", barIndex, "uint", offsetInPages, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} vmName 
     * @param {Pointer<Char>} snapshotName 
     * @param {Pointer<Char>} binPath 
     * @param {Pointer<Char>} vsvPath 
     * @param {Pointer<Char>} vmrsPath 
     * @returns {Integer} 
     */
    static LocateSavedStateFiles(vmName, snapshotName, binPath, vsvPath, vmrsPath) {
        vmName := vmName is String? StrPtr(vmName) : vmName
        snapshotName := snapshotName is String? StrPtr(snapshotName) : snapshotName

        result := DllCall("VmSavedStateDumpProvider.dll\LocateSavedStateFiles", "ptr", vmName, "ptr", snapshotName, "ptr", binPath, "ptr", vsvPath, "ptr", vmrsPath, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} vmrsFile 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {Integer} 
     */
    static LoadSavedStateFile(vmrsFile, vmSavedStateDumpHandle) {
        vmrsFile := vmrsFile is String? StrPtr(vmrsFile) : vmrsFile

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFile", "ptr", vmrsFile, "ptr", vmSavedStateDumpHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} vmrsFile 
     * @returns {Integer} 
     */
    static ApplyPendingSavedStateFileReplayLog(vmrsFile) {
        vmrsFile := vmrsFile is String? StrPtr(vmrsFile) : vmrsFile

        result := DllCall("VmSavedStateDumpProvider.dll\ApplyPendingSavedStateFileReplayLog", "ptr", vmrsFile, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} binFile 
     * @param {Pointer<Char>} vsvFile 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {Integer} 
     */
    static LoadSavedStateFiles(binFile, vsvFile, vmSavedStateDumpHandle) {
        binFile := binFile is String? StrPtr(binFile) : binFile
        vsvFile := vsvFile is String? StrPtr(vsvFile) : vsvFile

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFiles", "ptr", binFile, "ptr", vsvFile, "ptr", vmSavedStateDumpHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {Integer} 
     */
    static ReleaseSavedStateFiles(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateFiles", "ptr", vmSavedStateDumpHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt32>} virtualTrustLevels 
     * @returns {Integer} 
     */
    static GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle, virtualTrustLevels) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestEnabledVirtualTrustLevels", "ptr", vmSavedStateDumpHandle, "uint*", virtualTrustLevels, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} virtualTrustLevel 
     * @param {Pointer<GUEST_OS_INFO>} guestOsInfo 
     * @returns {Integer} 
     */
    static GetGuestOsInfo(vmSavedStateDumpHandle, virtualTrustLevel, guestOsInfo) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestOsInfo", "ptr", vmSavedStateDumpHandle, "char", virtualTrustLevel, "ptr", guestOsInfo, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt32>} vpCount 
     * @returns {Integer} 
     */
    static GetVpCount(vmSavedStateDumpHandle, vpCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetVpCount", "ptr", vmSavedStateDumpHandle, "uint*", vpCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} architecture 
     * @returns {Integer} 
     */
    static GetArchitecture(vmSavedStateDumpHandle, vpId, architecture) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetArchitecture", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", architecture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} architecture 
     * @returns {Integer} 
     */
    static ForceArchitecture(vmSavedStateDumpHandle, vpId, architecture) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceArchitecture", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", architecture, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} virtualTrustLevel 
     * @returns {Integer} 
     */
    static GetActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetActiveVirtualTrustLevel", "ptr", vmSavedStateDumpHandle, "uint", vpId, "char*", virtualTrustLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<UInt32>} virtualTrustLevels 
     * @returns {Integer} 
     */
    static GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle, vpId, virtualTrustLevels) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetEnabledVirtualTrustLevels", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint*", virtualTrustLevels, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} virtualTrustLevel 
     * @returns {Integer} 
     */
    static ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceActiveVirtualTrustLevel", "ptr", vmSavedStateDumpHandle, "uint", vpId, "char", virtualTrustLevel, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} activeVirtualTrustLevelEnabled 
     * @returns {Integer} 
     */
    static IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle, vpId, activeVirtualTrustLevelEnabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\IsActiveVirtualTrustLevelEnabled", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", activeVirtualTrustLevelEnabled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<Int32>} enabled 
     * @returns {Integer} 
     */
    static IsNestedVirtualizationEnabled(vmSavedStateDumpHandle, enabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\IsNestedVirtualizationEnabled", "ptr", vmSavedStateDumpHandle, "int*", enabled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} enabled 
     * @returns {Integer} 
     */
    static GetNestedVirtualizationMode(vmSavedStateDumpHandle, vpId, enabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetNestedVirtualizationMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", enabled, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} hostMode 
     * @param {Pointer<Int32>} oldMode 
     * @returns {Integer} 
     */
    static ForceNestedHostMode(vmSavedStateDumpHandle, vpId, hostMode, oldMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceNestedHostMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", hostMode, "int*", oldMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} inKernelSpace 
     * @returns {Integer} 
     */
    static InKernelSpace(vmSavedStateDumpHandle, vpId, inKernelSpace) {
        result := DllCall("VmSavedStateDumpProvider.dll\InKernelSpace", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", inKernelSpace, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} registerId 
     * @param {Pointer<VIRTUAL_PROCESSOR_REGISTER>} registerValue 
     * @returns {Integer} 
     */
    static GetRegisterValue(vmSavedStateDumpHandle, vpId, registerId, registerValue) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetRegisterValue", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", registerId, "ptr", registerValue, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} pagingMode 
     * @returns {Integer} 
     */
    static GetPagingMode(vmSavedStateDumpHandle, vpId, pagingMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetPagingMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", pagingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} pagingMode 
     * @returns {Integer} 
     */
    static ForcePagingMode(vmSavedStateDumpHandle, vpId, pagingMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForcePagingMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", pagingMode, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} physicalAddress 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt32>} bytesRead 
     * @returns {Integer} 
     */
    static ReadGuestPhysicalAddress(vmSavedStateDumpHandle, physicalAddress, buffer, bufferSize, bytesRead) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestPhysicalAddress", "ptr", vmSavedStateDumpHandle, "uint", physicalAddress, "ptr", buffer, "uint", bufferSize, "uint*", bytesRead, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} virtualAddress 
     * @param {Pointer<UInt64>} physicalAddress 
     * @param {Pointer<UInt64>} unmappedRegionSize 
     * @returns {Integer} 
     */
    static GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle, vpId, virtualAddress, physicalAddress, unmappedRegionSize) {
        result := DllCall("VmSavedStateDumpProvider.dll\GuestVirtualAddressToPhysicalAddress", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, "uint*", physicalAddress, "uint*", unmappedRegionSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} memoryChunkPageSize 
     * @param {Pointer<GPA_MEMORY_CHUNK>} memoryChunks 
     * @param {Pointer<UInt64>} memoryChunkCount 
     * @returns {Integer} 
     */
    static GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle, memoryChunkPageSize, memoryChunks, memoryChunkCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestPhysicalMemoryChunks", "ptr", vmSavedStateDumpHandle, "uint*", memoryChunkPageSize, "ptr", memoryChunks, "uint*", memoryChunkCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} physicalAddress 
     * @param {Pointer<UInt64>} rawSavedMemoryOffset 
     * @returns {Integer} 
     */
    static GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle, physicalAddress, rawSavedMemoryOffset) {
        result := DllCall("VmSavedStateDumpProvider.dll\GuestPhysicalAddressToRawSavedMemoryOffset", "ptr", vmSavedStateDumpHandle, "uint", physicalAddress, "uint*", rawSavedMemoryOffset, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} rawSavedMemoryOffset 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt32>} bytesRead 
     * @returns {Integer} 
     */
    static ReadGuestRawSavedMemory(vmSavedStateDumpHandle, rawSavedMemoryOffset, buffer, bufferSize, bytesRead) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestRawSavedMemory", "ptr", vmSavedStateDumpHandle, "uint", rawSavedMemoryOffset, "ptr", buffer, "uint", bufferSize, "uint*", bytesRead, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} guestRawSavedMemorySize 
     * @returns {Integer} 
     */
    static GetGuestRawSavedMemorySize(vmSavedStateDumpHandle, guestRawSavedMemorySize) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestRawSavedMemorySize", "ptr", vmSavedStateDumpHandle, "uint*", guestRawSavedMemorySize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} memoryBlockCacheLimit 
     * @returns {Integer} 
     */
    static SetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit) {
        result := DllCall("VmSavedStateDumpProvider.dll\SetMemoryBlockCacheLimit", "ptr", vmSavedStateDumpHandle, "uint", memoryBlockCacheLimit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} memoryBlockCacheLimit 
     * @returns {Integer} 
     */
    static GetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetMemoryBlockCacheLimit", "ptr", vmSavedStateDumpHandle, "uint*", memoryBlockCacheLimit, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} virtualAddress 
     * @param {Pointer<Void>} fixBuffer 
     * @param {Integer} fixBufferSize 
     * @returns {Integer} 
     */
    static ApplyGuestMemoryFix(vmSavedStateDumpHandle, vpId, virtualAddress, fixBuffer, fixBufferSize) {
        result := DllCall("VmSavedStateDumpProvider.dll\ApplyGuestMemoryFix", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, "ptr", fixBuffer, "uint", fixBufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<Char>} userSymbols 
     * @param {Integer} force 
     * @returns {Integer} 
     */
    static LoadSavedStateSymbolProvider(vmSavedStateDumpHandle, userSymbols, force) {
        userSymbols := userSymbols is String? StrPtr(userSymbols) : userSymbols

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateSymbolProvider", "ptr", vmSavedStateDumpHandle, "ptr", userSymbols, "int", force, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {Integer} 
     */
    static ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateSymbolProvider", "ptr", vmSavedStateDumpHandle, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {Pointer<Void>} 
     */
    static GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolProviderHandle", "ptr", vmSavedStateDumpHandle)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK>} Callback 
     * @returns {Integer} 
     */
    static SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle, Callback) {
        result := DllCall("VmSavedStateDumpProvider.dll\SetSavedStateSymbolProviderDebugInfoCallback", "ptr", vmSavedStateDumpHandle, "ptr", Callback, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<Byte>} imageName 
     * @param {Pointer<Byte>} moduleName 
     * @param {Integer} baseAddress 
     * @param {Integer} sizeOfBase 
     * @returns {Integer} 
     */
    static LoadSavedStateModuleSymbols(vmSavedStateDumpHandle, imageName, moduleName, baseAddress, sizeOfBase) {
        imageName := imageName is String? StrPtr(imageName) : imageName
        moduleName := moduleName is String? StrPtr(moduleName) : moduleName

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbols", "ptr", vmSavedStateDumpHandle, "ptr", imageName, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<Byte>} imageName 
     * @param {Integer} imageTimestamp 
     * @param {Pointer<Byte>} moduleName 
     * @param {Integer} baseAddress 
     * @param {Integer} sizeOfBase 
     * @returns {Integer} 
     */
    static LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle, imageName, imageTimestamp, moduleName, baseAddress, sizeOfBase) {
        imageName := imageName is String? StrPtr(imageName) : imageName
        moduleName := moduleName is String? StrPtr(moduleName) : moduleName

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbolsEx", "ptr", vmSavedStateDumpHandle, "ptr", imageName, "uint", imageTimestamp, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} globalName 
     * @param {Pointer<UInt64>} virtualAddress 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle, vpId, globalName, virtualAddress, size) {
        globalName := globalName is String? StrPtr(globalName) : globalName

        result := DllCall("VmSavedStateDumpProvider.dll\ResolveSavedStateGlobalVariableAddress", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, "uint*", virtualAddress, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} globalName 
     * @param {Pointer<Void>} buffer 
     * @param {Integer} bufferSize 
     * @returns {Integer} 
     */
    static ReadSavedStateGlobalVariable(vmSavedStateDumpHandle, vpId, globalName, buffer, bufferSize) {
        globalName := globalName is String? StrPtr(globalName) : globalName

        result := DllCall("VmSavedStateDumpProvider.dll\ReadSavedStateGlobalVariable", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, "ptr", buffer, "uint", bufferSize, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} typeName 
     * @param {Pointer<UInt32>} size 
     * @returns {Integer} 
     */
    static GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle, vpId, typeName, size) {
        typeName := typeName is String? StrPtr(typeName) : typeName

        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolTypeSize", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "uint*", size, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} typeName 
     * @param {Pointer<Char>} fieldName 
     * @param {Pointer<UInt32>} offset 
     * @param {Pointer<Int32>} found 
     * @returns {Integer} 
     */
    static FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle, vpId, typeName, fieldName, offset, found) {
        typeName := typeName is String? StrPtr(typeName) : typeName
        fieldName := fieldName is String? StrPtr(fieldName) : fieldName

        result := DllCall("VmSavedStateDumpProvider.dll\FindSavedStateSymbolFieldInType", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "ptr", fieldName, "uint*", offset, "int*", found, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} typeName 
     * @param {Pointer<Char>} typeFieldInfoMap 
     * @returns {Integer} 
     */
    static GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle, vpId, typeName, typeFieldInfoMap) {
        typeName := typeName is String? StrPtr(typeName) : typeName

        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolFieldInfo", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "ptr", typeFieldInfoMap, "int")
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
     * @param {Pointer<UInt64>} standaloneAddress 
     * @param {Integer} standaloneAddressCount 
     * @returns {Integer} 
     */
    static ScanMemoryForDosImages(vmSavedStateDumpHandle, vpId, startAddress, endAddress, callbackContext, foundImageCallback, standaloneAddress, standaloneAddressCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\ScanMemoryForDosImages", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", startAddress, "uint", endAddress, "ptr", callbackContext, "ptr", foundImageCallback, "uint*", standaloneAddress, "uint", standaloneAddressCount, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<MODULE_INFO>} imageInfo 
     * @param {Integer} imageInfoCount 
     * @param {Integer} frameCount 
     * @param {Pointer<Char>} callStack 
     * @returns {Integer} 
     */
    static CallStackUnwind(vmSavedStateDumpHandle, vpId, imageInfo, imageInfoCount, frameCount, callStack) {
        result := DllCall("VmSavedStateDumpProvider.dll\CallStackUnwind", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", imageInfo, "uint", imageInfoCount, "uint", frameCount, "ptr", callStack, "int")
        return result
    }

;@endregion Methods
}
