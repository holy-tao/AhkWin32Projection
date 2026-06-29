#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_authlistener_callbacks {
    #StructPack 8

    request_credentials : IntPtr

    verify_credentials : IntPtr

    security_violation : IntPtr

    authentication_complete : IntPtr

}
