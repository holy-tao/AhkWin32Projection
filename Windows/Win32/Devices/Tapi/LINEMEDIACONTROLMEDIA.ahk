#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEMEDIACONTROLMEDIA structure describes a media action to be executed when detecting a media type change. It is used as an entry in an array. The lineSetMediaControl and TSPI_lineSetMediaControl functions use this structure.
 * @remarks
 * This structure may not be extended.
 * 
 * The 
 * <b>LINEMEDIACONTROLMEDIA</b> structure defines a triple &lt;media type(s), duration, media-control action&gt;. An array of these triples is passed to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a> function to set the media control actions triggered by media type changes for a given call. When a change to a listed media type is detected, then the corresponding action on the media stream is invoked.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linemediacontrolmedia
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEMEDIACONTROLMEDIA {
    #StructPack 4

    /**
     * One or more media types. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediamode--constants">LINEMEDIAMODE_ Constants</a>.
     */
    dwMediaModes : UInt32

    /**
     * Duration of time during which the media type should be present before the application should be notified or media control action should be taken, in milliseconds.
     */
    dwDuration : UInt32

    /**
     * Media control action. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediacontrol--constants">LINEMEDIACONTROL_ Constants</a>.
     */
    dwMediaControl : UInt32

}
