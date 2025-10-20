#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaapperrorhandler
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaAppErrorHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaAppErrorHandler
     * @type {Guid}
     */
    static IID => Guid("{6c16186c-d0a6-400c-80f4-d26986a0e734}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWindow", "ReportStatus"]

    /**
     * Retrieves a handle to a window that has the specified relationship (Z-Order or owner) to the specified window.
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the function succeeds, the return value is a window handle. If no window exists with the specified relationship to the specified window, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getwindow
     */
    GetWindow(phwnd) {
        result := ComCall(3, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {IWiaItem2} pWiaItem2 
     * @param {HRESULT} hrStatus 
     * @param {Integer} lPercentComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wia/-wia-iwiaapperrorhandler-reportstatus
     */
    ReportStatus(lFlags, pWiaItem2, hrStatus, lPercentComplete) {
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaItem2, "int", hrStatus, "int", lPercentComplete, "HRESULT")
        return result
    }
}
