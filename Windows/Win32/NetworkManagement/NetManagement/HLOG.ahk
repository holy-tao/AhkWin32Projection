#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct HLOG {
    #StructPack 4

    time : UInt32

    last_flags : UInt32

    offset : UInt32

    rec_offset : UInt32

}
