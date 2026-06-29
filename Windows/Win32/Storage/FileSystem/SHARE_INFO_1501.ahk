#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSECURITY_DESCRIPTOR.ahk" { PSECURITY_DESCRIPTOR }

/**
 * Contains the security descriptor associated with the specified share. For more information, see Security Descriptors.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1501
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct SHARE_INFO_1501 {
    #StructPack 8

    /**
     * Reserved; must be zero.
     */
    shi1501_reserved : UInt32

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with the share.
     */
    shi1501_security_descriptor : PSECURITY_DESCRIPTOR

}
