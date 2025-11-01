#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpStreamFormat.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpAudio extends ISpStreamFormat{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpAudio
     * @type {Guid}
     */
    static IID => Guid("{c05c768f-fae8-4ec2-8e07-338321c12452}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetState", "SetFormat", "GetStatus", "SetBufferInfo", "GetBufferInfo", "GetDefaultFormat", "EventHandle", "GetVolumeLevel", "SetVolumeLevel", "GetBufferNotifySize", "SetBufferNotifySize"]

    /**
     * 
     * @param {Integer} NewState 
     * @param {Integer} ullReserved 
     * @returns {HRESULT} 
     */
    SetState(NewState, ullReserved) {
        result := ComCall(15, this, "int", NewState, "uint", ullReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFmtId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetFormat(rguidFmtId, pWaveFormatEx) {
        result := ComCall(16, this, "ptr", rguidFmtId, "ptr", pWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(17, this, "ptr", pStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    SetBufferInfo(pBuffInfo) {
        result := ComCall(18, this, "ptr", pBuffInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    GetBufferInfo(pBuffInfo) {
        result := ComCall(19, this, "ptr", pBuffInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppCoMemWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetDefaultFormat(pFormatId, ppCoMemWaveFormatEx) {
        result := ComCall(20, this, "ptr", pFormatId, "ptr*", ppCoMemWaveFormatEx, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    EventHandle() {
        result := ComCall(21, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLevel 
     * @returns {HRESULT} 
     */
    GetVolumeLevel(pLevel) {
        pLevelMarshal := pLevel is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pLevelMarshal, pLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetVolumeLevel(Level) {
        result := ComCall(23, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbSize 
     * @returns {HRESULT} 
     */
    GetBufferNotifySize(pcbSize) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := ComCall(24, this, pcbSizeMarshal, pcbSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(25, this, "uint", cbSize, "HRESULT")
        return result
    }
}
