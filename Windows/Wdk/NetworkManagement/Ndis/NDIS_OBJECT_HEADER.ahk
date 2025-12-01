#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Packages the object type, version, and size information that is required in many NDIS 6.0 structures.
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/ndis-object-header
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_OBJECT_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Specifies the type of NDIS object that a structure describes.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the revision number of this structure.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the total size, in bytes, of the NDIS structure that contains the **NDIS\_OBJECT\_HEADER**. This size includes the size of the **NDIS\_OBJECT\_HEADER** member and all other members of the structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
