#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusic extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumPort", "CreateMusicBuffer", "CreatePort", "EnumMasterClock", "GetMasterClock", "SetMasterClock", "Activate", "GetDefaultPort", "SetDirectSound"]

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_PORTCAPS>} pPortCaps 
     * @returns {HRESULT} 
     */
    EnumPort(dwIndex, pPortCaps) {
        result := ComCall(3, this, "uint", dwIndex, "ptr", pPortCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_BUFFERDESC>} pBufferDesc 
     * @param {Pointer<IDirectMusicBuffer>} ppBuffer 
     * @param {IUnknown} pUnkOuter 
     * @returns {HRESULT} 
     */
    CreateMusicBuffer(pBufferDesc, ppBuffer, pUnkOuter) {
        result := ComCall(4, this, "ptr", pBufferDesc, "ptr*", ppBuffer, "ptr", pUnkOuter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rclsidPort 
     * @param {Pointer<DMUS_PORTPARAMS8>} pPortParams 
     * @param {Pointer<IDirectMusicPort>} ppPort 
     * @param {IUnknown} pUnkOuter 
     * @returns {HRESULT} 
     */
    CreatePort(rclsidPort, pPortParams, ppPort, pUnkOuter) {
        result := ComCall(5, this, "ptr", rclsidPort, "ptr", pPortParams, "ptr*", ppPort, "ptr", pUnkOuter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<DMUS_CLOCKINFO8>} lpClockInfo 
     * @returns {HRESULT} 
     */
    EnumMasterClock(dwIndex, lpClockInfo) {
        result := ComCall(6, this, "uint", dwIndex, "ptr", lpClockInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClock 
     * @param {Pointer<IReferenceClock>} ppReferenceClock 
     * @returns {HRESULT} 
     */
    GetMasterClock(pguidClock, ppReferenceClock) {
        result := ComCall(7, this, "ptr", pguidClock, "ptr*", ppReferenceClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidClock 
     * @returns {HRESULT} 
     */
    SetMasterClock(rguidClock) {
        result := ComCall(8, this, "ptr", rguidClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Activate(fEnable) {
        result := ComCall(9, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidPort 
     * @returns {HRESULT} 
     */
    GetDefaultPort(pguidPort) {
        result := ComCall(10, this, "ptr", pguidPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectSound} pDirectSound 
     * @param {HWND} hWnd 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, hWnd) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(11, this, "ptr", pDirectSound, "ptr", hWnd, "HRESULT")
        return result
    }
}
