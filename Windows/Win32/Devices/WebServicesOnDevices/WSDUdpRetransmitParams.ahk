#Requires AutoHotkey v2.1-alpha.26+ 64-bit

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
 */
export default struct WSDUdpRetransmitParams {
    #StructPack 4

    /**
     * Time to wait before sending the first transmission, in milliseconds. Specify zero for no delay. Cannot be INFINITE.
     */
    ulSendDelay : UInt32

    /**
     * Maximum number of transmissions to send. Specify a value between 1 and 256, inclusively.
     */
    ulRepeat : UInt32

    /**
     * Minimum value of the range used to generate the initial delay value, in milliseconds. This value must be less than or equal to <b>ulRepeatMaxDelay</b>, can be zero, but cannot be INFINITE. See Remarks.
     */
    ulRepeatMinDelay : UInt32

    /**
     * Maximum value of the range used to generate the initial delay value, in milliseconds. This value be less than or equal to <b>ulRepeatUpperDelay</b>, can be zero, but cannot be INFINITE. See Remarks.
     */
    ulRepeatMaxDelay : UInt32

    /**
     * Maximum delay to wait before sending message, in milliseconds. This value be can be zero, but cannot be INFINITE.
     */
    ulRepeatUpperDelay : UInt32

}
