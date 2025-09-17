#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MIDIHDR structure defines the header used to identify a MIDI system-exclusive or stream buffer.
 * @see https://learn.microsoft.com/windows/win32/api/mmeapi/ns-mmeapi-midihdr
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class MIDIHDR extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * Pointer to MIDI data.
     * @type {Pointer<Byte>}
     */
    lpData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the buffer.
     * @type {Integer}
     */
    dwBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Actual amount of data in the buffer. This value should be less than or equal to the value given in the <b>dwBufferLength</b> member.
     * @type {Integer}
     */
    dwBytesRecorded {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Custom user data.
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer<MIDIHDR>}
     */
    lpNext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved; do not use.
     * @type {Pointer}
     */
    reserved {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Offset into the buffer when a callback is performed. (This callback is generated because the MEVT_F_CALLBACK flag is set in the <b>dwEvent</b> member of the <a href="https://docs.microsoft.com/previous-versions/dd798448(v=vs.85)">MIDIEVENT</a> structure.) This offset enables an application to determine which event caused the callback.
     * @type {Integer}
     */
    dwOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved; do not use.
     * @type {Array<UIntPtr>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 56, 8, Primitive, "ptr")
            return this.__dwReservedProxyArray
        }
    }
}
