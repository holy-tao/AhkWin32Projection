#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Audio\DirectSound\IDirectSound.ahk
#Include ..\Audio\DirectSound\IDirectSoundBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDirectSound interface specifies which window has focus for controlling DirectSound audio playback.
 * @see https://docs.microsoft.com/windows/win32/api//amaudio/nn-amaudio-iamdirectsound
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDirectSound extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDirectSoundInterface", "GetPrimaryBufferInterface", "GetSecondaryBufferInterface", "ReleaseDirectSoundInterface", "ReleasePrimaryBufferInterface", "ReleaseSecondaryBufferInterface", "SetFocusWindow", "GetFocusWindow"]

    /**
     * The GetDirectSoundInterface method is not implemented.
     * @returns {IDirectSound} 
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-getdirectsoundinterface
     */
    GetDirectSoundInterface() {
        result := ComCall(3, this, "ptr*", &lplpds := 0, "HRESULT")
        return IDirectSound(lplpds)
    }

    /**
     * The GetPrimaryBufferInterface method is not implemented.
     * @returns {IDirectSoundBuffer} 
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-getprimarybufferinterface
     */
    GetPrimaryBufferInterface() {
        result := ComCall(4, this, "ptr*", &lplpdsb := 0, "HRESULT")
        return IDirectSoundBuffer(lplpdsb)
    }

    /**
     * The GetSecondaryBufferInterface method is not implemented.
     * @returns {IDirectSoundBuffer} 
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-getsecondarybufferinterface
     */
    GetSecondaryBufferInterface() {
        result := ComCall(5, this, "ptr*", &lplpdsb := 0, "HRESULT")
        return IDirectSoundBuffer(lplpdsb)
    }

    /**
     * The ReleaseDirectSoundInterface method is not implemented.
     * @param {IDirectSound} lpds 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-releasedirectsoundinterface
     */
    ReleaseDirectSoundInterface(lpds) {
        result := ComCall(6, this, "ptr", lpds, "HRESULT")
        return result
    }

    /**
     * The ReleasePrimaryBufferInterface method is not implemented.
     * @param {IDirectSoundBuffer} lpdsb 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-releaseprimarybufferinterface
     */
    ReleasePrimaryBufferInterface(lpdsb) {
        result := ComCall(7, this, "ptr", lpdsb, "HRESULT")
        return result
    }

    /**
     * The ReleaseSecondaryBufferInterface method is not implemented.
     * @param {IDirectSoundBuffer} lpdsb 
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-releasesecondarybufferinterface
     */
    ReleaseSecondaryBufferInterface(lpdsb) {
        result := ComCall(8, this, "ptr", lpdsb, "HRESULT")
        return result
    }

    /**
     * The SetFocusWindow method specifies a window to handle sound playback.
     * @param {HWND} param0 
     * @param {BOOL} param1 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-setfocuswindow
     */
    SetFocusWindow(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(9, this, "ptr", param0, "int", param1, "HRESULT")
        return result
    }

    /**
     * The GetFocusWindow method retrieves the window that is handling sound playback.
     * @param {Pointer<HWND>} param0 
     * @param {Pointer<BOOL>} param1 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//amaudio/nf-amaudio-iamdirectsound-getfocuswindow
     */
    GetFocusWindow(param0, param1) {
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, "ptr", param0, param1Marshal, param1, "HRESULT")
        return result
    }
}
