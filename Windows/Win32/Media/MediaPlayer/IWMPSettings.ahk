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
     */
    autoStart {
        get => this.get_autoStart()
        set => this.put_autoStart(value)
    }

    /**
     */
    baseURL {
        get => this.get_baseURL()
        set => this.put_baseURL(value)
    }

    /**
     */
    defaultFrame {
        get => this.get_defaultFrame()
        set => this.put_defaultFrame(value)
    }

    /**
     */
    invokeURLs {
        get => this.get_invokeURLs()
        set => this.put_invokeURLs(value)
    }

    /**
     */
    mute {
        get => this.get_mute()
        set => this.put_mute(value)
    }

    /**
     */
    playCount {
        get => this.get_playCount()
        set => this.put_playCount(value)
    }

    /**
     */
    rate {
        get => this.get_rate()
        set => this.put_rate(value)
    }

    /**
     */
    balance {
        get => this.get_balance()
        set => this.put_balance(value)
    }

    /**
     */
    volume {
        get => this.get_volume()
        set => this.put_volume(value)
    }

    /**
     */
    enableErrorDialogs {
        get => this.get_enableErrorDialogs()
        set => this.put_enableErrorDialogs(value)
    }

    /**
     * The get_isAvailable method indicates whether a specified action can be performed.
     * @param {BSTR} bstrItem 
     * @param {Pointer<VARIANT_BOOL>} pIsAvailable Pointer to a <b>VARIANT_BOOL</b> indicating whether the specified action can be performed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        bstrItem := bstrItem is String ? BSTR.Alloc(bstrItem).Value : bstrItem

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "HRESULT")
        return result
    }

    /**
     * The get_autoStart method retrieves a value indicating whether the current media item begins playing automatically.
     * @param {Pointer<VARIANT_BOOL>} pfAutoStart Pointer to a <b>VARIANT_BOOL</b> that indicates whether the current media item begins playing automatically. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_autostart
     */
    get_autoStart(pfAutoStart) {
        pfAutoStartMarshal := pfAutoStart is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pfAutoStartMarshal, pfAutoStart, "HRESULT")
        return result
    }

    /**
     * The put_autoStart method specifies a value indicating whether the current media item begins playing automatically.
     * @param {VARIANT_BOOL} fAutoStart <b>VARIANT_BOOL</b> indicating whether the current media item begins playing automatically. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_autostart
     */
    put_autoStart(fAutoStart) {
        result := ComCall(9, this, "short", fAutoStart, "HRESULT")
        return result
    }

    /**
     * The get_baseURL method retrieves the base URL used for relative path resolution with URL script commands that are embedded in digital media content.
     * @param {Pointer<BSTR>} pbstrBaseURL Pointer to a <b>BSTR</b> containing the base URL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_baseurl
     */
    get_baseURL(pbstrBaseURL) {
        result := ComCall(10, this, "ptr", pbstrBaseURL, "HRESULT")
        return result
    }

    /**
     * The put_baseURL method specifies the base URL used for relative path resolution with URL script commands that are embedded in digital media files.
     * @param {BSTR} bstrBaseURL <b>BSTR</b> containing the base URL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_baseurl
     */
    put_baseURL(bstrBaseURL) {
        bstrBaseURL := bstrBaseURL is String ? BSTR.Alloc(bstrBaseURL).Value : bstrBaseURL

        result := ComCall(11, this, "ptr", bstrBaseURL, "HRESULT")
        return result
    }

    /**
     * The get_defaultFrame method retrieves the name of the frame used to display a URL that is received in a ScriptCommand event.
     * @param {Pointer<BSTR>} pbstrDefaultFrame Pointer to a <b>BSTR</b> containing the value of the name attribute of the target FRAME element.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_defaultframe
     */
    get_defaultFrame(pbstrDefaultFrame) {
        result := ComCall(12, this, "ptr", pbstrDefaultFrame, "HRESULT")
        return result
    }

    /**
     * The put_defaultFrame method specifies the name of the frame used to display a URL that is received in a ScriptCommand event.
     * @param {BSTR} bstrDefaultFrame <b>BSTR</b> containing the value of the name attribute of the target FRAME element.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_defaultframe
     */
    put_defaultFrame(bstrDefaultFrame) {
        bstrDefaultFrame := bstrDefaultFrame is String ? BSTR.Alloc(bstrDefaultFrame).Value : bstrDefaultFrame

        result := ComCall(13, this, "ptr", bstrDefaultFrame, "HRESULT")
        return result
    }

    /**
     * The get_invokeURLs method retrieves a value indicating whether URL events should launch a Web browser.
     * @param {Pointer<VARIANT_BOOL>} pfInvokeURLs Pointer to a <b>VARIANT_BOOL</b> indicating whether URL events should launch a Web browser. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_invokeurls
     */
    get_invokeURLs(pfInvokeURLs) {
        pfInvokeURLsMarshal := pfInvokeURLs is VarRef ? "short*" : "ptr"

        result := ComCall(14, this, pfInvokeURLsMarshal, pfInvokeURLs, "HRESULT")
        return result
    }

    /**
     * The put_invokeURLs method specifies a value indicating whether URL events should launch a Web browser.
     * @param {VARIANT_BOOL} fInvokeURLs <b>VARIANT_BOOL</b> indicating whether URL events should launch a Web browser. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_invokeurls
     */
    put_invokeURLs(fInvokeURLs) {
        result := ComCall(15, this, "short", fInvokeURLs, "HRESULT")
        return result
    }

    /**
     * The get_mute method retrieves a value indicating whether audio is muted.
     * @param {Pointer<VARIANT_BOOL>} pfMute Pointer to a <b>VARIANT_BOOL</b> indicating whether audio is muted. The default is <b>FALSE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_mute
     */
    get_mute(pfMute) {
        pfMuteMarshal := pfMute is VarRef ? "short*" : "ptr"

        result := ComCall(16, this, pfMuteMarshal, pfMute, "HRESULT")
        return result
    }

    /**
     * The put_mute method specifies a value indicating whether audio is muted.
     * @param {VARIANT_BOOL} fMute <b>VARIANT_BOOL</b> indicating whether audio is muted. The default is <b>FALSE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_mute
     */
    put_mute(fMute) {
        result := ComCall(17, this, "short", fMute, "HRESULT")
        return result
    }

    /**
     * The get_playCount method retrieves the number of times a media item will play.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count with a minimum value of 1 and a default value of 1.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_playcount
     */
    get_playCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The put_playCount method specifies the number of times a media item will play.
     * @param {Integer} lCount <b>long</b> containing the count with a minimum value of 1 and a default value of 1.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_playcount
     */
    put_playCount(lCount) {
        result := ComCall(19, this, "int", lCount, "HRESULT")
        return result
    }

    /**
     * The get_rate method retrieves the current playback rate for video.
     * @param {Pointer<Float>} pdRate Pointer to a <b>double</b> containing the rate with a default value of 1.0.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_rate
     */
    get_rate(pdRate) {
        pdRateMarshal := pdRate is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, pdRateMarshal, pdRate, "HRESULT")
        return result
    }

    /**
     * The put_rate method specifies the current playback rate for video.
     * @param {Float} dRate <b>double</b> containing the rate with a default value of 1.0.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_rate
     */
    put_rate(dRate) {
        result := ComCall(21, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * The get_balance method retrieves the current stereo balance.
     * @param {Pointer<Integer>} plBalance Pointer to a <b>long</b> containing the balance. This value can range from –100 to 100. The default value is zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_balance
     */
    get_balance(plBalance) {
        plBalanceMarshal := plBalance is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plBalanceMarshal, plBalance, "HRESULT")
        return result
    }

    /**
     * The put_balance method specifies the current stereo balance.
     * @param {Integer} lBalance <b>long</b> containing the balance. Values range from –100 to 100. The default value is zero.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_balance
     */
    put_balance(lBalance) {
        result := ComCall(23, this, "int", lBalance, "HRESULT")
        return result
    }

    /**
     * The get_volume method retrieves the current playback volume.
     * @param {Pointer<Integer>} plVolume Pointer to a <b>long</b> containing the volume level ranging from 0 to 100.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_volume
     */
    get_volume(plVolume) {
        plVolumeMarshal := plVolume is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plVolumeMarshal, plVolume, "HRESULT")
        return result
    }

    /**
     * The put_volume method specifies the current playback volume.
     * @param {Integer} lVolume <b>long</b> containing the volume level ranging from 0 to 100.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_volume
     */
    put_volume(lVolume) {
        result := ComCall(25, this, "int", lVolume, "HRESULT")
        return result
    }

    /**
     * The getMode method determines whether the loop mode or shuffle mode is active.
     * @param {BSTR} bstrMode 
     * @param {Pointer<VARIANT_BOOL>} pvarfMode Pointer to a <b>VARIANT_BOOL</b> indicating whether the specified mode is active.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-getmode
     */
    getMode(bstrMode, pvarfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        pvarfModeMarshal := pvarfMode is VarRef ? "short*" : "ptr"

        result := ComCall(26, this, "ptr", bstrMode, pvarfModeMarshal, pvarfMode, "HRESULT")
        return result
    }

    /**
     * The setMode method sets the state of playback options.
     * @param {BSTR} bstrMode 
     * @param {VARIANT_BOOL} varfMode <b>VARIANT_BOOL</b> specifying whether the specified mode is active.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-setmode
     */
    setMode(bstrMode, varfMode) {
        bstrMode := bstrMode is String ? BSTR.Alloc(bstrMode).Value : bstrMode

        result := ComCall(27, this, "ptr", bstrMode, "short", varfMode, "HRESULT")
        return result
    }

    /**
     * The get_enableErrorDialogs method retrieves a value indicating whether error dialog boxes are displayed automatically.
     * @param {Pointer<VARIANT_BOOL>} pfEnableErrorDialogs Pointer to a <b>VARIANT_BOOL</b> indicating whether error dialog boxes are displayed automatically. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-get_enableerrordialogs
     */
    get_enableErrorDialogs(pfEnableErrorDialogs) {
        pfEnableErrorDialogsMarshal := pfEnableErrorDialogs is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, pfEnableErrorDialogsMarshal, pfEnableErrorDialogs, "HRESULT")
        return result
    }

    /**
     * The put_enableErrorDialogs method specifies a value indicating whether error dialog boxes are displayed automatically.
     * @param {VARIANT_BOOL} fEnableErrorDialogs <b>VARIANT_BOOL</b> indicating whether error dialog boxes are displayed automatically. The default is <b>TRUE</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings-put_enableerrordialogs
     */
    put_enableErrorDialogs(fEnableErrorDialogs) {
        result := ComCall(29, this, "short", fEnableErrorDialogs, "HRESULT")
        return result
    }
}
