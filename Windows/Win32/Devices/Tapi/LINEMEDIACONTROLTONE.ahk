#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct LINEMEDIACONTROLTONE {
    #StructPack 4

    /**
     * Used by the application for tagging the tone. When this tone is detected, the value of the <b>dwAppSpecific</b> member is passed back to the application.
     */
    dwAppSpecific : UInt32

    /**
     * Duration of time during which the tone should be present before a detection is made, in milliseconds.
     */
    dwDuration : UInt32

    /**
     * First frequency of the tone, in hertz.
     */
    dwFrequency1 : UInt32

    /**
     * Second frequency of the tone, in hertz.
     */
    dwFrequency2 : UInt32

    /**
     * Third frequency of the tone, in hertz. If fewer than three frequencies are needed in the tone, a value of 0 should be used for the unused frequencies. A tone with all three frequencies set to zero is interpreted as silence and can be use for silence detection.
     */
    dwFrequency3 : UInt32

    /**
     * Media control action. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediacontrol--constants">LINEMEDIACONTROL_ Constants</a>.
     */
    dwMediaControl : UInt32

}
