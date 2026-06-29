#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_PROPERTY_FLAGS.ahk" { HTTP_PROPERTY_FLAGS }

/**
 * The transfer rate of a response.
 * @remarks
 * This structure allows an HTTP Server application to maximize the network bandwidth use by throttling down the transfer rate of an HTTP response.  This is especially useful in serving media content where the initial burst of the content is served at a higher transfer rate and then throttled.  This allows content from a larger number of media to be served concurrently.
 * 
 * The transfer rate is allowed to exceed <b> MaxBandwidth</b> in two cases:<ul>
 * <li>If the connection slows and the transfer rate falls below <b> MaxBandwidth</b>, the application can go beyond <b> MaxBandwidth</b> to catch up.</li>
 * <li>The beginning of a response is allowed to exceed <b> MaxBandwidth</b>.  For example, a server may  transfer media file at high speed at the beginning in order to expedite playback on the client.
 * For example, if that client needs initial 20KB of the file to start playback, the server might have this variable set to 20KB.
 * </li>
 * </ul>When <b> MaxBandwidth</b> is exceeded, <b> MaxPeakBandwidth </b> is still the absolute upper limit.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_flowrate_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_FLOWRATE_INFO {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ns-http-http_property_flags">HTTP_PROPERTY_FLAGS</a> structure specifying whether the property is present.
     */
    Flags : HTTP_PROPERTY_FLAGS

    /**
     * The maximum bandwidth represented in bytes/second.  This is the maximum bandwidth for the response after the burst content, whose size is specified in <b>BurstSize</b>,  has been sent.
     */
    MaxBandwidth : UInt32

    /**
     * The peak bandwidth represented in bytes/second.  This is the maximum bandwidth at which the burst is delivered.
     */
    MaxPeakBandwidth : UInt32

    /**
     * The size of the content, in bytes, to be delivered at <b>MaxPeakBandwidth</b>.  Once this content has been delivered, the response is throttled at <b>MaxBandwidth</b>.  If the HTTP Server application sends responses at a rate slower than <b>MaxBandwidth</b>, the response is subject to burst again at <b>MaxPeakBandwidth</b> to maximize bandwidth utilization.
     */
    BurstSize : UInt32

}
