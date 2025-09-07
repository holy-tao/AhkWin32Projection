#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEMEDIACONTROLTONE structure describes a media action to be executed when a tone has been detected. It is used as an entry in an array. The lineSetMediaControl and TSPI_lineSetMediaControl functions use this structure.
 * @remarks
 * This structure may not be extended.
  * 
  * The 
  * <b>LINEMEDIACONTROLTONE</b> structure defines a tuple &lt;tone, media-control action&gt;. An array of these tuples is passed to the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a> function to set media control actions triggered by media type changes for a given call. When a change to a listed media type is detected, the corresponding action on the media stream is invoked.
  * 
  * A tone with all frequencies set to zero corresponds to silence. An application can thus monitor the call's information stream for silence.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linemediacontroltone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEMEDIACONTROLTONE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * Used by the application for tagging the tone. When this tone is detected, the value of the <b>dwAppSpecific</b> member is passed back to the application.
     * @type {Integer}
     */
    dwAppSpecific {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Duration of time during which the tone should be present before a detection is made, in milliseconds.
     * @type {Integer}
     */
    dwDuration {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * First frequency of the tone, in hertz.
     * @type {Integer}
     */
    dwFrequency1 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Second frequency of the tone, in hertz.
     * @type {Integer}
     */
    dwFrequency2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Third frequency of the tone, in hertz. If fewer than three frequencies are needed in the tone, a value of 0 should be used for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be use for silence detection.
     * @type {Integer}
     */
    dwFrequency3 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Media control action. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediacontrol--constants">LINEMEDIACONTROL_ Constants</a>.
     * @type {Integer}
     */
    dwMediaControl {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
