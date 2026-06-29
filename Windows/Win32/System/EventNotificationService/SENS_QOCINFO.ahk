#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SENS_QOCINFO structure is used by the ISensNetwork::ConnectionMade method. This structure contains Quality of Connection information to the sink object in an application that subscribes to SENS.
 * @see https://learn.microsoft.com/windows/win32/api/sensevts/ns-sensevts-sens_qocinfo
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct SENS_QOCINFO {
    #StructPack 4

    /**
     * This member contains the actual size of the structure that was filled in.
     */
    dwSize : UInt32

    /**
     * Speed of connection. Flag bits indicate whether the connection is slow, medium, fast.
     */
    dwFlags : UInt32

    /**
     * Speed of data sent to the destination in bits per second.
     */
    dwOutSpeed : UInt32

    /**
     * Speed of data coming in from the destination in bits per second.
     */
    dwInSpeed : UInt32

}
