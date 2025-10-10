#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEMEDIACONTROLDIGIT structure describes a media action to be executed when detecting a digit. It is used as an entry in an array. The lineSetMediaControl and TSPI_lineSetMediaControl functions use this structure.
 * @remarks
 * 
  * This structure may not be extended.
  * 
  * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linemediacontrolmedia">LINEMEDIACONTROLMEDIA</a> structure defines a triple &lt;digit, digit mode(s), media-control action&gt;. An array of these triples is passed to the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetmediacontrol">lineSetMediaControl</a> function to set the media control actions triggered by digits detected on a given call. When a listed digit is detected, then the corresponding action on the media stream is invoked.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linemediacontroldigit
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEMEDIACONTROLDIGIT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Low-order byte is the digit in whose detection is to trigger a media action. Valid digits depend on the media type.
     * @type {Integer}
     */
    dwDigit {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Digit mode(s) to monitor. This member uses one or more of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linedigitmode--constants">LINEDIGITMODE_ Constants</a>.
     * @type {Integer}
     */
    dwDigitModes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Media control action. This member uses one of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/linemediacontrol--constants">LINEMEDIACONTROL_ Constants</a>.
     * @type {Integer}
     */
    dwMediaControl {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
