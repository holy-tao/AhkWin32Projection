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
        result := ComCall(4, this, "int64*", prtTime, "HRESULT")
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
        result := ComCall(6, this, "int64", rt, "uint", dwChannelGroup, "uint", cb, "char*", lpb, "HRESULT")
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
        result := ComCall(8, this, "int64*", prt, "uint*", pdwChannelGroup, "uint*", pdwLength, "ptr*", ppData, "HRESULT")
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
        result := ComCall(10, this, "int64*", prt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    GetUsedBytes(pcb) {
        result := ComCall(11, this, "uint*", pcb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     */
    GetMaxBytes(pcb) {
        result := ComCall(12, this, "uint*", pcb, "HRESULT")
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
