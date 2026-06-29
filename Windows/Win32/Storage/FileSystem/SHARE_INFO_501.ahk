#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHARE_TYPE.ahk" { SHARE_TYPE }

/**
 * Contains information about the shared resource including the name and type of the resource, and a comment associated with the resource.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_501
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_501 {
    #StructPack 8

    /**
     * Pointer to a Unicode string specifying the name of a shared resource.
     */
    shi501_netname : PWSTR

    /**
     * A combination of values that specify the type of share.
     */
    shi501_type : SHARE_TYPE

    /**
     * Pointer to a Unicode string specifying an optional comment about the shared resource.
     */
    shi501_remark : PWSTR

    /**
     * Reserved; must be zero.
     */
    shi501_flags : UInt32

}
