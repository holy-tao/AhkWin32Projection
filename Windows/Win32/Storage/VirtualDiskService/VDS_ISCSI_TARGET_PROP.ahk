#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VDS_ISCSI_TARGET_PROP structure (vdshwprv.h) defines the properties of an iSCSI target.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ns-vdshwprv-vds_iscsi_target_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_ISCSI_TARGET_PROP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The <b>VDS_OBJECT_ID</b> of the target.
     * @type {Pointer<Guid>}
     */
    id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A null-terminated, human-readable string that is the iSCSI name of the target.
     * @type {Pointer<Char>}
     */
    pwszIscsiName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A null-terminated, human-readable string that is the friendly name of the target. This corresponds to the 
     *      iSCSI alias.
     * @type {Pointer<Char>}
     */
    pwszFriendlyName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * If <b>TRUE</b>, a CHAP shared secret is required to login to this target.
     * @type {Integer}
     */
    bChapEnabled {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
