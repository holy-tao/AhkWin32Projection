#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionportlistener_callbacks {
    #StructPack 8

    accept_session_joiner : IntPtr

    session_joined : IntPtr

}
