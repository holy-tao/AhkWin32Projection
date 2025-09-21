#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the security descriptor associated with the specified share. For more information, see Security Descriptors.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1501
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_1501 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved; must be zero.
     * @type {Integer}
     */
    shi1501_reserved {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> associated with the share.
     * @type {Pointer<Void>}
     */
    shi1501_security_descriptor {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
