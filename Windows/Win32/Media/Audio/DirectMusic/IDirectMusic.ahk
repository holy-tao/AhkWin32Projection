#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusic extends IUnknown{
    /**
     * The interface identifier for IDirectMusic
     * @type {Guid}
     */
    static IID => Guid("{6536115a-7b2d-11d2-ba18-0000f875ac12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_PORTCAPS>} pPortCaps 
     * @returns {HRESULT} 
     */
    EnumPort(dwIndex, pPortCaps) {
        result := ComCall(3, this, "uint", dwIndex, "ptr", pPortCaps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_BUFFERDESC>} pBufferDesc 
     * @param {Pointer<IDirectMusicBuffer>} ppBuffer 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    CreateMusicBuffer(pBufferDesc, ppBuffer, pUnkOuter) {
        result := ComCall(4, this, "ptr", pBufferDesc, "ptr", ppBuffer, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidPort 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @param {Pointer<IDirectMusicPort>} ppPort 
     * @param {Pointer<IUnknown>} pUnkOuter 
     * @returns {HRESULT} 
     */
    CreatePort(rclsidPort, pPortParams, ppPort, pUnkOuter) {
        result := ComCall(5, this, "ptr", rclsidPort, "ptr", pPortParams, "ptr", ppPort, "ptr", pUnkOuter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_CLOCKINFO8>} lpClockInfo 
     * @returns {HRESULT} 
     */
    EnumMasterClock(dwIndex, lpClockInfo) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", lpClockInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClock 
     * @param {Pointer<IReferenceClock>} ppReferenceClock 
     * @returns {HRESULT} 
     */
    GetMasterClock(pguidClock, ppReferenceClock) {
        result := ComCall(7, this, "ptr", pguidClock, "ptr", ppReferenceClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(rguidClock) {
        result := ComCall(8, this, "ptr", rguidClock, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Activate(fEnable) {
        result := ComCall(9, this, "int", fEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPort 
     * @returns {HRESULT} 
     */
    GetDefaultPort(pguidPort) {
        result := ComCall(10, this, "ptr", pguidPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSound>} pDirectSound 
     * @param {HWND} hWnd 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(11, this, "ptr", pDirectSound, "ptr", hWnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
