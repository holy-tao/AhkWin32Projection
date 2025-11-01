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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_isAvailable", "get_autoStart", "put_autoStart", "get_baseURL", "put_baseURL", "get_defaultFrame", "put_defaultFrame", "get_invokeURLs", "put_invokeURLs", "get_mute", "put_mute", "get_playCount", "put_playCount", "get_rate", "put_rate", "get_balance", "put_balance", "get_volume", "put_volume", "getMode", "setMode", "get_enableErrorDialogs", "put_enableErrorDialogs"]

    /**
     * 
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        result := ComCall(7, this, "ptr", bstrItem, "ptr", pIsAvailable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfAutoStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_autostart
     */
    get_autoStart(pfAutoStart) {
        result := ComCall(8, this, "ptr", pfAutoStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fAutoStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_autostart
     */
    put_autoStart(fAutoStart) {
        result := ComCall(9, this, "short", fAutoStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_baseurl
     */
    get_baseURL(pbstrBaseURL) {
        result := ComCall(10, this, "ptr", pbstrBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrBaseURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_baseurl
     */
    put_baseURL(bstrBaseURL) {
        bstrBaseURL := bstrBaseURL is String ? BSTR.Alloc(bstrBaseURL).Value : bstrBaseURL

        result := ComCall(11, this, "ptr", bstrBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDefaultFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_defaultframe
     */
    get_defaultFrame(pbstrDefaultFrame) {
        result := ComCall(12, this, "ptr", pbstrDefaultFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDefaultFrame 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_defaultframe
     */
    put_defaultFrame(bstrDefaultFrame) {
        bstrDefaultFrame := bstrDefaultFrame is String ? BSTR.Alloc(bstrDefaultFrame).Value : bstrDefaultFrame

        result := ComCall(13, this, "ptr", bstrDefaultFrame, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfInvokeURLs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_invokeurls
     */
    get_invokeURLs(pfInvokeURLs) {
        result := ComCall(14, this, "ptr", pfInvokeURLs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fInvokeURLs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_invokeurls
     */
    put_invokeURLs(fInvokeURLs) {
        result := ComCall(15, this, "short", fInvokeURLs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_mute
     */
    get_mute(pfMute) {
        result := ComCall(16, this, "ptr", pfMute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fMute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_mute
     */
    put_mute(fMute) {
        result := ComCall(17, this, "short", fMute, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_playcount
     */
    get_playCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_playcount
     */
    put_playCount(lCount) {
        result := ComCall(19, this, "int", lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_rate
     */
    get_rate(pdRate) {
        pdRateMarshal := pdRate is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, pdRateMarshal, pdRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_rate
     */
    put_rate(dRate) {
        result := ComCall(21, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_balance
     */
    get_balance(plBalance) {
        plBalanceMarshal := plBalance is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plBalanceMarshal, plBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lBalance 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_balance
     */
    put_balance(lBalance) {
        result := ComCall(23, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_volume
     */
    get_volume(plVolume) {
        plVolumeMarshal := plVolume is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plVolumeMarshal, plVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_volume
     */
    put_volume(lVolume) {
        result := ComCall(25, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @param {Pointer<VARIANT_BOOL>} pvarfMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-getmode
     */
    getMode(bstrMode, pvarfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(26, this, "ptr", bstrMode, "ptr", pvarfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMode 
     * @param {VARIANT_BOOL} varfMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-setmode
     */
    setMode(bstrMode, varfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(27, this, "ptr", bstrMode, "short", varfMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnableErrorDialogs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-get_enableerrordialogs
     */
    get_enableErrorDialogs(pfEnableErrorDialogs) {
        result := ComCall(28, this, "ptr", pfEnableErrorDialogs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnableErrorDialogs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings-put_enableerrordialogs
     */
    put_enableErrorDialogs(fEnableErrorDialogs) {
        result := ComCall(29, this, "short", fEnableErrorDialogs, "HRESULT")
        return result
    }
}
