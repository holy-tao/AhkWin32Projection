#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugDataSpaces2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDataSpaces2
     * @type {Guid}
     */
    static IID => Guid("{7a5e852f-96e9-468f-ac1b-0b3addc4a049}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadVirtual", "WriteVirtual", "SearchVirtual", "ReadVirtualUncached", "WriteVirtualUncached", "ReadPointersVirtual", "WritePointersVirtual", "ReadPhysical", "WritePhysical", "ReadControl", "WriteControl", "ReadIo", "WriteIo", "ReadMsr", "WriteMsr", "ReadBusData", "WriteBusData", "CheckLowMemory", "ReadDebuggerData", "ReadProcessorSystemData", "VirtualToPhysical", "GetVirtualTranslationPhysicalOffsets", "ReadHandleData", "FillVirtual", "FillPhysical", "QueryVirtual"]

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadVirtual(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(3, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteVirtual(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(4, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Integer} PatternGranularity 
     * @param {Pointer<Integer>} MatchOffset 
     * @returns {HRESULT} 
     */
    SearchVirtual(Offset, Length, Pattern, PatternSize, PatternGranularity, MatchOffset) {
        result := ComCall(5, this, "uint", Offset, "uint", Length, "ptr", Pattern, "uint", PatternSize, "uint", PatternGranularity, "uint*", MatchOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadVirtualUncached(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(6, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteVirtualUncached(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(7, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Ptrs 
     * @returns {HRESULT} 
     */
    ReadPointersVirtual(Count, Offset, Ptrs) {
        result := ComCall(8, this, "uint", Count, "uint", Offset, "uint*", Ptrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Ptrs 
     * @returns {HRESULT} 
     */
    WritePointersVirtual(Count, Offset, Ptrs) {
        result := ComCall(9, this, "uint", Count, "uint", Offset, "uint*", Ptrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadPhysical(Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(10, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WritePhysical(Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(11, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadControl(Processor, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(12, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteControl(Processor, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(13, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
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
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(14, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
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
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(15, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Msr 
     * @param {Pointer<Integer>} Value 
     * @returns {HRESULT} 
     */
    ReadMsr(Msr, Value) {
        result := ComCall(16, this, "uint", Msr, "uint*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Msr 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    WriteMsr(Msr, Value) {
        result := ComCall(17, this, "uint", Msr, "uint", Value, "HRESULT")
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
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize, BytesRead) {
        result := ComCall(18, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
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
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WriteBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize, BytesWritten) {
        result := ComCall(19, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CheckLowMemory() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DataSize 
     * @returns {HRESULT} 
     */
    ReadDebuggerData(Index, Buffer, BufferSize, DataSize) {
        result := ComCall(21, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Index 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DataSize 
     * @returns {HRESULT} 
     */
    ReadProcessorSystemData(Processor, Index, Buffer, BufferSize, DataSize) {
        result := ComCall(22, this, "uint", Processor, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @param {Pointer<Integer>} Physical 
     * @returns {HRESULT} 
     */
    VirtualToPhysical(Virtual, Physical) {
        result := ComCall(23, this, "uint", Virtual, "uint*", Physical, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @param {Pointer<Integer>} Offsets 
     * @param {Integer} OffsetsSize 
     * @param {Pointer<Integer>} Levels 
     * @returns {HRESULT} 
     */
    GetVirtualTranslationPhysicalOffsets(Virtual, Offsets, OffsetsSize, Levels) {
        result := ComCall(24, this, "uint", Virtual, "uint*", Offsets, "uint", OffsetsSize, "uint*", Levels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Integer} DataType 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} DataSize 
     * @returns {HRESULT} 
     */
    ReadHandleData(Handle, DataType, Buffer, BufferSize, DataSize) {
        result := ComCall(25, this, "uint", Handle, "uint", DataType, "ptr", Buffer, "uint", BufferSize, "uint*", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Pointer<Integer>} Filled 
     * @returns {HRESULT} 
     */
    FillVirtual(Start, Size, Pattern, PatternSize, Filled) {
        result := ComCall(26, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", Filled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Pointer<Integer>} Filled 
     * @returns {HRESULT} 
     */
    FillPhysical(Start, Size, Pattern, PatternSize, Filled) {
        result := ComCall(27, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", Filled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<MEMORY_BASIC_INFORMATION64>} Info 
     * @returns {HRESULT} 
     */
    QueryVirtual(Offset, Info) {
        result := ComCall(28, this, "uint", Offset, "ptr", Info, "HRESULT")
        return result
    }
}
