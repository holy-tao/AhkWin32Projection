#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not supported.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwialog
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaLog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaLog
     * @type {Guid}
     */
    static IID => Guid("{a00c10b6-82a1-452f-8b6c-86062aad6890}")

    /**
     * The class identifier for WiaLog
     * @type {Guid}
     */
    static CLSID => Guid("{a1e75357-881a-419e-83e2-bb16db197c68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeLog", "hResult", "Log"]

    /**
     * This method is not supported.
     * @param {Integer} hInstance Type: <b>LONG</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwialog-initializelog
     */
    InitializeLog(hInstance) {
        result := ComCall(3, this, "int", hInstance, "HRESULT")
        return result
    }

    /**
     * This method is not supported.
     * @param {HRESULT} hResult Type: <b>HRESULT</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwialog-hresult
     */
    hResult(hResult) {
        result := ComCall(4, this, "int", hResult, "HRESULT")
        return result
    }

    /**
     * This method is not supported.
     * @param {Integer} lFlags Type: <b>LONG</b>
     * @param {Integer} lResID Type: <b>LONG</b>
     * @param {Integer} lDetail Type: <b>LONG</b>
     * @param {BSTR} bstrText Type: <b>BSTR</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-iwialog-log
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "HRESULT")
        return result
    }
}
