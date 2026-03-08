#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Memory\MEMORY_BASIC_INFORMATION64.ahk
#Include ..\IMAGE_NT_HEADERS64.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugDataSpaces3 extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadVirtual", "WriteVirtual", "SearchVirtual", "ReadVirtualUncached", "WriteVirtualUncached", "ReadPointersVirtual", "WritePointersVirtual", "ReadPhysical", "WritePhysical", "ReadControl", "WriteControl", "ReadIo", "WriteIo", "ReadMsr", "WriteMsr", "ReadBusData", "WriteBusData", "CheckLowMemory", "ReadDebuggerData", "ReadProcessorSystemData", "VirtualToPhysical", "GetVirtualTranslationPhysicalOffsets", "ReadHandleData", "FillVirtual", "FillPhysical", "QueryVirtual", "ReadImageNtHeaders", "ReadTagged", "StartEnumTagged", "GetNextTagged", "EndEnumTagged"]

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadVirtual(Offset, Buffer_R, BufferSize) {
        result := ComCall(3, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtual(Offset, Buffer_R, BufferSize) {
        result := ComCall(4, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Integer} PatternGranularity 
     * @returns {Integer} 
     */
    SearchVirtual(Offset, Length, Pattern, PatternSize, PatternGranularity) {
        result := ComCall(5, this, "uint", Offset, "uint", Length, "ptr", Pattern, "uint", PatternSize, "uint", PatternGranularity, "uint*", &MatchOffset := 0, "HRESULT")
        return MatchOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadVirtualUncached(Offset, Buffer_R, BufferSize) {
        result := ComCall(6, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtualUncached(Offset, Buffer_R, BufferSize) {
        result := ComCall(7, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    ReadPointersVirtual(Count, Offset) {
        result := ComCall(8, this, "uint", Count, "uint", Offset, "uint*", &Ptrs := 0, "HRESULT")
        return Ptrs
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} Ptrs 
     * @returns {HRESULT} 
     */
    WritePointersVirtual(Count, Offset, Ptrs) {
        PtrsMarshal := Ptrs is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "uint", Count, "uint", Offset, PtrsMarshal, Ptrs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadPhysical(Offset, Buffer_R, BufferSize) {
        result := ComCall(10, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WritePhysical(Offset, Buffer_R, BufferSize) {
        result := ComCall(11, this, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadControl(Processor, Offset, Buffer_R, BufferSize) {
        result := ComCall(12, this, "uint", Processor, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteControl(Processor, Offset, Buffer_R, BufferSize) {
        result := ComCall(13, this, "uint", Processor, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer_R, BufferSize) {
        result := ComCall(14, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer_R, BufferSize) {
        result := ComCall(15, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Msr 
     * @returns {Integer} 
     */
    ReadMsr(Msr) {
        result := ComCall(16, this, "uint", Msr, "uint*", &Value := 0, "HRESULT")
        return Value
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
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer_R, BufferSize) {
        result := ComCall(18, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer_R, BufferSize) {
        result := ComCall(19, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
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
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadDebuggerData(Index, Buffer_R, BufferSize) {
        result := ComCall(21, this, "uint", Index, "ptr", Buffer_R, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Index 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadProcessorSystemData(Processor, Index, Buffer_R, BufferSize) {
        result := ComCall(22, this, "uint", Processor, "uint", Index, "ptr", Buffer_R, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @returns {Integer} 
     */
    VirtualToPhysical(Virtual) {
        result := ComCall(23, this, "uint", Virtual, "uint*", &Physical := 0, "HRESULT")
        return Physical
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
        OffsetsMarshal := Offsets is VarRef ? "uint*" : "ptr"
        LevelsMarshal := Levels is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", Virtual, OffsetsMarshal, Offsets, "uint", OffsetsSize, LevelsMarshal, Levels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Integer} DataType 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadHandleData(Handle, DataType, Buffer_R, BufferSize) {
        result := ComCall(25, this, "uint", Handle, "uint", DataType, "ptr", Buffer_R, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @returns {Integer} 
     */
    FillVirtual(Start, Size, Pattern, PatternSize) {
        result := ComCall(26, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", &Filled := 0, "HRESULT")
        return Filled
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} Size 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @returns {Integer} 
     */
    FillPhysical(Start, Size, Pattern, PatternSize) {
        result := ComCall(27, this, "uint", Start, "uint", Size, "ptr", Pattern, "uint", PatternSize, "uint*", &Filled := 0, "HRESULT")
        return Filled
    }

    /**
     * The QueryVirtualMemoryInformation function returns information about a page or a set of pages within the virtual address space of the specified process.
     * @remarks
     * If the <i>MemoryInformationClass</i> parameter has a value of <b>MemoryRegionInfo</b>, the <i>MemoryInformation</i> parameter must point to a <a href="https://docs.microsoft.com/windows/desktop/api/memoryapi/ns-memoryapi-win32_memory_region_information">WIN32_MEMORY_REGION_INFORMATION</a> structure. The <i>VirtualAddress</i> parameter must point to an address within a valid memory allocation. If the <i>VirtualAddress</i> parameter points to an unallocated memory region, the function fails.
     * @param {Integer} Offset 
     * @returns {MEMORY_BASIC_INFORMATION64} 
     * @see https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-queryvirtualmemoryinformation
     */
    QueryVirtual(Offset) {
        Info := MEMORY_BASIC_INFORMATION64()
        result := ComCall(28, this, "uint", Offset, "ptr", Info, "HRESULT")
        return Info
    }

    /**
     * 
     * @param {Integer} ImageBase 
     * @returns {IMAGE_NT_HEADERS64} 
     */
    ReadImageNtHeaders(ImageBase) {
        Headers := IMAGE_NT_HEADERS64()
        result := ComCall(29, this, "uint", ImageBase, "ptr", Headers, "HRESULT")
        return Headers
    }

    /**
     * 
     * @param {Pointer<Guid>} Tag 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer_R 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTagged(Tag, Offset, Buffer_R, BufferSize) {
        result := ComCall(30, this, "ptr", Tag, "uint", Offset, "ptr", Buffer_R, "uint", BufferSize, "uint*", &TotalSize := 0, "HRESULT")
        return TotalSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    StartEnumTagged() {
        result := ComCall(31, this, "uint*", &Handle := 0, "HRESULT")
        return Handle
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Guid>} Tag 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetNextTagged(Handle, Tag, Size) {
        SizeMarshal := Size is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, "uint", Handle, "ptr", Tag, SizeMarshal, Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @returns {HRESULT} 
     */
    EndEnumTagged(Handle) {
        result := ComCall(33, this, "uint", Handle, "HRESULT")
        return result
    }
}
