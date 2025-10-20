#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugDataSpaces4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugDataSpaces4
     * @type {Guid}
     */
    static IID => Guid("{d98ada1f-29e9-4ef5-a6c0-e53349883212}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadVirtual", "WriteVirtual", "SearchVirtual", "ReadVirtualUncached", "WriteVirtualUncached", "ReadPointersVirtual", "WritePointersVirtual", "ReadPhysical", "WritePhysical", "ReadControl", "WriteControl", "ReadIo", "WriteIo", "ReadMsr", "WriteMsr", "ReadBusData", "WriteBusData", "CheckLowMemory", "ReadDebuggerData", "ReadProcessorSystemData", "VirtualToPhysical", "GetVirtualTranslationPhysicalOffsets", "ReadHandleData", "FillVirtual", "FillPhysical", "QueryVirtual", "ReadImageNtHeaders", "ReadTagged", "StartEnumTagged", "GetNextTagged", "EndEnumTagged", "GetOffsetInformation", "GetNextDifferentlyValidOffsetVirtual", "GetValidRegionVirtual", "SearchVirtual2", "ReadMultiByteStringVirtual", "ReadMultiByteStringVirtualWide", "ReadUnicodeStringVirtual", "ReadUnicodeStringVirtualWide", "ReadPhysical2", "WritePhysical2"]

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

    /**
     * 
     * @param {Integer} ImageBase 
     * @param {Pointer<IMAGE_NT_HEADERS64>} Headers 
     * @returns {HRESULT} 
     */
    ReadImageNtHeaders(ImageBase, Headers) {
        result := ComCall(29, this, "uint", ImageBase, "ptr", Headers, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Tag 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} TotalSize 
     * @returns {HRESULT} 
     */
    ReadTagged(Tag, Offset, Buffer, BufferSize, TotalSize) {
        result := ComCall(30, this, "ptr", Tag, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", TotalSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Handle 
     * @returns {HRESULT} 
     */
    StartEnumTagged(Handle) {
        result := ComCall(31, this, "uint*", Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Handle 
     * @param {Pointer<Guid>} Tag 
     * @param {Pointer<Integer>} Size 
     * @returns {HRESULT} 
     */
    GetNextTagged(Handle, Tag, Size) {
        result := ComCall(32, this, "uint", Handle, "ptr", Tag, "uint*", Size, "HRESULT")
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

    /**
     * 
     * @param {Integer} Space 
     * @param {Integer} Which 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} InfoSize 
     * @returns {HRESULT} 
     */
    GetOffsetInformation(Space, Which, Offset, Buffer, BufferSize, InfoSize) {
        result := ComCall(34, this, "uint", Space, "uint", Which, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", InfoSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer<Integer>} NextOffset 
     * @returns {HRESULT} 
     */
    GetNextDifferentlyValidOffsetVirtual(Offset, NextOffset) {
        result := ComCall(35, this, "uint", Offset, "uint*", NextOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Base 
     * @param {Integer} Size 
     * @param {Pointer<Integer>} ValidBase 
     * @param {Pointer<Integer>} ValidSize 
     * @returns {HRESULT} 
     */
    GetValidRegionVirtual(Base, Size, ValidBase, ValidSize) {
        result := ComCall(36, this, "uint", Base, "uint", Size, "uint*", ValidBase, "uint*", ValidSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Pointer} Pattern 
     * @param {Integer} PatternSize 
     * @param {Integer} PatternGranularity 
     * @param {Pointer<Integer>} MatchOffset 
     * @returns {HRESULT} 
     */
    SearchVirtual2(Offset, Length, Flags, Pattern, PatternSize, PatternGranularity, MatchOffset) {
        result := ComCall(37, this, "uint", Offset, "uint", Length, "uint", Flags, "ptr", Pattern, "uint", PatternSize, "uint", PatternGranularity, "uint*", MatchOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringBytes 
     * @returns {HRESULT} 
     */
    ReadMultiByteStringVirtual(Offset, MaxBytes, Buffer, BufferSize, StringBytes) {
        result := ComCall(38, this, "uint", Offset, "uint", MaxBytes, "ptr", Buffer, "uint", BufferSize, "uint*", StringBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringBytes 
     * @returns {HRESULT} 
     */
    ReadMultiByteStringVirtualWide(Offset, MaxBytes, CodePage, Buffer, BufferSize, StringBytes) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(39, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", Buffer, "uint", BufferSize, "uint*", StringBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringBytes 
     * @returns {HRESULT} 
     */
    ReadUnicodeStringVirtual(Offset, MaxBytes, CodePage, Buffer, BufferSize, StringBytes) {
        result := ComCall(40, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", Buffer, "uint", BufferSize, "uint*", StringBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} StringBytes 
     * @returns {HRESULT} 
     */
    ReadUnicodeStringVirtualWide(Offset, MaxBytes, Buffer, BufferSize, StringBytes) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(41, this, "uint", Offset, "uint", MaxBytes, "ptr", Buffer, "uint", BufferSize, "uint*", StringBytes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesRead 
     * @returns {HRESULT} 
     */
    ReadPhysical2(Offset, Flags, Buffer, BufferSize, BytesRead) {
        result := ComCall(42, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", BytesRead, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BytesWritten 
     * @returns {HRESULT} 
     */
    WritePhysical2(Offset, Flags, Buffer, BufferSize, BytesWritten) {
        result := ComCall(43, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", BytesWritten, "HRESULT")
        return result
    }
}
