#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is not supported.
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-iwialogex
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
     * 
     * @param {Pointer<Integer>} hInstance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-initializelogex
     */
    InitializeLogEx(hInstance) {
        result := ComCall(3, this, "char*", hInstance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-hresult
     */
    hResult(hResult) {
        result := ComCall(4, this, "int", hResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} lResID 
     * @param {Integer} lDetail 
     * @param {BSTR} bstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-log
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMethodId 
     * @param {HRESULT} hResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-hresultex
     */
    hResultEx(lMethodId, hResult) {
        result := ComCall(6, this, "int", lMethodId, "int", hResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMethodId 
     * @param {Integer} lFlags 
     * @param {Integer} lResID 
     * @param {Integer} lDetail 
     * @param {BSTR} bstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wia_xp/nf-wia_xp-iwialogex-logex
     */
    LogEx(lMethodId, lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(7, this, "int", lMethodId, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "HRESULT")
        return result
    }
}
