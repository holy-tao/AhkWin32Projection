#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct CMSGHDR {
    #StructPack 8

    cmsg_len : IntPtr

    cmsg_level : Int32

    cmsg_type : Int32

}
