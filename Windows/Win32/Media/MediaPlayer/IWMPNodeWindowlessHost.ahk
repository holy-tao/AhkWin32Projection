#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNodeWindowlessHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNodeWindowlessHost
     * @type {Guid}
     */
    static IID => Guid("{be7017c6-ce34-4901-8106-770381aa6e3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvalidateRect"]

    /**
     * The InvalidateRect function adds a rectangle to the specified window's update region. The update region represents the portion of the window's client area that must be redrawn.
     * @remarks
     * The invalidated areas accumulate in the update region until the region is processed when the next <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message occurs or until the region is validated by using the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validaterect">ValidateRect</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-validatergn">ValidateRgn</a> function.
     * 
     * The system sends a <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a> message to a window whenever its update region is not empty and there are no other messages in the application queue for that window.
     * 
     * If the <i>bErase</i> parameter is <b>TRUE</b> for any part of the update region, the background is erased in the entire region, not just in the specified part.
     * @param {Pointer<RECT>} prc 
     * @param {BOOL} fErase 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-invalidaterect
     */
    InvalidateRect(prc, fErase) {
        result := ComCall(3, this, "ptr", prc, "int", fErase, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
