#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPSettings interface provides methods that get or set the values of Windows Media Player settings.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsettings
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSettings extends IDispatch{
    /**
     * The interface identifier for IWMPSettings
     * @type {Guid}
     */
    static IID => Guid("{9104d1ab-80c9-4fed-abf0-2e6417a6df14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(7, this, "ptr", bstrItem, "ptr", pIsAvailable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfAutoStart 
     * @returns {HRESULT} 
     */
    get_autoStart(pfAutoStart) {
        result := ComCall(8, this, "ptr", pfAutoStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAutoStart 
     * @returns {HRESULT} 
     */
    put_autoStart(fAutoStart) {
        result := ComCall(9, this, "short", fAutoStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseURL 
     * @returns {HRESULT} 
     */
    get_baseURL(pbstrBaseURL) {
        result := ComCall(10, this, "ptr", pbstrBaseURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrBaseURL 
     * @returns {HRESULT} 
     */
    put_baseURL(bstrBaseURL) {
        bstrBaseURL := bstrBaseURL is String ? BSTR.Alloc(bstrBaseURL).Value : bstrBaseURL

        result := ComCall(11, this, "ptr", bstrBaseURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDefaultFrame 
     * @returns {HRESULT} 
     */
    get_defaultFrame(pbstrDefaultFrame) {
        result := ComCall(12, this, "ptr", pbstrDefaultFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDefaultFrame 
     * @returns {HRESULT} 
     */
    put_defaultFrame(bstrDefaultFrame) {
        bstrDefaultFrame := bstrDefaultFrame is String ? BSTR.Alloc(bstrDefaultFrame).Value : bstrDefaultFrame

        result := ComCall(13, this, "ptr", bstrDefaultFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfInvokeURLs 
     * @returns {HRESULT} 
     */
    get_invokeURLs(pfInvokeURLs) {
        result := ComCall(14, this, "ptr", pfInvokeURLs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fInvokeURLs 
     * @returns {HRESULT} 
     */
    put_invokeURLs(fInvokeURLs) {
        result := ComCall(15, this, "short", fInvokeURLs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMute 
     * @returns {HRESULT} 
     */
    get_mute(pfMute) {
        result := ComCall(16, this, "ptr", pfMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMute 
     * @returns {HRESULT} 
     */
    put_mute(fMute) {
        result := ComCall(17, this, "short", fMute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_playCount(plCount) {
        result := ComCall(18, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCount 
     * @returns {HRESULT} 
     */
    put_playCount(lCount) {
        result := ComCall(19, this, "int", lCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdRate 
     * @returns {HRESULT} 
     */
    get_rate(pdRate) {
        result := ComCall(20, this, "double*", pdRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     */
    put_rate(dRate) {
        result := ComCall(21, this, "double", dRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBalance 
     * @returns {HRESULT} 
     */
    get_balance(plBalance) {
        result := ComCall(22, this, "int*", plBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lBalance 
     * @returns {HRESULT} 
     */
    put_balance(lBalance) {
        result := ComCall(23, this, "int", lBalance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plVolume 
     * @returns {HRESULT} 
     */
    get_volume(plVolume) {
        result := ComCall(24, this, "int*", plVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     */
    put_volume(lVolume) {
        result := ComCall(25, this, "int", lVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @param {Pointer<VARIANT_BOOL>} pvarfMode 
     * @returns {HRESULT} 
     */
    getMode(bstrMode, pvarfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(26, this, "ptr", bstrMode, "ptr", pvarfMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @param {VARIANT_BOOL} varfMode 
     * @returns {HRESULT} 
     */
    setMode(bstrMode, varfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(27, this, "ptr", bstrMode, "short", varfMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnableErrorDialogs 
     * @returns {HRESULT} 
     */
    get_enableErrorDialogs(pfEnableErrorDialogs) {
        result := ComCall(28, this, "ptr", pfEnableErrorDialogs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnableErrorDialogs 
     * @returns {HRESULT} 
     */
    put_enableErrorDialogs(fEnableErrorDialogs) {
        result := ComCall(29, this, "short", fEnableErrorDialogs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
