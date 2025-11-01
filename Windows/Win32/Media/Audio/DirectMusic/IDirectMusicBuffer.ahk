#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicBuffer
     * @type {Guid}
     */
    static IID => Guid("{d2ac2878-b39b-11d1-8704-00600893b1bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Flush", "TotalTime", "PackStructured", "PackUnstructured", "ResetReadPtr", "GetNextEvent", "GetRawBufferPtr", "GetStartTime", "GetUsedBytes", "GetMaxBytes", "GetBufferFormat", "SetStartTime", "SetUsedBytes"]

    /**
     * 
     * @returns {HRESULT} 
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

        result := ComCall(8, this, prtMarshal, prt, pdwChannelGroupMarshal, pdwChannelGroup, pdwLengthMarshal, pdwLength, "ptr*", ppData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppData 
     * @returns {HRESULT} 
     */
    GetRawBufferPtr(ppData) {
        result := ComCall(9, this, "ptr*", ppData, "HRESULT")
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
        result := ComCall(13, this, "ptr", pGuidFormat, "HRESULT")
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
}
