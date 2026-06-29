#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_manifestarray {
    #StructPack 8

    count : IntPtr

    xmls : IntPtr

}
