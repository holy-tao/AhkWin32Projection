#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderStreamClock interface provides access to the clock used by the reader.This interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderstreamclock
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderStreamClock extends IUnknown{
    /**
     * The interface identifier for IWMReaderStreamClock
     * @type {Guid}
     */
    static IID => Guid("{96406bed-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt64>} pcnsNow 
     * @returns {HRESULT} 
     */
    GetTime(pcnsNow) {
        result := ComCall(3, this, "uint*", pcnsNow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Creates a timer with the specified time-out value.
     * @param {Integer} cnsWhen 
     * @param {Pointer<Void>} pvParam 
     * @param {Pointer<UInt32>} pdwTimerId 
     * @returns {HRESULT} Type: <b>UINT_PTR</b>
     * 
     * If the function succeeds and the <i>hWnd</i> parameter is <b>NULL</b>, the return value is an integer identifying the new timer. An application can pass this value to the <a href="/windows/desktop/api/winuser/nf-winuser-killtimer">KillTimer</a> function to destroy the timer.
     * 
     * If the function succeeds and the <i>hWnd</i> parameter is not <b>NULL</b>, then the return value is a nonzero integer. An application can pass the value of the <i>nIDEvent</i> parameter to the <a href="/windows/desktop/api/winuser/nf-winuser-killtimer">KillTimer</a> function to destroy the timer.
     * 
     * If the function fails to create a timer, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-settimer
     */
    SetTimer(cnsWhen, pvParam, pdwTimerId) {
        result := ComCall(4, this, "uint", cnsWhen, "ptr", pvParam, "uint*", pdwTimerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Destroys the specified timer.
     * @param {Integer} dwTimerId 
     * @returns {HRESULT} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-killtimer
     */
    KillTimer(dwTimerId) {
        result := ComCall(5, this, "uint", dwTimerId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
