#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_aboutlistener_callback {
    #StructPack 8

    about_listener_announced : IntPtr

}
