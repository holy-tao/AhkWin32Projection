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
     * 
     * @param {Integer} hInstance 
     * @returns {HRESULT} 
     */
    InitializeLog(hInstance) {
        result := ComCall(3, this, "int", hInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hResult 
     * @returns {HRESULT} 
     */
    hResult(hResult) {
        result := ComCall(4, this, "int", hResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lFlags 
     * @param {Integer} lResID 
     * @param {Integer} lDetail 
     * @param {BSTR} bstrText 
     * @returns {HRESULT} 
     */
    Log(lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(5, this, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
