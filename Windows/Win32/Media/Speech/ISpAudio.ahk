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
     * 
     * @param {Integer} NewState 
     * @param {Integer} ullReserved 
     * @returns {HRESULT} 
     */
    SetState(NewState, ullReserved) {
        result := ComCall(15, this, "int", NewState, "uint", ullReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidFmtId 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetFormat(rguidFmtId, pWaveFormatEx) {
        result := ComCall(16, this, "ptr", rguidFmtId, "ptr", pWaveFormatEx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOSTATUS>} pStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pStatus) {
        result := ComCall(17, this, "ptr", pStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    SetBufferInfo(pBuffInfo) {
        result := ComCall(18, this, "ptr", pBuffInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SPAUDIOBUFFERINFO>} pBuffInfo 
     * @returns {HRESULT} 
     */
    GetBufferInfo(pBuffInfo) {
        result := ComCall(19, this, "ptr", pBuffInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormatId 
     * @param {Pointer<WAVEFORMATEX>} ppCoMemWaveFormatEx 
     * @returns {HRESULT} 
     */
    GetDefaultFormat(pFormatId, ppCoMemWaveFormatEx) {
        result := ComCall(20, this, "ptr", pFormatId, "ptr", ppCoMemWaveFormatEx, "int")
        if(result != 0)
            throw OSError(result)

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
     * @param {Pointer<UInt32>} pLevel 
     * @returns {HRESULT} 
     */
    GetVolumeLevel(pLevel) {
        result := ComCall(22, this, "uint*", pLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    SetVolumeLevel(Level) {
        result := ComCall(23, this, "uint", Level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetBufferNotifySize(pcbSize) {
        result := ComCall(24, this, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {HRESULT} 
     */
    SetBufferNotifySize(cbSize) {
        result := ComCall(25, this, "uint", cbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
