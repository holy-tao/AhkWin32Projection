#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDIEVENT structure describes a MIDI event in a stream buffer.
 * @remarks
 * The high byte of <b>dwEvent</b> contains flags and an event code. Either the MEVT_F_LONG or MEVT_F_SHORT flag must be specified. The MEVT_F_CALLBACK flag is optional. The following table describes these flags.
 *       
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>MEVT_F_CALLBACK</td>
 * <td>The system generates a callback when the event
 *               is about to be executed.
 *             </td>
 * </tr>
 * <tr>
 * <td>MEVT_F_LONG</td>
 * <td>The event is a long event. The low 24 bits of dwEvent contain the length of the event parameters included in dwParms.
 *             </td>
 * </tr>
 * <tr>
 * <td>MEVT_F_SHORT</td>
 * <td>The event is a short event. The event parameters are contained in the low 24 bits of dwEvent.</td>
 * </tr>
 * </table>
 *  
 * 
 * The remainder of the high byte contains one of the following event codes:
 *       
 * 
 * <table>
 * <tr>
 * <th>Event Code</th>
 * <th>Meaning</th>
 * </tr>
 * <tr>
 * <td>MEVT_COMMENT</td>
 * <td>Long event. The event data will be ignored. This event is intended to store commentary information about the stream that might be useful to authoring programs or sequencers if the stream data were to be stored in a file in stream format. In a buffer of this data, the zero byte identifies the comment class and subsequent bytes contain the comment data. </td>
 * </tr>
 * <tr>
 * <td>MEVT_LONGMSG</td>
 * <td>Long event. The event data is transmitted verbatim. The event data is assumed to be system-exclusive data; that is, running status will be cleared when the event is executed and running status from any previous events will not be applied to any channel events in the event data. Using this event to send a group of channel messages at the same time is not recommended; a set of MEVT_SHORTMSG events with zero delta times should be used instead.</td>
 * </tr>
 * <tr>
 * <td>MEVT_NOP</td>
 * <td>Short event. This event is a placeholder; it does nothing. The low 24 bits are ignored. This event will still generate a callback if MEVT_F_CALLBACK is set in dwEvent.</td>
 * </tr>
 * <tr>
 * <td>MEVT_SHORTMSG</td>
 * <td>Short event. The data in the low 24 bits of dwEvent is a MIDI short message. (For a description of how a short message is packed into a DWORD value, see the midiOutShortMsg function.)</td>
 * </tr>
 * <tr>
 * <td>MEVT_TEMPO</td>
 * <td>Short event. The data in the low 24 bits of dwEvent contain the new tempo for following events. The tempo is specified in the same format as it is for the tempo change meta-event in a MIDI file — that is, in microseconds per quarter note. (This event will have no effect if the time format specified for the stream is SMPTE time.)</td>
 * </tr>
 * <tr>
 * <td>MEVT_VERSION</td>
 * <td>Long event. The event data must contain a MIDISTRMBUFFVER structure.</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midievent
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIDIEVENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Time, in MIDI ticks, between the previous event and the current event. The length of a tick is defined by the time format and possibly the tempo associated with the stream. (The definition is identical to the specification for a tick in a standard MIDI file.)
     * @type {Integer}
     */
    dwDeltaTime {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    dwStreamID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Event code and event parameters or length. To parse this information, use the <a href="https://docs.microsoft.com/previous-versions/dd798442(v=vs.85)">MEVT_EVENTTYPE</a> and <a href="https://docs.microsoft.com/previous-versions/dd798441(v=vs.85)">MEVT_EVENTPARM</a> macros. See Remarks.
     * @type {Integer}
     */
    dwEvent {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * If <b>dwEvent</b> specifies MEVT_F_LONG and the length of the buffer, this member contains parameters for the event. This parameter data must be padded with zeros so that an integral number of <b>DWORD</b> values are stored. For example, if the event data is five bytes long, three pad bytes must follow the data for a total of eight bytes. In this case, the low 24 bits of <b>dwEvent</b> would contain the value 5.
     *             
     * 
     * If <b>dwEvent</b> specifies MEVT_F_SHORT, do not use this member in the stream buffer.
     * @type {Array<UInt32>}
     */
    dwParms{
        get {
            if(!this.HasProp("__dwParmsProxyArray"))
                this.__dwParmsProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "uint")
            return this.__dwParmsProxyArray
        }
    }
}
