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
     * 
     * @param {Pointer<Byte>} hInstance 
     * @returns {HRESULT} 
     */
    InitializeLogEx(hInstance) {
        result := ComCall(3, this, "char*", hInstance, "int")
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

    /**
     * 
     * @param {Integer} lMethodId 
     * @param {HRESULT} hResult 
     * @returns {HRESULT} 
     */
    hResultEx(lMethodId, hResult) {
        result := ComCall(6, this, "int", lMethodId, "int", hResult, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    LogEx(lMethodId, lFlags, lResID, lDetail, bstrText) {
        bstrText := bstrText is String ? BSTR.Alloc(bstrText).Value : bstrText

        result := ComCall(7, this, "int", lMethodId, "int", lFlags, "int", lResID, "int", lDetail, "ptr", bstrText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
