#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwner interface is implemented by an application or a text service to receive text input without having a text store. An instance of this interface is obtained when the application calls the ITfSource::AdviseSink method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextowner
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwner extends IUnknown{
    /**
     * The interface identifier for ITfContextOwner
     * @type {Guid}
     */
    static IID => Guid("{aa80e80c-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<POINT>} ptScreen 
     * @param {Integer} dwFlags 
     * @param {Pointer<Int32>} pacp 
     * @returns {HRESULT} 
     */
    GetACPFromPoint(ptScreen, dwFlags, pacp) {
        result := ComCall(3, this, "ptr", ptScreen, "uint", dwFlags, "int*", pacp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} acpStart 
     * @param {Integer} acpEnd 
     * @param {Pointer<RECT>} prc 
     * @param {Pointer<BOOL>} pfClipped 
     * @returns {HRESULT} 
     */
    GetTextExt(acpStart, acpEnd, prc, pfClipped) {
        result := ComCall(4, this, "int", acpStart, "int", acpEnd, "ptr", prc, "ptr", pfClipped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetScreenExt(prc) {
        result := ComCall(5, this, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TS_STATUS>} pdcs 
     * @returns {HRESULT} 
     */
    GetStatus(pdcs) {
        result := ComCall(6, this, "ptr", pdcs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    GetWnd(phwnd) {
        result := ComCall(7, this, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguidAttribute 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetAttribute(rguidAttribute, pvarValue) {
        result := ComCall(8, this, "ptr", rguidAttribute, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
