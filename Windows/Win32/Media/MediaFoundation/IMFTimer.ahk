#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a timer that invokes a callback at a specified time.
 * @remarks
 * 
  * The presentation clock exposes this interface. To get a pointer to the interface, call <b>QueryInterface</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftimer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTimer extends IUnknown{
    /**
     * The interface identifier for IMFTimer
     * @type {Guid}
     */
    static IID => Guid("{e56e4cbd-8f70-49d8-a0f8-edb3d6ab9bf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Creates a timer with the specified time-out value.
     * @param {Integer} dwFlags 
     * @param {Integer} llClockTime 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} punkState 
     * @param {Pointer<IUnknown>} ppunkKey 
     * @returns {HRESULT} Type: <b>UINT_PTR</b>
     * 
     * If the function succeeds and the <i>hWnd</i> parameter is <b>NULL</b>, the return value is an integer identifying the new timer. An application can pass this value to the <a href="/windows/desktop/api/winuser/nf-winuser-killtimer">KillTimer</a> function to destroy the timer.
     * 
     * If the function succeeds and the <i>hWnd</i> parameter is not <b>NULL</b>, then the return value is a nonzero integer. An application can pass the value of the <i>nIDEvent</i> parameter to the <a href="/windows/desktop/api/winuser/nf-winuser-killtimer">KillTimer</a> function to destroy the timer.
     * 
     * If the function fails to create a timer, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-settimer
     */
    SetTimer(dwFlags, llClockTime, pCallback, punkState, ppunkKey) {
        result := ComCall(3, this, "uint", dwFlags, "int64", llClockTime, "ptr", pCallback, "ptr", punkState, "ptr", ppunkKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} punkKey 
     * @returns {HRESULT} 
     */
    CancelTimer(punkKey) {
        result := ComCall(4, this, "ptr", punkKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
