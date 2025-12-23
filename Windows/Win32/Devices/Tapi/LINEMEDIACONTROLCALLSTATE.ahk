#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEMEDIACONTROLCALLSTATE structure describes a media action to be executed when detecting transitions into one or more call states. The lineSetMediaControl and TSPI_lineSetMediaControl functions use this structure.
 * @remarks
 * This structure may not be extended.
 * 
 * The 
 * <b>LINEMEDIACONTROLCALLSTATE</b> structure defines a triple &lt;call state(s), media-control action&gt;. An array of these triples is passed to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a> function to set the media control actions triggered by the transition to the call state of the given call. When a transition to a listed call state is detected, the corresponding action on the media stream is invoked.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linemediacontrolcallstate
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEMEDIACONTROLCALLSTATE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * One or more call states. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linecallstate--constants">LINECALLSTATE_ Constants</a>.
     * @type {Integer}
     */
    dwCallStates {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Media control action. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediacontrol--constants">LINEMEDIACONTROL_ Constants</a>.
     * @type {Integer}
     */
    dwMediaControl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
