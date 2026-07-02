#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Memory\MEMORY_BASIC_INFORMATION64.ahk" { MEMORY_BASIC_INFORMATION64 }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugDataSpaces2 extends IUnknown {
    /**
     * The interface identifier for IDebugDataSpaces2
     * @type {Guid}
     */
    static IID := Guid("{7a5e852f-96e9-468f-ac1b-0b3addc4a049}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDataSpaces2 interfaces
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
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDataSpaces2.Vtbl()
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
        result := ComCall(3, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(4, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
        result := ComCall(5, this, Int64, Offset, Int64, Length, IntPtr, Pattern, UInt32, PatternSize, UInt32, PatternGranularity, "uint*", &MatchOffset := 0, "HRESULT")
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
        result := ComCall(6, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(7, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Count 
     * @param {Integer} Offset 
     * @returns {Integer} 
     */
    ReadPointersVirtual(Count, Offset) {
        result := ComCall(8, this, UInt32, Count, Int64, Offset, "uint*", &Ptrs := 0, "HRESULT")
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

        result := ComCall(9, this, UInt32, Count, Int64, Offset, PtrsMarshal, Ptrs, "HRESULT")
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
        result := ComCall(10, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(11, this, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
        result := ComCall(12, this, UInt32, Processor, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(13, this, UInt32, Processor, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
        result := ComCall(14, this, UInt32, InterfaceType, UInt32, BusNumber, UInt32, AddressSpace, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(15, this, UInt32, InterfaceType, UInt32, BusNumber, UInt32, AddressSpace, Int64, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
        return BytesWritten
    }

    /**
     * 
     * @param {Integer} Msr 
     * @returns {Integer} 
     */
    ReadMsr(Msr) {
        result := ComCall(16, this, UInt32, Msr, "uint*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {Integer} Msr 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    WriteMsr(Msr, Value) {
        result := ComCall(17, this, UInt32, Msr, Int64, Value, "HRESULT")
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
        result := ComCall(18, this, UInt32, BusDataType, UInt32, BusNumber, UInt32, SlotNumber, UInt32, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesRead := 0, "HRESULT")
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
        result := ComCall(19, this, UInt32, BusDataType, UInt32, BusNumber, UInt32, SlotNumber, UInt32, Offset, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &BytesWritten := 0, "HRESULT")
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
        result := ComCall(21, this, UInt32, Index, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &DataSize := 0, "HRESULT")
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
        result := ComCall(22, this, UInt32, Processor, UInt32, Index, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &DataSize := 0, "HRESULT")
        return DataSize
    }

    /**
     * 
     * @param {Integer} Virtual 
     * @returns {Integer} 
     */
    VirtualToPhysical(Virtual) {
        result := ComCall(23, this, Int64, Virtual, "uint*", &_Physical := 0, "HRESULT")
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

        result := ComCall(24, this, Int64, Virtual, OffsetsMarshal, Offsets, UInt32, OffsetsSize, _LevelsMarshal, _Levels, "HRESULT")
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
        result := ComCall(25, this, Int64, _Handle, UInt32, DataType, IntPtr, _Buffer, UInt32, BufferSize, "uint*", &DataSize := 0, "HRESULT")
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
        result := ComCall(26, this, Int64, Start, UInt32, _Size, IntPtr, Pattern, UInt32, PatternSize, "uint*", &Filled := 0, "HRESULT")
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
        result := ComCall(27, this, Int64, Start, UInt32, _Size, IntPtr, Pattern, UInt32, PatternSize, "uint*", &Filled := 0, "HRESULT")
        return Filled
    }

    /**
     * 
     * @param {Integer} Offset 
     * @returns {MEMORY_BASIC_INFORMATION64} 
     */
    QueryVirtual(Offset) {
        Info := MEMORY_BASIC_INFORMATION64()
        result := ComCall(28, this, Int64, Offset, MEMORY_BASIC_INFORMATION64.Ptr, Info, "HRESULT")
        return Info
    }

    Query(iid) {
        if (IDebugDataSpaces2.IID.Equals(iid)) {
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
    }
}
