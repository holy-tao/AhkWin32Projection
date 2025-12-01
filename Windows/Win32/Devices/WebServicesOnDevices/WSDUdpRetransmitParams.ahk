#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the parameters for repeating a message transmission.
 * @remarks
 * If <b>ulRepeatMinDelay</b>, <b>ulRepeatMaxDelay</b>, and <b>ulRepeatUpperDelay</b> are all zero, there is no delay in retransmission of the message.
 * 
 * WSD sends the first transmission after waiting <b>ulSendDelay</b>. WSD uses the other members to determine when to repeat the transmission, if necessary. WSD repeats the transmission up to <b>ulRepeat</b> times with increasing delays between transmission. WSD uses the <b>ulRepeatMinDelay</b>, <b>ulRepeatMaxDelay</b>, and <b>ulRepeatUpperDelay</b> members to determine the delay. 
 * 
 * WSD generates a random delay value in the range <b>ulRepeatMinDelay</b> to <b>ulRepeatMaxDelay</b> and waits this amount of time before repeating the transmission. All subsequent repeat attempts then double the current delay value until <b>ulRepeatUpperDelay</b> is reached. For example, if the initial random delay value is 50 and the upper delay value is 250, the second attempt will wait 50 milliseconds, the third attempt will wait 100 milliseconds, the fourth attempt will wait 200 milliseconds, and the remaining attempts will wait 250 milliseconds.
 * 
 * For details on how WSD uses these values to send messages, see Appendix I of the <a href="https://schemas.xmlsoap.org/ws/2004/09/soap-over-udp/">SOAP-over-UDP</a> specification.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ns-wsdbase-wsdudpretransmitparams
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSDUdpRetransmitParams extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * Time to wait before sending the first transmission, in milliseconds. Specify zero for no delay. Cannot be INFINITE.
     * @type {Integer}
     */
    ulSendDelay {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Maximum number of transmissions to send. Specify a value between 1 and 256, inclusively.
     * @type {Integer}
     */
    ulRepeat {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Minimum value of the range used to generate the initial delay value, in milliseconds. This value must be less than or equal to <b>ulRepeatMaxDelay</b>, can be zero, but cannot be INFINITE. See Remarks.
     * @type {Integer}
     */
    ulRepeatMinDelay {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum value of the range used to generate the initial delay value, in milliseconds. This value be less than or equal to <b>ulRepeatUpperDelay</b>, can be zero, but cannot be INFINITE. See Remarks.
     * @type {Integer}
     */
    ulRepeatMaxDelay {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Maximum delay to wait before sending message, in milliseconds. This value be can be zero, but cannot be INFINITE.
     * @type {Integer}
     */
    ulRepeatUpperDelay {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
