#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_sessionlistener_callbacks {
    #StructPack 8

    session_lost : IntPtr

    session_member_added : IntPtr

    session_member_removed : IntPtr

}
