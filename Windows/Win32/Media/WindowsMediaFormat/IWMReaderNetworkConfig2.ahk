#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderNetworkConfig.ahk

/**
 * The IWMReaderNetworkConfig2 interface provides advanced networking functionality.An IWMReaderNetworkConfig2 interface exists for every reader object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreadernetworkconfig2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderNetworkConfig2 extends IWMReaderNetworkConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderNetworkConfig2
     * @type {Guid}
     */
    static IID => Guid("{d979a853-042b-4050-8387-c939db22013f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnableContentCaching", "SetEnableContentCaching", "GetEnableFastCache", "SetEnableFastCache", "GetAcceleratedStreamingDuration", "SetAcceleratedStreamingDuration", "GetAutoReconnectLimit", "SetAutoReconnectLimit", "GetEnableResends", "SetEnableResends", "GetEnableThinning", "SetEnableThinning", "GetMaxNetPacketSize"]

    /**
     * The GetEnableContentCaching method queries whether content caching is enabled. If content caching is enabled, streaming content can be cached locally.
     * @remarks
     * This method applies only to content being streamed from a server running Windows Media Services.
     * @returns {BOOL} Pointer to a Boolean value that is True if content caching is enabled.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablecontentcaching
     */
    GetEnableContentCaching() {
        result := ComCall(36, this, "int*", &pfEnableContentCaching := 0, "HRESULT")
        return pfEnableContentCaching
    }

    /**
     * The SetEnableContentCaching method enables or disables content caching. If content caching is enabled, content that is being streamed can be cached locally.
     * @remarks
     * This method applies only to content being streamed from a server running Windows Media Services.
     * @param {BOOL} fEnableContentCaching Boolean value that is True to enable content caching.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablecontentcaching
     */
    SetEnableContentCaching(fEnableContentCaching) {
        result := ComCall(37, this, "int", fEnableContentCaching, "HRESULT")
        return result
    }

    /**
     * The GetEnableFastCache method queries whether Fast Cache streaming is enabled. Fast Cache streaming enables network content to be streamed faster than the playback rate, if bandwidth allows.
     * @remarks
     * This feature requires content caching to be enabled as well. Fast Cache applies only to content being streamed from a server running Windows Media Services.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. The value is True if Fast Cache streaming is enabled, or False otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablefastcache
     */
    GetEnableFastCache() {
        result := ComCall(38, this, "int*", &pfEnableFastCache := 0, "HRESULT")
        return pfEnableFastCache
    }

    /**
     * The SetEnableFastCache method enables or disables Fast Cache streaming. Fast Cache streaming enables network content to be streamed faster than the playback rate, if bandwidth allows.
     * @remarks
     * This method enables the reader to use Fast Cache streaming if the server also supports it. This feature is supported only when streaming content from a server running Windows Media Services. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/enabling-fast-cache-streaming-from-the-client">Enabling Fast Cache Streaming from the Client</a>.
     * 
     * Regardless of the status of Fast Cache set by this method, a user can enable this feature by adding "?WMCache=1" to the end of the URL. However, Fast Cache cannot be activated at all unless caching is enabled with a call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablecontentcaching">IWMReaderNetworkconfig2::SetEnableContentCaching</a>.
     * @param {BOOL} fEnableFastCache Specifies whether to enable or disable Fast Cache streaming. The value True enables Fast Cache, and the value False disables it.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablefastcache
     */
    SetEnableFastCache(fEnableFastCache) {
        result := ComCall(39, this, "int", fEnableFastCache, "HRESULT")
        return result
    }

    /**
     * The GetAcceleratedStreamingDuration method retrieves the current accelerated streaming duration.
     * @remarks
     * When using Fast Start, the server running Windows Media Services will send some data at the beginning of the content at a faster rate than that specified by the bit rate of the content.
     * @returns {Integer} Pointer to a <b>QWORD</b> that receives the accelerated streaming duration, in 100-nanosecond units. This is the amount of data at the beginning of the content that is streamed at an accelerated rate. The default value is twice the buffering duration.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getacceleratedstreamingduration
     */
    GetAcceleratedStreamingDuration() {
        result := ComCall(40, this, "uint*", &pcnsAccelDuration := 0, "HRESULT")
        return pcnsAccelDuration
    }

    /**
     * The SetAcceleratedStreamingDuration method sets the accelerated streaming duration. This duration applies to the Fast Start feature of Windows Media Services, which enables content to be played quickly without waiting for lengthy initial buffering.
     * @remarks
     * When using Fast Start, the server running Windows Media Services will send some data at the beginning of the content at a faster rate than that specified by the bit rate of the content.
     * @param {Integer} cnsAccelDuration Specifies the accelerated streaming duration, in 100-nanosecond units. The maximum value is 1,200,000,000. This is the amount of data at the beginning of the content that is streamed at an accelerated rate.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setacceleratedstreamingduration
     */
    SetAcceleratedStreamingDuration(cnsAccelDuration) {
        result := ComCall(41, this, "uint", cnsAccelDuration, "HRESULT")
        return result
    }

    /**
     * The GetAutoReconnectLimit method retrieves the maximum number of times the reader will attempt to reconnect to the server in the case of an unexpected disconnection.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the automatic reconnection limit.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getautoreconnectlimit
     */
    GetAutoReconnectLimit() {
        result := ComCall(42, this, "uint*", &pdwAutoReconnectLimit := 0, "HRESULT")
        return pdwAutoReconnectLimit
    }

    /**
     * The SetAutoReconnectLimit method sets the maximum number of times the reader will attempt to reconnect to the server in the case of an unexpected disconnection.
     * @remarks
     * The method configures the Fast Reconnect feature, which enables the reader object to reconnect to the server automatically if it loses the connection. When possible, playback resumes at the same point in the stream. The accuracy may depend on whether the source file is indexed. For live content, there may be a gap in the stream.
     * 
     * The reader only tries to reconnect if the interruption is unexpected. For example, it does not try to reconnect if the server denies access because of an authentication failure, if the server terminates the connection because of client inactivity, if the server administrator terminates the connection, and so forth.
     * 
     * This method is equivalent to setting the WMReconnect modifier in the URL. For example:
     * 
     * mms://MyServer/MyVideo.wmv?WMReconnect=5
     * @param {Integer} dwAutoReconnectLimit Specifies the maximum number of times the reader object will attempt to reconnect. To disable automatic reconnection, set this value to zero.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setautoreconnectlimit
     */
    SetAutoReconnectLimit(dwAutoReconnectLimit) {
        result := ComCall(43, this, "uint", dwAutoReconnectLimit, "HRESULT")
        return result
    }

    /**
     * The GetEnableResends method ascertains whether resending is enabled.
     * @remarks
     * This feature is available only for content streamed from a server running Windows Media Services using either MMSU or RTSPU protocol.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if resending is enabled.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenableresends
     */
    GetEnableResends() {
        result := ComCall(44, this, "int*", &pfEnableResends := 0, "HRESULT")
        return pfEnableResends
    }

    /**
     * The SetEnableResends method enables or disables resends.
     * @remarks
     * This feature is available only for content streamed from a server running Windows Media Services using either MMSU or RTSPU protocol.
     * @param {BOOL} fEnableResends Pointer to a Boolean value that is True to enable resends.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenableresends
     */
    SetEnableResends(fEnableResends) {
        result := ComCall(45, this, "int", fEnableResends, "HRESULT")
        return result
    }

    /**
     * The GetEnableThinning method ascertains whether Intelligent Streaming is enabled. Intelligent Streaming is the communication between the reader and the streaming server that enables the server to change the content sent based on available bandwidth.
     * @remarks
     * With Intelligent Streaming enabled, the reader responds to insufficient bandwidth by requesting that the server reduce the bit rate by using one of the following techniques. If one technique does not solve the problem, the reader will try the next one:
     * 
     * <ul>
     * <li>If the file is encoded using multiple bit rates (MBR), the first step the reader takes to rectify insufficient bandwidth is to request a lower bit rate version of streams.</li>
     * <li>If the file is not MBR, or if using a lower bit rate stream does not reduce the bandwidth requirements enough, the reader requests that the server thin the video streams. This means that the server reduces the frame rate of the video being streamed.</li>
     * <li>If thinning the video streams does not reduce the bandwidth requirements enough, the reader requests that the server stop sending video streams.</li>
     * </ul>
     * If Intelligent Streaming is disabled by setting <i>pfEnableThinning</i> to <b>FALSE</b>, the reader will not request any bandwidth corrections.
     * 
     * This feature applies only to content streaming from a server running Windows Media Services.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. The value is <b>TRUE</b> if thinning is enabled, or <b>FALSE</b> if thinning is disabled.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablethinning
     */
    GetEnableThinning() {
        result := ComCall(46, this, "int*", &pfEnableThinning := 0, "HRESULT")
        return pfEnableThinning
    }

    /**
     * The SetEnableThinning method enables or disables Intelligent Streaming. Intelligent Streaming is the communication between the reader and the streaming server that enables the server to change the content sent based on available bandwidth.
     * @remarks
     * With Intelligent Streaming enabled, the reader responds to insufficient bandwidth by requesting that the server reduce the bit rate by using one of the following techniques. If one technique does not solve the problem, the reader will try the next one:
     * 
     * <ul>
     * <li>If the file is encoded using multiple bit rates (MBR), the first step the reader takes to rectify insufficient bandwidth is to request a lower bit rate version of streams.</li>
     * <li>If the file is not MBR, or if using a lower bit rate stream does not reduce the bandwidth requirements enough, the reader requests that the server thin the video streams. This means that the server reduces the frame rate of the video being streamed.</li>
     * <li>If thinning the video streams does not reduce the bandwidth requirements enough, the reader requests that the server stop sending video streams.</li>
     * </ul>
     * If Intelligent Streaming is disabled by setting <i>pfEnableThinning</i> to <b>FALSE</b>, the reader will not request any bandwidth corrections.
     * 
     * This feature applies only to content streaming from a server running Windows Media Services.
     * 
     * This method is equivalent to specifying the WMThinning modifier in the URL. The modifier WMThinning=1 enables thinning, while WMThinning=0 disables it. For example:
     * 
     * mms://MyServer/MyVideo.wmv?WMThinning=1
     * 
     * Using the WMThinning URL modifier will override the setting specified with this method.
     * @param {BOOL} fEnableThinning Specify <b>True</b> to enable thinning, or <b>False</b> to disable thinning.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablethinning
     */
    SetEnableThinning(fEnableThinning) {
        result := ComCall(47, this, "int", fEnableThinning, "HRESULT")
        return result
    }

    /**
     * The GetMaxNetPacketSize method retrieves the maximum size of packets being streamed over a network.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the maximum net packet size, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getmaxnetpacketsize
     */
    GetMaxNetPacketSize() {
        result := ComCall(48, this, "uint*", &pdwMaxNetPacketSize := 0, "HRESULT")
        return pdwMaxNetPacketSize
    }
}
