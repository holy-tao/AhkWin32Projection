#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_ISCSI_IPSEC_KEY structure (vdshwprv.h) is not supported and is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_ipsec_key
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_IPSEC_KEY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved for future use.
     * @type {Pointer<Byte>}
     */
    pKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    ulKeySize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
