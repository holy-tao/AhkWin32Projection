#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AM_SimpleRateChange structure is used to change the playback rate for an MPEG-2 stream.
 * @remarks
 * 
 * <h3><a id="Version_1.1_Semantics"></a><a id="version_1.1_semantics"></a><a id="VERSION_1.1_SEMANTICS"></a>Version 1.1 Semantics</h3>
 * For version 1.1 of this property set, the <b>StartTime</b> member can be -1. This value indicates that the rate change applies to the decoder's <i>most forward</i> sample, defined as the sample at the head of the decoder's outgoing queue.  To get the actual start time of the rate change, query the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/am-rate-querylastratesegpts-property">AM_RATE_QueryLastRateSegPTS</a> property.
 * 
 * The decoder should adjust the time stamps on every queued sample to reflect the new rate. Queued samples might be incompatible with the new rate, especially for audio decoders. If so, the decoder may simply drop the queued samples. After dropping samples, it should set the discontinuity flag on the first sample it delivers.
 * 
 *  
 * 
 * In the case where <b>StartTime</b> is -1, but the new rate is incompatible and the decoder does not keep a queue of samples, the decoder should return VFW_E_DVD_WRONG_SPEED from the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/ikspropertyset-set">IKsPropertySet::Set</a> method. The source filter can then set a rate change with a specified (not -1) start time.
 * 
 * The source filter can schedule a rate change whose start time is earlier than previously queued rate changes. This invalidates any rate changes further down the queue; the decoder should discard them. If <b>StartTime</b> is -1, the decoder should discard all pending rate changes before queuing the new rate change.
 * 
 *  
 * 
 * The source filter can also schedule a rate change for a start time in the past—that is, earlier than any queued sample. In that case, the decoder should adjust the time stamps of all queued samples.
 * 
 * 
 * 
 * If a sample spans the start time, and the new rate is incompatible, the behavior is undefined. The decoder may keep the sample or discard it, depending on the media.
 * 
 * <h3><a id="Source_Filter_Requirements"></a><a id="source_filter_requirements"></a><a id="SOURCE_FILTER_REQUIREMENTS"></a>Source Filter Requirements</h3>
 * <ul>
 * <li>The source filter's time stamps correspond to a 1x rate. The decoder filter adjusts the time stamps to match the rate. 
 * </li>
 * <li>During reverse playback, time stamps increase. They do not go backward. The source filter does not set a discontinuity flag when the rate transitions between forward and reverse playback (unless the source filter is also dropping frames).</li>
 * <li> 
 * For MPEG-2 content, GOPs must be presented in forward order, even during reverse playback. During reverse playback, the GOP-to-GOP order is reversed. Each GOP has one time stamp for the I frame, with no time stamps for non-I frames. Each GOP is contained in one sample.</li>
 * <li> 
 * During reverse playback, audio is presented in reverse order. If there is more than one audio sample per media sample, the decoder must send the audio samples to the audio renderer in reverse order.</li>
 * <li> 
 * The source filter must recover if it sets a rate change with <b>StartTime</b> = -1 and the decoder fails the call. </li>
 * </ul>
 * <h3><a id="Decoder_Requirements"></a><a id="decoder_requirements"></a><a id="DECODER_REQUIREMENTS"></a>Decoder Requirements</h3>
 * <ul>
 * <li>The decoder queues rate changes, sorted in order of start time. It uses these rate changes to scale the time stamps on decoded samples.</li>
 * <li> 
 * All rate changes must be queued and used to computer scaled time stamps, regardless of rate compatibility.</li>
 * <li> 
 * When scaling time stamps, the decoder must take into account any segments where it dropped samples due to rate incompatibility.</li>
 * <li> 
 * The rate-change equation uses the value of <b>StartTime</b>, even if that value does not exactly match any sample's presentation time.</li>
 * </ul>
 * <h3><a id="Calculating_Rate_Changes"></a><a id="calculating_rate_changes"></a><a id="CALCULATING_RATE_CHANGES"></a>Calculating Rate Changes</h3>
 * In the following diagram, the output time stamp (y) is given by formula
 * 
 * 
 * 
 * 
 *              
 *              
 *              
 *              
 *              y = r(x - xi)
 * 
 * where x is the input time stamp, r is the rate, and xi is the x-intercept for the current rate. This formula is obtained by solving for the equation y = mx + b at the point xi, where m is the slope (r) and b is the y-intercept. This gives b = -m(xi), which can then be substituted back into the equation y = mx + b.
 * 
 * 
 * 
 * <img alt="A diagram showing the relation between input time stamps and output time stamps." src="./images/dvd_ratechange.png"/>
 * 
 * The decoder can calculate the x-intercept as follows. Given:
 * 
 * 
 * 
 *     r1 = previous rate
 * 
 * 
 * 
 *     r2 = current rate
 * 
 * 
 * 
 *     xi1 = x-intercept for the previous rate change
 * 
 *     xi2 = x-intercept for the current rate change
 * 
 *     x = start time for the current rate change
 * 
 * The unknown xi2 can be found by setting y = r2(x - xi2) = r1(x - xi1) and solving for xi2. (Refer to the diagram that follows.) This gives the following result:
 * 
 * 
 *     xi2 = (r1 / r2)(xi1 - x) + x
 * 
 * <img alt="A diagram showing the x intercept of the r2." src="./images/dvd_rate_change2.png"/>
 * 
 * In the special case where playback is 1x at time 0, r1 = 1 and xi1 = 0.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ns-dvdmedia-am_simpleratechange
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_SimpleRateChange extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the time stamp on the input sample when the new rate takes effect. The new rate applies to all samples with a time stamp &gt;= <b>StartTime</b> and less than the start time on the next queued rate segment.
     * @type {Integer}
     */
    StartTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Specifies the new rate x 10000. Rate is the inverse of speed. For example, if the playback speed is 2x, the rate is 1/2, so the <b>Rate</b> member is set to 5000.
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
