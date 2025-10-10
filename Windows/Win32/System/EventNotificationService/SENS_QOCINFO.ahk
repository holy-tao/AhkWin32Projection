#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SENS_QOCINFO structure is used by the ISensNetwork::ConnectionMade method. This structure contains Quality of Connection information to the sink object in an application that subscribes to SENS.
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/ns-sensevts-sens_qocinfo
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class SENS_QOCINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * This member contains the actual size of the structure that was filled in.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Speed of connection. Flag bits indicate whether the connection is slow, medium, fast.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Speed of data sent to the destination in bits per second.
     * @type {Integer}
     */
    dwOutSpeed {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Speed of data coming in from the destination in bits per second.
     * @type {Integer}
     */
    dwInSpeed {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
