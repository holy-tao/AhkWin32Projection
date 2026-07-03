#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_pinglistener_callback {
    #StructPack 8

    destination_found : IntPtr

    destination_lost : IntPtr

}
