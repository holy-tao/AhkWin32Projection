#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct USE_OPTION_PROPERTIES {
    #StructPack 8

    Tag : UInt32

    pInfo : IntPtr

    Length : IntPtr

}
