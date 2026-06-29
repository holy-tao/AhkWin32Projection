#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugDataSpaces extends IUnknown {
    /**
     * The interface identifier for IDebugDataSpaces
     * @type {Guid}
     */
    static IID := Guid("{88f7dfab-3ea7-4c3a-aefb-c4e8106173aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugDataSpaces interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReadVirtual             : IntPtr
        WriteVirtual            : IntPtr
        SearchVirtual           : IntPtr
        ReadVirtualUncached     : IntPtr
        WriteVirtualUncached    : IntPtr
        ReadPointersVirtual     : IntPtr
        WritePointersVirtual    : IntPtr
        ReadPhysical            : IntPtr
        WritePhysical           : IntPtr
        ReadControl             : IntPtr
        WriteControl            : IntPtr
        ReadIo                  : IntPtr
        WriteIo                 : IntPtr
        ReadMsr                 : IntPtr
        WriteMsr                : IntPtr
        ReadBusData             : IntPtr
        WriteBusData            : IntPtr
        CheckLowMemory          : IntPtr
        ReadDebuggerData        : IntPtr
        ReadProcessorSystemData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugDataSpaces.Vtbl()
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

    Query(iid) {
        if (IDebugDataSpaces.IID.Equals(iid)) {
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
    }
}
