#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusicBuffer extends IUnknown {
    /**
     * The interface identifier for IDirectMusicBuffer
     * @type {Guid}
     */
    static IID := Guid("{d2ac2878-b39b-11d1-8704-00600893b1bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusicBuffer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Flush            : IntPtr
        TotalTime        : IntPtr
        PackStructured   : IntPtr
        PackUnstructured : IntPtr
        ResetReadPtr     : IntPtr
        GetNextEvent     : IntPtr
        GetRawBufferPtr  : IntPtr
        GetStartTime     : IntPtr
        GetUsedBytes     : IntPtr
        GetMaxBytes      : IntPtr
        GetBufferFormat  : IntPtr
        SetStartTime     : IntPtr
        SetUsedBytes     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusicBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Clears the forward buffers for the stream and writes any buffered data to the configuration file.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-flush
     */
    Flush() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prtTime 
     * @returns {HRESULT} 
     */
    TotalTime(prtTime) {
        prtTimeMarshal := prtTime is VarRef ? "int64*" : "ptr"

        result := ComCall(4, this, prtTimeMarshal, prtTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannelMessage 
     * @returns {HRESULT} 
     */
    PackStructured(rt, dwChannelGroup, dwChannelMessage) {
        result := ComCall(5, this, "int64", rt, "uint", dwChannelGroup, "uint", dwChannelMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} lpb 
     * @returns {HRESULT} 
     */
    PackUnstructured(rt, dwChannelGroup, cb, lpb) {
        lpbMarshal := lpb is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int64", rt, "uint", dwChannelGroup, "uint", cb, lpbMarshal, lpb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetReadPtr() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prt 
     * @param {Pointer<Integer>} pdwChannelGroup 
     * @param {Pointer<Integer>} pdwLength 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetNextEvent(prt, pdwChannelGroup, pdwLength, ppData) {
        prtMarshal := prt is VarRef ? "int64*" : "ptr"
        pdwChannelGroupMarshal := pdwChannelGroup is VarRef ? "uint*" : "ptr"
        pdwLengthMarshal := pdwLength is VarRef ? "uint*" : "ptr"
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, prtMarshal, prt, pdwChannelGroupMarshal, pdwChannelGroup, pdwLengthMarshal, pdwLength, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetRawBufferPtr(ppData) {
        ppDataMarshal := ppData is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, ppDataMarshal, ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} prt 
     * @returns {HRESULT} 
     */
    GetStartTime(prt) {
        prtMarshal := prt is VarRef ? "int64*" : "ptr"

        result := ComCall(10, this, prtMarshal, prt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    GetUsedBytes(pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pcbMarshal, pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    GetMaxBytes(pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pcbMarshal, pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuidFormat 
     * @returns {HRESULT} 
     */
    GetBufferFormat(pGuidFormat) {
        result := ComCall(13, this, Guid.Ptr, pGuidFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @returns {HRESULT} 
     */
    SetStartTime(rt) {
        result := ComCall(14, this, "int64", rt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    SetUsedBytes(cb) {
        result := ComCall(15, this, "uint", cb, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusicBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 1)
        this.vtbl.TotalTime := CallbackCreate(GetMethod(implObj, "TotalTime"), flags, 2)
        this.vtbl.PackStructured := CallbackCreate(GetMethod(implObj, "PackStructured"), flags, 4)
        this.vtbl.PackUnstructured := CallbackCreate(GetMethod(implObj, "PackUnstructured"), flags, 5)
        this.vtbl.ResetReadPtr := CallbackCreate(GetMethod(implObj, "ResetReadPtr"), flags, 1)
        this.vtbl.GetNextEvent := CallbackCreate(GetMethod(implObj, "GetNextEvent"), flags, 5)
        this.vtbl.GetRawBufferPtr := CallbackCreate(GetMethod(implObj, "GetRawBufferPtr"), flags, 2)
        this.vtbl.GetStartTime := CallbackCreate(GetMethod(implObj, "GetStartTime"), flags, 2)
        this.vtbl.GetUsedBytes := CallbackCreate(GetMethod(implObj, "GetUsedBytes"), flags, 2)
        this.vtbl.GetMaxBytes := CallbackCreate(GetMethod(implObj, "GetMaxBytes"), flags, 2)
        this.vtbl.GetBufferFormat := CallbackCreate(GetMethod(implObj, "GetBufferFormat"), flags, 2)
        this.vtbl.SetStartTime := CallbackCreate(GetMethod(implObj, "SetStartTime"), flags, 2)
        this.vtbl.SetUsedBytes := CallbackCreate(GetMethod(implObj, "SetUsedBytes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Flush)
        CallbackFree(this.vtbl.TotalTime)
        CallbackFree(this.vtbl.PackStructured)
        CallbackFree(this.vtbl.PackUnstructured)
        CallbackFree(this.vtbl.ResetReadPtr)
        CallbackFree(this.vtbl.GetNextEvent)
        CallbackFree(this.vtbl.GetRawBufferPtr)
        CallbackFree(this.vtbl.GetStartTime)
        CallbackFree(this.vtbl.GetUsedBytes)
        CallbackFree(this.vtbl.GetMaxBytes)
        CallbackFree(this.vtbl.GetBufferFormat)
        CallbackFree(this.vtbl.SetStartTime)
        CallbackFree(this.vtbl.SetUsedBytes)
    }
}
