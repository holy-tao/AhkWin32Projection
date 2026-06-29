#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IMAGE_NT_HEADERS64.ahk" { IMAGE_NT_HEADERS64 }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Memory\MEMORY_BASIC_INFORMATION64.ahk" { MEMORY_BASIC_INFORMATION64 }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugDataSpaces4 extends IUnknown {
    /**
     * The interface identifier for IDebugDataSpaces4
     * @type {Guid}
     */
    static IID := Guid("{d98ada1f-29e9-4ef5-a6c0-e53349883212}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDataSpaces4 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadVirtual                          : IntPtr
        WriteVirtual                         : IntPtr
        SearchVirtual                        : IntPtr
        ReadVirtualUncached                  : IntPtr
        WriteVirtualUncached                 : IntPtr
        ReadPointersVirtual                  : IntPtr
        WritePointersVirtual                 : IntPtr
        ReadPhysical                         : IntPtr
        WritePhysical                        : IntPtr
        ReadControl                          : IntPtr
        WriteControl                         : IntPtr
        ReadIo                               : IntPtr
        WriteIo                              : IntPtr
        ReadMsr                              : IntPtr
        WriteMsr                             : IntPtr
        ReadBusData                          : IntPtr
        WriteBusData                         : IntPtr
        CheckLowMemory                       : IntPtr
        ReadDebuggerData                     : IntPtr
        ReadProcessorSystemData              : IntPtr
        VirtualToPhysical                    : IntPtr
        GetVirtualTranslationPhysicalOffsets : IntPtr
        ReadHandleData                       : IntPtr
        FillVirtual                          : IntPtr
        FillPhysical                         : IntPtr
        QueryVirtual                         : IntPtr
        ReadImageNtHeaders                   : IntPtr
        ReadTagged                           : IntPtr
        StartEnumTagged                      : IntPtr
        GetNextTagged                        : IntPtr
        EndEnumTagged                        : IntPtr
        GetOffsetInformation                 : IntPtr
        GetNextDifferentlyValidOffsetVirtual : IntPtr
        GetValidRegionVirtual                : IntPtr
        SearchVirtual2                       : IntPtr
        ReadMultiByteStringVirtual           : IntPtr
        ReadMultiByteStringVirtualWide       : IntPtr
        ReadUnicodeStringVirtual             : IntPtr
        ReadUnicodeStringVirtualWide         : IntPtr
        ReadPhysical2                        : IntPtr
        WritePhysical2                       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDataSpaces4.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadVirtual(Offset, _Buffer, BufferSize) {
        result := ComCall(3, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtual(Offset, _Buffer, BufferSize) {
        result := ComCall(4, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Integer} Pattern 
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
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadVirtualUncached(Offset, _Buffer, BufferSize) {
        result := ComCall(6, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteVirtualUncached(Offset, _Buffer, BufferSize) {
        result := ComCall(7, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadPhysical(Offset, _Buffer, BufferSize) {
        result := ComCall(10, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WritePhysical(Offset, _Buffer, BufferSize) {
        result := ComCall(11, this, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadControl(Processor, Offset, _Buffer, BufferSize) {
        result := ComCall(12, this, "uint", Processor, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteControl(Processor, Offset, _Buffer, BufferSize) {
        result := ComCall(13, this, "uint", Processor, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadIo(InterfaceType, BusNumber, AddressSpace, Offset, _Buffer, BufferSize) {
        result := ComCall(14, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} InterfaceType 
     * @param {Integer} BusNumber 
     * @param {Integer} AddressSpace 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteIo(InterfaceType, BusNumber, AddressSpace, Offset, _Buffer, BufferSize) {
        result := ComCall(15, this, "uint", InterfaceType, "uint", BusNumber, "uint", AddressSpace, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadBusData(BusDataType, BusNumber, SlotNumber, Offset, _Buffer, BufferSize) {
        result := ComCall(18, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} BusDataType 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WriteBusData(BusDataType, BusNumber, SlotNumber, Offset, _Buffer, BufferSize) {
        result := ComCall(19, this, "uint", BusDataType, "uint", BusNumber, "uint", SlotNumber, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadDebuggerData(Index, _Buffer, BufferSize) {
        result := ComCall(21, this, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Processor 
     * @param {Integer} Index 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadProcessorSystemData(Processor, Index, _Buffer, BufferSize) {
        result := ComCall(22, this, "uint", Processor, "uint", Index, "ptr", _Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @returns {Integer} 
     */
    VirtualToPhysical(Virtual) {
        result := ComCall(23, this, "uint", Virtual, "uint*", &_Physical := 0, "HRESULT")
        return _Physical
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @param {Pointer<Integer>} Offsets 
     * @param {Integer} OffsetsSize 
     * @param {Pointer<Integer>} _Levels 
     * @returns {HRESULT} 
     */
    GetVirtualTranslationPhysicalOffsets(Virtual, Offsets, OffsetsSize, _Levels) {
        OffsetsMarshal := Offsets is VarRef ? "uint*" : "ptr"
        _LevelsMarshal := _Levels is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, "uint", Virtual, OffsetsMarshal, Offsets, "uint", OffsetsSize, _LevelsMarshal, _Levels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {Integer} DataType 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadHandleData(_Handle, DataType, _Buffer, BufferSize) {
        result := ComCall(25, this, "uint", _Handle, "uint", DataType, "ptr", _Buffer, "uint", BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} _Size 
     * @param {Integer} Pattern 
     * @param {Integer} PatternSize 
     * @returns {Integer} 
     */
    FillVirtual(Start, _Size, Pattern, PatternSize) {
        result := ComCall(26, this, "uint", Start, "uint", _Size, "ptr", Pattern, "uint", PatternSize, "uint*", &Filled := 0, "HRESULT")
        return Filled
    }

    /**
     * 
     * @param {Integer} Start 
     * @param {Integer} _Size 
     * @param {Integer} Pattern 
     * @param {Integer} PatternSize 
     * @returns {Integer} 
     */
    FillPhysical(Start, _Size, Pattern, PatternSize) {
        result := ComCall(27, this, "uint", Start, "uint", _Size, "ptr", Pattern, "uint", PatternSize, "uint*", &Filled := 0, "HRESULT")
        return Filled
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {MEMORY_BASIC_INFORMATION64} 
     */
    QueryVirtual(Offset) {
        Info := MEMORY_BASIC_INFORMATION64()
        result := ComCall(28, this, "uint", Offset, MEMORY_BASIC_INFORMATION64.Ptr, Info, "HRESULT")
        return Info
    }

    /**
     * 
     * @param {Integer} ImageBase 
     * @returns {IMAGE_NT_HEADERS64} 
     */
    ReadImageNtHeaders(ImageBase) {
        Headers := IMAGE_NT_HEADERS64()
        result := ComCall(29, this, "uint", ImageBase, IMAGE_NT_HEADERS64.Ptr, Headers, "HRESULT")
        return Headers
    }

    /**
     * 
     * @param {Pointer<Guid>} Tag 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadTagged(Tag, Offset, _Buffer, BufferSize) {
        result := ComCall(30, this, Guid.Ptr, Tag, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &TotalSize := 0, "HRESULT")
        return TotalSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    StartEnumTagged() {
        result := ComCall(31, this, "uint*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @param {Pointer<Guid>} Tag 
     * @param {Pointer<Integer>} _Size 
     * @returns {HRESULT} 
     */
    GetNextTagged(_Handle, Tag, _Size) {
        _SizeMarshal := _Size is VarRef ? "uint*" : "ptr"

        result := ComCall(32, this, "uint", _Handle, Guid.Ptr, Tag, _SizeMarshal, _Size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Handle 
     * @returns {HRESULT} 
     */
    EndEnumTagged(_Handle) {
        result := ComCall(33, this, "uint", _Handle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Space 
     * @param {Integer} Which 
     * @param {Integer} Offset 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    GetOffsetInformation(Space, Which, Offset, _Buffer, BufferSize) {
        result := ComCall(34, this, "uint", Space, "uint", Which, "uint", Offset, "ptr", _Buffer, "uint", BufferSize, "uint*", &InfoSize := 0, "HRESULT")
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
     * @param {Integer} _Size 
     * @param {Pointer<Integer>} ValidBase 
     * @param {Pointer<Integer>} ValidSize 
     * @returns {HRESULT} 
     */
    GetValidRegionVirtual(Base, _Size, ValidBase, ValidSize) {
        ValidBaseMarshal := ValidBase is VarRef ? "uint*" : "ptr"
        ValidSizeMarshal := ValidSize is VarRef ? "uint*" : "ptr"

        result := ComCall(36, this, "uint", Base, "uint", _Size, ValidBaseMarshal, ValidBase, ValidSizeMarshal, ValidSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {Integer} Flags 
     * @param {Integer} Pattern 
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
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadMultiByteStringVirtual(Offset, MaxBytes, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(38, this, "uint", Offset, "uint", MaxBytes, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadMultiByteStringVirtualWide(Offset, MaxBytes, CodePage, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(39, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {Integer} CodePage 
     * @param {PSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadUnicodeStringVirtual(Offset, MaxBytes, CodePage, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(40, this, "uint", Offset, "uint", MaxBytes, "uint", CodePage, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} MaxBytes 
     * @param {PWSTR} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadUnicodeStringVirtualWide(Offset, MaxBytes, _Buffer, BufferSize) {
        _Buffer := _Buffer is String ? StrPtr(_Buffer) : _Buffer

        result := ComCall(41, this, "uint", Offset, "uint", MaxBytes, "ptr", _Buffer, "uint", BufferSize, "uint*", &StringBytes := 0, "HRESULT")
        return StringBytes
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    ReadPhysical2(Offset, Flags, _Buffer, BufferSize) {
        result := ComCall(42, this, "uint", Offset, "uint", Flags, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesRead := 0, "HRESULT")
        return BytesRead
    }

    /**
     * 
     * @param {Integer} Offset 
     * @param {Integer} Flags 
     * @param {Integer} _Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     */
    WritePhysical2(Offset, Flags, _Buffer, BufferSize) {
        result := ComCall(43, this, "uint", Offset, "uint", Flags, "ptr", _Buffer, "uint", BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    Query(iid) {
        if (IDebugDataSpaces4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReadVirtual := CallbackCreate(GetMethod(implObj, "ReadVirtual"), flags, 5)
        this.vtbl.WriteVirtual := CallbackCreate(GetMethod(implObj, "WriteVirtual"), flags, 5)
        this.vtbl.SearchVirtual := CallbackCreate(GetMethod(implObj, "SearchVirtual"), flags, 7)
        this.vtbl.ReadVirtualUncached := CallbackCreate(GetMethod(implObj, "ReadVirtualUncached"), flags, 5)
        this.vtbl.WriteVirtualUncached := CallbackCreate(GetMethod(implObj, "WriteVirtualUncached"), flags, 5)
        this.vtbl.ReadPointersVirtual := CallbackCreate(GetMethod(implObj, "ReadPointersVirtual"), flags, 4)
        this.vtbl.WritePointersVirtual := CallbackCreate(GetMethod(implObj, "WritePointersVirtual"), flags, 4)
        this.vtbl.ReadPhysical := CallbackCreate(GetMethod(implObj, "ReadPhysical"), flags, 5)
        this.vtbl.WritePhysical := CallbackCreate(GetMethod(implObj, "WritePhysical"), flags, 5)
        this.vtbl.ReadControl := CallbackCreate(GetMethod(implObj, "ReadControl"), flags, 6)
        this.vtbl.WriteControl := CallbackCreate(GetMethod(implObj, "WriteControl"), flags, 6)
        this.vtbl.ReadIo := CallbackCreate(GetMethod(implObj, "ReadIo"), flags, 8)
        this.vtbl.WriteIo := CallbackCreate(GetMethod(implObj, "WriteIo"), flags, 8)
        this.vtbl.ReadMsr := CallbackCreate(GetMethod(implObj, "ReadMsr"), flags, 3)
        this.vtbl.WriteMsr := CallbackCreate(GetMethod(implObj, "WriteMsr"), flags, 3)
        this.vtbl.ReadBusData := CallbackCreate(GetMethod(implObj, "ReadBusData"), flags, 8)
        this.vtbl.WriteBusData := CallbackCreate(GetMethod(implObj, "WriteBusData"), flags, 8)
        this.vtbl.CheckLowMemory := CallbackCreate(GetMethod(implObj, "CheckLowMemory"), flags, 1)
        this.vtbl.ReadDebuggerData := CallbackCreate(GetMethod(implObj, "ReadDebuggerData"), flags, 5)
        this.vtbl.ReadProcessorSystemData := CallbackCreate(GetMethod(implObj, "ReadProcessorSystemData"), flags, 6)
        this.vtbl.VirtualToPhysical := CallbackCreate(GetMethod(implObj, "VirtualToPhysical"), flags, 3)
        this.vtbl.GetVirtualTranslationPhysicalOffsets := CallbackCreate(GetMethod(implObj, "GetVirtualTranslationPhysicalOffsets"), flags, 5)
        this.vtbl.ReadHandleData := CallbackCreate(GetMethod(implObj, "ReadHandleData"), flags, 6)
        this.vtbl.FillVirtual := CallbackCreate(GetMethod(implObj, "FillVirtual"), flags, 6)
        this.vtbl.FillPhysical := CallbackCreate(GetMethod(implObj, "FillPhysical"), flags, 6)
        this.vtbl.QueryVirtual := CallbackCreate(GetMethod(implObj, "QueryVirtual"), flags, 3)
        this.vtbl.ReadImageNtHeaders := CallbackCreate(GetMethod(implObj, "ReadImageNtHeaders"), flags, 3)
        this.vtbl.ReadTagged := CallbackCreate(GetMethod(implObj, "ReadTagged"), flags, 6)
        this.vtbl.StartEnumTagged := CallbackCreate(GetMethod(implObj, "StartEnumTagged"), flags, 2)
        this.vtbl.GetNextTagged := CallbackCreate(GetMethod(implObj, "GetNextTagged"), flags, 4)
        this.vtbl.EndEnumTagged := CallbackCreate(GetMethod(implObj, "EndEnumTagged"), flags, 2)
        this.vtbl.GetOffsetInformation := CallbackCreate(GetMethod(implObj, "GetOffsetInformation"), flags, 7)
        this.vtbl.GetNextDifferentlyValidOffsetVirtual := CallbackCreate(GetMethod(implObj, "GetNextDifferentlyValidOffsetVirtual"), flags, 3)
        this.vtbl.GetValidRegionVirtual := CallbackCreate(GetMethod(implObj, "GetValidRegionVirtual"), flags, 5)
        this.vtbl.SearchVirtual2 := CallbackCreate(GetMethod(implObj, "SearchVirtual2"), flags, 8)
        this.vtbl.ReadMultiByteStringVirtual := CallbackCreate(GetMethod(implObj, "ReadMultiByteStringVirtual"), flags, 6)
        this.vtbl.ReadMultiByteStringVirtualWide := CallbackCreate(GetMethod(implObj, "ReadMultiByteStringVirtualWide"), flags, 7)
        this.vtbl.ReadUnicodeStringVirtual := CallbackCreate(GetMethod(implObj, "ReadUnicodeStringVirtual"), flags, 7)
        this.vtbl.ReadUnicodeStringVirtualWide := CallbackCreate(GetMethod(implObj, "ReadUnicodeStringVirtualWide"), flags, 6)
        this.vtbl.ReadPhysical2 := CallbackCreate(GetMethod(implObj, "ReadPhysical2"), flags, 6)
        this.vtbl.WritePhysical2 := CallbackCreate(GetMethod(implObj, "WritePhysical2"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReadVirtual)
        CallbackFree(this.vtbl.WriteVirtual)
        CallbackFree(this.vtbl.SearchVirtual)
        CallbackFree(this.vtbl.ReadVirtualUncached)
        CallbackFree(this.vtbl.WriteVirtualUncached)
        CallbackFree(this.vtbl.ReadPointersVirtual)
        CallbackFree(this.vtbl.WritePointersVirtual)
        CallbackFree(this.vtbl.ReadPhysical)
        CallbackFree(this.vtbl.WritePhysical)
        CallbackFree(this.vtbl.ReadControl)
        CallbackFree(this.vtbl.WriteControl)
        CallbackFree(this.vtbl.ReadIo)
        CallbackFree(this.vtbl.WriteIo)
        CallbackFree(this.vtbl.ReadMsr)
        CallbackFree(this.vtbl.WriteMsr)
        CallbackFree(this.vtbl.ReadBusData)
        CallbackFree(this.vtbl.WriteBusData)
        CallbackFree(this.vtbl.CheckLowMemory)
        CallbackFree(this.vtbl.ReadDebuggerData)
        CallbackFree(this.vtbl.ReadProcessorSystemData)
        CallbackFree(this.vtbl.VirtualToPhysical)
        CallbackFree(this.vtbl.GetVirtualTranslationPhysicalOffsets)
        CallbackFree(this.vtbl.ReadHandleData)
        CallbackFree(this.vtbl.FillVirtual)
        CallbackFree(this.vtbl.FillPhysical)
        CallbackFree(this.vtbl.QueryVirtual)
        CallbackFree(this.vtbl.ReadImageNtHeaders)
        CallbackFree(this.vtbl.ReadTagged)
        CallbackFree(this.vtbl.StartEnumTagged)
        CallbackFree(this.vtbl.GetNextTagged)
        CallbackFree(this.vtbl.EndEnumTagged)
        CallbackFree(this.vtbl.GetOffsetInformation)
        CallbackFree(this.vtbl.GetNextDifferentlyValidOffsetVirtual)
        CallbackFree(this.vtbl.GetValidRegionVirtual)
        CallbackFree(this.vtbl.SearchVirtual2)
        CallbackFree(this.vtbl.ReadMultiByteStringVirtual)
        CallbackFree(this.vtbl.ReadMultiByteStringVirtualWide)
        CallbackFree(this.vtbl.ReadUnicodeStringVirtual)
        CallbackFree(this.vtbl.ReadUnicodeStringVirtualWide)
        CallbackFree(this.vtbl.ReadPhysical2)
        CallbackFree(this.vtbl.WritePhysical2)
    }
}
