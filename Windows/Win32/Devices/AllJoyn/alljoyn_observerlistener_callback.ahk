#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_observerlistener_callback {
    #StructPack 8

    object_discovered : IntPtr

    object_lost : IntPtr

}
