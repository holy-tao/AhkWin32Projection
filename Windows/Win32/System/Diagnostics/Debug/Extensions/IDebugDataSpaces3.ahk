#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugDataSpaces3 extends IUnknown{
    /**
     * The interface identifier for IDebugDataSpaces3
     * @type {Guid}
     */
    static IID => Guid("{23f79d6c-8aaf-4f7c-a607-9995f5407e63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadVirtual(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(3, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteVirtual(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(4, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Integer} PatternGranularity 
     * @param {Pointer<UInt64>} MatchOffset 
     * @returns {HRESULT} 
     */
    SearchVirtual(Offset, Length, Pattern, PatternSize, PatternGranularity, MatchOffset) {
        result := ComCall(5, this, "uint", Offset, "uint", Length, "ptr", Pattern, "uint", PatternSize, "uint", PatternGranularity, "uint*", MatchOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadVirtualUncached(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(6, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteVirtualUncached(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(7, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @param {Pointer<UInt64>} Ptrs 
     * @returns {HRESULT} 
     */
    ReadPointersVirtual(Count, Offset, Ptrs) {
        result := ComCall(8, this, "uint", Count, "uint", Offset, "uint*", Ptrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @param {Pointer<UInt64>} Ptrs 
     * @returns {HRESULT} 
     */
    WritePointersVirtual(Count, Offset, Ptrs) {
        result := ComCall(9, this, "uint", Count, "uint", Offset, "uint*", Ptrs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadPhysical(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(10, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WritePhysical(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(11, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadControl(Processor, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(12, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteControl(Processor, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(13, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(14, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(15, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Msr 
     * @param {Pointer<UInt64>} Value 
     * @returns {HRESULT} 
     */
    ReadMsr(Msr, Value) {
        result := ComCall(16, this, "uint", Msr, "uint*", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Msr 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    WriteMsr(Msr, Value) {
        result := ComCall(17, this, "uint", Msr, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(18, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(19, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CheckLowMemory() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DataSize 
     * @returns {HRESULT} 
     */
    ReadDebuggerData(Index, Buffer, BufferSize, DataSize) {
        result := ComCall(21, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Index 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DataSize 
     * @returns {HRESULT} 
     */
    ReadProcessorSystemData(Processor, Index, Buffer, BufferSize, DataSize) {
        result := ComCall(22, this, "uint", Processor, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @param {Pointer<UInt64>} Physical 
     * @returns {HRESULT} 
     */
    VirtualToPhysical(Virtual, Physical) {
        result := ComCall(23, this, "uint", Virtual, "uint*", Physical, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @param {Pointer<UInt64>} Offsets 
     * @param {Integer} OffsetsSize 
     * @param {Pointer<UInt32>} Levels 
     * @returns {HRESULT} 
     */
    GetVirtualTranslationPhysicalOffsets(Virtual, Offsets, OffsetsSize, Levels) {
        result := ComCall(24, this, "uint", Virtual, "uint*", Offsets, "uint", OffsetsSize, "uint*", Levels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Integer} DataType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} DataSize 
     * @returns {HRESULT} 
     */
    ReadHandleData(Handle, DataType, Buffer, BufferSize, DataSize) {
        result := ComCall(25, this, "uint", Handle, "uint", DataType, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Pointer<UInt32>} Filled 
     * @returns {HRESULT} 
     */
    FillVirtual(Start, Size, Pattern, PatternSize, Filled) {
        result := ComCall(26, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", Filled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Pointer<UInt32>} Filled 
     * @returns {HRESULT} 
     */
    FillPhysical(Start, Size, Pattern, PatternSize, Filled) {
        result := ComCall(27, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", Filled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<MEMORY_BASIC_INFORMATION64>} Info 
     * @returns {HRESULT} 
     */
    QueryVirtual(Offset, Info) {
        result := ComCall(28, this, "uint", Offset, "ptr", Info, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ImageBase 
     * @param {Pointer<IMAGE_NT_HEADERS64>} Headers 
     * @returns {HRESULT} 
     */
    ReadImageNtHeaders(ImageBase, Headers) {
        result := ComCall(29, this, "uint", ImageBase, "ptr", Headers, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Tag 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} TotalSize 
     * @returns {HRESULT} 
     */
    ReadTagged(Tag, Offset, Buffer, BufferSize, TotalSize) {
        result := ComCall(30, this, "ptr", Tag, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", TotalSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} Handle 
     * @returns {HRESULT} 
     */
    StartEnumTagged(Handle) {
        result := ComCall(31, this, "uint*", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Guid>} Tag 
     * @param {Pointer<UInt32>} Size 
     * @returns {HRESULT} 
     */
    GetNextTagged(Handle, Tag, Size) {
        result := ComCall(32, this, "uint", Handle, "ptr", Tag, "uint*", Size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    EndEnumTagged(Handle) {
        result := ComCall(33, this, "uint", Handle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
