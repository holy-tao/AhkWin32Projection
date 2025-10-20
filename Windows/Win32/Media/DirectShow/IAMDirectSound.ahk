#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDirectSound interface specifies which window has focus for controlling DirectSound audio playback.
 * @see https://docs.microsoft.com/windows/win32/api//amaudio/nn-amaudio-iamdirectsound
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDirectSound extends IUnknown{
    /**
     * The interface identifier for IAMDirectSound
     * @type {Guid}
     */
    static IID => Guid("{546f4260-d53e-11cf-b3f0-00aa003761c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirectSound>} lplpds 
     * @returns {HRESULT} 
     */
    GetDirectSoundInterface(lplpds) {
        result := ComCall(3, this, "ptr", lplpds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSoundBuffer>} lplpdsb 
     * @returns {HRESULT} 
     */
    GetPrimaryBufferInterface(lplpdsb) {
        result := ComCall(4, this, "ptr", lplpdsb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSoundBuffer>} lplpdsb 
     * @returns {HRESULT} 
     */
    GetSecondaryBufferInterface(lplpdsb) {
        result := ComCall(5, this, "ptr", lplpdsb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSound>} lpds 
     * @returns {HRESULT} 
     */
    ReleaseDirectSoundInterface(lpds) {
        result := ComCall(6, this, "ptr", lpds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSoundBuffer>} lpdsb 
     * @returns {HRESULT} 
     */
    ReleasePrimaryBufferInterface(lpdsb) {
        result := ComCall(7, this, "ptr", lpdsb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectSoundBuffer>} lpdsb 
     * @returns {HRESULT} 
     */
    ReleaseSecondaryBufferInterface(lpdsb) {
        result := ComCall(8, this, "ptr", lpdsb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {BOOL} param1 
     * @returns {HRESULT} 
     */
    SetFocusWindow(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(9, this, "ptr", param0, "int", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<BOOL>} param1 
     * @returns {HRESULT} 
     */
    GetFocusWindow(param0, param1) {
        result := ComCall(10, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
