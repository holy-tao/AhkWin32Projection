#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IWMPNetwork interface provides methods relating to the network connection used by Windows Media Player.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpnetwork
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPNetwork extends IDispatch {
    /**
     * The interface identifier for IWMPNetwork
     * @type {Guid}
     */
    static IID := Guid("{ec21b779-edef-462d-bba4-ad9dde2b29a7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPNetwork interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_bandWidth          : IntPtr
        get_recoveredPackets   : IntPtr
        get_sourceProtocol     : IntPtr
        get_receivedPackets    : IntPtr
        get_lostPackets        : IntPtr
        get_receptionQuality   : IntPtr
        get_bufferingCount     : IntPtr
        get_bufferingProgress  : IntPtr
        get_bufferingTime      : IntPtr
        put_bufferingTime      : IntPtr
        get_frameRate          : IntPtr
        get_maxBitRate         : IntPtr
        get_bitRate            : IntPtr
        getProxySettings       : IntPtr
        setProxySettings       : IntPtr
        getProxyName           : IntPtr
        setProxyName           : IntPtr
        getProxyPort           : IntPtr
        setProxyPort           : IntPtr
        getProxyExceptionList  : IntPtr
        setProxyExceptionList  : IntPtr
        getProxyBypassForLocal : IntPtr
        setProxyBypassForLocal : IntPtr
        get_maxBandwidth       : IntPtr
        put_maxBandwidth       : IntPtr
        get_downloadProgress   : IntPtr
        get_encodedFrameRate   : IntPtr
        get_framesSkipped      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPNetwork.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    bandWidth {
        get => this.get_bandWidth()
    }

    /**
     */
    recoveredPackets {
        get => this.get_recoveredPackets()
    }

    /**
     */
    sourceProtocol {
        get => this.get_sourceProtocol()
    }

    /**
     */
    receivedPackets {
        get => this.get_receivedPackets()
    }

    /**
     */
    lostPackets {
        get => this.get_lostPackets()
    }

    /**
     */
    receptionQuality {
        get => this.get_receptionQuality()
    }

    /**
     */
    bufferingCount {
        get => this.get_bufferingCount()
    }

    /**
     */
    bufferingProgress {
        get => this.get_bufferingProgress()
    }

    /**
     * @type {Integer} 
     */
    bufferingTime {
        get => this.get_bufferingTime()
        set => this.put_bufferingTime(value)
    }

    /**
     */
    frameRate {
        get => this.get_frameRate()
    }

    /**
     */
    maxBitRate {
        get => this.get_maxBitRate()
    }

    /**
     */
    bitRate {
        get => this.get_bitRate()
    }

    /**
     * @type {Integer} 
     */
    maxBandwidth {
        get => this.get_maxBandwidth()
        set => this.put_maxBandwidth(value)
    }

    /**
     */
    downloadProgress {
        get => this.get_downloadProgress()
    }

    /**
     */
    encodedFrameRate {
        get => this.get_encodedFrameRate()
    }

    /**
     */
    framesSkipped {
        get => this.get_framesSkipped()
    }

    /**
     * The get_bandWidth method retrieves the current bandwidth of the media item.
     * @remarks
     * The value retrieved through <b>IWMPCore::put_URL</b> will be zero if the URL is not set. This method is only valid for streaming media.
     * @param {Pointer<Integer>} plBandwidth Pointer to a <b>long</b> containing the bandwidth.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bandwidth
     */
    get_bandWidth(plBandwidth) {
        plBandwidthMarshal := plBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plBandwidthMarshal, plBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_recoveredPackets method retrieves the number of recovered packets.
     * @remarks
     * Each time playback is stopped and restarted, the value retrieved from this method is reset to zero. The value is not reset if playback is paused.
     * 
     * This method retrieves valid information only during run time when the URL for playback is set by using the <b>IWMPCore::put_URL</b> method. The value will be zero when using the HTTP protocol, which is lossless.
     * @param {Pointer<Integer>} plRecoveredPackets Pointer to a <b>long</b> containing the recovered packets.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_recoveredpackets
     */
    get_recoveredPackets(plRecoveredPackets) {
        plRecoveredPacketsMarshal := plRecoveredPackets is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plRecoveredPacketsMarshal, plRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * The get_sourceProtocol method retrieves the source protocol used to receive data.
     * @remarks
     * This method retrieves an empty string ("") when playing a CD or DVD.
     * @param {Pointer<BSTR>} pbstrSourceProtocol Pointer to a <b>BSTR</b> containing the source protocol.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_sourceprotocol
     */
    get_sourceProtocol(pbstrSourceProtocol) {
        result := ComCall(9, this, BSTR.Ptr, pbstrSourceProtocol, "HRESULT")
        return result
    }

    /**
     * The get_receivedPackets method retrieves the number of packets received.
     * @remarks
     * Each time playback is stopped and restarted, the value retrieved from this method is reset to zero. The value is not reset if playback is paused.
     * @param {Pointer<Integer>} plReceivedPackets Pointer to a <b>long</b> containing the received packets.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_receivedpackets
     */
    get_receivedPackets(plReceivedPackets) {
        plReceivedPacketsMarshal := plReceivedPackets is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plReceivedPacketsMarshal, plReceivedPackets, "HRESULT")
        return result
    }

    /**
     * The get_lostPackets method retrieves the number of packets lost.
     * @remarks
     * This method retrieves streaming media packets only, and will equal zero when using the HTTP protocol, which is lossless.
     * 
     * Packets may be lost for a number of reasons, such as the type and quality of the network connection.
     * 
     * Each time playback is stopped and restarted, the value retrieved from this method is reset to zero. The value is not reset if playback is paused. This method retrieves valid information only during run time when the URL for playback is set by using the <b>IWMPCore::put_URL</b> method.
     * @param {Pointer<Integer>} plLostPackets Pointer to a <b>long</b> containing the lost packets.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_lostpackets
     */
    get_lostPackets(plLostPackets) {
        plLostPacketsMarshal := plLostPackets is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plLostPacketsMarshal, plLostPackets, "HRESULT")
        return result
    }

    /**
     * The get_receptionQuality method retrieves the percentage of packets received in the last 30 seconds.
     * @remarks
     * The number of packets received, lost, and recovered during streaming is monitored once every second. The <b>get_receptionQuality</b> method retrieves the percentage of packets not lost during the last 30 seconds.
     * 
     * Each time playback is stopped and restarted, the value retrieved from this method is reset to zero. The value is not reset if playback is paused.
     * 
     * This method retrieves valid information only during run time when the URL for playback is set by using the <b>IWMPCore::put_URL</b> method.
     * @param {Pointer<Integer>} plReceptionQuality Pointer to a <b>long</b> containing the reception quality.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_receptionquality
     */
    get_receptionQuality(plReceptionQuality) {
        plReceptionQualityMarshal := plReceptionQuality is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plReceptionQualityMarshal, plReceptionQuality, "HRESULT")
        return result
    }

    /**
     * The get_bufferingCount method retrieves the number of times buffering occurred during playback.
     * @remarks
     * Each time playback is stopped and restarted, the value retrieved from this method is zero. It is not reset if playback is paused.
     * 
     * Buffering only applies to streaming content. This method retrieves valid information only during run time when the URL for playback is set by using the <b>IWMPCore::put_URL</b> method.
     * @param {Pointer<Integer>} plBufferingCount Pointer to a <b>long</b> containing the buffering count.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingcount
     */
    get_bufferingCount(plBufferingCount) {
        plBufferingCountMarshal := plBufferingCount is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plBufferingCountMarshal, plBufferingCount, "HRESULT")
        return result
    }

    /**
     * The get_bufferingProgress method retrieves the percentage of buffering completed.
     * @remarks
     * Each time playback is stopped and restarted, the value retrieved from this method is zero. It is not reset if playback is paused.
     * 
     * Buffering only applies to streaming content. This method retrieves valid information only during run time when the URL for playback is set using the <b>IWMPCore::put_URL</b> method.
     * 
     * Use the <b>IWMPEvents::Buffering</b> event to determine when buffering starts or stops.
     * @param {Pointer<Integer>} plBufferingProgress Pointer to a <b>long</b> containing the buffering progress.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingprogress
     */
    get_bufferingProgress(plBufferingProgress) {
        plBufferingProgressMarshal := plBufferingProgress is VarRef ? "int*" : "ptr"

        result := ComCall(14, this, plBufferingProgressMarshal, plBufferingProgress, "HRESULT")
        return result
    }

    /**
     * The get_bufferingTime method retrieves the amount of time in milliseconds allocated for buffering incoming data before playing begins.
     * @param {Pointer<Integer>} plBufferingTime Pointer to a <b>long</b> containing the buffering time, which ranges from zero to 60,000 with a default value of 5,000.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingtime
     */
    get_bufferingTime(plBufferingTime) {
        plBufferingTimeMarshal := plBufferingTime is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, plBufferingTimeMarshal, plBufferingTime, "HRESULT")
        return result
    }

    /**
     * The put_bufferingTime method specifies the amount of time in milliseconds allocated for buffering incoming data before playing begins.
     * @param {Integer} lBufferingTime <b>long</b> containing the buffering time, which ranges from zero to 60,000 with a default value of 5,000.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-put_bufferingtime
     */
    put_bufferingTime(lBufferingTime) {
        result := ComCall(16, this, "int", lBufferingTime, "HRESULT")
        return result
    }

    /**
     * The get_frameRate method retrieves the current video frame rate.
     * @remarks
     * The frame rate value is returned in frames per hundred seconds. For example, a value of 2998 indicates 29.98 frames per second (fps).
     * @param {Pointer<Integer>} plFrameRate Pointer to a <b>long</b> containing the frame rate.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_framerate
     */
    get_frameRate(plFrameRate) {
        plFrameRateMarshal := plFrameRate is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, plFrameRateMarshal, plFrameRate, "HRESULT")
        return result
    }

    /**
     * The get_maxBitRate method retrieves the maximum possible video bit rate.
     * @param {Pointer<Integer>} plBitRate Pointer to a <b>long</b> containing the bit rate.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_maxbitrate
     */
    get_maxBitRate(plBitRate) {
        plBitRateMarshal := plBitRate is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plBitRateMarshal, plBitRate, "HRESULT")
        return result
    }

    /**
     * The get_bitRate method retrieves the current bit rate being received.
     * @remarks
     * The value retrieved by this method is a combination of the bit rates of both video and audio streams.
     * @param {Pointer<Integer>} plBitRate Pointer to a <b>long</b> containing the bit rate.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bitrate
     */
    get_bitRate(plBitRate) {
        plBitRateMarshal := plBitRate is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plBitRateMarshal, plBitRate, "HRESULT")
        return result
    }

    /**
     * The getProxySettings method retrieves the proxy setting for a given protocol.
     * @remarks
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {Pointer<Integer>} plProxySetting 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxysettings
     */
    getProxySettings(bstrProtocol, plProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        plProxySettingMarshal := plProxySetting is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, BSTR, bstrProtocol, plProxySettingMarshal, plProxySetting, "HRESULT")
        return result
    }

    /**
     * The setProxySettings method specifies the proxy setting for a given protocol.
     * @remarks
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {Integer} lProxySetting 
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxysettings
     */
    setProxySettings(bstrProtocol, lProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(21, this, BSTR, bstrProtocol, "int", lProxySetting, "HRESULT")
        return result
    }

    /**
     * The getProxyName method retrieves the name of the proxy server being used.
     * @remarks
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {Pointer<BSTR>} pbstrProxyName Pointer to a <b>BSTR</b> containing the name of the proxy server being used. The value retrieved is meaningful only when <b>IWMPNetwork::getProxySettings</b> retrieves a value of 2 (use manual settings).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyname
     */
    getProxyName(bstrProtocol, pbstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(22, this, BSTR, bstrProtocol, BSTR.Ptr, pbstrProxyName, "HRESULT")
        return result
    }

    /**
     * The setProxyName method specifies the name of the proxy server to use.
     * @remarks
     * This method has no effect unless the value retrieved from <b>IWMPNetwork::getProxySettings</b> is 2 (use manual settings).
     * 
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {BSTR} bstrProxyName <b>BSTR</b> containing the name of the proxy server to use.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyname
     */
    setProxyName(bstrProtocol, bstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrProxyName := bstrProxyName is String ? BSTR.Alloc(bstrProxyName).Value : bstrProxyName

        result := ComCall(23, this, BSTR, bstrProtocol, BSTR, bstrProxyName, "HRESULT")
        return result
    }

    /**
     * The getProxyPort method retrieves the proxy port being used.
     * @remarks
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {Pointer<Integer>} lProxyPort <b>long</b> containing the proxy port being used. The value retrieved is meaningful only when <b>IWMPNetwork::getProxySettings</b> retrieves a value of 2 (use manual settings).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyport
     */
    getProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        lProxyPortMarshal := lProxyPort is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, BSTR, bstrProtocol, lProxyPortMarshal, lProxyPort, "HRESULT")
        return result
    }

    /**
     * The setProxyPort method specifies the proxy port to use.
     * @remarks
     * This method has no effect unless the value retrieved from <b>IWMPNetwork::getProxySettings</b> is 2 (use manual settings).
     * 
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>..
     * @param {Integer} lProxyPort <b>long</b> containing the proxy port to use.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyport
     */
    setProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(25, this, BSTR, bstrProtocol, "int", lProxyPort, "HRESULT")
        return result
    }

    /**
     * The getProxyExceptionList method retrieves the proxy exception list.
     * @remarks
     * This is a list of computers, domains, and/or addresses that will bypass the proxy server when the host portion of the target URL matches an entry in the list.
     * 
     * The * character can be used as a wildcard for listing entries. For example, *.com would match all hosts in the com domain while 67.* would match all hosts in the 67 class A subnet.
     * 
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {Pointer<BSTR>} pbstrExceptionList Pointer to a <b>BSTR</b> containing a semicolon-delimited list of hosts for which the proxy server is bypassed. The value retrieved is meaningful only when <b>IWMPNetwork::getProxySettings</b> retrieves a value of 2 (use manual settings).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyexceptionlist
     */
    getProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(26, this, BSTR, bstrProtocol, BSTR.Ptr, pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * The setProxyExceptionList method specifies the proxy exception list.
     * @remarks
     * This is a list of computers, domains, and/or addresses that will bypass the proxy server when the host portion of the target URL matches an entry in the list.
     * 
     * The * character can be used as a wildcard for listing entries. For example, *.com would match all hosts in the com domain, while 67.* would match all hosts in the 67 class A subnet.
     * 
     * This method has no effect unless the value retrieved from <b>IWMPNetwork::getProxySettings</b> is 2 (use manual settings).
     * 
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {BSTR} pbstrExceptionList <b>BSTR</b> containing a semicolon-delimited list of hosts for which the proxy server is bypassed. Leading and trailing spaces should not be present.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyexceptionlist
     */
    setProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        pbstrExceptionList := pbstrExceptionList is String ? BSTR.Alloc(pbstrExceptionList).Value : pbstrExceptionList

        result := ComCall(27, this, BSTR, bstrProtocol, BSTR, pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * The getProxyBypassForLocal method retrieves a value indicating whether the proxy server is bypassed if the origin server is on a local network.
     * @remarks
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol.
     * @param {Pointer<VARIANT_BOOL>} pfBypassForLocal Pointer to a <b>VARIANT_BOOL</b> that indicates whether the proxy server is bypassed. The value retrieved is meaningful only when <b>IWMPNetwork::getProxySettings</b> retrieves a value of 2 (use manual settings).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxybypassforlocal
     */
    getProxyBypassForLocal(bstrProtocol, pfBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        pfBypassForLocalMarshal := pfBypassForLocal is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, BSTR, bstrProtocol, pfBypassForLocalMarshal, pfBypassForLocal, "HRESULT")
        return result
    }

    /**
     * The setProxyBypassForLocal method specifies a value indicating whether the proxy server is bypassed if the origin server is on a local network.
     * @remarks
     * This method has no effect unless the value retrieved from <b>IWMPNetwork::getProxySettings</b> is 2 (use manual settings).
     * 
     * This method fails unless the calling application is running on the local computer or intranet.
     * 
     * <b>Windows Media Player 10 Mobile:</b> This method always returns E_INVALIDARG.
     * @param {BSTR} bstrProtocol <b>BSTR</b> containing the protocol name. For a list of supported protocols, see <a href="https://docs.microsoft.com/windows/desktop/WMP/supported-protocols-and-file-types">Supported Protocols and File Types</a>.
     * @param {VARIANT_BOOL} fBypassForLocal <b>VARIANT_BOOL</b> indicating whether the proxy server is bypassed.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxybypassforlocal
     */
    setProxyBypassForLocal(bstrProtocol, fBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(29, this, BSTR, bstrProtocol, VARIANT_BOOL, fBypassForLocal, "HRESULT")
        return result
    }

    /**
     * The get_maxBandwidth method retrieves the maximum allowed bandwidth.
     * @param {Pointer<Integer>} lMaxBandwidth Pointer to a <b>long</b> containing the maximum bandwidth.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_maxbandwidth
     */
    get_maxBandwidth(lMaxBandwidth) {
        lMaxBandwidthMarshal := lMaxBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, lMaxBandwidthMarshal, lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * The put_maxBandwidth method specifies the maximum allowed bandwidth.
     * @remarks
     * This method does not have a default value. The value can be specified while Windows Media Player is playing, but the change will not take effect until the current media item is released by opening another one or by calling <b>IWMPCore::close</b>. Windows Media Player attempts to achieve the highest bandwidth possible. Only in the case of this value being set will any intentional reduction of bandwidth occur.
     * 
     * This setting is useful for reducing the amount of bandwidth used, particularly in the case of a multiple bit rate (MBR) stream. An MBR stream contains multiple streams with different bit rates. In some cases, it may be desirable to use a stream with a lower bit rate than the client requires. In this case, specifying a lower bit rate with the <b>IWMPNetwork::put_maxBandwidth</b> method will select a lower bit-rate stream. For example, an MBR stream might include streams encoded at 20 kilobits per second (Kbps), 37 Kbps, and 200 Kbps. Using <b>IWMPNetwork::put_maxBandwidth</b> to specify a bit rate of 50,000 (50 Kbps) will select the 37 Kbps stream instead of the 200 Kbps stream.
     * @param {Integer} lMaxBandwidth <b>long</b> containing the max bandwidth.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-put_maxbandwidth
     */
    put_maxBandwidth(lMaxBandwidth) {
        result := ComCall(31, this, "int", lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_downloadProgress method retrieves the percentage of the download completed.
     * @remarks
     * When the Windows Media Player control is connected to a digital media file that can be played and downloaded at the same time, the <b>get_downloadProgress</b> method retrieves the percentage of the total file that has been downloaded. This feature is currently supported only for digital media files downloaded from web servers. The following file formats can be downloaded and played simultaneously:
     * 
     * <ul>
     * <li>Advanced Systems Format (ASF)</li>
     * <li>Windows Media Audio (WMA)</li>
     * <li>Windows Media Video (WMV)</li>
     * <li>MP3</li>
     * <li>MPEG</li>
     * <li>WAV</li>
     * </ul>
     * In addition, some AVI files can be downloaded and played simultaneously.
     * 
     * Use the <b>IWMPEvents::Buffering</b> event to determine when buffering starts or stops.
     * @param {Pointer<Integer>} plDownloadProgress Pointer to a <b>long</b> containing the download progress.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_downloadprogress
     */
    get_downloadProgress(plDownloadProgress) {
        plDownloadProgressMarshal := plDownloadProgress is VarRef ? "int*" : "ptr"

        result := ComCall(32, this, plDownloadProgressMarshal, plDownloadProgress, "HRESULT")
        return result
    }

    /**
     * The get_encodedFrameRate method retrieves the video frame rate specified by the content author.
     * @param {Pointer<Integer>} plFrameRate Pointer to a <b>long</b> containing the frame rate in frames per second (fps).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_encodedframerate
     */
    get_encodedFrameRate(plFrameRate) {
        plFrameRateMarshal := plFrameRate is VarRef ? "int*" : "ptr"

        result := ComCall(33, this, plFrameRateMarshal, plFrameRate, "HRESULT")
        return result
    }

    /**
     * The get_framesSkipped method retrieves the total number of frames skipped during playback.
     * @param {Pointer<Integer>} plFrames Pointer to a <b>long</b> containing the number of frames.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_framesskipped
     */
    get_framesSkipped(plFrames) {
        plFramesMarshal := plFrames is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, plFramesMarshal, plFrames, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPNetwork.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_bandWidth := CallbackCreate(GetMethod(implObj, "get_bandWidth"), flags, 2)
        this.vtbl.get_recoveredPackets := CallbackCreate(GetMethod(implObj, "get_recoveredPackets"), flags, 2)
        this.vtbl.get_sourceProtocol := CallbackCreate(GetMethod(implObj, "get_sourceProtocol"), flags, 2)
        this.vtbl.get_receivedPackets := CallbackCreate(GetMethod(implObj, "get_receivedPackets"), flags, 2)
        this.vtbl.get_lostPackets := CallbackCreate(GetMethod(implObj, "get_lostPackets"), flags, 2)
        this.vtbl.get_receptionQuality := CallbackCreate(GetMethod(implObj, "get_receptionQuality"), flags, 2)
        this.vtbl.get_bufferingCount := CallbackCreate(GetMethod(implObj, "get_bufferingCount"), flags, 2)
        this.vtbl.get_bufferingProgress := CallbackCreate(GetMethod(implObj, "get_bufferingProgress"), flags, 2)
        this.vtbl.get_bufferingTime := CallbackCreate(GetMethod(implObj, "get_bufferingTime"), flags, 2)
        this.vtbl.put_bufferingTime := CallbackCreate(GetMethod(implObj, "put_bufferingTime"), flags, 2)
        this.vtbl.get_frameRate := CallbackCreate(GetMethod(implObj, "get_frameRate"), flags, 2)
        this.vtbl.get_maxBitRate := CallbackCreate(GetMethod(implObj, "get_maxBitRate"), flags, 2)
        this.vtbl.get_bitRate := CallbackCreate(GetMethod(implObj, "get_bitRate"), flags, 2)
        this.vtbl.getProxySettings := CallbackCreate(GetMethod(implObj, "getProxySettings"), flags, 3)
        this.vtbl.setProxySettings := CallbackCreate(GetMethod(implObj, "setProxySettings"), flags, 3)
        this.vtbl.getProxyName := CallbackCreate(GetMethod(implObj, "getProxyName"), flags, 3)
        this.vtbl.setProxyName := CallbackCreate(GetMethod(implObj, "setProxyName"), flags, 3)
        this.vtbl.getProxyPort := CallbackCreate(GetMethod(implObj, "getProxyPort"), flags, 3)
        this.vtbl.setProxyPort := CallbackCreate(GetMethod(implObj, "setProxyPort"), flags, 3)
        this.vtbl.getProxyExceptionList := CallbackCreate(GetMethod(implObj, "getProxyExceptionList"), flags, 3)
        this.vtbl.setProxyExceptionList := CallbackCreate(GetMethod(implObj, "setProxyExceptionList"), flags, 3)
        this.vtbl.getProxyBypassForLocal := CallbackCreate(GetMethod(implObj, "getProxyBypassForLocal"), flags, 3)
        this.vtbl.setProxyBypassForLocal := CallbackCreate(GetMethod(implObj, "setProxyBypassForLocal"), flags, 3)
        this.vtbl.get_maxBandwidth := CallbackCreate(GetMethod(implObj, "get_maxBandwidth"), flags, 2)
        this.vtbl.put_maxBandwidth := CallbackCreate(GetMethod(implObj, "put_maxBandwidth"), flags, 2)
        this.vtbl.get_downloadProgress := CallbackCreate(GetMethod(implObj, "get_downloadProgress"), flags, 2)
        this.vtbl.get_encodedFrameRate := CallbackCreate(GetMethod(implObj, "get_encodedFrameRate"), flags, 2)
        this.vtbl.get_framesSkipped := CallbackCreate(GetMethod(implObj, "get_framesSkipped"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_bandWidth)
        CallbackFree(this.vtbl.get_recoveredPackets)
        CallbackFree(this.vtbl.get_sourceProtocol)
        CallbackFree(this.vtbl.get_receivedPackets)
        CallbackFree(this.vtbl.get_lostPackets)
        CallbackFree(this.vtbl.get_receptionQuality)
        CallbackFree(this.vtbl.get_bufferingCount)
        CallbackFree(this.vtbl.get_bufferingProgress)
        CallbackFree(this.vtbl.get_bufferingTime)
        CallbackFree(this.vtbl.put_bufferingTime)
        CallbackFree(this.vtbl.get_frameRate)
        CallbackFree(this.vtbl.get_maxBitRate)
        CallbackFree(this.vtbl.get_bitRate)
        CallbackFree(this.vtbl.getProxySettings)
        CallbackFree(this.vtbl.setProxySettings)
        CallbackFree(this.vtbl.getProxyName)
        CallbackFree(this.vtbl.setProxyName)
        CallbackFree(this.vtbl.getProxyPort)
        CallbackFree(this.vtbl.setProxyPort)
        CallbackFree(this.vtbl.getProxyExceptionList)
        CallbackFree(this.vtbl.setProxyExceptionList)
        CallbackFree(this.vtbl.getProxyBypassForLocal)
        CallbackFree(this.vtbl.setProxyBypassForLocal)
        CallbackFree(this.vtbl.get_maxBandwidth)
        CallbackFree(this.vtbl.put_maxBandwidth)
        CallbackFree(this.vtbl.get_downloadProgress)
        CallbackFree(this.vtbl.get_encodedFrameRate)
        CallbackFree(this.vtbl.get_framesSkipped)
    }
}
