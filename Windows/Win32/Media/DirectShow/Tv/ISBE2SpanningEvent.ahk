#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements in-band spanning events for the Stream Buffer Engine, version 2 (SBE2). An in-band spanning event is an in-band event that can be recorded as part of the state information in a stream.
 * @remarks
 * An in-band spanning event has a persisting semantic: it exists until it is replaced or erased, and it is part of the state for events that follow it in a stream. For example, the format of a stream is stored as an in-band spanning event because it can change over time. Video may consist of high definition (HD) content at the beginning of a recording but may switch to standard definition (SD) content, then back to HD content again during the course of the recording. If the user skips from SD to HD or vice versa, a dynamic format change occurs because the format has been stored as a spanning event.
 * 
 * In-band spanning events are also available for use by modules other than SBE2.  For example, content protection could store the protection policy as a spanning event. A recording might begin as unprotected content and then become protected midway through. An in-band spanning event indicating protected content would replace the in-band spanning event indicating protected content. As with the stream format example in the preceding paragraph, a skip from unprotected to protected content causes the in-band spanning event to be sourced.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2SpanningEvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nn-sbe-isbe2spanningevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2SpanningEvent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISBE2SpanningEvent
     * @type {Guid}
     */
    static IID => Guid("{caede760-b6b1-11db-a578-0018f3fa24c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEvent"]

    /**
     * Gets an in-band spanning event and event data from the Stream Buffer Engine, version 2 (SBE2). An in-band spanning event is an event that exists until it is replaced or erased, and is part of the state for events that appear later in the same stream.
     * @remarks
     * The following types of in-band spanning events are defined.
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>EVENTID_ARIBcontentSpanningEvent</td>
     * <td>Signals the start of Integrated Services Digital Broadcasting (ISDB) content. No data is associated with this event.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_AudioDescriptorSpanningEvent</td>
     * <td>Contains an MPEG-2 descriptor for an audio stream. The event data is a byte array with the following layout:<ul>
     * <li>Byte 0 contains the descriptor tag.</li>
     * <li>Byte 1 contains the length of the descriptor body.</li>
     * <li>The remaining bytes contain the descriptor body.</li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td>EVENTID_AudioTypeSpanningEvent</td>
     * <td>Specifies the audio type of the data stream. The event data is a <b>char</b> that contains the audio_type field from the ISO 639 Language Descriptor.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_CASFailureSpanningEvent</td>
     * <td>Signals a failure in the condition access system (CAS). The event data depends on the CAS technology in use. </td>
     * </tr>
     * <tr>
     * <td>EVENTID_ChannelChangeSpanningEvent</td>
     * <td>Signals the start or end of a channel change. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/channelchangeinfo">ChannelChangeInfo</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_ChannelInfoSpanningEvent</td>
     * <td>Contains information about the cable television channel. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/channelinfo">ChannelInfo</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_ChannelTypeSpanningEvent</td>
     * <td>Contains information about the cable television channel type. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/channelinfo">ChannelTypeInfo</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_CSDescriptorSpanningEvent</td>
     * <td>Contains a caption service descriptor. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/spanningeventdescriptor">SpanningEventDescriptor</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_CtxADescriptorSpanningEvent</td>
     * <td>Contains a content advisory descriptor. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/spanningeventdescriptor">SpanningEventDescriptor</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_DualMonoSpanningEvent</td>
     * <td>Specifies the audio languages for a dual-mono audio stream. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/dualmonoinfo">DualMonoInfo</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_DVBScramblingControlSpanningEvent</td>
     * <td>Indicates whether a Digital Video Broadcasting (DVB) program stream is scrambled. This event is signaled when the value of the transport_scrambling_control field changes. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/dvbscramblingcontrolspanningevent">DVBScramblingControlSpanningEvent</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_EmmMessageSpanningEvent</td>
     * <td>Contains information about an Entitlement Management Message (EMM) in a DVB data stream. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/spanningeventemmmessage">SpanningEventEmmMessage</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_LanguageSpanningEvent</td>
     * <td>Specifies the audio language. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/languageinfo">LanguageInfo</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_PBDAParentalControlSpanningEvent</td>
     * <td>Contains information about the current parental control policy. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/pbdaparentalcontrol">PBDAParentalControl</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_PIDListSpanningEvent</td>
     * <td>Contains a list of packet identifiers (PIDs) for the current stream. The event data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/pidlistspanningevent">PIDListSpanningEvent</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_RRTSpanningEvent</td>
     * <td>Contains information about a rating region table (RRT). The data is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mpeg2structs/ns-mpeg2structs-section">SECTION</a> structure.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_SignalAndServiceStatusSpanningEvent</td>
     * <td>Signals the current state of the television service. The event data is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/signalandservicestatusspanningevent-state">SignalAndServiceStatusSpanningEvent_State</a> enumeration.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_StreamIDSpanningEvent</td>
     * <td>Contains a stream identifier descriptor.  The event data has the same format as the EVENTID_AudioDescriptorSpanningEvent event.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_StreamTypeSpanningEvent</td>
     * <td>Specifies the stream type. The event data is a <b>DWORD</b> that contains a value from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/mpeg2streamtype">MPEG2StreamType</a> enumeration.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_SubtitleSpanningEvent</td>
     * <td>Contains a subtitling descriptor. The event data has the same format as the <b>EVENTID_AudioDescriptorSpanningEvent</b> event.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_TeletextSpanningEvent</td>
     * <td>Contains a teletext descriptor. The event data has the same format as the <b>EVENTID_AudioDescriptorSpanningEvent</b> event.</td>
     * </tr>
     * <tr>
     * <td>EVENTID_TuneFailureSpanningEvent</td>
     * <td>Signals a tuning failure.</td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} idEvt GUID identifying the spanning event type.
     * @param {Integer} streamId Identifies the stream containing the spanning event.
     * @param {Pointer<Integer>} pcb Pointer to a value that gets the size of the event data buffer. If the <i>pb</i> parameter is <b>NULL</b>, this parameter returns the required buffer size.
     * @returns {Integer} Pointer to a buffer that gets the event data. If this parameter is <b>NULL</b>, the <i>pcb</i> parameter returns the required buffer size. The structure of the event data depends on the event type.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbe/nf-sbe-isbe2spanningevent-getevent
     */
    GetEvent(idEvt, streamId, pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", idEvt, "uint", streamId, pcbMarshal, pcb, "char*", &pb := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pb
    }
}
