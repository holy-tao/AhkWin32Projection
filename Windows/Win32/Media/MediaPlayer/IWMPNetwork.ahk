#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPNetwork interface provides methods relating to the network connection used by Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpnetwork
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNetwork extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPNetwork
     * @type {Guid}
     */
    static IID => Guid("{ec21b779-edef-462d-bba4-ad9dde2b29a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_bandWidth", "get_recoveredPackets", "get_sourceProtocol", "get_receivedPackets", "get_lostPackets", "get_receptionQuality", "get_bufferingCount", "get_bufferingProgress", "get_bufferingTime", "put_bufferingTime", "get_frameRate", "get_maxBitRate", "get_bitRate", "getProxySettings", "setProxySettings", "getProxyName", "setProxyName", "getProxyPort", "setProxyPort", "getProxyExceptionList", "setProxyExceptionList", "getProxyBypassForLocal", "setProxyBypassForLocal", "get_maxBandwidth", "put_maxBandwidth", "get_downloadProgress", "get_encodedFrameRate", "get_framesSkipped"]

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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_bandwidth
     */
    get_bandWidth(plBandwidth) {
        plBandwidthMarshal := plBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plBandwidthMarshal, plBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_recoveredPackets method retrieves the number of recovered packets.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_recoveredpackets
     */
    get_recoveredPackets(plRecoveredPackets) {
        plRecoveredPacketsMarshal := plRecoveredPackets is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plRecoveredPacketsMarshal, plRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * The get_sourceProtocol method retrieves the source protocol used to receive data.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_sourceprotocol
     */
    get_sourceProtocol(pbstrSourceProtocol) {
        result := ComCall(9, this, "ptr", pbstrSourceProtocol, "HRESULT")
        return result
    }

    /**
     * The get_receivedPackets method retrieves the number of packets received.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_receivedpackets
     */
    get_receivedPackets(plReceivedPackets) {
        plReceivedPacketsMarshal := plReceivedPackets is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plReceivedPacketsMarshal, plReceivedPackets, "HRESULT")
        return result
    }

    /**
     * The get_lostPackets method retrieves the number of packets lost.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_lostpackets
     */
    get_lostPackets(plLostPackets) {
        plLostPacketsMarshal := plLostPackets is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plLostPacketsMarshal, plLostPackets, "HRESULT")
        return result
    }

    /**
     * The get_receptionQuality method retrieves the percentage of packets received in the last 30 seconds.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_receptionquality
     */
    get_receptionQuality(plReceptionQuality) {
        plReceptionQualityMarshal := plReceptionQuality is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plReceptionQualityMarshal, plReceptionQuality, "HRESULT")
        return result
    }

    /**
     * The get_bufferingCount method retrieves the number of times buffering occurred during playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_bufferingcount
     */
    get_bufferingCount(plBufferingCount) {
        plBufferingCountMarshal := plBufferingCount is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, plBufferingCountMarshal, plBufferingCount, "HRESULT")
        return result
    }

    /**
     * The get_bufferingProgress method retrieves the percentage of buffering completed.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_bufferingprogress
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_bufferingtime
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-put_bufferingtime
     */
    put_bufferingTime(lBufferingTime) {
        result := ComCall(16, this, "int", lBufferingTime, "HRESULT")
        return result
    }

    /**
     * The get_frameRate method retrieves the current video frame rate.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_framerate
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_maxbitrate
     */
    get_maxBitRate(plBitRate) {
        plBitRateMarshal := plBitRate is VarRef ? "int*" : "ptr"

        result := ComCall(18, this, plBitRateMarshal, plBitRate, "HRESULT")
        return result
    }

    /**
     * The get_bitRate method retrieves the current bit rate being received.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_bitrate
     */
    get_bitRate(plBitRate) {
        plBitRateMarshal := plBitRate is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, plBitRateMarshal, plBitRate, "HRESULT")
        return result
    }

    /**
     * The getProxySettings method retrieves the proxy setting for a given protocol.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-getproxysettings
     */
    getProxySettings(bstrProtocol, plProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        plProxySettingMarshal := plProxySetting is VarRef ? "int*" : "ptr"

        result := ComCall(20, this, "ptr", bstrProtocol, plProxySettingMarshal, plProxySetting, "HRESULT")
        return result
    }

    /**
     * The setProxySettings method specifies the proxy setting for a given protocol.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-setproxysettings
     */
    setProxySettings(bstrProtocol, lProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(21, this, "ptr", bstrProtocol, "int", lProxySetting, "HRESULT")
        return result
    }

    /**
     * The getProxyName method retrieves the name of the proxy server being used.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-getproxyname
     */
    getProxyName(bstrProtocol, pbstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(22, this, "ptr", bstrProtocol, "ptr", pbstrProxyName, "HRESULT")
        return result
    }

    /**
     * The setProxyName method specifies the name of the proxy server to use.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-setproxyname
     */
    setProxyName(bstrProtocol, bstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrProxyName := bstrProxyName is String ? BSTR.Alloc(bstrProxyName).Value : bstrProxyName

        result := ComCall(23, this, "ptr", bstrProtocol, "ptr", bstrProxyName, "HRESULT")
        return result
    }

    /**
     * The getProxyPort method retrieves the proxy port being used.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-getproxyport
     */
    getProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        lProxyPortMarshal := lProxyPort is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "ptr", bstrProtocol, lProxyPortMarshal, lProxyPort, "HRESULT")
        return result
    }

    /**
     * The setProxyPort method specifies the proxy port to use.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-setproxyport
     */
    setProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(25, this, "ptr", bstrProtocol, "int", lProxyPort, "HRESULT")
        return result
    }

    /**
     * The getProxyExceptionList method retrieves the proxy exception list.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-getproxyexceptionlist
     */
    getProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(26, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * The setProxyExceptionList method specifies the proxy exception list.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-setproxyexceptionlist
     */
    setProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        pbstrExceptionList := pbstrExceptionList is String ? BSTR.Alloc(pbstrExceptionList).Value : pbstrExceptionList

        result := ComCall(27, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * The getProxyBypassForLocal method retrieves a value indicating whether the proxy server is bypassed if the origin server is on a local network.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-getproxybypassforlocal
     */
    getProxyBypassForLocal(bstrProtocol, pfBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        pfBypassForLocalMarshal := pfBypassForLocal is VarRef ? "short*" : "ptr"

        result := ComCall(28, this, "ptr", bstrProtocol, pfBypassForLocalMarshal, pfBypassForLocal, "HRESULT")
        return result
    }

    /**
     * The setProxyBypassForLocal method specifies a value indicating whether the proxy server is bypassed if the origin server is on a local network.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-setproxybypassforlocal
     */
    setProxyBypassForLocal(bstrProtocol, fBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(29, this, "ptr", bstrProtocol, "short", fBypassForLocal, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_maxbandwidth
     */
    get_maxBandwidth(lMaxBandwidth) {
        lMaxBandwidthMarshal := lMaxBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, lMaxBandwidthMarshal, lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * The put_maxBandwidth method specifies the maximum allowed bandwidth.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-put_maxbandwidth
     */
    put_maxBandwidth(lMaxBandwidth) {
        result := ComCall(31, this, "int", lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_downloadProgress method retrieves the percentage of the download completed.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_downloadprogress
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_encodedframerate
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpnetwork-get_framesskipped
     */
    get_framesSkipped(plFrames) {
        plFramesMarshal := plFrames is VarRef ? "int*" : "ptr"

        result := ComCall(34, this, plFramesMarshal, plFrames, "HRESULT")
        return result
    }
}
