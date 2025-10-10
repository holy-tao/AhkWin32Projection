#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DISCONNECT_CODE enum is used by the ITBasicCallControl::Disconnect method.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-disconnect_code
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class DISCONNECT_CODE{

    /**
     * The call is being disconnected as part of the normal cycle of the call.
     * @type {Integer (Int32)}
     */
    static DC_NORMAL => 0

    /**
     * The call is being disconnected because it has not been answered. (For example, an application may set a certain amount of time for the user to answer the call. If the user does not answer, the application can call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itbasiccallcontrol-disconnect">Disconnect</a> with the NOANSWER code.)
     * @type {Integer (Int32)}
     */
    static DC_NOANSWER => 1

    /**
     * The user rejected the offered call.
     * @type {Integer (Int32)}
     */
    static DC_REJECTED => 2
}
