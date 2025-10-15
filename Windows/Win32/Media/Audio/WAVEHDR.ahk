#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The WAVEHDR structure defines the header used to identify a waveform-audio buffer.
 * @remarks
 * 
  * Use the WHDR_BEGINLOOP and WHDR_ENDLOOP flags in the <b>dwFlags</b> member to specify the beginning and ending data blocks for looping. To loop on a single block, specify both flags for the same block. Use the <b>dwLoops</b> member in the <b>WAVEHDR</b> structure for the first block in the loop to specify the number of times to play the loop.
  * 
  * The <b>lpData</b>, <b>dwBufferLength</b>, and <b>dwFlags</b> members must be set before calling the <a href="https://docs.microsoft.com/previous-versions/dd743848(v=vs.85)">waveInPrepareHeader</a> or <a href="https://docs.microsoft.com/previous-versions/dd743868(v=vs.85)">waveOutPrepareHeader</a> function. (For either function, the <b>dwFlags</b> member must be set to zero.)
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mmeapi/ns-mmeapi-wavehdr
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class WAVEHDR extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to the waveform buffer.
     * @type {PSTR}
     */
    lpData{
        get {
            if(!this.HasProp("__lpData"))
                this.__lpData := PSTR(this.ptr + 0)
            return this.__lpData
        }
    }

    /**
     * Length, in bytes, of the buffer.
     * @type {Integer}
     */
    dwBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * When the header is used in input, specifies how much data is in the buffer.
     * @type {Integer}
     */
    dwBytesRecorded {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * User data.
     * @type {Pointer}
     */
    dwUser {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A bitwise <b>OR</b> of zero of more flags. The following flags are defined:
     * 
     * <table>
     * <tr>
     * <th>Name</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHDR_BEGINLOOP"></a><a id="whdr_beginloop"></a><dl>
     * <dt><b>WHDR_BEGINLOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This buffer is the first buffer in a loop. This flag is used only with output buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHDR_DONE"></a><a id="whdr_done"></a><dl>
     * <dt><b>WHDR_DONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by the device driver to indicate that it is finished with the buffer and is returning it to the application.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHDR_ENDLOOP"></a><a id="whdr_endloop"></a><dl>
     * <dt><b>WHDR_ENDLOOP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This buffer is the last buffer in a loop. This flag is used only with output buffers.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHDR_INQUEUE"></a><a id="whdr_inqueue"></a><dl>
     * <dt><b>WHDR_INQUEUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by Windows to indicate that the buffer is queued for playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WHDR_PREPARED"></a><a id="whdr_prepared"></a><dl>
     * <dt><b>WHDR_PREPARED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Set by Windows to indicate that the buffer has been prepared with the <a href="https://docs.microsoft.com/previous-versions/dd743848(v=vs.85)">waveInPrepareHeader</a> or <a href="https://docs.microsoft.com/previous-versions/dd743868(v=vs.85)">waveOutPrepareHeader</a> function.
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
     * Number of times to play the loop. This member is used only with output buffers.
     * @type {Integer}
     */
    dwLoops {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Reserved.
     * @type {Pointer<WAVEHDR>}
     */
    lpNext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Reserved.
     * @type {Pointer}
     */
    reserved {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
