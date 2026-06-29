#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_DOS_HEADER {
    #StructPack 4

    e_magic : UInt16

    e_cblp : UInt16

    e_cp : UInt16

    e_crlc : UInt16

    e_cparhdr : UInt16

    e_minalloc : UInt16

    e_maxalloc : UInt16

    e_ss : UInt16

    e_sp : UInt16

    e_csum : UInt16

    e_ip : UInt16

    e_cs : UInt16

    e_lfarlc : UInt16

    e_ovno : UInt16

    e_res : UInt16[4]

    e_oemid : UInt16

    e_oeminfo : UInt16

    e_res2 : UInt16[10]

    e_lfanew : Int32

}
