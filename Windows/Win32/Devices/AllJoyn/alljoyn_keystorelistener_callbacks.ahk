#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_keystorelistener_callbacks {
    #StructPack 8

    load_request : IntPtr

    store_request : IntPtr

}
