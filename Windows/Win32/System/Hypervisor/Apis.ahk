#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

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
     * @returns {HRESULT} 
     */
    static WHvGetCapability(CapabilityCode, CapabilityBuffer, CapabilityBufferSizeInBytes, WrittenSizeInBytes) {
        result := DllCall("WinHvPlatform.dll\WHvGetCapability", "int", CapabilityCode, "ptr", CapabilityBuffer, "uint", CapabilityBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WHV_PARTITION_HANDLE>} Partition 
     * @returns {HRESULT} 
     */
    static WHvCreatePartition(Partition) {
        result := DllCall("WinHvPlatform.dll\WHvCreatePartition", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvSetupPartition(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetupPartition", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvResetPartition(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvResetPartition", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvDeletePartition(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvDeletePartition", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @param {Pointer<UInt32>} WrittenSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvGetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes, WrittenSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetPartitionProperty", "ptr", Partition, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvSetPartitionProperty(Partition, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetPartitionProperty", "ptr", Partition, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvSuspendPartitionTime(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSuspendPartitionTime", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvResumePartitionTime(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvResumePartitionTime", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<Void>} SourceAddress 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    static WHvMapGpaRange(Partition, SourceAddress, GuestAddress, SizeInBytes, Flags) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvMapGpaRange", "ptr", Partition, "ptr", SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {HANDLE} Process 
     * @param {Pointer<Void>} SourceAddress 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    static WHvMapGpaRange2(Partition, Process, SourceAddress, GuestAddress, SizeInBytes, Flags) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition
        Process := Process is Win32Handle ? NumGet(Process, "ptr") : Process

        result := DllCall("WinHvPlatform.dll\WHvMapGpaRange2", "ptr", Partition, "ptr", Process, "ptr", SourceAddress, "uint", GuestAddress, "uint", SizeInBytes, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} GuestAddress 
     * @param {Integer} SizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvUnmapGpaRange(Partition, GuestAddress, SizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvUnmapGpaRange", "ptr", Partition, "uint", GuestAddress, "uint", SizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Gva 
     * @param {Integer} TranslateFlags 
     * @param {Pointer<WHV_TRANSLATE_GVA_RESULT>} TranslationResult 
     * @param {Pointer<UInt64>} Gpa 
     * @returns {HRESULT} 
     */
    static WHvTranslateGva(Partition, VpIndex, Gva, TranslateFlags, TranslationResult, Gpa) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvTranslateGva", "ptr", Partition, "uint", VpIndex, "uint", Gva, "int", TranslateFlags, "ptr", TranslationResult, "uint*", Gpa, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    static WHvCreateVirtualProcessor(Partition, VpIndex, Flags) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor", "ptr", Partition, "uint", VpIndex, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<WHV_VIRTUAL_PROCESSOR_PROPERTY>} Properties 
     * @param {Integer} PropertyCount 
     * @returns {HRESULT} 
     */
    static WHvCreateVirtualProcessor2(Partition, VpIndex, Properties, PropertyCount) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCreateVirtualProcessor2", "ptr", Partition, "uint", VpIndex, "ptr", Properties, "uint", PropertyCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @returns {HRESULT} 
     */
    static WHvDeleteVirtualProcessor(Partition, VpIndex) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvDeleteVirtualProcessor", "ptr", Partition, "uint", VpIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} ExitContext 
     * @param {Integer} ExitContextSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvRunVirtualProcessor(Partition, VpIndex, ExitContext, ExitContextSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvRunVirtualProcessor", "ptr", Partition, "uint", VpIndex, "ptr", ExitContext, "uint", ExitContextSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    static WHvCancelRunVirtualProcessor(Partition, VpIndex, Flags) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCancelRunVirtualProcessor", "ptr", Partition, "uint", VpIndex, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<Int32>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorRegisters", "ptr", Partition, "uint", VpIndex, "int*", RegisterNames, "uint", RegisterCount, "ptr", RegisterValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer<Int32>} RegisterNames 
     * @param {Integer} RegisterCount 
     * @param {Pointer<WHV_REGISTER_VALUE>} RegisterValues 
     * @returns {HRESULT} 
     */
    static WHvSetVirtualProcessorRegisters(Partition, VpIndex, RegisterNames, RegisterCount, RegisterValues) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorRegisters", "ptr", Partition, "uint", VpIndex, "int*", RegisterNames, "uint", RegisterCount, "ptr", RegisterValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @param {Pointer<UInt32>} WrittenSize 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize, WrittenSize) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", WrittenSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @returns {HRESULT} 
     */
    static WHvSetVirtualProcessorInterruptControllerState(Partition, VpIndex, State, StateSize) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_INTERRUPT_CONTROL>} Interrupt 
     * @param {Integer} InterruptControlSize 
     * @returns {HRESULT} 
     */
    static WHvRequestInterrupt(Partition, Interrupt, InterruptControlSize) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvRequestInterrupt", "ptr", Partition, "ptr", Interrupt, "uint", InterruptControlSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorXsaveState(Partition, VpIndex, Buffer, BufferSizeInBytes, BytesWritten) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorXsaveState", "ptr", Partition, "uint", VpIndex, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvSetVirtualProcessorXsaveState(Partition, VpIndex, Buffer, BufferSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorXsaveState", "ptr", Partition, "uint", VpIndex, "ptr", Buffer, "uint", BufferSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} GuestAddress 
     * @param {Integer} RangeSizeInBytes 
     * @param {Pointer} Bitmap 
     * @param {Integer} BitmapSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvQueryGpaRangeDirtyBitmap(Partition, GuestAddress, RangeSizeInBytes, Bitmap, BitmapSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvQueryGpaRangeDirtyBitmap", "ptr", Partition, "uint", GuestAddress, "uint", RangeSizeInBytes, "ptr", Bitmap, "uint", BitmapSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} CounterSet 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    static WHvGetPartitionCounters(Partition, CounterSet, Buffer, BufferSizeInBytes, BytesWritten) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetPartitionCounters", "ptr", Partition, "int", CounterSet, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} CounterSet 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorCounters(Partition, VpIndex, CounterSet, Buffer, BufferSizeInBytes, BytesWritten) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCounters", "ptr", Partition, "uint", VpIndex, "int", CounterSet, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @param {Pointer<UInt32>} WrittenSize 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize, WrittenSize) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorInterruptControllerState2", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "uint*", WrittenSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Pointer} State 
     * @param {Integer} StateSize 
     * @returns {HRESULT} 
     */
    static WHvSetVirtualProcessorInterruptControllerState2(Partition, VpIndex, State, StateSize) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorInterruptControllerState2", "ptr", Partition, "uint", VpIndex, "ptr", State, "uint", StateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
     * @param {HANDLE} EventHandle 
     * @returns {HRESULT} 
     */
    static WHvRegisterPartitionDoorbellEvent(Partition, MatchData, EventHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition
        EventHandle := EventHandle is Win32Handle ? NumGet(EventHandle, "ptr") : EventHandle

        result := DllCall("WinHvPlatform.dll\WHvRegisterPartitionDoorbellEvent", "ptr", Partition, "ptr", MatchData, "ptr", EventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_DOORBELL_MATCH_DATA>} MatchData 
     * @returns {HRESULT} 
     */
    static WHvUnregisterPartitionDoorbellEvent(Partition, MatchData) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvUnregisterPartitionDoorbellEvent", "ptr", Partition, "ptr", MatchData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_MEMORY_RANGE_ENTRY>} GpaRanges 
     * @param {Integer} GpaRangesCount 
     * @param {Integer} Advice 
     * @param {Pointer} AdviceBuffer 
     * @param {Integer} AdviceBufferSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvAdviseGpaRange(Partition, GpaRanges, GpaRangesCount, Advice, AdviceBuffer, AdviceBufferSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvAdviseGpaRange", "ptr", Partition, "ptr", GpaRanges, "uint", GpaRangesCount, "int", Advice, "ptr", AdviceBuffer, "uint", AdviceBufferSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} GuestAddress 
     * @param {WHV_ACCESS_GPA_CONTROLS} Controls 
     * @param {Pointer} Data 
     * @param {Integer} DataSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvReadGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvReadGpaRange", "ptr", Partition, "uint", VpIndex, "uint", GuestAddress, "ptr", Controls, "ptr", Data, "uint", DataSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} GuestAddress 
     * @param {WHV_ACCESS_GPA_CONTROLS} Controls 
     * @param {Pointer} Data 
     * @param {Integer} DataSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvWriteGpaRange(Partition, VpIndex, GuestAddress, Controls, Data, DataSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvWriteGpaRange", "ptr", Partition, "uint", VpIndex, "uint", GuestAddress, "ptr", Controls, "ptr", Data, "uint", DataSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {WHV_SYNIC_EVENT_PARAMETERS} SynicEvent 
     * @param {Pointer<BOOL>} NewlySignaled 
     * @returns {HRESULT} 
     */
    static WHvSignalVirtualProcessorSynicEvent(Partition, SynicEvent, NewlySignaled) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSignalVirtualProcessorSynicEvent", "ptr", Partition, "ptr", SynicEvent, "ptr", NewlySignaled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} StateType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    static WHvGetVirtualProcessorState(Partition, VpIndex, StateType, Buffer, BufferSizeInBytes, BytesWritten) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorState", "ptr", Partition, "uint", VpIndex, "int", StateType, "ptr", Buffer, "uint", BufferSizeInBytes, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} StateType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvSetVirtualProcessorState(Partition, VpIndex, StateType, Buffer, BufferSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVirtualProcessorState", "ptr", Partition, "uint", VpIndex, "int", StateType, "ptr", Buffer, "uint", BufferSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} ResourceDescriptor 
     * @param {Integer} ResourceDescriptorSizeInBytes 
     * @param {Pointer<HANDLE>} VpciResource 
     * @returns {HRESULT} 
     */
    static WHvAllocateVpciResource(ProviderId, Flags, ResourceDescriptor, ResourceDescriptorSizeInBytes, VpciResource) {
        result := DllCall("WinHvPlatform.dll\WHvAllocateVpciResource", "ptr", ProviderId, "int", Flags, "ptr", ResourceDescriptor, "uint", ResourceDescriptorSizeInBytes, "ptr", VpciResource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {HANDLE} VpciResource 
     * @param {Integer} Flags 
     * @param {HANDLE} NotificationEventHandle 
     * @returns {HRESULT} 
     */
    static WHvCreateVpciDevice(Partition, LogicalDeviceId, VpciResource, Flags, NotificationEventHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition
        VpciResource := VpciResource is Win32Handle ? NumGet(VpciResource, "ptr") : VpciResource
        NotificationEventHandle := NotificationEventHandle is Win32Handle ? NumGet(NotificationEventHandle, "ptr") : NotificationEventHandle

        result := DllCall("WinHvPlatform.dll\WHvCreateVpciDevice", "ptr", Partition, "uint", LogicalDeviceId, "ptr", VpciResource, "int", Flags, "ptr", NotificationEventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @returns {HRESULT} 
     */
    static WHvDeleteVpciDevice(Partition, LogicalDeviceId) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvDeleteVpciDevice", "ptr", Partition, "uint", LogicalDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} PropertyCode 
     * @param {Pointer} PropertyBuffer 
     * @param {Integer} PropertyBufferSizeInBytes 
     * @param {Pointer<UInt32>} WrittenSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvGetVpciDeviceProperty(Partition, LogicalDeviceId, PropertyCode, PropertyBuffer, PropertyBufferSizeInBytes, WrittenSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceProperty", "ptr", Partition, "uint", LogicalDeviceId, "int", PropertyCode, "ptr", PropertyBuffer, "uint", PropertyBufferSizeInBytes, "uint*", WrittenSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer} Notification 
     * @param {Integer} NotificationSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvGetVpciDeviceNotification(Partition, LogicalDeviceId, Notification, NotificationSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceNotification", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Notification, "uint", NotificationSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<UInt32>} MappingCount 
     * @param {Pointer<WHV_VPCI_MMIO_MAPPING>} Mappings 
     * @returns {HRESULT} 
     */
    static WHvMapVpciDeviceMmioRanges(Partition, LogicalDeviceId, MappingCount, Mappings) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceMmioRanges", "ptr", Partition, "uint", LogicalDeviceId, "uint*", MappingCount, "ptr", Mappings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @returns {HRESULT} 
     */
    static WHvUnmapVpciDeviceMmioRanges(Partition, LogicalDeviceId) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceMmioRanges", "ptr", Partition, "uint", LogicalDeviceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} PowerState 
     * @returns {HRESULT} 
     */
    static WHvSetVpciDevicePowerState(Partition, LogicalDeviceId, PowerState) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetVpciDevicePowerState", "ptr", Partition, "uint", LogicalDeviceId, "int", PowerState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
     * @param {Pointer<Void>} Data 
     * @returns {HRESULT} 
     */
    static WHvReadVpciDeviceRegister(Partition, LogicalDeviceId, Register, Data) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvReadVpciDeviceRegister", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Register, "ptr", Data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Pointer<WHV_VPCI_DEVICE_REGISTER>} Register 
     * @param {Pointer<Void>} Data 
     * @returns {HRESULT} 
     */
    static WHvWriteVpciDeviceRegister(Partition, LogicalDeviceId, Register, Data) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvWriteVpciDeviceRegister", "ptr", Partition, "uint", LogicalDeviceId, "ptr", Register, "ptr", Data, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @param {Integer} MessageCount 
     * @param {Pointer<WHV_VPCI_INTERRUPT_TARGET>} Target 
     * @param {Pointer<UInt64>} MsiAddress 
     * @param {Pointer<UInt32>} MsiData 
     * @returns {HRESULT} 
     */
    static WHvMapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index, MessageCount, Target, MsiAddress, MsiData) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvMapVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MessageCount, "ptr", Target, "uint*", MsiAddress, "uint*", MsiData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @returns {HRESULT} 
     */
    static WHvUnmapVpciDeviceInterrupt(Partition, LogicalDeviceId, Index) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvUnmapVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "int")
        if(result != 0)
            throw OSError(result)

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
    static WHvRetargetVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData, Target) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvRetargetVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, "ptr", Target, "int")
        if(result != 0)
            throw OSError(result)

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
    static WHvRequestVpciDeviceInterrupt(Partition, LogicalDeviceId, MsiAddress, MsiData) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvRequestVpciDeviceInterrupt", "ptr", Partition, "uint", LogicalDeviceId, "uint", MsiAddress, "uint", MsiData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} LogicalDeviceId 
     * @param {Integer} Index 
     * @param {Integer} MultiMessageNumber 
     * @param {Pointer} Target 
     * @param {Integer} TargetSizeInBytes 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    static WHvGetVpciDeviceInterruptTarget(Partition, LogicalDeviceId, Index, MultiMessageNumber, Target, TargetSizeInBytes, BytesWritten) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVpciDeviceInterruptTarget", "ptr", Partition, "uint", LogicalDeviceId, "uint", Index, "uint", MultiMessageNumber, "ptr", Target, "uint", TargetSizeInBytes, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
     * @param {Pointer<Void>} TriggerHandle 
     * @param {Pointer<HANDLE>} EventHandle 
     * @returns {HRESULT} 
     */
    static WHvCreateTrigger(Partition, Parameters, TriggerHandle, EventHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCreateTrigger", "ptr", Partition, "ptr", Parameters, "ptr", TriggerHandle, "ptr", EventHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_TRIGGER_PARAMETERS>} Parameters 
     * @param {Pointer<Void>} TriggerHandle 
     * @returns {HRESULT} 
     */
    static WHvUpdateTriggerParameters(Partition, Parameters, TriggerHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvUpdateTriggerParameters", "ptr", Partition, "ptr", Parameters, "ptr", TriggerHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<Void>} TriggerHandle 
     * @returns {HRESULT} 
     */
    static WHvDeleteTrigger(Partition, TriggerHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvDeleteTrigger", "ptr", Partition, "ptr", TriggerHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<WHV_NOTIFICATION_PORT_PARAMETERS>} Parameters 
     * @param {HANDLE} EventHandle 
     * @param {Pointer<Void>} PortHandle 
     * @returns {HRESULT} 
     */
    static WHvCreateNotificationPort(Partition, Parameters, EventHandle, PortHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition
        EventHandle := EventHandle is Win32Handle ? NumGet(EventHandle, "ptr") : EventHandle

        result := DllCall("WinHvPlatform.dll\WHvCreateNotificationPort", "ptr", Partition, "ptr", Parameters, "ptr", EventHandle, "ptr", PortHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<Void>} PortHandle 
     * @param {Integer} PropertyCode 
     * @param {Integer} PropertyValue 
     * @returns {HRESULT} 
     */
    static WHvSetNotificationPortProperty(Partition, PortHandle, PropertyCode, PropertyValue) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvSetNotificationPortProperty", "ptr", Partition, "ptr", PortHandle, "int", PropertyCode, "uint", PropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<Void>} PortHandle 
     * @returns {HRESULT} 
     */
    static WHvDeleteNotificationPort(Partition, PortHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvDeleteNotificationPort", "ptr", Partition, "ptr", PortHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} VpIndex 
     * @param {Integer} SintIndex 
     * @param {Pointer} Message 
     * @param {Integer} MessageSizeInBytes 
     * @returns {HRESULT} 
     */
    static WHvPostVirtualProcessorSynicMessage(Partition, VpIndex, SintIndex, Message, MessageSizeInBytes) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvPostVirtualProcessorSynicMessage", "ptr", Partition, "uint", VpIndex, "uint", SintIndex, "ptr", Message, "uint", MessageSizeInBytes, "int")
        if(result != 0)
            throw OSError(result)

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
    static WHvGetVirtualProcessorCpuidOutput(Partition, VpIndex, Eax, Ecx, CpuidOutput) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetVirtualProcessorCpuidOutput", "ptr", Partition, "uint", VpIndex, "uint", Eax, "uint", Ecx, "ptr", CpuidOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Integer} Destination 
     * @param {Integer} DestinationMode 
     * @param {Pointer<UInt32>} TargetVps 
     * @param {Integer} VpCount 
     * @param {Pointer<UInt32>} TargetVpCount 
     * @returns {HRESULT} 
     */
    static WHvGetInterruptTargetVpSet(Partition, Destination, DestinationMode, TargetVps, VpCount, TargetVpCount) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvGetInterruptTargetVpSet", "ptr", Partition, "uint", Destination, "int", DestinationMode, "uint*", TargetVps, "uint", VpCount, "uint*", TargetVpCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @param {Pointer<HANDLE>} MigrationHandle 
     * @returns {HRESULT} 
     */
    static WHvStartPartitionMigration(Partition, MigrationHandle) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvStartPartitionMigration", "ptr", Partition, "ptr", MigrationHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvCancelPartitionMigration(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCancelPartitionMigration", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {WHV_PARTITION_HANDLE} Partition 
     * @returns {HRESULT} 
     */
    static WHvCompletePartitionMigration(Partition) {
        Partition := Partition is Win32Handle ? NumGet(Partition, "ptr") : Partition

        result := DllCall("WinHvPlatform.dll\WHvCompletePartitionMigration", "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} MigrationHandle 
     * @param {Pointer<WHV_PARTITION_HANDLE>} Partition 
     * @returns {HRESULT} 
     */
    static WHvAcceptPartitionMigration(MigrationHandle, Partition) {
        MigrationHandle := MigrationHandle is Win32Handle ? NumGet(MigrationHandle, "ptr") : MigrationHandle

        result := DllCall("WinHvPlatform.dll\WHvAcceptPartitionMigration", "ptr", MigrationHandle, "ptr", Partition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WHV_EMULATOR_CALLBACKS>} Callbacks 
     * @param {Pointer<Void>} Emulator 
     * @returns {HRESULT} 
     */
    static WHvEmulatorCreateEmulator(Callbacks, Emulator) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorCreateEmulator", "ptr", Callbacks, "ptr", Emulator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @returns {HRESULT} 
     */
    static WHvEmulatorDestroyEmulator(Emulator) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorDestroyEmulator", "ptr", Emulator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
     * @param {Pointer<WHV_X64_IO_PORT_ACCESS_CONTEXT>} IoInstructionContext 
     * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
     * @returns {HRESULT} 
     */
    static WHvEmulatorTryIoEmulation(Emulator, Context, VpContext, IoInstructionContext, EmulatorReturnStatus) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorTryIoEmulation", "ptr", Emulator, "ptr", Context, "ptr", VpContext, "ptr", IoInstructionContext, "ptr", EmulatorReturnStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Emulator 
     * @param {Pointer<Void>} Context 
     * @param {Pointer<WHV_VP_EXIT_CONTEXT>} VpContext 
     * @param {Pointer<WHV_MEMORY_ACCESS_CONTEXT>} MmioInstructionContext 
     * @param {Pointer<WHV_EMULATOR_STATUS>} EmulatorReturnStatus 
     * @returns {HRESULT} 
     */
    static WHvEmulatorTryMmioEmulation(Emulator, Context, VpContext, MmioInstructionContext, EmulatorReturnStatus) {
        result := DllCall("WinHvEmulation.dll\WHvEmulatorTryMmioEmulation", "ptr", Emulator, "ptr", Context, "ptr", VpContext, "ptr", MmioInstructionContext, "ptr", EmulatorReturnStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {HRESULT} 
     */
    static HdvInitializeDeviceHost(computeSystem, deviceHostHandle) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHost", "ptr", computeSystem, "ptr", deviceHostHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HCS_SYSTEM} computeSystem 
     * @param {Integer} flags 
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {HRESULT} 
     */
    static HdvInitializeDeviceHostEx(computeSystem, flags, deviceHostHandle) {
        computeSystem := computeSystem is Win32Handle ? NumGet(computeSystem, "ptr") : computeSystem

        result := DllCall("vmdevicehost.dll\HdvInitializeDeviceHostEx", "ptr", computeSystem, "int", flags, "ptr", deviceHostHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} deviceHostHandle 
     * @returns {HRESULT} 
     */
    static HdvTeardownDeviceHost(deviceHostHandle) {
        result := DllCall("vmdevicehost.dll\HdvTeardownDeviceHost", "ptr", deviceHostHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} deviceHostHandle 
     * @param {Integer} deviceType 
     * @param {Pointer<Guid>} deviceClassId 
     * @param {Pointer<Guid>} deviceInstanceId 
     * @param {Pointer<Void>} deviceInterface 
     * @param {Pointer<Void>} deviceContext 
     * @param {Pointer<Void>} deviceHandle 
     * @returns {HRESULT} 
     */
    static HdvCreateDeviceInstance(deviceHostHandle, deviceType, deviceClassId, deviceInstanceId, deviceInterface, deviceContext, deviceHandle) {
        result := DllCall("vmdevicehost.dll\HdvCreateDeviceInstance", "ptr", deviceHostHandle, "int", deviceType, "ptr", deviceClassId, "ptr", deviceInstanceId, "ptr", deviceInterface, "ptr", deviceContext, "ptr", deviceHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {Pointer<Byte>} buffer 
     * @returns {HRESULT} 
     */
    static HdvReadGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer) {
        result := DllCall("vmdevicehost.dll\HdvReadGuestMemory", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "char*", buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {Pointer<Byte>} buffer 
     * @returns {HRESULT} 
     */
    static HdvWriteGuestMemory(requestor, guestPhysicalAddress, byteCount, buffer) {
        result := DllCall("vmdevicehost.dll\HdvWriteGuestMemory", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "char*", buffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} guestPhysicalAddress 
     * @param {Integer} byteCount 
     * @param {BOOL} writeProtected 
     * @param {Pointer<Void>} mappedAddress 
     * @returns {HRESULT} 
     */
    static HdvCreateGuestMemoryAperture(requestor, guestPhysicalAddress, byteCount, writeProtected, mappedAddress) {
        result := DllCall("vmdevicehost.dll\HdvCreateGuestMemoryAperture", "ptr", requestor, "uint", guestPhysicalAddress, "uint", byteCount, "int", writeProtected, "ptr", mappedAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Pointer<Void>} mappedAddress 
     * @returns {HRESULT} 
     */
    static HdvDestroyGuestMemoryAperture(requestor, mappedAddress) {
        result := DllCall("vmdevicehost.dll\HdvDestroyGuestMemoryAperture", "ptr", requestor, "ptr", mappedAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} msiAddress 
     * @param {Integer} msiData 
     * @returns {HRESULT} 
     */
    static HdvDeliverGuestInterrupt(requestor, msiAddress, msiData) {
        result := DllCall("vmdevicehost.dll\HdvDeliverGuestInterrupt", "ptr", requestor, "uint", msiAddress, "uint", msiData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} BarIndex 
     * @param {Integer} BarOffset 
     * @param {Integer} TriggerValue 
     * @param {Integer} Flags 
     * @param {HANDLE} DoorbellEvent 
     * @returns {HRESULT} 
     */
    static HdvRegisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags, DoorbellEvent) {
        DoorbellEvent := DoorbellEvent is Win32Handle ? NumGet(DoorbellEvent, "ptr") : DoorbellEvent

        result := DllCall("vmdevicehost.dll\HdvRegisterDoorbell", "ptr", requestor, "int", BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, "ptr", DoorbellEvent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} BarIndex 
     * @param {Integer} BarOffset 
     * @param {Integer} TriggerValue 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    static HdvUnregisterDoorbell(requestor, BarIndex, BarOffset, TriggerValue, Flags) {
        result := DllCall("vmdevicehost.dll\HdvUnregisterDoorbell", "ptr", requestor, "int", BarIndex, "uint", BarOffset, "uint", TriggerValue, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} barIndex 
     * @param {Integer} offsetInPages 
     * @param {Integer} lengthInPages 
     * @param {Integer} MappingFlags 
     * @param {HANDLE} sectionHandle 
     * @param {Integer} sectionOffsetInPages 
     * @returns {HRESULT} 
     */
    static HdvCreateSectionBackedMmioRange(requestor, barIndex, offsetInPages, lengthInPages, MappingFlags, sectionHandle, sectionOffsetInPages) {
        sectionHandle := sectionHandle is Win32Handle ? NumGet(sectionHandle, "ptr") : sectionHandle

        result := DllCall("vmdevicehost.dll\HdvCreateSectionBackedMmioRange", "ptr", requestor, "int", barIndex, "uint", offsetInPages, "uint", lengthInPages, "int", MappingFlags, "ptr", sectionHandle, "uint", sectionOffsetInPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} requestor 
     * @param {Integer} barIndex 
     * @param {Integer} offsetInPages 
     * @returns {HRESULT} 
     */
    static HdvDestroySectionBackedMmioRange(requestor, barIndex, offsetInPages) {
        result := DllCall("vmdevicehost.dll\HdvDestroySectionBackedMmioRange", "ptr", requestor, "int", barIndex, "uint", offsetInPages, "int")
        if(result != 0)
            throw OSError(result)

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
    static LocateSavedStateFiles(vmName, snapshotName, binPath, vsvPath, vmrsPath) {
        vmName := vmName is String ? StrPtr(vmName) : vmName
        snapshotName := snapshotName is String ? StrPtr(snapshotName) : snapshotName

        result := DllCall("VmSavedStateDumpProvider.dll\LocateSavedStateFiles", "ptr", vmName, "ptr", snapshotName, "ptr", binPath, "ptr", vsvPath, "ptr", vmrsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} vmrsFile 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {HRESULT} 
     */
    static LoadSavedStateFile(vmrsFile, vmSavedStateDumpHandle) {
        vmrsFile := vmrsFile is String ? StrPtr(vmrsFile) : vmrsFile

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFile", "ptr", vmrsFile, "ptr", vmSavedStateDumpHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} vmrsFile 
     * @returns {HRESULT} 
     */
    static ApplyPendingSavedStateFileReplayLog(vmrsFile) {
        vmrsFile := vmrsFile is String ? StrPtr(vmrsFile) : vmrsFile

        result := DllCall("VmSavedStateDumpProvider.dll\ApplyPendingSavedStateFileReplayLog", "ptr", vmrsFile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} binFile 
     * @param {PWSTR} vsvFile 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {HRESULT} 
     */
    static LoadSavedStateFiles(binFile, vsvFile, vmSavedStateDumpHandle) {
        binFile := binFile is String ? StrPtr(binFile) : binFile
        vsvFile := vsvFile is String ? StrPtr(vsvFile) : vsvFile

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateFiles", "ptr", binFile, "ptr", vsvFile, "ptr", vmSavedStateDumpHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {HRESULT} 
     */
    static ReleaseSavedStateFiles(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateFiles", "ptr", vmSavedStateDumpHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt32>} virtualTrustLevels 
     * @returns {HRESULT} 
     */
    static GetGuestEnabledVirtualTrustLevels(vmSavedStateDumpHandle, virtualTrustLevels) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestEnabledVirtualTrustLevels", "ptr", vmSavedStateDumpHandle, "uint*", virtualTrustLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} virtualTrustLevel 
     * @param {Pointer<GUEST_OS_INFO>} guestOsInfo 
     * @returns {HRESULT} 
     */
    static GetGuestOsInfo(vmSavedStateDumpHandle, virtualTrustLevel, guestOsInfo) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestOsInfo", "ptr", vmSavedStateDumpHandle, "char", virtualTrustLevel, "ptr", guestOsInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt32>} vpCount 
     * @returns {HRESULT} 
     */
    static GetVpCount(vmSavedStateDumpHandle, vpCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetVpCount", "ptr", vmSavedStateDumpHandle, "uint*", vpCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} architecture 
     * @returns {HRESULT} 
     */
    static GetArchitecture(vmSavedStateDumpHandle, vpId, architecture) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetArchitecture", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", architecture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} architecture 
     * @returns {HRESULT} 
     */
    static ForceArchitecture(vmSavedStateDumpHandle, vpId, architecture) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceArchitecture", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", architecture, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Byte>} virtualTrustLevel 
     * @returns {HRESULT} 
     */
    static GetActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetActiveVirtualTrustLevel", "ptr", vmSavedStateDumpHandle, "uint", vpId, "char*", virtualTrustLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<UInt32>} virtualTrustLevels 
     * @returns {HRESULT} 
     */
    static GetEnabledVirtualTrustLevels(vmSavedStateDumpHandle, vpId, virtualTrustLevels) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetEnabledVirtualTrustLevels", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint*", virtualTrustLevels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} virtualTrustLevel 
     * @returns {HRESULT} 
     */
    static ForceActiveVirtualTrustLevel(vmSavedStateDumpHandle, vpId, virtualTrustLevel) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceActiveVirtualTrustLevel", "ptr", vmSavedStateDumpHandle, "uint", vpId, "char", virtualTrustLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<BOOL>} activeVirtualTrustLevelEnabled 
     * @returns {HRESULT} 
     */
    static IsActiveVirtualTrustLevelEnabled(vmSavedStateDumpHandle, vpId, activeVirtualTrustLevelEnabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\IsActiveVirtualTrustLevelEnabled", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", activeVirtualTrustLevelEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<BOOL>} enabled 
     * @returns {HRESULT} 
     */
    static IsNestedVirtualizationEnabled(vmSavedStateDumpHandle, enabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\IsNestedVirtualizationEnabled", "ptr", vmSavedStateDumpHandle, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<BOOL>} enabled 
     * @returns {HRESULT} 
     */
    static GetNestedVirtualizationMode(vmSavedStateDumpHandle, vpId, enabled) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetNestedVirtualizationMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", enabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {BOOL} hostMode 
     * @param {Pointer<BOOL>} oldMode 
     * @returns {HRESULT} 
     */
    static ForceNestedHostMode(vmSavedStateDumpHandle, vpId, hostMode, oldMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForceNestedHostMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", hostMode, "ptr", oldMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<BOOL>} inKernelSpace 
     * @returns {HRESULT} 
     */
    static InKernelSpace(vmSavedStateDumpHandle, vpId, inKernelSpace) {
        result := DllCall("VmSavedStateDumpProvider.dll\InKernelSpace", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", inKernelSpace, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} registerId 
     * @param {Pointer<VIRTUAL_PROCESSOR_REGISTER>} registerValue 
     * @returns {HRESULT} 
     */
    static GetRegisterValue(vmSavedStateDumpHandle, vpId, registerId, registerValue) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetRegisterValue", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", registerId, "ptr", registerValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<Int32>} pagingMode 
     * @returns {HRESULT} 
     */
    static GetPagingMode(vmSavedStateDumpHandle, vpId, pagingMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetPagingMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int*", pagingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} pagingMode 
     * @returns {HRESULT} 
     */
    static ForcePagingMode(vmSavedStateDumpHandle, vpId, pagingMode) {
        result := DllCall("VmSavedStateDumpProvider.dll\ForcePagingMode", "ptr", vmSavedStateDumpHandle, "uint", vpId, "int", pagingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} physicalAddress 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt32>} bytesRead 
     * @returns {HRESULT} 
     */
    static ReadGuestPhysicalAddress(vmSavedStateDumpHandle, physicalAddress, buffer, bufferSize, bytesRead) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestPhysicalAddress", "ptr", vmSavedStateDumpHandle, "uint", physicalAddress, "ptr", buffer, "uint", bufferSize, "uint*", bytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Integer} virtualAddress 
     * @param {Pointer<UInt64>} physicalAddress 
     * @param {Pointer<UInt64>} unmappedRegionSize 
     * @returns {HRESULT} 
     */
    static GuestVirtualAddressToPhysicalAddress(vmSavedStateDumpHandle, vpId, virtualAddress, physicalAddress, unmappedRegionSize) {
        result := DllCall("VmSavedStateDumpProvider.dll\GuestVirtualAddressToPhysicalAddress", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, "uint*", physicalAddress, "uint*", unmappedRegionSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} memoryChunkPageSize 
     * @param {Pointer<GPA_MEMORY_CHUNK>} memoryChunks 
     * @param {Pointer<UInt64>} memoryChunkCount 
     * @returns {HRESULT} 
     */
    static GetGuestPhysicalMemoryChunks(vmSavedStateDumpHandle, memoryChunkPageSize, memoryChunks, memoryChunkCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestPhysicalMemoryChunks", "ptr", vmSavedStateDumpHandle, "uint*", memoryChunkPageSize, "ptr", memoryChunks, "uint*", memoryChunkCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} physicalAddress 
     * @param {Pointer<UInt64>} rawSavedMemoryOffset 
     * @returns {HRESULT} 
     */
    static GuestPhysicalAddressToRawSavedMemoryOffset(vmSavedStateDumpHandle, physicalAddress, rawSavedMemoryOffset) {
        result := DllCall("VmSavedStateDumpProvider.dll\GuestPhysicalAddressToRawSavedMemoryOffset", "ptr", vmSavedStateDumpHandle, "uint", physicalAddress, "uint*", rawSavedMemoryOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} rawSavedMemoryOffset 
     * @param {Pointer} buffer 
     * @param {Integer} bufferSize 
     * @param {Pointer<UInt32>} bytesRead 
     * @returns {HRESULT} 
     */
    static ReadGuestRawSavedMemory(vmSavedStateDumpHandle, rawSavedMemoryOffset, buffer, bufferSize, bytesRead) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReadGuestRawSavedMemory", "ptr", vmSavedStateDumpHandle, "uint", rawSavedMemoryOffset, "ptr", buffer, "uint", bufferSize, "uint*", bytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} guestRawSavedMemorySize 
     * @returns {HRESULT} 
     */
    static GetGuestRawSavedMemorySize(vmSavedStateDumpHandle, guestRawSavedMemorySize) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetGuestRawSavedMemorySize", "ptr", vmSavedStateDumpHandle, "uint*", guestRawSavedMemorySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} memoryBlockCacheLimit 
     * @returns {HRESULT} 
     */
    static SetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit) {
        result := DllCall("VmSavedStateDumpProvider.dll\SetMemoryBlockCacheLimit", "ptr", vmSavedStateDumpHandle, "uint", memoryBlockCacheLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<UInt64>} memoryBlockCacheLimit 
     * @returns {HRESULT} 
     */
    static GetMemoryBlockCacheLimit(vmSavedStateDumpHandle, memoryBlockCacheLimit) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetMemoryBlockCacheLimit", "ptr", vmSavedStateDumpHandle, "uint*", memoryBlockCacheLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
    static ApplyGuestMemoryFix(vmSavedStateDumpHandle, vpId, virtualAddress, fixBuffer, fixBufferSize) {
        result := DllCall("VmSavedStateDumpProvider.dll\ApplyGuestMemoryFix", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", virtualAddress, "ptr", fixBuffer, "uint", fixBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {PWSTR} userSymbols 
     * @param {BOOL} force 
     * @returns {HRESULT} 
     */
    static LoadSavedStateSymbolProvider(vmSavedStateDumpHandle, userSymbols, force) {
        userSymbols := userSymbols is String ? StrPtr(userSymbols) : userSymbols

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateSymbolProvider", "ptr", vmSavedStateDumpHandle, "ptr", userSymbols, "int", force, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {HRESULT} 
     */
    static ReleaseSavedStateSymbolProvider(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\ReleaseSavedStateSymbolProvider", "ptr", vmSavedStateDumpHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @returns {HANDLE} 
     */
    static GetSavedStateSymbolProviderHandle(vmSavedStateDumpHandle) {
        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolProviderHandle", "ptr", vmSavedStateDumpHandle, "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Pointer<GUEST_SYMBOLS_PROVIDER_DEBUG_INFO_CALLBACK>} Callback 
     * @returns {HRESULT} 
     */
    static SetSavedStateSymbolProviderDebugInfoCallback(vmSavedStateDumpHandle, Callback) {
        result := DllCall("VmSavedStateDumpProvider.dll\SetSavedStateSymbolProviderDebugInfoCallback", "ptr", vmSavedStateDumpHandle, "ptr", Callback, "int")
        if(result != 0)
            throw OSError(result)

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
    static LoadSavedStateModuleSymbols(vmSavedStateDumpHandle, imageName, moduleName, baseAddress, sizeOfBase) {
        imageName := imageName is String ? StrPtr(imageName) : imageName
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbols", "ptr", vmSavedStateDumpHandle, "ptr", imageName, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "int")
        if(result != 0)
            throw OSError(result)

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
    static LoadSavedStateModuleSymbolsEx(vmSavedStateDumpHandle, imageName, imageTimestamp, moduleName, baseAddress, sizeOfBase) {
        imageName := imageName is String ? StrPtr(imageName) : imageName
        moduleName := moduleName is String ? StrPtr(moduleName) : moduleName

        result := DllCall("VmSavedStateDumpProvider.dll\LoadSavedStateModuleSymbolsEx", "ptr", vmSavedStateDumpHandle, "ptr", imageName, "uint", imageTimestamp, "ptr", moduleName, "uint", baseAddress, "uint", sizeOfBase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {PSTR} globalName 
     * @param {Pointer<UInt64>} virtualAddress 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    static ResolveSavedStateGlobalVariableAddress(vmSavedStateDumpHandle, vpId, globalName, virtualAddress, size) {
        globalName := globalName is String ? StrPtr(globalName) : globalName

        result := DllCall("VmSavedStateDumpProvider.dll\ResolveSavedStateGlobalVariableAddress", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, "uint*", virtualAddress, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {PSTR} globalName 
     * @param {Pointer<Void>} buffer 
     * @param {Integer} bufferSize 
     * @returns {HRESULT} 
     */
    static ReadSavedStateGlobalVariable(vmSavedStateDumpHandle, vpId, globalName, buffer, bufferSize) {
        globalName := globalName is String ? StrPtr(globalName) : globalName

        result := DllCall("VmSavedStateDumpProvider.dll\ReadSavedStateGlobalVariable", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", globalName, "ptr", buffer, "uint", bufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {PSTR} typeName 
     * @param {Pointer<UInt32>} size 
     * @returns {HRESULT} 
     */
    static GetSavedStateSymbolTypeSize(vmSavedStateDumpHandle, vpId, typeName, size) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolTypeSize", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "uint*", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {PSTR} typeName 
     * @param {PWSTR} fieldName 
     * @param {Pointer<UInt32>} offset 
     * @param {Pointer<BOOL>} found 
     * @returns {HRESULT} 
     */
    static FindSavedStateSymbolFieldInType(vmSavedStateDumpHandle, vpId, typeName, fieldName, offset, found) {
        typeName := typeName is String ? StrPtr(typeName) : typeName
        fieldName := fieldName is String ? StrPtr(fieldName) : fieldName

        result := DllCall("VmSavedStateDumpProvider.dll\FindSavedStateSymbolFieldInType", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "ptr", fieldName, "uint*", offset, "ptr", found, "int")
        if(result != 0)
            throw OSError(result)

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
    static GetSavedStateSymbolFieldInfo(vmSavedStateDumpHandle, vpId, typeName, typeFieldInfoMap) {
        typeName := typeName is String ? StrPtr(typeName) : typeName

        result := DllCall("VmSavedStateDumpProvider.dll\GetSavedStateSymbolFieldInfo", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", typeName, "ptr", typeFieldInfoMap, "int")
        if(result != 0)
            throw OSError(result)

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
     * @returns {HRESULT} 
     */
    static ScanMemoryForDosImages(vmSavedStateDumpHandle, vpId, startAddress, endAddress, callbackContext, foundImageCallback, standaloneAddress, standaloneAddressCount) {
        result := DllCall("VmSavedStateDumpProvider.dll\ScanMemoryForDosImages", "ptr", vmSavedStateDumpHandle, "uint", vpId, "uint", startAddress, "uint", endAddress, "ptr", callbackContext, "ptr", foundImageCallback, "uint*", standaloneAddress, "uint", standaloneAddressCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} vmSavedStateDumpHandle 
     * @param {Integer} vpId 
     * @param {Pointer<MODULE_INFO>} imageInfo 
     * @param {Integer} imageInfoCount 
     * @param {Integer} frameCount 
     * @param {Pointer<PWSTR>} callStack 
     * @returns {HRESULT} 
     */
    static CallStackUnwind(vmSavedStateDumpHandle, vpId, imageInfo, imageInfoCount, frameCount, callStack) {
        result := DllCall("VmSavedStateDumpProvider.dll\CallStackUnwind", "ptr", vmSavedStateDumpHandle, "uint", vpId, "ptr", imageInfo, "uint", imageInfoCount, "uint", frameCount, "ptr", callStack, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
