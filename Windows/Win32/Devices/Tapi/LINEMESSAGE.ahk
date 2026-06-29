#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEMESSAGE structure contains parameter values specifying a change in status of the line the application currently has open. The lineGetMessage function returns the LINEMESSAGE structure.
 * @remarks
 * For information about parameter values passed in this structure, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Tapi/line-device-messages">Line Device Messages</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linemessage
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEMESSAGE {
    #StructPack 8

    /**
     * Handle to either a line device or a call. The nature of this handle (line handle or call handle) can be determined by the context provided by <i>dwMessageID</i>.
     */
    hDevice : UInt32

    /**
     * Line or call device message.
     */
    dwMessageID : UInt32

    /**
     * Instance data passed back to the application, which was specified by the application in the <i>dwCallBackInstance</i> parameter of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-lineinitializeexa">lineInitializeEx</a>. This <b>DWORD</b> is not interpreted by TAPI.
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
