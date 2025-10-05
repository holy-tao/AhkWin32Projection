#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the maximum number of concurrent connections that the shared resource can accommodate.
 * @see https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1006
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SHARE_INFO_1006 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies a DWORD value that indicates the maximum number of concurrent connections that the shared resource can accommodate. The number of connections is unlimited if the value specified in this member is –1.
     * @type {Integer}
     */
    shi1006_max_uses {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
