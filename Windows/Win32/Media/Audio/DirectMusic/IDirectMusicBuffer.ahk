#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicBuffer extends IUnknown{
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
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prtTime 
     * @returns {HRESULT} 
     */
    TotalTime(prtTime) {
        result := ComCall(4, this, "int64*", prtTime, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "int64", rt, "uint", dwChannelGroup, "uint", dwChannelMessage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} cb 
     * @param {Pointer<Byte>} lpb 
     * @returns {HRESULT} 
     */
    PackUnstructured(rt, dwChannelGroup, cb, lpb) {
        result := ComCall(6, this, "int64", rt, "uint", dwChannelGroup, "uint", cb, "char*", lpb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetReadPtr() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prt 
     * @param {Pointer<UInt32>} pdwChannelGroup 
     * @param {Pointer<UInt32>} pdwLength 
     * @param {Pointer<Byte>} ppData 
     * @returns {HRESULT} 
     */
    GetNextEvent(prt, pdwChannelGroup, pdwLength, ppData) {
        result := ComCall(8, this, "int64*", prt, "uint*", pdwChannelGroup, "uint*", pdwLength, "char*", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppData 
     * @returns {HRESULT} 
     */
    GetRawBufferPtr(ppData) {
        result := ComCall(9, this, "char*", ppData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} prt 
     * @returns {HRESULT} 
     */
    GetStartTime(prt) {
        result := ComCall(10, this, "int64*", prt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    GetUsedBytes(pcb) {
        result := ComCall(11, this, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    GetMaxBytes(pcb) {
        result := ComCall(12, this, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuidFormat 
     * @returns {HRESULT} 
     */
    GetBufferFormat(pGuidFormat) {
        result := ComCall(13, this, "ptr", pGuidFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rt 
     * @returns {HRESULT} 
     */
    SetStartTime(rt) {
        result := ComCall(14, this, "int64", rt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    SetUsedBytes(cb) {
        result := ComCall(15, this, "uint", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
