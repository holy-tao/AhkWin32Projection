#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPSettings interface provides methods that get or set the values of Windows Media Player settings.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpsettings
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_isavailable
     */
    get_isAvailable(bstrItem, pIsAvailable) {
        if(bstrItem is String) {
            pin := BSTR.Alloc(bstrItem)
            bstrItem := pin.Value
        }

        pIsAvailableMarshal := pIsAvailable is VarRef ? "short*" : "ptr"

        result := ComCall(7, this, "ptr", bstrItem, pIsAvailableMarshal, pIsAvailable, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_autoStart method retrieves a value indicating whether the current media item begins playing automatically.
     * @remarks
     * If <i>pfAutoStart</i> is <b>TRUE</b>, the media item will begin playing when <b>IWMPCore::put_URL</b>, <b>IWMPCore::put_currentPlaylist</b>, or <b>IWMPCore::put_currentMedia</b> is called. Otherwise, the media item will not start playing until the <b>IWMPControls::play</b> method is called.
     * 
     * <i>pfAutoStart</i> for the full mode of Windows Media Player can be set globally by external events (such as loading a CD). Skins and remoted Player controls cannot expect a default value because they both employ the full mode Windows Media Player playback engine.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_autostart
     */
    get_autoStart(pfAutoStart) {
        pfAutoStartMarshal := pfAutoStart is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pfAutoStartMarshal, pfAutoStart, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_autoStart method specifies a value indicating whether the current media item begins playing automatically.
     * @remarks
     * The <b>put_autoStart</b> method for the full mode of Windows Media Player can be set globally by external events (such as loading a CD). Therefore, there is no reliable default value for skins and remoted Player controls. This is because the playback engine of the full mode Player is used in both cases.
     * 
     * You should set <b>put_autoStart</b> to <b>FALSE</b> immediately before you set <b>IWMPCore::put_URL</b>, <b>IWMPCore::put_currentPlaylist</b>, or <b>IWMPCore::put_currentMedia</b> in skins and remoted Player controls if you wish to ensure that the media item does not start playing immediately. Also, unless you set <b>put_autostart</b> to <b>TRUE</b> immediately before specifying a media item, you should not rely on this setting as a substitute for using the <b>IWMPControls::play</b> method.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_autostart
     */
    put_autoStart(fAutoStart) {
        result := ComCall(9, this, "short", fAutoStart, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_baseURL method retrieves the base URL used for relative path resolution with URL script commands that are embedded in digital media content.
     * @remarks
     * This method retrieves the base HTTP URL that is passed as the command parameter by the <b>ScriptCommand</b> event. The base URL is concatenated with the relative URL as follows:
     * 
     * 1. A trailing forward slash (/) is added to the value retrieved by the <b>get_baseURL</b> method.
     * 1. A leading period, backward slash, or forward slash character (., \\, and /) is deleted from the relative URL.
     * 1. The relative URL is added to the end of the base URL.
     * 1. All slash characters in the resulting fully qualified URL are pointed in the same direction (converted to forward or backward slashes) based on the direction of the first slash character encountered in the new URL.
     * 
     * > [!NOTE]
     * > The Windows Media Player control does not support the use of two periods (..) in the relative URL to indicate the parent of the current location.
     * 
     * **Windows Media Player 10 Mobile:** This method always retrieves a `BSTR` containing an empty string.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_baseurl
     */
    get_baseURL(pbstrBaseURL) {
        result := ComCall(10, this, "ptr", pbstrBaseURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_baseURL method specifies the base URL used for relative path resolution with URL script commands that are embedded in digital media files.
     * @remarks
     * This method specifies the base HTTP URL that is passed as the command parameter by the <b>ScriptCommand</b> event. The base URL is concatenated with the relative URL as follows:
     * 
     * <ol>
     * <li>A trailing forward slash (/) is added to the value specified in the <b>put_baseURL</b> method.</li>
     * <li>A leading period, backward slash, or forward slash character (., \, and /) is deleted from the relative URL.</li>
     * <li>The relative URL is added to the end of the base URL.</li>
     * <li>All slash characters in the resulting fully qualified URL are pointed in the same direction (converted to forward or backward slashes) based on the direction of the first slash character encountered in the new URL.</li>
     * </ol>
     * <b>Note</b>
     * 
     * The Windows Media Player control does not support the use of two periods (..) in the relative URL to indicate the parent of the current location.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_baseurl
     */
    put_baseURL(bstrBaseURL) {
        if(bstrBaseURL is String) {
            pin := BSTR.Alloc(bstrBaseURL)
            bstrBaseURL := pin.Value
        }

        result := ComCall(11, this, "ptr", bstrBaseURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_defaultFrame method retrieves the name of the frame used to display a URL that is received in a ScriptCommand event.
     * @remarks
     * If a target frame is specified in the <b>ScriptCommand</b> event itself, this method is ignored.
     * 
     * This method is ignored when using the Netscape Navigator Java applet. In Navigator, each URL script command received will display the URL in a new browser window, regardless of the value retrieved by <b>get_defaultFrame</b>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_defaultframe
     */
    get_defaultFrame(pbstrDefaultFrame) {
        result := ComCall(12, this, "ptr", pbstrDefaultFrame, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_defaultFrame method specifies the name of the frame used to display a URL that is received in a ScriptCommand event.
     * @remarks
     * If a target frame is specified in the <b>ScriptCommand</b> event itself, this method is ignored.
     * 
     * This method is ignored when using the Netscape Navigator Java applet. In Navigator, each URL script command received displays the URL in a new Web browser window, regardless of the value specified in <b>put_defaultFrame</b>.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_defaultframe
     */
    put_defaultFrame(bstrDefaultFrame) {
        if(bstrDefaultFrame is String) {
            pin := BSTR.Alloc(bstrDefaultFrame)
            bstrDefaultFrame := pin.Value
        }

        result := ComCall(13, this, "ptr", bstrDefaultFrame, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_invokeURLs method retrieves a value indicating whether URL events should launch a Web browser.
     * @remarks
     * Digital media files and streams can contain URL script commands. When a URL script command is sent to the Windows Media Player control, it is passed first to the <b>ScriptCommand</b> event handler regardless of the value retrieved by <b>get_invokeURLs</b>. After <b>ScriptCommand</b> exits, Windows Media Player checks the <b>VARIANT_BOOL</b> retrieved by <b>get_invokeURLs</b> to determine whether to launch the default Web browser with the URL. You can selectively display URLs by checking them in <b>ScriptCommand</b> and setting <b>put_invokeURLs</b> as needed.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>VARIANT_BOOL</b> set to <b>FALSE</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_invokeurls
     */
    get_invokeURLs(pfInvokeURLs) {
        pfInvokeURLsMarshal := pfInvokeURLs is VarRef ? "short*" : "ptr"

        result := ComCall(14, this, pfInvokeURLsMarshal, pfInvokeURLs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_invokeURLs method specifies a value indicating whether URL events should launch a Web browser.
     * @remarks
     * Digital media files and streams can contain URL script commands. When a URL script command is sent to the Windows Media Player control, it is passed first to the <b>ScriptCommand</b> event handler regardless of the value specified in <b>put_invokeURLs</b>. After <b>ScriptCommand</b> exits, Windows Media Player checks the <b>VARIANT_BOOL</b> specified in <b>put_invokeURLs</b> to determine whether to launch the default Web browser with the URL. You can selectively display URLs by checking them in <b>ScriptCommand</b> and setting <b>put_invokeURLs</b> as needed.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method only accepts a <b>VARIANT_BOOL</b> set to <b>FALSE</b>, otherwise an E_INVALIDARG <b>HRESULT</b> is returned.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_invokeurls
     */
    put_invokeURLs(fInvokeURLs) {
        result := ComCall(15, this, "short", fInvokeURLs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_mute
     */
    get_mute(pfMute) {
        pfMuteMarshal := pfMute is VarRef ? "short*" : "ptr"

        result := ComCall(16, this, pfMuteMarshal, pfMute, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_mute
     */
    put_mute(fMute) {
        result := ComCall(17, this, "short", fMute, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_playCount method retrieves the number of times a media item will play.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not implemented and always returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_playcount
     */
    get_playCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_playCount method specifies the number of times a media item will play.
     * @remarks
     * <b>Windows Media Player 10 Mobile: </b>This method is not implemented and always returns E_NOTIMPL.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_playcount
     */
    put_playCount(lCount) {
        result := ComCall(19, this, "int", lCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_rate method retrieves the current playback rate for video.
     * @remarks
     * The value retrieved by this method acts as a multiplier value that enables you to play a media item at a faster or slower rate. The default value of 1.0 indicates the authored speed.
     * 
     * Note that an audio track becomes difficult to understand at rates lower than 0.5 or higher than 1.5. A playback rate of 2 equates to twice the normal playback speed.
     * 
     * Windows Media Player will attempt to use the most effective of the following four different playback modes
     * 
     * <ul>
     * <li>Smooth video playback with audio pitch maintained</li>
     * <li>Smooth video playback with audio pitch not maintained</li>
     * <li>Smooth video playback with no audio</li>
     * <li>Keyframe video playback with no audio</li>
     * </ul>
     * The mode chosen by Windows Media Player depends on numerous factors including file type and location, operating system, network, and server.
     * 
     * Other considerations apply as well, depending on the digital media format used to create the content:
     * 
     * <ul>
     * <li><b>Windows Media Video (WMV) and ASF. </b>Optimal values for this property are from 1 to 10, or from –1 to –10 for reverse play. Values from 0.5 to 1.0 or from -0.5 to -1.0 may also work well in cases where audio pitch can be maintained, such as when playing files located on the local computer. Values with an absolute magnitude greater than 10 are allowed, but are not very meaningful.</li>
     * <li><b>Other video formats. </b>This property can range from 0 to 9. Negative values are not allowed. Values less than 1 represent slow motion. Values above 9 are allowed, but are not very meaningful.</li>
     * </ul>
     * The <b>IWMPControls::fastForward method</b> changes the value retrieved by <b>get_rate</b> to 5.0, while the <b>IWMPControls::fastReverse</b> method changes the value retrieved by <b>get_rate</b> to –5.0.
     * 
     * The playback rate of some digital media formats cannot be altered. Use the <b>IWMPSettings::get_isAvailable</b> method to determine whether this property can be specified for a particular media item.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only retrieves a <b>long</b> set to -2.0, 1.0, or 2.0.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_rate
     */
    get_rate(pdRate) {
        pdRateMarshal := pdRate is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, pdRateMarshal, pdRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_rate method specifies the current playback rate for video.
     * @remarks
     * The value retrieved by this method acts as a multiplier value that enables you to play a media item at a faster or slower rate. The default value of 1.0 indicates the authored speed.
     * 
     * Note that an audio track becomes difficult to understand at rates lower than 0.5 or higher than 1.5. A playback rate of 2 equates to twice the normal playback speed.
     * 
     * Windows Media Player will attempt to use the most effective of the following four different playback modes
     * 
     * <ul>
     * <li>Smooth video playback with audio pitch maintained</li>
     * <li>Smooth video playback with audio pitch not maintained</li>
     * <li>Smooth video playback with no audio</li>
     * <li>Keyframe video playback with no audio</li>
     * </ul>
     * The mode chosen by Windows Media Player depends on numerous factors including file type and location, operating system, network, and server.
     * 
     * Other considerations apply as well, depending on the digital media format used to create the content:
     * 
     * <ul>
     * <li>Windows Media Video (WMV) and ASF. Optimal values for this property are from 1 to 10, or from –1 to –10 for reverse play. Values from 0.5 to 1.0 or from -0.5 to -1.0 may also work well in cases where audio pitch can be maintained, such as when playing files located on the local computer. Values with an absolute magnitude greater than 10 are allowed, but are not very meaningful.</li>
     * <li><b>Other video formats. </b>This property can range from 0 to 9. Negative values are not allowed. Values less than 1 represent slow motion. Values above 9 are allowed, but are not very meaningful.</li>
     * </ul>
     * The <b>IWMPControls::fastForward</b> method changes the value retrieved by <b>get_rate</b> to 5.0, while the <b>IWMPControls::fastReverse</b> method changes the value retrieved by <b>get_rate</b> to –5.0.
     * 
     * The playback rate of some digital media formats cannot be altered. Use the <b>IWMPSettings::get_isAvailable</b> method to determine whether this property can be specified for a particular media item.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only accepts a <b>long</b> set to -5.0, 1.0, or 5.0. Otherwise, E_INVALIDARG is returned.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_rate
     */
    put_rate(dRate) {
        result := ComCall(21, this, "double", dRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_balance method retrieves the current stereo balance.
     * @remarks
     * The value zero indicates that the audio plays at equal volume on both left and right channels. A value of –100 indicates that audio plays only on the left channel. A value of 100 indicates that audio plays only on the right channel.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_balance
     */
    get_balance(plBalance) {
        plBalanceMarshal := plBalance is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, plBalanceMarshal, plBalance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_balance method specifies the current stereo balance.
     * @remarks
     * The value zero indicates that the audio plays at equal volume on both left and right channels. A value of –100 indicates that audio plays only on the left channel. A value of 100 indicates that audio plays only on the right channel.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_balance
     */
    put_balance(lBalance) {
        result := ComCall(23, this, "int", lBalance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_volume method retrieves the current playback volume.
     * @remarks
     * A value of zero specifies no volume (muted). A value of 100 specifies full volume. If no value is specified for this property, it defaults to the last volume setting established for Windows Media Player.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_volume
     */
    get_volume(plVolume) {
        plVolumeMarshal := plVolume is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plVolumeMarshal, plVolume, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_volume method specifies the current playback volume.
     * @remarks
     * A value of zero specifies no volume (muted). A value of 100 specifies full volume. If no value is specified for this property, it defaults to the last volume setting established for Windows Media Player.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_volume
     */
    put_volume(lVolume) {
        result := ComCall(25, this, "int", lVolume, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-getmode
     */
    getMode(bstrMode, pvarfMode) {
        if(bstrMode is String) {
            pin := BSTR.Alloc(bstrMode)
            bstrMode := pin.Value
        }

        pvarfModeMarshal := pvarfMode is VarRef ? "short*" : "ptr"

        result := ComCall(26, this, "ptr", bstrMode, pvarfModeMarshal, pvarfMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The setMode method sets the state of playback options.
     * @remarks
     * When the showFrame mode is active, Windows Media Player must access the track content to retrieve the video frame. Use this mode cautiously when playing non-local content.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-setmode
     */
    setMode(bstrMode, varfMode) {
        if(bstrMode is String) {
            pin := BSTR.Alloc(bstrMode)
            bstrMode := pin.Value
        }

        result := ComCall(27, this, "ptr", bstrMode, "short", varfMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_enableErrorDialogs method retrieves a value indicating whether error dialog boxes are displayed automatically.
     * @remarks
     * This method exhibits specific behavior for remoted instances of the Windows Media Player control. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/remoting-the-windows-media-player-control">Remoting the Windows Media Player Control</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-get_enableerrordialogs
     */
    get_enableErrorDialogs(pfEnableErrorDialogs) {
        pfEnableErrorDialogsMarshal := pfEnableErrorDialogs is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, pfEnableErrorDialogsMarshal, pfEnableErrorDialogs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_enableErrorDialogs method specifies a value indicating whether error dialog boxes are displayed automatically.
     * @remarks
     * This method exhibits specific behavior for remoted instances of the Windows Media Player control. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WMP/remoting-the-windows-media-player-control">Remoting the Windows Media Player Control</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpsettings-put_enableerrordialogs
     */
    put_enableErrorDialogs(fEnableErrorDialogs) {
        result := ComCall(29, this, "short", fEnableErrorDialogs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
