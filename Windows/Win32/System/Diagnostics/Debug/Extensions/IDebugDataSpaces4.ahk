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
     * @returns {Integer} 
     */
    ReadVirtual(Offset, Buffer, BufferSize) {
        result := ComCall(3, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtual(Offset, Buffer, BufferSize) {
        result := ComCall(4, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadVirtualUncached(Offset, Buffer, BufferSize) {
        result := ComCall(6, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtualUncached(Offset, Buffer, BufferSize) {
        result := ComCall(7, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadPhysical(Offset, Buffer, BufferSize) {
        result := ComCall(10, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WritePhysical(Offset, Buffer, BufferSize) {
        result := ComCall(11, this, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadControl(Processor, Offset, Buffer, BufferSize) {
        result := ComCall(12, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteControl(Processor, Offset, Buffer, BufferSize) {
        result := ComCall(13, this, "uint", Processor, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize) {
        result := ComCall(14, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteIo(InterfaceType, BusNumber, AddressSpace, Offset, Buffer, BufferSize) {
        result := ComCall(15, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize) {
        result := ComCall(18, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteBusData(BusDataType, BusNumber, SlotNumber, Offset, Buffer, BufferSize) {
        result := ComCall(19, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadDebuggerData(Index, Buffer, BufferSize) {
        result := ComCall(21, this, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Index 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadProcessorSystemData(Processor, Index, Buffer, BufferSize) {
        result := ComCall(22, this, "uint", Processor, "uint", Index, "ptr", Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadHandleData(Handle, DataType, Buffer, BufferSize) {
        result := ComCall(25, this, "uint", Handle, "uint", DataType, "ptr", Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
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
     * 
     * @param {Integer} Offset 
     * @returns {MEMORY_BASIC_INFORMATION64} 
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
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTagged(Tag, Offset, Buffer, BufferSize) {
        result := ComCall(30, this, "ptr", Tag, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &TotalSize := 0, "HRESULT")
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

    /**
     * 
     * @param {Integer} Space 
     * @param {Integer} Which 
     * @param {Integer} Offset 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetInformation(Space, Which, Offset, Buffer, BufferSize) {
        result := ComCall(34, this, "uint", Space, "uint", Which, "uint", Offset, "ptr", Buffer, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
        return InfoSize
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    GetNextDifferentlyValidOffsetVirtual(Offset) {
        result := ComCall(35, this, "uint", Offset, "uint*", &NextOffset := 0, "HRESULT")
        return NextOffset
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
        ValidBaseMarshal := ValidBase is VarRef ? "uint*" : "ptr"
        ValidSizeMarshal := ValidSize is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "uint", Base, "uint", Size, ValidBaseMarshal, ValidBase, ValidSizeMarshal, ValidSize, "HRESULT")
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
     * @returns {Integer} 
     */
    SearchVirtual2(Offset, Length, Flags, Pattern, PatternSize, PatternGranularity) {
        result := ComCall(37, this, "uint", Offset, "uint", Length, "uint", Flags, "ptr", Pattern, "uint", PatternSize, "uint", PatternGranularity, "uint*", &MatchOffset := 0, "HRESULT")
        return MatchOffset
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadMultiByteStringVirtual(Offset, MaxBytes, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(38, this, "uint", Offset, "uint", MaxBytes, "ptr", Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadMultiByteStringVirtualWide(Offset, MaxBytes, CodePage, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(39, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadUnicodeStringVirtual(Offset, MaxBytes, CodePage, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(40, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {PWSTR} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadUnicodeStringVirtualWide(Offset, MaxBytes, Buffer, BufferSize) {
        Buffer := Buffer is String ? StrPtr(Buffer) : Buffer

        result := ComCall(41, this, "uint", Offset, "uint", MaxBytes, "ptr", Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadPhysical2(Offset, Flags, Buffer, BufferSize) {
        result := ComCall(42, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Pointer} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WritePhysical2(Offset, Flags, Buffer, BufferSize) {
        result := ComCall(43, this, "uint", Offset, "uint", Flags, "ptr", Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }
}
