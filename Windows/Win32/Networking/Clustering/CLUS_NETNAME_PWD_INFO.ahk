#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information for resetting the security principal associated with a computer name.
 * @see https://docs.microsoft.com/windows/win32/api//clusapi/ns-clusapi-clus_netname_pwd_info
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUS_NETNAME_PWD_INFO extends Win32Struct
{
    static sizeof => 680

    static packingSize => 4

    /**
     * Indicates if other fields in the structure have valid data.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains the new password for the alternate computer name's associated security principal.
     * @type {String}
     */
    Password {
        get => StrGet(this.ptr + 4, 15, "UTF-16")
        set => StrPut(value, this.ptr + 4, 15, "UTF-16")
    }

    /**
     * Contains the name of a directory server where the associated security principal object is stored. The total length includes the '\\' prefix.
     * @type {String}
     */
    CreatingDC {
        get => StrGet(this.ptr + 36, 257, "UTF-16")
        set => StrPut(value, this.ptr + 36, 257, "UTF-16")
    }

    /**
     * Contains the ID of a security principal objecton a directory server.
     * @type {String}
     */
    ObjectGuid {
        get => StrGet(this.ptr + 552, 63, "UTF-16")
        set => StrPut(value, this.ptr + 552, 63, "UTF-16")
    }
}
