#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The MIDIHDR structure defines the header used to identify a MIDI system-exclusive or stream buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midihdr
 * @namespace Windows.Win32.Media.Audio
 */
export default struct MIDIHDR {
    #StructPack 8

    /**
     * Pointer to MIDI data.
     */
    lpData : PSTR

    /**
     * Size of the buffer.
     */
    dwBufferLength : UInt32

    /**
     * Actual amount of data in the buffer. This value should be less than or equal to the value given in the <b>dwBufferLength</b> member.
     */
    dwBytesRecorded : UInt32

    /**
     * Custom user data.
     */
    dwUser : IntPtr

    /**
     * Flags giving information about the buffer.
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MHDR_DONE"></a><a id="mhdr_done"></a><dl>
     * <dt><b>MHDR_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by the device driver to indicate that it is finished with the buffer and is returning it to the application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MHDR_INQUEUE"></a><a id="mhdr_inqueue"></a><dl>
     * <dt><b>MHDR_INQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by Windows to indicate that the buffer is queued for playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MHDR_ISSTRM"></a><a id="mhdr_isstrm"></a><dl>
     * <dt><b>MHDR_ISSTRM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set to indicate that the buffer is a stream buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MHDR_PREPARED"></a><a id="mhdr_prepared"></a><dl>
     * <dt><b>MHDR_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by Windows to indicate that the buffer has been prepared by using the <a href="https://docs.microsoft.com/previous-versions/dd798459(v=vs.85)">midiInPrepareHeader</a> or <a href="https://docs.microsoft.com/previous-versions/dd798477(v=vs.85)">midiOutPrepareHeader</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Reserved; do not use.
     */
    lpNext : MIDIHDR.Ptr

    /**
     * Reserved; do not use.
     */
    reserved : IntPtr

    /**
     * Offset into the buffer when a callback is performed. (This callback is generated because the MEVT_F_CALLBACK flag is set in the <b>dwEvent</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd798448(v=vs.85)">MIDIEVENT</a> structure.) This offset enables an application to determine which event caused the callback.
     */
    dwOffset : UInt32

    /**
     * Reserved; do not use.
     */
    dwReserved : IntPtr[8]

}
