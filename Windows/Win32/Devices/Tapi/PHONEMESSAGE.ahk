#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PHONEMESSAGE structure contains the next message queued for delivery to the application. The phoneGetMessage function returns this structure.
 * @remarks
 * For information about parameter values passed in this structure, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/phone-device-messages">Phone Device Messages</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-phonemessage
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct PHONEMESSAGE {
    #StructPack 8

    /**
     * Handle to a phone device.
     */
    hDevice : UInt32

    /**
     * Phone message.
     */
    dwMessageID : UInt32

    /**
     * Instance data passed back to the application, which was specified by the application in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phoneinitializeexa">phoneInitializeEx</a>. This value is not interpreted by TAPI.
     */
    dwCallbackInstance : IntPtr

    /**
     * Parameter for the message.
     */
    dwParam1 : IntPtr

    /**
     * Parameter for the message.
     */
    dwParam2 : IntPtr

    /**
     * Parameter for the message.
     */
    dwParam3 : IntPtr

}
