#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a length of time.
 * @remarks
 * 
  * If any numeric member has a value of 0, then the member and its value is not included in the XML output when the structure is converted to XML.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wsdxml/ns-wsdxml-wsd_duration
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_DURATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * This parameter is <b>TRUE</b> if the entire duration is positive.
     * @type {BOOL}
     */
    isPositive {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The year value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    year {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The month value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    month {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The day value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    day {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The hour value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    hour {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The minute value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    minute {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The second value. This number is a value between 0 and max(ULONG).
     * @type {Integer}
     */
    second {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The millisecond value (0-999).
     * @type {Integer}
     */
    millisecond {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
