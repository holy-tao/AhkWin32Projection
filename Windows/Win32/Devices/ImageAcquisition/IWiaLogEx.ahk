#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not supported. (IWiaLogEx)
 * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nn-wia_xp-iwialogex
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaLogEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaLogEx
     * @type {Guid}
     */
    static IID => Guid("{af1f22ac-7a40-4787-b421-aeb47a1fbd0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeLogEx", "hResult", "Log", "hResultEx", "LogEx"]

    /**
     * This method is not supported. (IWiaLogEx.InitializeLogEx)
     * @param {Pointer<Integer>} hInstance_ Type: <b>BYTE*</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwialogex-initializelogex
     */
    InitializeLogEx(hInstance_) {
        hInstance_Marshal := hInstance_ is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, hInstance_Marshal, hInstance_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.hResult)
     * @param {HRESULT} hResult_ Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwialogex-hresult
     */
    hResult(hResult_) {
        result := ComCall(4, this, "int", hResult_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.Log)
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwialogex-log
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        if(bstrText is String) {
            pin := BSTR.Alloc(bstrText)
            bstrText := pin.Value
        }

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.hResultEx)
     * @param {Integer} lMethodId Type: <b>LONG</b>
     * @param {HRESULT} hResult_ Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwialogex-hresultex
     */
    hResultEx(lMethodId, hResult_) {
        result := ComCall(6, this, "int", lMethodId, "int", hResult_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This method is not supported. (IWiaLogEx.LogEx)
     * @param {Integer} lMethodId Type: <b>LONG</b>
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wia_xp/nf-wia_xp-iwialogex-logex
     */
    LogEx(lMethodId, lFlags, lResID, lDetail, bstrText) {
        if(bstrText is String) {
            pin := BSTR.Alloc(bstrText)
            bstrText := pin.Value
        }

        result := ComCall(7, this, "int", lMethodId, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
